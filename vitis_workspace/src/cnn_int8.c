#include "cnn_int8.h"
#include "frontend.h"
#include "peripherals.h"
#include <string.h>

#ifdef __ARM_NEON
#include <arm_neon.h>
#endif

/* Max INT8 feature map = l2_pw output: 48 * 32 * 64 = 98,304 bytes -> 128 KiB ping-pong */
#define INT8_DMA_BUF_BYTES   (128 * 1024)
/* Max padded DW input = l3_dw input (48+1)x(32+1)x64 or l2_dw (50x34x32): <= 110 KiB */
#define INT8_DW_PAD_BYTES    (52 * 36 * 64)

#ifdef HOST_GOLDEN_SIM
static int8_t  s_dma_buf_a[INT8_DMA_BUF_BYTES] __attribute__((aligned(4096)));
static int8_t  s_dma_buf_b[INT8_DMA_BUF_BYTES] __attribute__((aligned(4096)));
static int32_t s_dma_logits8[8]                __attribute__((aligned(64)));
#else
static int8_t  s_dma_buf_a[INT8_DMA_BUF_BYTES] __attribute__((section(".dma_buf"), aligned(4096)));
static int8_t  s_dma_buf_b[INT8_DMA_BUF_BYTES] __attribute__((section(".dma_buf"), aligned(4096)));
static int32_t s_dma_logits8[8]                __attribute__((section(".dma_buf"), aligned(64)));
#endif

static int8_t s_in_q[98 * 66]            __attribute__((aligned(64)));
static int8_t s_dw_pad[INT8_DW_PAD_BYTES] __attribute__((aligned(64)));
static float  s_patch_i8_tmp[ARARA_PATCH_FRAMES * ARARA_MEL_BANDS] __attribute__((aligned(64)));

static inline int8_t requant_relu_i8(int32_t acc, int32_t mult, uint8_t sh, int32_t out_zp) {
    if (acc < 0) {
        acc = 0;
    }
    int64_t prod = (int64_t)acc * (int64_t)mult;
    int64_t rnd  = 1LL << (sh - 1U);
    int64_t val  = ((prod + rnd) >> sh) + (int64_t)out_zp;
    if (val > 127)  return 127;
    if (val < -128) return -128;
    return (int8_t)val;
}

#ifdef HOST_GOLDEN_SIM

uint32_t cnn_int8_init(void) {
    model_weights_init();
    arara_frontend_init();
    return AXI_CNN_EXPECTED_ID;
}

/* Bit-exact C model of logic/axi_cnn_accelerator.vhd reading the exact same
 * 128-byte tile header + (k8, bank, lane) 64-bit DMA weight stream! */
