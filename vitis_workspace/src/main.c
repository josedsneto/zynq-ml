#include <stdint.h>
#include <math.h>
#include <string.h>

#include "uart.h"
#include "peripherals.h"
#include "model_weights.h"
#include "frontend.h"
#include "cnn_neon.h"
#include "cnn_int8.h"

/* Provide weak Newlib errno hook for bare-metal -nostdlib -lm linking */
__attribute__((weak)) int *__errno(void) {
    static int s_errno = 0;
    return &s_errno;
}

typedef struct {
    uint32_t cm[4][4];
    uint32_t correct;
    uint32_t total;
    uint32_t gold_matches;
    double   sum_time_ms;
    double   sum_backbone_ms;
    double   sum_head_ms;
    uint64_t sum_pl_total_cyc;
    uint64_t sum_pl_comp_cyc;
    uint64_t sum_pl_dma_cyc;
} bench_stats_t;

static void print_padded_str(const char *s, int width) {
    int len = 0;
    while (s[len]) len++;
    uart_puts(s);
    for (int i = len; i < width; i++) {
        uart_putc(' ');
    }
}

static void print_padded_uint(uint32_t v, int width) {
    char tmp[16];
    int n = 0;
    if (v == 0U) {
        tmp[n++] = '0';
    } else {
        uint32_t x = v;
        while (x > 0U) {
            tmp[n++] = (char)('0' + (x % 10U));
            x /= 10U;
        }
    }
    for (int i = n; i < width; i++) {
        uart_putc(' ');
    }
    while (n > 0) {
        uart_putc(tmp[--n]);
    }
}

