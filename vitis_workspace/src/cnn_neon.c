#include "cnn_neon.h"
#include "frontend.h"
#include "peripherals.h"
#include <math.h>
#include <string.h>

#ifdef __ARM_NEON
#include <arm_neon.h>
#endif

/* Max intermediate tensor = l2_pw output: 48 * 32 * 64 = 98,304 floats (384 KiB) */
#define FP32_MAX_ACT_ELEMS  (48 * 32 * 64)

static float s_buf_a[FP32_MAX_ACT_ELEMS] __attribute__((aligned(64)));
static float s_buf_b[FP32_MAX_ACT_ELEMS] __attribute__((aligned(64)));
static float s_patch_tmp[ARARA_PATCH_FRAMES * ARARA_MEL_BANDS] __attribute__((aligned(64)));

void cnn_neon_init(void) {
    model_weights_init();
    arara_frontend_init();
}

uint8_t arara_logits8_to_probs4(const float logits8[8], float probs4[4], float *confidence) {
    float max_z = logits8[0];
    for (int i = 1; i < 8; i++) {
        if (logits8[i] > max_z) {
            max_z = logits8[i];
        }
    }

    float p8[8];
    float sum_e = 0.0f;
    for (int i = 0; i < 8; i++) {
        p8[i] = expf(logits8[i] - max_z);
        sum_e += p8[i];
    }
    float inv_sum = 1.0f / sum_e;
    for (int i = 0; i < 8; i++) {
        p8[i] *= inv_sum;
    }

    /* ARARA 8-to-4 class collapse (head.py):
     *   [0: chainsaw, 1: rain, 2: engine, 3: hand_saw,
     *    4: chirping_birds, 5: thunderstorm, 6: wind, 7: insects]
     */
    probs4[0] = p8[0];                                        /* chainsaw */
    probs4[1] = p8[2];                                        /* engine   */
    probs4[2] = p8[3];                                        /* hand_saw */
    probs4[3] = p8[1] + p8[4] + p8[5] + p8[6] + p8[7];        /* others   */

    uint8_t best_c = 0;
    float   best_p = probs4[0];
    for (uint8_t c = 1; c < 4; c++) {
        if (probs4[c] > best_p) {
            best_p = probs4[c];
            best_c = c;
        }
    }
    if (confidence) {
        *confidence = best_p;
    }
    return best_c;
}

