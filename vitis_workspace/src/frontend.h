#ifndef FRONTEND_H
#define FRONTEND_H

#include <stdint.h>
#include "model_weights.h"

/* Initialize 512-pt FFT twiddle & bit-reversal tables (call once at boot) */
void arara_frontend_init(void);

/* Convert 15,600 float32 waveform samples [-1, 1] @ 16 kHz -> [96 * 64] log-mel patch */
void arara_frontend_f32_to_patch(const float *wav_15600, float *out_patch_96x64);

/* Convert 15,600 int16 PCM samples @ 16 kHz (INMP441 format) -> [96 * 64] log-mel patch */
void arara_frontend_pcm16_to_patch(const int16_t *pcm_15600, float *out_patch_96x64);

#endif /* FRONTEND_H */