static void pl_accel_dispatch(const yamnet_int8_dma_op_t *op,
                              const int8_t *act_in, void *act_out,
                              arara_infer_result_t *prof) {
    const uint32_t M       = op->m;
    const uint32_t K       = op->k;
    const uint32_t N       = op->n;
    const uint32_t num_k8  = K >> 3;
    const uint32_t n_tiles = N >> 3;
    const uint8_t *stream  = op->dma_stream;

    for (uint32_t t = 0; t < n_tiles; t++) {
        const uint8_t *hdr = stream;
        int32_t tile_bias[8];
        int32_t tile_mult[8];
        uint8_t tile_shift[8];

        for (int j = 0; j < 8; j++) {
            memcpy(&tile_bias[j], hdr + j * 8 + 0, 4);
            memcpy(&tile_mult[j], hdr + j * 8 + 4, 4);
            tile_shift[j] = hdr[64 + j] & 0x3FU;
        }

        const int8_t *w_words = (const int8_t *)(hdr + 128);
        stream += 128U + 8U * K;

        for (uint32_t m = 0; m < M; m++) {
            const int8_t *x_row = act_in + m * K;
            int32_t acc[8];
            for (int j = 0; j < 8; j++) {
                acc[j] = tile_bias[j];
            }

            for (uint32_t k8 = 0; k8 < num_k8; k8++) {
                const int8_t *x8 = x_row + (k8 << 3);
                for (int j = 0; j < 8; j++) {
                    const int8_t *w8 = w_words + ((k8 * 8U + (uint32_t)j) << 3);
                    int32_t s8 = 0;
                    for (int lane = 0; lane < 8; lane++) {
                        s8 += (int32_t)x8[lane] * (int32_t)w8[lane];
                    }
                    acc[j] += s8;
                }
            }

            if (op->raw_i32_en) {
                int32_t *dst32 = (int32_t *)act_out + m * N + (t << 3);
                for (int j = 0; j < 8; j++) {
                    dst32[j] = acc[j];
                }
            } else {
                int8_t *dst8 = (int8_t *)act_out + m * N + (t << 3);
                for (int j = 0; j < 8; j++) {
                    int32_t a = acc[j];
                    if (op->relu_en && a < 0) {
                        a = 0;
                    }
                    uint8_t sh = tile_shift[j];
                    if (sh < 1U)  sh = 1U;
                    if (sh > 62U) sh = 62U;
                    int64_t prod = (int64_t)a * (int64_t)tile_mult[j];
                    int64_t rnd  = 1LL << (sh - 1U);
                    int64_t val  = ((prod + rnd) >> sh) + (int64_t)op->out_zp;
                    if (val > 127)  val = 127;
                    if (val < -128) val = -128;
                    dst8[j] = (int8_t)val;
                }
            }
        }
    }

    /* Exact cycle model of axi_cnn_accelerator.vhd FSM @ 100 MHz */
    uint64_t dma_cyc   = (uint64_t)(M * num_k8) + (uint64_t)n_tiles * (16ULL + K) + 64ULL;
    uint64_t comp_per  = (uint64_t)num_k8 + 7ULL + (op->raw_i32_en ? 0ULL : 14ULL);
    uint64_t comp_cyc  = (uint64_t)n_tiles * (uint64_t)M * comp_per;
    uint64_t wr_slot   = (uint64_t)n_tiles * (uint64_t)M;
    uint64_t total_cyc = dma_cyc + comp_cyc + wr_slot;
    if (prof) {
        prof->pl_dma_cycles   += dma_cyc;
        prof->pl_comp_cycles  += comp_cyc;
        prof->pl_total_cycles += total_cyc;
        prof->pl_macs         += (uint64_t)M * (uint64_t)K * (uint64_t)N;
    }
    /* Convert 100 MHz PL clock cycles to 333.33 MHz Global Timer ticks (* 10 / 3) */
    sim_add_gtimer_cycles((total_cyc * 10ULL + 2ULL) / 3ULL);
}

#else /* Bare-metal Zynq-7000 PL Hardware Accelerator Driver */

#define ACCEL_REG(off) (*(volatile uint32_t *)(AXI_CNN_ACCEL_BASE + (off)))

/* ARMv7-A CP15 L1 D-Cache Maintenance (32-byte line size on Cortex-A9).
 * Ensures S_AXI_HP0 DMA coherency both with software/startup.s and Vitis standalone BSP. */
static inline void dcache_clean_range(const void *addr, size_t len) {
    uintptr_t p   = (uintptr_t)addr & ~(uintptr_t)31U;
    uintptr_t end = (uintptr_t)addr + len;
    while (p < end) {
        __asm__ volatile("mcr p15, 0, %0, c7, c10, 1" :: "r"(p) : "memory"); /* DCCMVAC */
        p += 32U;
    }
    __asm__ volatile("dsb sy" ::: "memory");
}

static inline void dcache_invalidate_range(const void *addr, size_t len) {
    uintptr_t p   = (uintptr_t)addr & ~(uintptr_t)31U;
    uintptr_t end = (uintptr_t)addr + len;
    while (p < end) {
        __asm__ volatile("mcr p15, 0, %0, c7, c6, 1" :: "r"(p) : "memory");  /* DCIMVAC */
        p += 32U;
    }
    __asm__ volatile("dsb sy" ::: "memory");
}

