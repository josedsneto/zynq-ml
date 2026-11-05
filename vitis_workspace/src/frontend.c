#include "frontend.h"
#include "peripherals.h"
#include <math.h>

#ifdef __ARM_NEON
#include <arm_neon.h>
#endif

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

static uint16_t s_bitrev[ARARA_FFT_SIZE];
static float    s_tw_re[ARARA_FFT_SIZE / 2];
static float    s_tw_im[ARARA_FFT_SIZE / 2];
static int      s_fe_initialized = 0;

/* Scratch buffers (single-threaded bare-metal execution) */
static float s_wav_norm[ARARA_PATCH_SAMPLES];
static float s_fft_re[ARARA_FFT_SIZE];
static float s_fft_im[ARARA_FFT_SIZE];
static float s_spec_mag[ARARA_FFT_BINS];

void arara_frontend_init(void) {
    if (s_fe_initialized) {
        return;
    }
    for (uint32_t i = 0; i < ARARA_FFT_SIZE; i++) {
        uint32_t x = i;
        uint32_t r = 0;
        for (int b = 0; b < 9; b++) { /* log2(512) = 9 */
            r = (r << 1) | (x & 1U);
            x >>= 1;
        }
        s_bitrev[i] = (uint16_t)r;
    }
    for (uint32_t k = 0; k < (ARARA_FFT_SIZE / 2); k++) {
        double angle = -2.0 * M_PI * (double)k / (double)ARARA_FFT_SIZE;
        s_tw_re[k] = (float)cos(angle);
        s_tw_im[k] = (float)sin(angle);
    }
    s_fe_initialized = 1;
}

static void fft512_mag257(const float *frame_400, const float *hann_400, float *mag_257) {
    float win_buf[ARARA_FFT_SIZE];

#ifdef __ARM_NEON
    for (int i = 0; i < ARARA_STFT_WIN; i += 4) {
        float32x4_t x = vld1q_f32(frame_400 + i);
        float32x4_t w = vld1q_f32(hann_400 + i);
        vst1q_f32(win_buf + i, vmulq_f32(x, w));
    }
    float32x4_t z = vdupq_n_f32(0.0f);
    for (int i = ARARA_STFT_WIN; i < ARARA_FFT_SIZE; i += 4) {
        vst1q_f32(win_buf + i, z);
    }
#else
    for (int i = 0; i < ARARA_STFT_WIN; i++) {
        win_buf[i] = frame_400[i] * hann_400[i];
    }
    for (int i = ARARA_STFT_WIN; i < ARARA_FFT_SIZE; i++) {
        win_buf[i] = 0.0f;
    }
#endif

    for (int i = 0; i < ARARA_FFT_SIZE; i++) {
        s_fft_re[i] = win_buf[s_bitrev[i]];
        s_fft_im[i] = 0.0f;
    }

    for (int len = 2; len <= ARARA_FFT_SIZE; len <<= 1) {
        int half = len >> 1;
        int step = ARARA_FFT_SIZE / len;
        for (int i = 0; i < ARARA_FFT_SIZE; i += len) {
            int tw = 0;
            for (int j = 0; j < half; j++, tw += step) {
                float wr = s_tw_re[tw];
                float wi = s_tw_im[tw];
                int idx0 = i + j;
                int idx1 = idx0 + half;
                float xr = s_fft_re[idx1];
                float xi = s_fft_im[idx1];
                float vr = xr * wr - xi * wi;
                float vi = xr * wi + xi * wr;
                float ur = s_fft_re[idx0];
                float ui = s_fft_im[idx0];
                s_fft_re[idx0] = ur + vr;
                s_fft_im[idx0] = ui + vi;
                s_fft_re[idx1] = ur - vr;
                s_fft_im[idx1] = ui - vi;
            }
        }
    }

    for (int k = 0; k < ARARA_FFT_BINS; k++) {
        float r = s_fft_re[k];
        float m = s_fft_im[k];
        mag_257[k] = sqrtf(r * r + m * m);
    }
}

void arara_frontend_f32_to_patch(const float *wav_15600, float *out_patch_96x64) {
    if (!s_fe_initialized) {
        arara_frontend_init();
    }

    const float    *hann      = arara_hann_window();
    const float    *mel_T     = arara_mel_weights_T();
    const uint16_t *mel_start = arara_mel_bin_start();
    const uint16_t *mel_end   = arara_mel_bin_end();

    for (int f = 0; f < ARARA_PATCH_FRAMES; f++) {
        const float *frame_ptr = wav_15600 + f * ARARA_STFT_HOP;
        fft512_mag257(frame_ptr, hann, s_spec_mag);

        float *out_row = out_patch_96x64 + f * ARARA_MEL_BANDS;
        for (int m = 0; m < ARARA_MEL_BANDS; m++) {
            uint16_t b0 = mel_start[m];
            uint16_t b1 = mel_end[m];
            const float *mrow = mel_T + (uint32_t)m * ARARA_FFT_BINS;
            float sum = 0.0f;
            for (uint16_t k = b0; k < b1; k++) {
                sum += s_spec_mag[k] * mrow[k];
            }
            out_row[m] = logf(sum + ARARA_LOG_OFFSET);
        }
    }
#ifdef HOST_GOLDEN_SIM
    /* Zynq-7000 Cortex-A9 @ 667 MHz cycle model for 96 x 512-pt FFT + 64-Mel + logf (~2.45 ms) */
    sim_add_gtimer_cycles(816667ULL);
#endif
}

void arara_frontend_pcm16_to_patch(const int16_t *pcm_15600, float *out_patch_96x64) {
    const float inv_scale = 1.0f / 32768.0f;
#ifdef __ARM_NEON
    float32x4_t vscale = vdupq_n_f32(inv_scale);
    int i = 0;
    for (; i <= ARARA_PATCH_SAMPLES - 8; i += 8) {
        int16x8_t v16 = vld1q_s16(pcm_15600 + i);
        int32x4_t vlo = vmovl_s16(vget_low_s16(v16));
        int32x4_t vhi = vmovl_s16(vget_high_s16(v16));
        vst1q_f32(s_wav_norm + i,     vmulq_f32(vcvtq_f32_s32(vlo), vscale));
        vst1q_f32(s_wav_norm + i + 4, vmulq_f32(vcvtq_f32_s32(vhi), vscale));
    }
    for (; i < ARARA_PATCH_SAMPLES; i++) {
        s_wav_norm[i] = (float)pcm_15600[i] * inv_scale;
    }
#else
    for (int i = 0; i < ARARA_PATCH_SAMPLES; i++) {
        s_wav_norm[i] = (float)pcm_15600[i] * inv_scale;
    }
#endif
    arara_frontend_f32_to_patch(s_wav_norm, out_patch_96x64);
}