static void print_model_report(const char *tag, const char *title,
                               const bench_stats_t *st, float frontend_avg_ms,
                               int is_pl_int8) {
    float acc_pct = (st->total > 0U) ? (100.0f * (float)st->correct / (float)st->total) : 0.0f;
    float avg_ms  = (st->total > 0U) ? (float)(st->sum_time_ms / (double)st->total) : 0.0f;
    float bb_ms   = (st->total > 0U) ? (float)(st->sum_backbone_ms / (double)st->total) : 0.0f;
    float hd_ms   = (st->total > 0U) ? (float)(st->sum_head_ms / (double)st->total) : 0.0f;
    float e2e_ms  = frontend_avg_ms + avg_ms;
    float mops    = (avg_ms > 0.0f) ? (ARARA_TOTAL_OPS / (avg_ms * 1000.0f)) : 0.0f;
    float rpi_sp  = (e2e_ms > 0.0f) ? (ARARA_RPI3_REF_MS / e2e_ms) : 0.0f;

    uart_puts("\n========================================================================\n ");
    uart_puts(title);
    uart_puts("\n========================================================================\n");
    uart_puts("  Global Accuracy    : ");
    uart_print_float(acc_pct, 2);
    uart_puts("% (");
    uart_print_uint(st->correct);
    uart_puts(" / ");
    uart_print_uint(st->total);
    uart_puts(")  [Golden Match: ");
    uart_print_uint(st->gold_matches);
    uart_puts("/");
    uart_print_uint(st->total);
    uart_puts("]\n");

    uart_puts("  Inference Latency  : ");
    uart_print_float(avg_ms, 3);
    uart_puts(" ms/patch  (Backbone: ");
    uart_print_float(bb_ms, 3);
    uart_puts(" ms | Head: ");
    uart_print_float(hd_ms, 3);
    uart_puts(" ms)\n");

    uart_puts("  End-to-End (+STFT) : ");
    uart_print_float(e2e_ms, 3);
    uart_puts(" ms/patch  (Frontend: ");
    uart_print_float(frontend_avg_ms, 3);
    uart_puts(" ms | vs RPi3 1250 ms: ");
    uart_print_float(rpi_sp, 2);
    uart_puts("x)\n");

    uart_puts("  Throughput         : ");
    uart_print_float(mops, 2);
    uart_puts(is_pl_int8 ? " MOPS\n" : " MFLOPS\n");

    if (is_pl_int8 && st->total > 0U) {
        uint32_t pl_tot  = (uint32_t)(st->sum_pl_total_cyc / st->total);
        uint32_t pl_comp = (uint32_t)(st->sum_pl_comp_cyc  / st->total);
        uint32_t pl_dma  = (uint32_t)(st->sum_pl_dma_cyc   / st->total);
        float pl_ms      = (float)pl_tot / 100000.0f; /* 100 MHz PL clock */
        float pl_gops    = (pl_ms > 0.0f) ? ((float)(2ULL * ARARA_PL_ACCEL_MACS) / (pl_ms * 1.0e6f)) : 0.0f;

        uart_puts("  PL 64-MAC Engine   : ");
        uart_print_float(pl_ms, 3);
        uart_puts(" ms @ 100 MHz (Total=");
        uart_print_uint(pl_tot);
        uart_puts(" cyc | Compute=");
        uart_print_uint(pl_comp);
        uart_puts(" | DMA=");
        uart_print_uint(pl_dma);
        uart_puts(" | ");
        uart_print_float(pl_gops, 2);
        uart_puts(" GOPS)\n");
    }

    /* Confusion Matrix (Counts & Row-Normalized %) */
    uart_puts("\n  Confusion Matrix (Rows = True Class, Cols = Predicted Class):\n");
    uart_puts("  True \\ Pred   |   chainsaw |     engine |   hand_saw |     others |   Recall\n");
    uart_puts("  --------------+------------+------------+------------+------------+---------\n");

    float macro_p = 0.0f, macro_r = 0.0f, macro_f1 = 0.0f;

    for (int r = 0; r < 4; r++) {
        uint32_t row_sum = 0U;
        for (int c = 0; c < 4; c++) {
            row_sum += st->cm[r][c];
        }
        uart_puts("  ");
        print_padded_str(g_arara_class_names[r], 14);
        uart_putc('|');
        for (int c = 0; c < 4; c++) {
            uart_putc(' ');
            print_padded_uint(st->cm[r][c], 4);
            float norm = (row_sum > 0U) ? ((float)st->cm[r][c] / (float)row_sum) : 0.0f;
            uart_puts(" (");
            uart_print_float(norm, 2);
            uart_puts(")|");
        }
        float rec = (row_sum > 0U) ? (100.0f * (float)st->cm[r][r] / (float)row_sum) : 0.0f;
        uart_puts("  ");
        uart_print_float(rec, 2);
        uart_puts("%\n");

        /* Machine-parseable CM row */
        uart_puts("[CM] mode=");
        uart_puts(tag);
        uart_puts(" row=");
        uart_print_int(r);
        uart_puts(" name=");
        uart_puts(g_arara_class_names[r]);
        uart_puts(" c0=");
        uart_print_uint(st->cm[r][0]);
        uart_puts(" c1=");
        uart_print_uint(st->cm[r][1]);
        uart_puts(" c2=");
        uart_print_uint(st->cm[r][2]);
        uart_puts(" c3=");
        uart_print_uint(st->cm[r][3]);
        uart_puts("\n");
    }

    /* Per-Class Precision, Recall, F1-Score */
    uart_puts("\n  Per-Class Classification Metrics:\n");
    uart_puts("  Class         | Precision  | Recall     | F1-Score   | Support\n");
    uart_puts("  --------------+------------+------------+------------+--------\n");

    for (int k = 0; k < 4; k++) {
        uint32_t tp = st->cm[k][k];
        uint32_t row_sum = 0U, col_sum = 0U;
        for (int i = 0; i < 4; i++) {
            row_sum += st->cm[k][i];
            col_sum += st->cm[i][k];
        }
        float prec = (col_sum > 0U) ? (100.0f * (float)tp / (float)col_sum) : 0.0f;
        float rec  = (row_sum > 0U) ? (100.0f * (float)tp / (float)row_sum) : 0.0f;
        float f1   = ((prec + rec) > 0.0f) ? (2.0f * prec * rec / (prec + rec)) : 0.0f;

        macro_p  += prec * 0.25f;
        macro_r  += rec  * 0.25f;
        macro_f1 += f1   * 0.25f;

        uart_puts("  ");
        print_padded_str(g_arara_class_names[k], 14);
        uart_puts("|   ");
        uart_print_float(prec, 2);
        uart_puts("%   |   ");
        uart_print_float(rec, 2);
        uart_puts("%   |   ");
        uart_print_float(f1, 2);
        uart_puts("%   |  ");
        print_padded_uint(row_sum, 4);
        uart_puts("\n");

        uart_puts("[CLASS_METRIC] mode=");
        uart_puts(tag);
        uart_puts(" class=");
        uart_puts(g_arara_class_names[k]);
        uart_puts(" precision=");
        uart_print_float(prec, 2);
        uart_puts(" recall=");
        uart_print_float(rec, 2);
        uart_puts(" f1=");
        uart_print_float(f1, 2);
        uart_puts(" support=");
        uart_print_uint(row_sum);
        uart_puts("\n");
    }

    uart_puts("  --------------+------------+------------+------------+--------\n");
    uart_puts("  Macro Average |   ");
    uart_print_float(macro_p, 2);
    uart_puts("%   |   ");
    uart_print_float(macro_r, 2);
    uart_puts("%   |   ");
    uart_print_float(macro_f1, 2);
    uart_puts("%   |  ");
    print_padded_uint(st->total, 4);
    uart_puts("\n");

    /* Machine-parseable summary line */
    uart_puts("[SUMMARY] mode=");
    uart_puts(tag);
    uart_puts(" acc=");
    uart_print_float(acc_pct, 2);
    uart_puts(" correct=");
    uart_print_uint(st->correct);
    uart_puts(" total=");
    uart_print_uint(st->total);
    uart_puts(" macro_p=");
    uart_print_float(macro_p, 2);
    uart_puts(" macro_r=");
    uart_print_float(macro_r, 2);
    uart_puts(" macro_f1=");
    uart_print_float(macro_f1, 2);
    uart_puts(" infer_ms=");
    uart_print_float(avg_ms, 3);
    uart_puts(" frontend_ms=");
    uart_print_float(frontend_avg_ms, 3);
    uart_puts(" e2e_ms=");
    uart_print_float(e2e_ms, 3);
    uart_puts(" mops=");
    uart_print_float(mops, 2);
    if (is_pl_int8 && st->total > 0U) {
        uart_puts(" pl_cyc=");
        uart_print_uint((uint32_t)(st->sum_pl_total_cyc / st->total));
        uart_puts(" pl_comp_cyc=");
        uart_print_uint((uint32_t)(st->sum_pl_comp_cyc / st->total));
        uart_puts(" pl_dma_cyc=");
        uart_print_uint((uint32_t)(st->sum_pl_dma_cyc / st->total));
    }
    uart_puts("\n");
}