uint32_t cnn_int8_init(void) {
    model_weights_init();
    arara_frontend_init();
    dcache_clean_range(g_model_blob, (size_t)(g_model_blob_end - g_model_blob));
    ACCEL_REG(ACCEL_CTRL_OFFSET) = ACCEL_CTRL_SOFT_RST;
    __asm__ volatile("dsb sy" ::: "memory");
    return ACCEL_REG(ACCEL_ID_OFFSET);
}

static void pl_accel_dispatch(const yamnet_int8_dma_op_t *op,
                              const int8_t *act_in, void *act_out,
                              arara_infer_result_t *prof) {
    const size_t in_bytes  = (size_t)op->m * (size_t)op->k;
    const size_t out_bytes = (size_t)op->m * (size_t)op->n * (op->raw_i32_en ? 4U : 1U);

    /* Ensure all PS stores reach DDR3 and prevent stale cache lines on DMA destination */
    dcache_clean_range(act_in, in_bytes);
    dcache_invalidate_range(act_out, out_bytes);

    ACCEL_REG(ACCEL_ACT_ADDR_OFFSET) = (uint32_t)(uintptr_t)act_in;
    ACCEL_REG(ACCEL_WGT_ADDR_OFFSET) = (uint32_t)(uintptr_t)op->dma_stream;
    ACCEL_REG(ACCEL_OUT_ADDR_OFFSET) = (uint32_t)(uintptr_t)act_out;
    ACCEL_REG(ACCEL_DIM_MK_OFFSET)   = ((uint32_t)op->k << 16) | (uint32_t)op->m;
    ACCEL_REG(ACCEL_DIM_N_ZP_OFFSET) = (((uint32_t)(uint8_t)op->out_zp) << 16) | (uint32_t)op->n;

    uint32_t ctrl = ACCEL_CTRL_START;
    if (op->relu_en) {
        ctrl |= ACCEL_CTRL_RELU_EN;
    }
    if (op->raw_i32_en) {
        ctrl |= ACCEL_CTRL_RAW_I32;
    }
    ACCEL_REG(ACCEL_CTRL_OFFSET) = ctrl;

    while ((ACCEL_REG(ACCEL_STATUS_OFFSET) & ACCEL_STATUS_DONE) == 0U) { }
    dcache_invalidate_range(act_out, out_bytes);

    if (prof) {
        prof->pl_total_cycles += (uint64_t)ACCEL_REG(ACCEL_PERF_TOTAL_OFFSET);
        prof->pl_comp_cycles  += (uint64_t)ACCEL_REG(ACCEL_PERF_COMP_OFFSET);
        prof->pl_dma_cycles   += (uint64_t)ACCEL_REG(ACCEL_PERF_DMA_OFFSET);
        prof->pl_macs         += (uint64_t)op->m * (uint64_t)op->k * (uint64_t)op->n;
    }
}

#endif /* HOST_GOLDEN_SIM */

/* Quantize [96 x 64] float32 patch -> padded [97 x 65] int8 buffer (pt=0, pb=1, pl=0, pr=1) */
static void quantize_and_pad_conv1_input(const float *patch_96x64, int8_t *xp_97x65) {
    const float inv_sc = ARARA_INT8_IN_INV_SCALE;
    const int32_t zp   = ARARA_INT8_IN_ZP;

    for (int h = 0; h < 96; h++) {
        const float *src = patch_96x64 + h * 64;
        int8_t      *dst = xp_97x65 + h * 65;
        for (int w = 0; w < 64; w++) {
            float v = src[w] * inv_sc;
            int32_t r = (v >= 0.0f) ? (int32_t)(v + 0.5f) : (int32_t)(v - 0.5f);
            int32_t q = r + zp;
            if (q > 127)  q = 127;
            if (q < -128) q = -128;
            dst[w] = (int8_t)q;
        }
        dst[64] = (int8_t)zp; /* right pad = 1 */
    }
    /* bottom pad row h = 96 */
    memset(xp_97x65 + 96 * 65, zp & 0xFF, 65);
}