/* Layer 1: Conv2D 3x3, stride=2, Cin=1 -> Cout=32, SAME pad (pt=0, pb=1, pl=0, pr=1) + ReLU */
static void conv1_3x3_s2_fp32(const float *in_96x64, float *out_48x32x32) {
    const float *w = arara_fp32_conv1_w(); /* [3][3][32] */
    const float *b = arara_fp32_conv1_b(); /* [32] */

    for (int oh = 0; oh < 48; oh++) {
        for (int ow = 0; ow < 32; ow++) {
            float *dst = out_48x32x32 + ((oh * 32 + ow) * 32);
#ifdef __ARM_NEON
            float32x4_t c0 = vld1q_f32(b +  0);
            float32x4_t c1 = vld1q_f32(b +  4);
            float32x4_t c2 = vld1q_f32(b +  8);
            float32x4_t c3 = vld1q_f32(b + 12);
            float32x4_t c4 = vld1q_f32(b + 16);
            float32x4_t c5 = vld1q_f32(b + 20);
            float32x4_t c6 = vld1q_f32(b + 24);
            float32x4_t c7 = vld1q_f32(b + 28);

            for (int ky = 0; ky < 3; ky++) {
                int ih = oh * 2 + ky;
                if (ih >= 96) continue;
                for (int kx = 0; kx < 3; kx++) {
                    int iw = ow * 2 + kx;
                    if (iw >= 64) continue;
                    float32x4_t vx = vdupq_n_f32(in_96x64[ih * 64 + iw]);
                    const float *wk = w + ((ky * 3 + kx) * 32);
                    c0 = vmlaq_f32(c0, vx, vld1q_f32(wk +  0));
                    c1 = vmlaq_f32(c1, vx, vld1q_f32(wk +  4));
                    c2 = vmlaq_f32(c2, vx, vld1q_f32(wk +  8));
                    c3 = vmlaq_f32(c3, vx, vld1q_f32(wk + 12));
                    c4 = vmlaq_f32(c4, vx, vld1q_f32(wk + 16));
                    c5 = vmlaq_f32(c5, vx, vld1q_f32(wk + 20));
                    c6 = vmlaq_f32(c6, vx, vld1q_f32(wk + 24));
                    c7 = vmlaq_f32(c7, vx, vld1q_f32(wk + 28));
                }
            }
            float32x4_t z = vdupq_n_f32(0.0f);
            vst1q_f32(dst +  0, vmaxq_f32(c0, z));
            vst1q_f32(dst +  4, vmaxq_f32(c1, z));
            vst1q_f32(dst +  8, vmaxq_f32(c2, z));
            vst1q_f32(dst + 12, vmaxq_f32(c3, z));
            vst1q_f32(dst + 16, vmaxq_f32(c4, z));
            vst1q_f32(dst + 20, vmaxq_f32(c5, z));
            vst1q_f32(dst + 24, vmaxq_f32(c6, z));
            vst1q_f32(dst + 28, vmaxq_f32(c7, z));
#else
            for (int co = 0; co < 32; co++) {
                dst[co] = b[co];
            }
            for (int ky = 0; ky < 3; ky++) {
                int ih = oh * 2 + ky;
                if (ih >= 96) continue;
                for (int kx = 0; kx < 3; kx++) {
                    int iw = ow * 2 + kx;
                    if (iw >= 64) continue;
                    float xval = in_96x64[ih * 64 + iw];
                    const float *wk = w + ((ky * 3 + kx) * 32);
                    for (int co = 0; co < 32; co++) {
                        dst[co] += xval * wk[co];
                    }
                }
            }
            for (int co = 0; co < 32; co++) {
                if (dst[co] < 0.0f) dst[co] = 0.0f;
            }
#endif
        }
    }
}

/* Depthwise 3x3 + ReLU (channels is a multiple of 32) */
static void depthwise_3x3_fp32(const float *in_act, float *out_act, const yamnet_fp32_sep_t *L) {
    const int h_in   = L->h_in;
    const int w_in   = L->w_in;
    const int h_out  = L->h_out;
    const int w_out  = L->w_out;
    const int C      = L->cin;
    const int stride = L->stride;
    const int pt     = L->pad_top;
    const int pl     = L->pad_left;

    for (int oh = 0; oh < h_out; oh++) {
        for (int ow = 0; ow < w_out; ow++) {
            float *dst = out_act + ((oh * w_out + ow) * C);
#ifdef __ARM_NEON
            float32x4_t z = vdupq_n_f32(0.0f);
            for (int c = 0; c < C; c += 16) {
                float32x4_t a0 = vld1q_f32(L->dw_b + c +  0);
                float32x4_t a1 = vld1q_f32(L->dw_b + c +  4);
                float32x4_t a2 = vld1q_f32(L->dw_b + c +  8);
                float32x4_t a3 = vld1q_f32(L->dw_b + c + 12);

                for (int ky = 0; ky < 3; ky++) {
                    int ih = oh * stride + ky - pt;
                    if ((unsigned)ih >= (unsigned)h_in) continue;
                    for (int kx = 0; kx < 3; kx++) {
                        int iw = ow * stride + kx - pl;
                        if ((unsigned)iw >= (unsigned)w_in) continue;
                        const float *src = in_act  + ((ih * w_in + iw) * C) + c;
                        const float *wk  = L->dw_w + ((ky * 3 + kx) * C) + c;
                        a0 = vmlaq_f32(a0, vld1q_f32(src +  0), vld1q_f32(wk +  0));
                        a1 = vmlaq_f32(a1, vld1q_f32(src +  4), vld1q_f32(wk +  4));
                        a2 = vmlaq_f32(a2, vld1q_f32(src +  8), vld1q_f32(wk +  8));
                        a3 = vmlaq_f32(a3, vld1q_f32(src + 12), vld1q_f32(wk + 12));
                    }
                }
                vst1q_f32(dst + c +  0, vmaxq_f32(a0, z));
                vst1q_f32(dst + c +  4, vmaxq_f32(a1, z));
                vst1q_f32(dst + c +  8, vmaxq_f32(a2, z));
                vst1q_f32(dst + c + 12, vmaxq_f32(a3, z));
            }
#else
            for (int c = 0; c < C; c++) {
                dst[c] = L->dw_b[c];
            }
            for (int ky = 0; ky < 3; ky++) {
                int ih = oh * stride + ky - pt;
                if ((unsigned)ih >= (unsigned)h_in) continue;
                for (int kx = 0; kx < 3; kx++) {
                    int iw = ow * stride + kx - pl;
                    if ((unsigned)iw >= (unsigned)w_in) continue;
                    const float *src = in_act  + ((ih * w_in + iw) * C);
                    const float *wk  = L->dw_w + ((ky * 3 + kx) * C);
                    for (int c = 0; c < C; c++) {
                        dst[c] += src[c] * wk[c];
                    }
                }
            }
            for (int c = 0; c < C; c++) {
                if (dst[c] < 0.0f) dst[c] = 0.0f;
            }
#endif
        }
    }
}