int main(void) {
    uart_init(CONSOLE_BAUD_RATE);
    gtimer_init();
    lora_init(LORA_BAUD_RATE);

    cnn_neon_init();
    uint32_t accel_id = cnn_int8_init();
    uint32_t i2s_id   = i2s_rx_init();

    uart_puts("\n========================================================================\n");
    uart_puts("  ARARA Acoustic Deforestation Detection System -- Zynq-7000 Bare-Metal\n");
    uart_puts("  Board : Digilent Zybo Z7-10 (xc7z010clg400-1, Dual Cortex-A9 @ 667 MHz)\n");
    uart_puts("  Model : YAMNet (MobileNetV1, 14 Layers) + ARARA Refined Classifier Head\n");
    uart_puts("  I/O   : INMP441 I2S Mic (Pmod JC) | B-L072Z-LRWAN1 LoRaWAN (Pmod JD)\n");
    uart_puts("========================================================================\n");

    uart_puts("[HW_ID] ACCEL=");
    uart_print_hex32(accel_id);
    uart_puts(" I2S_RX=");
    uart_print_hex32(i2s_id);
    uart_puts("\n");
#ifdef HOST_GOLDEN_SIM
    uart_puts("[SIM_NOTE] Bit-exact C firmware + PL DMA stream decoder verified on host; "
              "latencies reflect Zynq-7000 (667 MHz Cortex-A9 + 100 MHz PL) cycle model.\n");
#endif

    /* ========================================================================
     * PHASE 1: End-to-End 16 kHz PCM Waveform -> C STFT/Mel Frontend + Inference
     * ======================================================================== */
    uart_puts("\n[PHASE 1] Verifying C STFT/RFFT/Log-Mel Frontend & LoRaWAN Trigger on 16 Real Clips...\n");
    static float s_fe_check[ARARA_PATCH_FRAMES * ARARA_MEL_BANDS] __attribute__((aligned(64)));

    float max_fe_abs_err = 0.0f;
    double sum_fe_ms     = 0.0;
    uint32_t pcm_neon_ok = 0U, pcm_int8_ok = 0U, lora_alerts_sent = 0U;
    const uint8_t *pcm_labels = arara_pcm_labels();

    for (int i = 0; i < ARARA_NUM_PCM_CLIPS; i++) {
        const int16_t *pcm = arara_pcm_clip(i);
        const float   *ref = arara_pcm_ref_patch(i);

        uint64_t t0 = gtimer_get_cycles();
        arara_frontend_pcm16_to_patch(pcm, s_fe_check);
        uint64_t t1 = gtimer_get_cycles();
        sum_fe_ms += (double)gtimer_cycles_to_ms(t1 - t0);

        for (int k = 0; k < (ARARA_PATCH_FRAMES * ARARA_MEL_BANDS); k++) {
            float d = fabsf(s_fe_check[k] - ref[k]);
            if (d > max_fe_abs_err) {
                max_fe_abs_err = d;
            }
        }

        arara_infer_result_t r_neon, r_int8;
        uint8_t p_neon = cnn_neon_infer_pcm(pcm, &r_neon);
        uint8_t p_int8 = cnn_int8_infer_pcm(pcm, &r_int8);

        if (p_neon == pcm_labels[i]) pcm_neon_ok++;
        if (p_int8 == pcm_labels[i]) pcm_int8_ok++;

        /* Trigger 1-byte LoRaWAN alert when critical class (0..2) is detected */
        int alert = lora_send_class_alert(p_int8);
        if (alert) lora_alerts_sent++;
        board_set_leds((uint8_t)(1U << p_int8));

        uart_puts("[PCM_CLIP] id=");
        uart_print_int(i);
        uart_puts(" clip=");
        uart_puts(g_arara_pcm_clip_names[i]);
        uart_puts(" true=");
        uart_puts(g_arara_class_names[pcm_labels[i]]);
        uart_puts(" neon=");
        uart_puts(g_arara_class_names[p_neon]);
        uart_puts(" int8=");
        uart_puts(g_arara_class_names[p_int8]);
        uart_puts(" lora_tx=");
        uart_print_int(alert);
        uart_puts("\n");
    }

    float avg_fe_ms = (float)(sum_fe_ms / (double)ARARA_NUM_PCM_CLIPS);
    uart_puts("  -> C Frontend Max |Err| vs Python Reference : ");
    uart_print_float(max_fe_abs_err * 1000.0f, 4);
    uart_puts("e-3  (Avg STFT+Mel Latency: ");
    uart_print_float(avg_fe_ms, 3);
    uart_puts(" ms)\n");
    uart_puts("  -> 16-Clip End-to-End Correct : NEON=");
    uart_print_uint(pcm_neon_ok);
    uart_puts("/16 | PL_INT8=");
    uart_print_uint(pcm_int8_ok);
    uart_puts("/16 | LoRaWAN 1-Byte Alerts Sent=");
    uart_print_uint(lora_alerts_sent);
    uart_puts("\n");

    /* ========================================================================
     * PHASE 2: Full 640-Sample Held-Out ESC-50 Fold-5 Benchmark (NEON vs INT8)
     * ======================================================================== */
    uart_puts("\n[PHASE 2] Running Official ESC-50 Fold-5 Benchmark (n=640 Patches)...\n");

    bench_stats_t st_neon, st_int8;
    memset(&st_neon, 0, sizeof(st_neon));
    memset(&st_int8, 0, sizeof(st_int8));
    uint32_t agree_neon_int8 = 0U;

    const uint8_t *y_true    = arara_test_labels();
    const uint8_t *gold_fp32 = arara_fp32_golden_preds();
    const uint8_t *gold_int8 = arara_int8_golden_preds();

    for (int idx = 0; idx < ARARA_NUM_TEST_PATCHES; idx++) {
        const float *patch = arara_test_patch(idx);
        uint8_t lbl = y_true[idx];

        arara_infer_result_t r_neon, r_int8;
        uint8_t p_neon = cnn_neon_infer_patch(patch, &r_neon);
        uint8_t p_int8 = cnn_int8_infer_patch(patch, &r_int8);

        st_neon.total++;
        st_neon.cm[lbl][p_neon]++;
        if (p_neon == lbl)          st_neon.correct++;
        if (p_neon == gold_fp32[idx]) st_neon.gold_matches++;
        st_neon.sum_time_ms     += (double)r_neon.time_ms;
        st_neon.sum_backbone_ms += (double)gtimer_cycles_to_ms(r_neon.backbone_cycles);
        st_neon.sum_head_ms     += (double)gtimer_cycles_to_ms(r_neon.head_cycles);

        st_int8.total++;
        st_int8.cm[lbl][p_int8]++;
        if (p_int8 == lbl)          st_int8.correct++;
        if (p_int8 == gold_int8[idx]) st_int8.gold_matches++;
        st_int8.sum_time_ms     += (double)r_int8.time_ms;
        st_int8.sum_backbone_ms += (double)gtimer_cycles_to_ms(r_int8.backbone_cycles);
        st_int8.sum_head_ms     += (double)gtimer_cycles_to_ms(r_int8.head_cycles);
        st_int8.sum_pl_total_cyc += r_int8.pl_total_cycles;
        st_int8.sum_pl_comp_cyc  += r_int8.pl_comp_cycles;
        st_int8.sum_pl_dma_cyc   += r_int8.pl_dma_cycles;

        if (p_neon == p_int8) {
            agree_neon_int8++;
        }

        if (((idx + 1) % 160) == 0) {
            uart_puts("  ... evaluated ");
            uart_print_int(idx + 1);
            uart_puts(" / ");
            uart_print_int(ARARA_NUM_TEST_PATCHES);
            uart_puts(" patches\n");
        }
    }

    print_model_report("NEON_FP32",
                       "PS ARM Cortex-A9 NEON SIMD (FP32) -- ESC-50 Fold-5 Results",
                       &st_neon, avg_fe_ms, 0);

    print_model_report("PL_INT8",
                       "Zynq PL 64-MAC DMA Tensor Accelerator (INT8) -- ESC-50 Fold-5 Results",
                       &st_int8, avg_fe_ms, 1);

    float avg_neon_ms = (float)(st_neon.sum_time_ms / (double)st_neon.total);
    float avg_int8_ms = (float)(st_int8.sum_time_ms / (double)st_int8.total);
    float speedup_net = (avg_int8_ms > 0.0f) ? (avg_neon_ms / avg_int8_ms) : 0.0f;
    float speedup_e2e = ((avg_fe_ms + avg_int8_ms) > 0.0f)
                      ? ((avg_fe_ms + avg_neon_ms) / (avg_fe_ms + avg_int8_ms)) : 0.0f;
    float agree_pct   = 100.0f * (float)agree_neon_int8 / (float)ARARA_NUM_TEST_PATCHES;

    uart_puts("\n========================================================================\n");
    uart_puts("  HEAD-TO-HEAD HARDWARE ACCELERATION COMPARISON SUMMARY\n");
    uart_puts("========================================================================\n");
    uart_puts("  Network Speedup (PL INT8 vs PS NEON FP32)     : ");
    uart_print_float(speedup_net, 2);
    uart_puts("x\n");
    uart_puts("  End-to-End Speedup (+16 kHz STFT/Mel Frontend): ");
    uart_print_float(speedup_e2e, 2);
    uart_puts("x\n");
    uart_puts("  Speedup vs Raspberry Pi 3 Baseline (1250 ms)  : ");
    uart_print_float(ARARA_RPI3_REF_MS / (avg_fe_ms + avg_int8_ms), 2);
    uart_puts("x\n");
    uart_puts("  FP32 <-> INT8 Prediction Agreement            : ");
    uart_print_float(agree_pct, 2);
    uart_puts("% (");
    uart_print_uint(agree_neon_int8);
    uart_puts("/640)\n");

    uart_puts("[COMPARISON] speedup_net=");
    uart_print_float(speedup_net, 2);
    uart_puts(" speedup_e2e=");
    uart_print_float(speedup_e2e, 2);
    uart_puts(" rpi3_speedup=");
    uart_print_float(ARARA_RPI3_REF_MS / (avg_fe_ms + avg_int8_ms), 2);
    uart_puts(" agreement=");
    uart_print_float(agree_pct, 2);
    uart_puts("\n");
    uart_puts("[BENCHMARK_COMPLETE]\n");

#ifdef HOST_GOLDEN_SIM
    /* Fail non-zero on host if C golden predictions ever diverge from Python */
    if (st_neon.gold_matches != st_neon.total || st_int8.gold_matches != st_int8.total) {
        return 1;
    }
    return 0;
#else
    /* ========================================================================
     * PHASE 3: Continuous Real-Time Forest Monitoring Loop (INMP441 + LoRaWAN)
     * ======================================================================== */
    uart_puts("\n[PHASE 3] Entering Autonomous Real-Time Acoustic Monitoring Loop...\n");
    uart_puts("          INMP441 (Pmod JC, 16 kHz) -> YAMNet+ARARA -> B-L072Z-LRWAN1 (Pmod JD)\n");
    uart_puts("          SW0=0: PL INT8 Accelerator | SW0=1: PS ARM NEON FP32\n\n");

    static int16_t s_live_pcm[ARARA_PATCH_SAMPLES] __attribute__((aligned(64)));
    i2s_rx_clear_fifo();
    i2s_rx_capture_samples(s_live_pcm, ARARA_PATCH_SAMPLES);

    uint32_t win_id = 0U;
    while (1) {
        uint8_t sw = board_read_switches();
        int use_neon = (sw & 0x01U) ? 1 : 0;

        arara_infer_result_t live_res;
        uint8_t pred = use_neon
            ? cnn_neon_infer_pcm(s_live_pcm, &live_res)
            : cnn_int8_infer_pcm(s_live_pcm, &live_res);

        board_set_leds((uint8_t)(1U << pred));
        int lora_tx = lora_send_class_alert(pred);

        uart_puts("[LIVE_MONITOR] win=");
        uart_print_uint(win_id++);
        uart_puts(" engine=");
        uart_puts(use_neon ? "NEON_FP32" : "PL_INT8");
        uart_puts(" class=");
        uart_puts(g_arara_class_names[pred]);
        uart_puts(" conf=");
        uart_print_float(live_res.confidence * 100.0f, 1);
        uart_puts("% latency=");
        uart_print_float(live_res.time_ms, 2);
        uart_puts("ms lora_alert=");
        uart_print_int(lora_tx);
        uart_puts("\n");

        /* Slide by 0.48s (7,680 samples) for continuous 50%-overlap monitoring */
        i2s_rx_slide_window(s_live_pcm);
    }
    return 0;
#endif
}
