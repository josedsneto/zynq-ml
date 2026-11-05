#include "peripherals.h"
#include "model_weights.h"
#include <string.h>

#ifdef HOST_GOLDEN_SIM

static uint64_t s_sim_gt_cycles = 0ULL;

void gtimer_init(void) {
    s_sim_gt_cycles = 0ULL;
}

void sim_add_gtimer_cycles(uint64_t gt_cycles) {
    s_sim_gt_cycles += gt_cycles;
}

uint64_t gtimer_get_cycles(void) {
    return s_sim_gt_cycles;
}

float gtimer_cycles_to_ms(uint64_t cycles) {
    return (float)cycles * (1000.0f / ZYNQ_GTIMER_HZ);
}

uint32_t i2s_rx_init(void) { return AXI_I2S_EXPECTED_ID; }
uint32_t i2s_rx_fifo_level(void) { return 0U; }
void     i2s_rx_clear_fifo(void) { }
void     i2s_rx_capture_samples(int16_t *dst, uint32_t count) { memset(dst, 0, count * sizeof(int16_t)); }
void     i2s_rx_slide_window(int16_t *window_15600) { (void)window_15600; }
void     board_set_leds(uint8_t led_mask) { (void)led_mask; }
uint8_t  board_read_switches(void) { return 0U; }
void     lora_init(uint32_t baud_rate) { (void)baud_rate; }

int lora_send_class_alert(uint8_t class_id) {
    /* Critical classes: 0=chainsaw, 1=engine, 2=hand_saw (3=others suppressed) */
    return (class_id < 3U) ? 1 : 0;
}

#else /* Bare-metal Zynq-7000 Hardware Drivers */

/* Weak freestanding memory primitives (used with -nostdlib; overridden if linked with Vitis libc) */
__attribute__((weak)) void *memcpy(void *dst, const void *src, size_t n) {
    uint8_t *d = (uint8_t *)dst;
    const uint8_t *s = (const uint8_t *)src;
    while (n--) {
        *d++ = *s++;
    }
    return dst;
}

__attribute__((weak)) void *memset(void *dst, int val, size_t n) {
    uint8_t *d = (uint8_t *)dst;
    uint8_t b = (uint8_t)val;
    while (n--) {
        *d++ = b;
    }
    return dst;
}

__attribute__((weak)) void *memmove(void *dst, const void *src, size_t n) {
    uint8_t *d = (uint8_t *)dst;
    const uint8_t *s = (const uint8_t *)src;
    if (d < s || d >= s + n) {
        while (n--) {
            *d++ = *s++;
        }
    } else {
        d += n;
        s += n;
        while (n--) {
            *--d = *--s;
        }
    }
    return dst;
}

/* Cortex-A9 Global Timer Registers (0xF8F00200) */
#define GT_COUNTER_LO          (*(volatile uint32_t *)0xF8F00200U)
#define GT_COUNTER_HI          (*(volatile uint32_t *)0xF8F00204U)
#define GT_CONTROL             (*(volatile uint32_t *)0xF8F00208U)

/* PL AXI I2S RX Registers (0x43C20000) */
#define I2S_CTRL_REG           (*(volatile uint32_t *)(AXI_I2S_RX_BASE + 0x00U))
#define I2S_STATUS_REG         (*(volatile uint32_t *)(AXI_I2S_RX_BASE + 0x04U))
#define I2S_LEVEL_REG          (*(volatile uint32_t *)(AXI_I2S_RX_BASE + 0x08U))
#define I2S_DATA_REG           (*(volatile uint32_t *)(AXI_I2S_RX_BASE + 0x0CU))
#define I2S_LEDS_REG           (*(volatile uint32_t *)(AXI_I2S_RX_BASE + 0x10U))
#define I2S_ID_REG             (*(volatile uint32_t *)(AXI_I2S_RX_BASE + 0x14U))

#define I2S_CTRL_EN            (1U << 0)
#define I2S_CTRL_FIFO_CLR      (1U << 1)
#define I2S_CTRL_LORA_TRIG     (1U << 2)

