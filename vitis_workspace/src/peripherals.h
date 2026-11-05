#ifndef PERIPHERALS_H
#define PERIPHERALS_H

#include <stdint.h>

/* ============================================================================
 * PL Hardware Core Base Addresses (Zybo Z7-10 M_AXI_GP0)
 * ============================================================================ */
#define LORA_AXI_UART_BASE     0x43C00000U   /* Pmod JD: B-L072Z-LRWAN1 UART */
#define AXI_CNN_ACCEL_BASE     0x43C10000U   /* 64-MAC INT8 DMA Tensor Engine */
#define AXI_I2S_RX_BASE        0x43C20000U   /* Pmod JC: INMP441 I2S + GPIO */

#define AXI_I2S_EXPECTED_ID    0x12250001U
#define AXI_CNN_EXPECTED_ID    0xACC64008U

/* Zybo Z7-10 Clock Frequencies */
#define ZYNQ_CPU_HZ            666666666.0f
#define ZYNQ_GTIMER_HZ         333333333.0f  /* Cortex-A9 Global Timer = CPU/2 */
#define ZYNQ_PL_CLK_HZ         100000000U    /* FCLK_CLK0 = 100 MHz */
#define LORA_BAUD_RATE         115200U

/* Cortex-A9 64-bit Global Timer */
void     gtimer_init(void);
uint64_t gtimer_get_cycles(void);
float    gtimer_cycles_to_ms(uint64_t cycles);
#ifdef HOST_GOLDEN_SIM
void     sim_add_gtimer_cycles(uint64_t gt_cycles);
#endif

/* INMP441 I2S Master Receiver + 16K-Sample BRAM FIFO (Pmod JC) */
uint32_t i2s_rx_init(void);
uint32_t i2s_rx_fifo_level(void);
void     i2s_rx_clear_fifo(void);
void     i2s_rx_capture_samples(int16_t *dst, uint32_t count);
void     i2s_rx_slide_window(int16_t *window_15600);

/* Zybo Z7-10 User LEDs (LD3..LD0) & Switches (SW1..SW0) */
void     board_set_leds(uint8_t led_mask);
uint8_t  board_read_switches(void);

/* B-L072Z-LRWAN1 LoRaWAN Module Interface (Pmod JD: 1-byte alert payload) */
void     lora_init(uint32_t baud_rate);
int      lora_send_class_alert(uint8_t class_id);

#endif /* PERIPHERALS_H */