/* Cache-friendly 4-row-blocked SGEMM for Pointwise 1x1 & Dense layers:
 *   out[M, N] = ReLU_opt(in[M, K] @ W[K, N] + b[N]), N is a multiple of 8
 */
static void sgemm_row_blocked_fp32(const float *in_mk, const float *w_kn, const float *b_n,
                                   float *out_mn, int M, int K, int N, int relu_en) {
    int m = 0;
#ifdef __ARM_NEON
    float32x4_t z = vdupq_n_f32(0.0f);
    for (; m + 4 <= M; m += 4) {
        float *y0 = out_mn + (m + 0) * N;
        float *y1 = out_mn + (m + 1) * N;
        float *y2 = out_mn + (m + 2) * N;
        float *y3 = out_mn + (m + 3) * N;
        for (int co = 0; co < N; co += 8) {
            float32x4_t b0 = vld1q_f32(b_n + co);
            float32x4_t b1 = vld1q_f32(b_n + co + 4);
            vst1q_f32(y0 + co, b0); vst1q_f32(y0 + co + 4, b1);
            vst1q_f32(y1 + co, b0); vst1q_f32(y1 + co + 4, b1);
            vst1q_f32(y2 + co, b0); vst1q_f32(y2 + co + 4, b1);
            vst1q_f32(y3 + co, b0); vst1q_f32(y3 + co + 4, b1);
        }

        const float *x0 = in_mk + (m + 0) * K;
        const float *x1 = in_mk + (m + 1) * K;
        const float *x2 = in_mk + (m + 2) * K;
        const float *x3 = in_mk + (m + 3) * K;

        for (int ci = 0; ci < K; ci++) {
            float32x4_t vx0 = vdupq_n_f32(x0[ci]);
            float32x4_t vx1 = vdupq_n_f32(x1[ci]);
            float32x4_t vx2 = vdupq_n_f32(x2[ci]);
            float32x4_t vx3 = vdupq_n_f32(x3[ci]);
            const float *wrow = w_kn + (uint32_t)ci * N;

            for (int co = 0; co < N; co += 8) {
                float32x4_t w0 = vld1q_f32(wrow + co);
                float32x4_t w1 = vld1q_f32(wrow + co + 4);

                vst1q_f32(y0 + co,     vmlaq_f32(vld1q_f32(y0 + co),     vx0, w0));
                vst1q_f32(y0 + co + 4, vmlaq_f32(vld1q_f32(y0 + co + 4), vx0, w1));
                vst1q_f32(y1 + co,     vmlaq_f32(vld1q_f32(y1 + co),     vx1, w0));
                vst1q_f32(y1 + co + 4, vmlaq_f32(vld1q_f32(y1 + co + 4), vx1, w1));
                vst1q_f32(y2 + co,     vmlaq_f32(vld1q_f32(y2 + co),     vx2, w0));
                vst1q_f32(y2 + co + 4, vmlaq_f32(vld1q_f32(y2 + co + 4), vx2, w1));
                vst1q_f32(y3 + co,     vmlaq_f32(vld1q_f32(y3 + co),     vx3, w0));
                vst1q_f32(y3 + co + 4, vmlaq_f32(vld1q_f32(y3 + co + 4), vx3, w1));
            }
        }

        if (relu_en) {
            for (int co = 0; co < N; co += 4) {
                vst1q_f32(y0 + co, vmaxq_f32(vld1q_f32(y0 + co), z));
                vst1q_f32(y1 + co, vmaxq_f32(vld1q_f32(y1 + co), z));
                vst1q_f32(y2 + co, vmaxq_f32(vld1q_f32(y2 + co), z));
                vst1q_f32(y3 + co, vmaxq_f32(vld1q_f32(y3 + co), z));
            }
        }
    }

    for (; m < M; m++) {
        float *y = out_mn + m * N;
        const float *x = in_mk + m * K;
        for (int co = 0; co < N; co += 4) {
            vst1q_f32(y + co, vld1q_f32(b_n + co));
        }
        for (int ci = 0; ci < K; ci++) {
            float32x4_t vx = vdupq_n_f32(x[ci]);
            const float *wrow = w_kn + (uint32_t)ci * N;
            for (int co = 0; co < N; co += 8) {
                vst1q_f32(y + co,     vmlaq_f32(vld1q_f32(y + co),     vx, vld1q_f32(wrow + co)));
                vst1q_f32(y + co + 4, vmlaq_f32(vld1q_f32(y + co + 4), vx, vld1q_f32(wrow + co + 4)));
            }
        }
        if (relu_en) {
            for (int co = 0; co < N; co += 4) {
                vst1q_f32(y + co, vmaxq_f32(vld1q_f32(y + co), z));
            }
        }
    }
#else
    for (; m < M; m++) {
        float *y = out_mn + m * N;
        const float *x = in_mk + m * K;
        for (int co = 0; co < N; co++) {
            y[co] = b_n[co];
        }
        for (int ci = 0; ci < K; ci++) {
            float xval = x[ci];
            const float *wrow = w_kn + (uint32_t)ci * N;
            for (int co = 0; co < N; co++) {
                y[co] += xval * wrow[co];
            }
        }
        if (relu_en) {
            for (int co = 0; co < N; co++) {
                if (y[co] < 0.0f) y[co] = 0.0f;
            }
        }
    }
#endif
}