/* PL AXI UART Registers for B-L072Z-LRWAN1 (0x43C00000) */
#define LORA_UART_DATA         (*(volatile uint32_t *)(LORA_AXI_UART_BASE + 0x00U))
#define LORA_UART_STATUS       (*(volatile uint32_t *)(LORA_AXI_UART_BASE + 0x04U))
#define LORA_UART_CTRL         (*(volatile uint32_t *)(LORA_AXI_UART_BASE + 0x08U))
#define LORA_UART_BAUD_DIV     (*(volatile uint32_t *)(LORA_AXI_UART_BASE + 0x0CU))

#define LORA_UART_TX_BUSY      (1U << 0)

void gtimer_init(void) {
    GT_CONTROL = 0x01U; /* Enable 64-bit free-running counter, prescaler = 0 */
}

uint64_t gtimer_get_cycles(void) {
    uint32_t hi1, lo, hi2;
    do {
        hi1 = GT_COUNTER_HI;
        lo  = GT_COUNTER_LO;
        hi2 = GT_COUNTER_HI;
    } while (hi1 != hi2);
    return ((uint64_t)hi1 << 32) | (uint64_t)lo;
}

float gtimer_cycles_to_ms(uint64_t cycles) {
    return (float)cycles * (1000.0f / ZYNQ_GTIMER_HZ);
}

uint32_t i2s_rx_init(void) {
    uint32_t hw_id = I2S_ID_REG;
    I2S_CTRL_REG = I2S_CTRL_FIFO_CLR;
    I2S_CTRL_REG = I2S_CTRL_EN;
    I2S_LEDS_REG = 0x0U;
    return hw_id;
}

uint32_t i2s_rx_fifo_level(void) {
    return I2S_LEVEL_REG;
}

void i2s_rx_clear_fifo(void) {
    uint32_t ctrl = I2S_CTRL_REG & I2S_CTRL_EN;
    I2S_CTRL_REG = ctrl | I2S_CTRL_FIFO_CLR;
}

void i2s_rx_capture_samples(int16_t *dst, uint32_t count) {
    uint32_t idx = 0U;
    while (idx < count) {
        uint32_t avail = I2S_LEVEL_REG;
        if (avail == 0U) {
            continue;
        }
        uint32_t burst = count - idx;
        if (avail < burst) {
            burst = avail;
        }
        for (uint32_t i = 0U; i < burst; i++) {
            dst[idx++] = (int16_t)(int32_t)I2S_DATA_REG;
        }
    }
}

void i2s_rx_slide_window(int16_t *window_15600) {
    const uint32_t keep = ARARA_PATCH_SAMPLES - ARARA_PATCH_HOP_SAMPLES; /* 7920 */
    memmove(window_15600, window_15600 + ARARA_PATCH_HOP_SAMPLES, keep * sizeof(int16_t));
    i2s_rx_capture_samples(window_15600 + keep, ARARA_PATCH_HOP_SAMPLES);
}

void board_set_leds(uint8_t led_mask) {
    I2S_LEDS_REG = (uint32_t)(led_mask & 0x0FU);
}

uint8_t board_read_switches(void) {
    return (uint8_t)((I2S_STATUS_REG >> 4) & 0x03U);
}

void lora_init(uint32_t baud_rate) {
    uint32_t div16 = ZYNQ_PL_CLK_HZ / (16U * baud_rate);
    if (div16 < 2U) {
        div16 = 54U;
    }
    LORA_UART_BAUD_DIV = div16;
    LORA_UART_CTRL     = 0x00U;
}

int lora_send_class_alert(uint8_t class_id) {
    /* Paper Sec. III-C: Only transmit 1-byte alert for critical deforestation classes:
     *   0x00 = chainsaw, 0x01 = engine, 0x02 = hand_saw (0x03 = others is ignored)
     */
    if (class_id >= 3U) {
        return 0;
    }

    /* Pulse lora_trig_o wake/interrupt pin to B-L072Z-LRWAN1 while keeping I2S active */
    uint32_t base_ctrl = I2S_CTRL_REG & I2S_CTRL_EN;
    I2S_CTRL_REG = base_ctrl | I2S_CTRL_LORA_TRIG;

    /* Wait for UART TX ready and send compact 1-byte class identifier */
    while (LORA_UART_STATUS & LORA_UART_TX_BUSY) { }
    LORA_UART_DATA = (uint32_t)class_id;
    while (LORA_UART_STATUS & LORA_UART_TX_BUSY) { }

    I2S_CTRL_REG = base_ctrl;
    return 1;
}

#endif /* HOST_GOLDEN_SIM */
