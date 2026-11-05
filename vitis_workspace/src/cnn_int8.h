#ifndef CNN_INT8_H
#define CNN_INT8_H

#include <stdint.h>
#include "model_weights.h"
#include "cnn_neon.h"

/* ============================================================================
 * PL 64-MAC INT8 DMA Tensor Accelerator Register Map (0x43C10000)
 * ============================================================================ */
#define ACCEL_CTRL_OFFSET       0x00U
#define ACCEL_STATUS_OFFSET     0x04U
#define ACCEL_ACT_ADDR_OFFSET   0x08U
#define ACCEL_WGT_ADDR_OFFSET   0x0CU
#define ACCEL_OUT_ADDR_OFFSET   0x10U
#define ACCEL_DIM_MK_OFFSET     0x14U
#define ACCEL_DIM_N_ZP_OFFSET   0x18U
#define ACCEL_ID_OFFSET         0x1CU
#define ACCEL_PERF_TOTAL_OFFSET 0x20U
#define ACCEL_PERF_COMP_OFFSET  0x24U
#define ACCEL_PERF_DMA_OFFSET   0x28U
#define ACCEL_PERF_MAC8_OFFSET  0x2CU

#define ACCEL_CTRL_START        (1U << 0)
#define ACCEL_CTRL_SOFT_RST     (1U << 1)
#define ACCEL_CTRL_RELU_EN      (1U << 2)
#define ACCEL_CTRL_RAW_I32      (1U << 3)

#define ACCEL_STATUS_BUSY       (1U << 0)
#define ACCEL_STATUS_DONE       (1U << 1)
#define ACCEL_STATUS_ERR        (1U << 2)

/* Initialize PL CNN Tensor Accelerator and return Hardware ID (0xACC64008) */
uint32_t cnn_int8_init(void);

/* Run Hybrid PS-NEON (Conv1/DW/GAP) + PL 64-MAC Tensor Engine (PW/Dense) on a [96*64] patch */
uint8_t cnn_int8_infer_patch(const float *patch_96x64, arara_infer_result_t *res);

/* Run Full Audio Frontend + INT8 PL-Accelerated Inference on 15,600 int16 PCM samples */
uint8_t cnn_int8_infer_pcm(const int16_t *pcm_15600, arara_infer_result_t *res);

#endif /* CNN_INT8_H */