uint8_t cnn_neon_infer_patch(const float *patch_96x64, arara_infer_result_t *res) {
    uint64_t t0 = gtimer_get_cycles();

    /* 1. Layer 1 Conv 3x3 s2 -> s_buf_a (48 x 32 x 32) */
    conv1_3x3_s2_fp32(patch_96x64, s_buf_a);

    /* 2. Layers 2..14 Depthwise + Pointwise Separable Convolutions */
    float *cur_act = s_buf_a;
    float *tmp_act = s_buf_b;
    for (int i = 0; i < ARARA_NUM_SEP_LAYERS; i++) {
        const yamnet_fp32_sep_t *L = &g_yamnet_fp32_sep[i];
        depthwise_3x3_fp32(cur_act, tmp_act, L);
        sgemm_row_blocked_fp32(tmp_act, L->pw_w, L->pw_b, cur_act,
                               (int)L->h_out * (int)L->w_out, (int)L->cin, (int)L->cout, 1);
    }

    /* 3. Global Average Pooling over 3x2 = 6 spatial tokens -> 1024-D embedding */
    float emb[ARARA_EMBEDDING_DIM] __attribute__((aligned(64)));
    const float inv6 = 1.0f / 6.0f;
    for (int c = 0; c < ARARA_EMBEDDING_DIM; c++) {
        float sum = cur_act[0 * 1024 + c] + cur_act[1 * 1024 + c] +
                    cur_act[2 * 1024 + c] + cur_act[3 * 1024 + c] +
                    cur_act[4 * 1024 + c] + cur_act[5 * 1024 + c];
        emb[c] = sum * inv6;
    }
#ifdef HOST_GOLDEN_SIM
    /* Cortex-A9 @ 667 MHz NEON FP32 cycle model: 68.63M MACs + 14.2 MiB DDR3 weight streaming */
    sim_add_gtimer_cycles(41200000ULL);
#endif
    uint64_t t_backbone = gtimer_get_cycles();

    /* 4. ARARA Classifier Head: 1024 -> Dense(512, ReLU) -> Dense(8) -> Softmax -> 4 classes */
    float h1[ARARA_HEAD_HIDDEN_DIM] __attribute__((aligned(64)));
    float logits8[ARARA_RAW_CLASSES] __attribute__((aligned(32)));
    sgemm_row_blocked_fp32(emb, arara_fp32_fc1_w(), arara_fp32_fc1_b(),
                           h1, 1, ARARA_EMBEDDING_DIM, ARARA_HEAD_HIDDEN_DIM, 1);
    sgemm_row_blocked_fp32(h1, arara_fp32_fc2_w(), arara_fp32_fc2_b(),
                           logits8, 1, ARARA_HEAD_HIDDEN_DIM, ARARA_RAW_CLASSES, 0);

    float probs4[4];
    float conf = 0.0f;
    uint8_t pred = arara_logits8_to_probs4(logits8, probs4, &conf);
#ifdef HOST_GOLDEN_SIM
    /* Cortex-A9 @ 667 MHz NEON FP32 cycle model: 528K MACs + 2.02 MiB DDR3 weight streaming */
    sim_add_gtimer_cycles(310000ULL);
#endif
    uint64_t t_end = gtimer_get_cycles();

    if (res) {
        memset(res, 0, sizeof(*res));
        res->pred_class      = pred;
        res->confidence      = conf;
        for (int c = 0; c < 4; c++) res->probs4[c] = probs4[c];
        res->frontend_cycles = 0ULL;
        res->backbone_cycles = t_backbone - t0;
        res->head_cycles     = t_end - t_backbone;
        res->total_cycles    = t_end - t0;
        res->time_ms         = gtimer_cycles_to_ms(res->total_cycles);
        res->mops            = (res->time_ms > 0.0f) ? (ARARA_TOTAL_OPS / (res->time_ms * 1000.0f)) : 0.0f;
    }
    return pred;
}

uint8_t cnn_neon_infer_pcm(const int16_t *pcm_15600, arara_infer_result_t *res) {
    uint64_t t_fe0 = gtimer_get_cycles();
    arara_frontend_pcm16_to_patch(pcm_15600, s_patch_tmp);
    uint64_t t_fe1 = gtimer_get_cycles();

    arara_infer_result_t sub;
    uint8_t pred = cnn_neon_infer_patch(s_patch_tmp, &sub);
    if (res) {
        *res = sub;
        res->frontend_cycles = t_fe1 - t_fe0;
        res->total_cycles    = res->frontend_cycles + sub.total_cycles;
        res->time_ms         = gtimer_cycles_to_ms(res->total_cycles);
        res->mops            = (res->time_ms > 0.0f) ? (ARARA_TOTAL_OPS / (res->time_ms * 1000.0f)) : 0.0f;
    }
    return pred;
}