/* Layer 1: Conv2D 3x3 s2, Cin=1 -> Cout=32 (vectorized ARM NEON INT8) */
static void conv1_3x3_s2_int8(const int8_t *xp_97x65, int8_t *out_48x32x32) {
    const int8_t  *wq = arara_int8_conv1_wq();    /* [3][3][32] */
    const int32_t *bf = arara_int8_conv1_bfold(); /* [32] */
    const int32_t *mu = arara_int8_conv1_mult();  /* [32] */
    const uint8_t *sh = arara_int8_conv1_shift(); /* [32] */
    const int32_t ozp = ARARA_INT8_CONV1_OUT_ZP;

    for (int oh = 0; oh < 48; oh++) {
        for (int ow = 0; ow < 32; ow++) {
            int8_t *dst = out_48x32x32 + ((oh * 32 + ow) * 32);
#ifdef __ARM_NEON
            for (int co = 0; co < 32; co += 8) {
                int32x4_t a_lo = vld1q_s32(bf + co);
                int32x4_t a_hi = vld1q_s32(bf + co + 4);
                for (int ky = 0; ky < 3; ky++) {
                    const int8_t *xrow = xp_97x65 + (oh * 2 + ky) * 65 + (ow * 2);
                    for (int kx = 0; kx < 3; kx++) {
                        int8x8_t vx = vdup_n_s8(xrow[kx]);
                        int8x8_t vw = vld1_s8(wq + ((ky * 3 + kx) * 32) + co);
                        int16x8_t p = vmull_s8(vx, vw);
                        a_lo = vaddw_s16(a_lo, vget_low_s16(p));
                        a_hi = vaddw_s16(a_hi, vget_high_s16(p));
                    }
                }
                int32_t acc8[8];
                vst1q_s32(acc8,     a_lo);
                vst1q_s32(acc8 + 4, a_hi);
                for (int j = 0; j < 8; j++) {
                    dst[co + j] = requant_relu_i8(acc8[j], mu[co + j], sh[co + j], ozp);
                }
            }
#else
            for (int co = 0; co < 32; co++) {
                int32_t acc = bf[co];
                for (int ky = 0; ky < 3; ky++) {
                    const int8_t *xrow = xp_97x65 + (oh * 2 + ky) * 65 + (ow * 2);
                    for (int kx = 0; kx < 3; kx++) {
                        acc += (int32_t)xrow[kx] * (int32_t)wq[(ky * 3 + kx) * 32 + co];
                    }
                }
                dst[co] = requant_relu_i8(acc, mu[co], sh[co], ozp);
            }
#endif
        }
    }
#ifdef HOST_GOLDEN_SIM
    /* Cortex-A9 @ 667 MHz NEON INT8 cycle model for Conv1 3x3 s2 + patch quantization */
    sim_add_gtimer_cycles(180000ULL);
#endif
}

