#ifndef UART_H
#define UART_H

#include <stdint.h>

/* Zybo Z7-10 Onboard FTDI USB-UART Console = PS UART1 (MIO 48..49) */
#define PS_UART1_BASE       0xE0001000U
#define CONSOLE_BAUD_RATE   115200U

void uart_init(uint32_t baud_rate);
void uart_putc(char c);
void uart_puts(const char *str);
int  uart_has_data(void);
char uart_getc(void);

void uart_print_int(int32_t val);
void uart_print_uint(uint32_t val);
void uart_print_hex32(uint32_t val);
void uart_print_float(float val, int decimals);

#endif /* UART_H */
