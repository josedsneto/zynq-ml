#include "uart.h"

#ifdef HOST_GOLDEN_SIM
#include <stdio.h>

void uart_init(uint32_t baud_rate) {
    (void)baud_rate;
}

void uart_putc(char c) {
    if (c != '\r') {
        putchar((unsigned char)c);
    }
}

void uart_puts(const char *str) {
    while (*str) {
        uart_putc(*str++);
    }
    fflush(stdout);
}

int uart_has_data(void) {
    return 0;
}

char uart_getc(void) {
    return '\0';
}

#else /* Bare-metal Zynq-7000 PS UART1 (Zybo Z7-10 MIO 48..49, 100 MHz RefClk) */

#define PS_UART_CR          (*(volatile uint32_t *)(PS_UART1_BASE + 0x00U))
#define PS_UART_MR          (*(volatile uint32_t *)(PS_UART1_BASE + 0x04U))
#define PS_UART_BAUDGEN     (*(volatile uint32_t *)(PS_UART1_BASE + 0x18U))
#define PS_UART_SR          (*(volatile uint32_t *)(PS_UART1_BASE + 0x2CU))
#define PS_UART_FIFO        (*(volatile uint32_t *)(PS_UART1_BASE + 0x30U))
#define PS_UART_BAUDDIV     (*(volatile uint32_t *)(PS_UART1_BASE + 0x34U))

#define PS_CR_TXDIS         (1U << 5)
#define PS_CR_TXEN          (1U << 4)
#define PS_CR_RXDIS         (1U << 3)
#define PS_CR_RXEN          (1U << 2)
#define PS_CR_TXRES         (1U << 1)
#define PS_CR_RXRES         (1U << 0)
#define PS_SR_TXFULL        (1U << 4)
#define PS_SR_TXEMPTY       (1U << 3)
#define PS_SR_RXEMPTY       (1U << 1)

void uart_init(uint32_t baud_rate) {
    /* Wait for any pending TX bytes from bootrom/ps7_init to drain */
    while (!(PS_UART_SR & PS_SR_TXEMPTY)) { }

    /* Reset TX/RX paths */
    PS_UART_CR = PS_CR_TXDIS | PS_CR_RXDIS | PS_CR_TXRES | PS_CR_RXRES;

    /* 8 data bits, no parity, 1 stop bit */
    PS_UART_MR = 0x00000020U;

    /* Baud = 100,000,000 / (CD * (BDIV + 1))
     * For 115200 bps: BDIV = 6 (div 7), CD = 124 -> 115,207 bps (0.006% err)
     * For 230400 bps: BDIV = 6 (div 7), CD = 62  -> 230,414 bps (0.006% err)
     */
    if (baud_rate == 230400U) {
        PS_UART_BAUDDIV = 6U;
        PS_UART_BAUDGEN = 62U;
    } else {
        PS_UART_BAUDDIV = 6U;
        PS_UART_BAUDGEN = 124U;
    }

    PS_UART_CR = PS_CR_TXEN | PS_CR_RXEN;
}

void uart_putc(char c) {
    while (PS_UART_SR & PS_SR_TXFULL) { }
    PS_UART_FIFO = (uint32_t)(uint8_t)c;
}

void uart_puts(const char *str) {
    while (*str) {
        if (*str == '\n') {
            uart_putc('\r');
        }
        uart_putc(*str++);
    }
}

int uart_has_data(void) {
    return (PS_UART_SR & PS_SR_RXEMPTY) ? 0 : 1;
}

char uart_getc(void) {
    while (!uart_has_data()) { }
    return (char)(PS_UART_FIFO & 0xFFU);
}

#endif /* HOST_GOLDEN_SIM */

void uart_print_uint(uint32_t val) {
    char buf[16];
    int i = 0;
    if (val == 0U) {
        uart_putc('0');
        return;
    }
    while (val > 0U) {
        buf[i++] = (char)('0' + (val % 10U));
        val /= 10U;
    }
    while (i > 0) {
        uart_putc(buf[--i]);
    }
}

void uart_print_int(int32_t val) {
    if (val < 0) {
        uart_putc('-');
        uart_print_uint((uint32_t)(-(int64_t)val));
    } else {
        uart_print_uint((uint32_t)val);
    }
}

void uart_print_hex32(uint32_t val) {
    static const char hex[] = "0123456789ABCDEF";
    uart_puts("0x");
    for (int shift = 28; shift >= 0; shift -= 4) {
        uart_putc(hex[(val >> shift) & 0xFU]);
    }
}

void uart_print_float(float val, int decimals) {
    if (val < 0.0f) {
        uart_putc('-');
        val = -val;
    }

    float round_offset = 0.5f;
    for (int d = 0; d < decimals; d++) {
        round_offset *= 0.1f;
    }
    val += round_offset;

    uint32_t int_part = (uint32_t)val;
    uart_print_uint(int_part);

    if (decimals > 0) {
        uart_putc('.');
        float frac = val - (float)int_part;
        for (int d = 0; d < decimals; d++) {
            frac *= 10.0f;
            int32_t digit = (int32_t)frac;
            if (digit < 0) digit = 0;
            if (digit > 9) digit = 9;
            uart_putc((char)('0' + digit));
            frac -= (float)digit;
        }
    }
}