/* Depthwise 3x3 INT8 (vectorized ARM NEON INT8, border-padded with L->in_zp) */
static void depthwise_3x3_int8(const int8_t *in_act, int8_t *out_act, const yamnet_int8_dw_t *L) {
    const int h_in   = L->h_in;
    const int w_in   = L->w_in;
    const int h_out  = L->h_out;
    const int w_out  = L->w_out;
    const int C      = L->channels;
    const int stride = L->stride;
    const int pt     = L->pad_top;
    const int pb     = L->pad_bottom;
    const int pl     = L->pad_left;
    const int pr     = L->pad_right;
    const int w_pad  = w_in + pl + pr;
    const int row_b  = w_pad * C;
    const uint8_t zp_u8 = (uint8_t)L->in_zp;

    /* Populate padded buffer s_dw_pad[h_pad][w_pad][C] in cached L1/L2 memory */
    if (pt > 0) {
        memset(s_dw_pad, zp_u8, (size_t)(pt * row_b));
    }
    for (int h = 0; h < h_in; h++) {
        int8_t *prow = s_dw_pad + (h + pt) * row_b;
        if (pl > 0) {
            memset(prow, zp_u8, (size_t)(pl * C));
        }
        memcpy(prow + pl * C, in_act + h * w_in * C, (size_t)(w_in * C));
        if (pr > 0) {
            memset(prow + (pl + w_in) * C, zp_u8, (size_t)(pr * C));
        }
    }
    if (pb > 0) {
        memset(s_dw_pad + (pt + h_in) * row_b, zp_u8, (size_t)(pb * row_b));
    }

    for (int oh = 0; oh < h_out; oh++) {
        for (int ow = 0; ow < w_out; ow++) {
            int8_t *dst = out_act + ((oh * w_out + ow) * C);
            const int base_h = oh * stride;
            const int base_w = ow * stride;

#ifdef __ARM_NEON
            for (int c = 0; c < C; c += 8) {
                int32x4_t a_lo = vld1q_s32(L->b_fold + c);
                int32x4_t a_hi = vld1q_s32(L->b_fold + c + 4);

                for (int ky = 0; ky < 3; ky++) {
                    const int8_t *xrow = s_dw_pad + (base_h + ky) * row_b + base_w * C + c;
                    const int8_t *wrow = L->w_q + (ky * 3 * C) + c;
                    for (int kx = 0; kx < 3; kx++) {
                        int8x8_t vx = vld1_s8(xrow + kx * C);
                        int8x8_t vw = vld1_s8(wrow + kx * C);
                        int16x8_t p = vmull_s8(vx, vw);
                        a_lo = vaddw_s16(a_lo, vget_low_s16(p));
                        a_hi = vaddw_s16(a_hi, vget_high_s16(p));
                    }
                }

                int32_t acc8[8];
                vst1q_s32(acc8,     a_lo);
                vst1q_s32(acc8 + 4, a_hi);
                for (int j = 0; j < 8; j++) {
                    dst[c + j] = requant_relu_i8(acc8[j], L->mult[c + j], L->shift[c + j], L->out_zp);
                }
            }
#else
            for (int c = 0; c < C; c++) {
                int32_t acc = L->b_fold[c];
                for (int ky = 0; ky < 3; ky++) {
                    const int8_t *xrow = s_dw_pad + (base_h + ky) * row_b + base_w * C + c;
                    const int8_t *wrow = L->w_q + (ky * 3 * C) + c;
                    for (int kx = 0; kx < 3; kx++) {
                        acc += (int32_t)xrow[kx * C] * (int32_t)wrow[kx * C];
                    }
                }
                dst[c] = requant_relu_i8(acc, L->mult[c], L->shift[c], L->out_zp);
            }
#endif
        }
    }
#ifdef HOST_GOLDEN_SIM
    /* Cortex-A9 @ 667 MHz NEON INT8 cycle model for 3x3 Depthwise Conv + border pad */
    sim_add_gtimer_cycles(((uint64_t)h_out * (uint64_t)w_out * (uint64_t)C * 3ULL) / 4ULL);
#endif
}

/* Fixed-point Global Average Pooling over 3x2 = 6 spatial positions (matches quant.py _run_gap6) */
static void gap6_1024_int8(const int8_t *in_6x1024, int8_t *out_1024) {
    for (int c = 0; c < ARARA_EMBEDDING_DIM; c++) {
        int32_t s = ((int32_t)in_6x1024[0 * 1024 + c] + 128) +
                    ((int32_t)in_6x1024[1 * 1024 + c] + 128) +
                    ((int32_t)in_6x1024[2 * 1024 + c] + 128) +
                    ((int32_t)in_6x1024[3 * 1024 + c] + 128) +
                    ((int32_t)in_6x1024[4 * 1024 + c] + 128) +
                    ((int32_t)in_6x1024[5 * 1024 + c] + 128);
        int32_t avg_u = (s * 10923 + 32768) >> 16;
        int32_t q = avg_u - 128;
        if (q > 127)  q = 127;
        if (q < -128) q = -128;
        out_1024[c] = (int8_t)q;
    }
}

