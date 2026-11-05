#ifndef CNN_NEON_H
#define CNN_NEON_H

#include <stdint.h>
#include "model_weights.h"

typedef struct {
    uint8_t  pred_class;          /* 0=chainsaw, 1=engine, 2=hand_saw, 3=others */
    float    confidence;          /* Probability of pred_class in [0, 1] */
    float    probs4[4];           /* 4-class collapsed probabilities */
    uint64_t frontend_cycles;     /* Global Timer cycles for STFT/RFFT/Mel (if run) */
    uint64_t backbone_cycles;     /* Global Timer cycles for 14-layer YAMNet */
    uint64_t head_cycles;         /* Global Timer cycles for ARARA Dense head */
    uint64_t total_cycles;        /* Total Global Timer cycles */
    float    time_ms;             /* Total latency in milliseconds */
    float    mops;                /* Effective throughput in MFLOPS / MOPS */

    /* Hardware Performance Counters from PL Tensor Engine (100 MHz FCLK_CLK0) */
    uint64_t pl_total_cycles;
    uint64_t pl_comp_cycles;
    uint64_t pl_dma_cycles;
    uint64_t pl_macs;
} arara_infer_result_t;

void cnn_neon_init(void);

/* Collapse 8-neuron ARARA logits -> 4-class probabilities + argmax */
uint8_t arara_logits8_to_probs4(const float logits8[8], float probs4[4], float *confidence);

/* Run FP32 ARM NEON YAMNet + ARARA Head on a precomputed [96 * 64] log-mel patch */
uint8_t cnn_neon_infer_patch(const float *patch_96x64, arara_infer_result_t *res);

/* Run Full Audio Frontend + FP32 ARM NEON YAMNet + ARARA Head on 15,600 int16 PCM samples */
uint8_t cnn_neon_infer_pcm(const int16_t *pcm_15600, arara_infer_result_t *res);

#endif /* CNN_NEON_H */