uint8_t cnn_int8_infer_patch(const float *patch_96x64, arara_infer_result_t *res) {
    arara_infer_result_t local_res;
    memset(&local_res, 0, sizeof(local_res));

    uint64_t t0 = gtimer_get_cycles();

    /* 1. Quantize patch + Layer 1 Conv 3x3 s2 -> s_dma_buf_a */
    quantize_and_pad_conv1_input(patch_96x64, s_in_q);
    conv1_3x3_s2_int8(s_in_q, s_dma_buf_a);

    /* 2. 13 Separable Blocks: PS NEON INT8 Depthwise -> PL 64-MAC DMA Pointwise */
    for (int i = 0; i < ARARA_NUM_SEP_LAYERS; i++) {
        depthwise_3x3_int8(s_dma_buf_a, s_dma_buf_b, &g_yamnet_int8_dw[i]);
        pl_accel_dispatch(&g_yamnet_int8_pw[i], s_dma_buf_b, s_dma_buf_a, &local_res);
    }

    /* 3. Global Average Pooling (3x2 -> 1024) into s_dma_buf_b */
    gap6_1024_int8(s_dma_buf_a, s_dma_buf_b);
    uint64_t t_backbone = gtimer_get_cycles();

    /* 4. ARARA Classifier Head on PL 64-MAC Tensor Accelerator:
     *    fc1: [1 x 1024] -> [1 x 512] INT8 ReLU
     *    fc2: [1 x 512]  -> [1 x 8]   Raw INT32 Logits
     */
    pl_accel_dispatch(&g_arara_int8_fc1, s_dma_buf_b, s_dma_buf_a, &local_res);
    pl_accel_dispatch(&g_arara_int8_fc2, s_dma_buf_a, s_dma_logits8, &local_res);

    const float *lscale = arara_int8_fc2_logit_scale();
    float logits8_f32[8];
    for (int i = 0; i < 8; i++) {
        logits8_f32[i] = (float)s_dma_logits8[i] * lscale[i];
    }

    float conf = 0.0f;
    uint8_t pred = arara_logits8_to_probs4(logits8_f32, local_res.probs4, &conf);
#ifdef HOST_GOLDEN_SIM
    sim_add_gtimer_cycles(3000ULL);
#endif
    uint64_t t_end = gtimer_get_cycles();

    local_res.pred_class      = pred;
    local_res.confidence      = conf;
    local_res.frontend_cycles = 0ULL;
    local_res.backbone_cycles = t_backbone - t0;
    local_res.head_cycles     = t_end - t_backbone;
    local_res.total_cycles    = t_end - t0;
    local_res.time_ms         = gtimer_cycles_to_ms(local_res.total_cycles);
    local_res.mops            = (local_res.time_ms > 0.0f) ? (ARARA_TOTAL_OPS / (local_res.time_ms * 1000.0f)) : 0.0f;

    if (res) {
        *res = local_res;
    }
    return pred;
}

uint8_t cnn_int8_infer_pcm(const int16_t *pcm_15600, arara_infer_result_t *res) {
    uint64_t t_fe0 = gtimer_get_cycles();
    arara_frontend_pcm16_to_patch(pcm_15600, s_patch_i8_tmp);
    uint64_t t_fe1 = gtimer_get_cycles();

    arara_infer_result_t sub;
    uint8_t pred = cnn_int8_infer_patch(s_patch_i8_tmp, &sub);
    if (res) {
        *res = sub;
        res->frontend_cycles = t_fe1 - t_fe0;
        res->total_cycles    = res->frontend_cycles + sub.total_cycles;
        res->time_ms         = gtimer_cycles_to_ms(res->total_cycles);
        res->mops            = (res->time_ms > 0.0f) ? (ARARA_TOTAL_OPS / (res->time_ms * 1000.0f)) : 0.0f;
    }
    return pred;
}
