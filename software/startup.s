/* ============================================================================
 * Bare-Metal ARM Cortex-A9 Startup for Digilent Zybo Z7-10 (Zynq-7000)
 *   - Safe cold-boot & JTAG warm-reload cache/TLB hygiene
 *   - VFPv3 / ARM NEON SIMD coprocessor enable (CP10 & CP11)
 *   - Flat 1 MiB Section MMU table:
 *       * 0x00000000..0x3FFFFFFF : Normal Write-Back Cacheable DDR3L
 *       * __dma_section_start    : Normal Non-Cacheable (100% S_AXI_HP0 coherent)
 *       * 0x40000000..0xFFFFFFFF : Shareable Device (PL AXI GP0, PS UART1, Timer)
 *   - Enables L1 I-Cache, L1 D-Cache, Branch Prediction, and Cortex-A9 Global Timer
 * ============================================================================ */
    .syntax unified
    .cpu cortex-a9
    .fpu neon
    .arm

    .section .mmu_tbl, "aw", %nobits
    .balign 16384
    .global g_mmu_tlb_table
g_mmu_tlb_table:
    .space 16384

    .section .vector_table, "ax"
    .global _start
_start:
    /* 1. Mask IRQ/FIQ and switch to Supervisor (SVC) mode */
    cpsid   if, #0x13
    ldr     sp, =_stack_top

    /* 2. If L1 D-Cache is currently enabled (warm JTAG reload), clean+invalidate
     *    all 4 ways x 256 sets of the 32 KiB Cortex-A9 L1 D-Cache first */
    mrc     p15, 0, r0, c1, c0, 0       /* Read SCTLR */
    tst     r0, #(1 << 2)               /* Check C bit */
    beq     caches_off_done

    mov     r1, #0                      /* way = 0..3 */
way_clean_loop:
    mov     r2, #0                      /* set = 0..255 */
set_clean_loop:
    orr     r3, r2, r1, lsl #30
    mcr     p15, 0, r3, c7, c14, 2      /* DCCISW: Clean & Invalidate by Set/Way */
    add     r2, r2, #(1 << 5)
    cmp     r2, #(256 << 5)
    blt     set_clean_loop
    add     r1, r1, #1
    cmp     r1, #4
    blt     way_clean_loop
    dsb

    /* Disable MMU, D-Cache, I-Cache, Branch Predictor during table setup */
    bic     r0, r0, #(1 << 0)           /* M = 0 */
    bic     r0, r0, #(1 << 2)           /* C = 0 */
    bic     r0, r0, #(1 << 11)          /* Z = 0 */
    bic     r0, r0, #(1 << 12)          /* I = 0 */
    mcr     p15, 0, r0, c1, c0, 0
    dsb
    isb

caches_off_done:
    /* 3. Invalidate L1 D-Cache (4 ways x 256 sets), I-Cache, Branch Pred & TLB */
    mov     r1, #0
way_inv_loop:
    mov     r2, #0
set_inv_loop:
    orr     r3, r2, r1, lsl #30
    mcr     p15, 0, r3, c7, c6, 2       /* DCISW: Invalidate by Set/Way */
    add     r2, r2, #(1 << 5)
    cmp     r2, #(256 << 5)
    blt     set_inv_loop
    add     r1, r1, #1
    cmp     r1, #4
    blt     way_inv_loop

    mov     r0, #0
    mcr     p15, 0, r0, c7, c5, 0       /* ICIALLU: Invalidate I-Cache */
    mcr     p15, 0, r0, c7, c5, 6       /* BPIALL:  Invalidate Branch Predictor */
    mcr     p15, 0, r0, c8, c7, 0       /* TLBIALL: Invalidate Unified TLB */
    dsb
    isb

    /* 4. Zero .bss (includes g_mmu_tlb_table) */
    ldr     r0, =__bss_start__
    ldr     r1, =__bss_end__
    mov     r2, #0
clear_bss:
    cmp     r0, r1
    bge     build_mmu_table
    str     r2, [r0], #4
    b       clear_bss

    /* 5. Populate 4096 x 1 MiB Section MMU Table */
build_mmu_table:
    ldr     r0, =g_mmu_tlb_table
    ldr     r4, =__dma_section_start
    lsr     r4, r4, #20                 /* 1 MiB section index of .dma_buf */

    mov     r1, #0                      /* section = 0 .. 4095 */
mmu_loop:
    cmp     r1, #0x400                  /* 0x000..0x3FF = 1 GB DDR + OCM */
    bge     mmu_dev_attr
    cmp     r1, r4
    beq     mmu_nc_attr

    /* Normal Write-Back Write-Allocate Cacheable: TEX=001, C=1, B=1, AP=11 (0x1C0E) */
    ldr     r2, =0x00001C0E
    b       mmu_write_entry

mmu_nc_attr:
    /* Normal Non-Cacheable for PL S_AXI_HP0 DMA window: TEX=001, C=0, B=0, AP=11 (0x1C02) */
    ldr     r2, =0x00001C02
    b       mmu_write_entry

mmu_dev_attr:
    /* Shareable Device, Execute-Never for PL AXI + PS Peripherals: 0x0C16 */
    ldr     r2, =0x00000C16

mmu_write_entry:
    orr     r3, r2, r1, lsl #20
    str     r3, [r0, r1, lsl #2]
    add     r1, r1, #1
    cmp     r1, #4096
    blt     mmu_loop
    dsb

    /* 6. Configure Domain Access (Client on all domains), TTBR0, TTBCR=0, enable MMU+Caches */
    ldr     r0, =0x55555555
    mcr     p15, 0, r0, c3, c0, 0       /* DACR */
    mov     r0, #0
    mcr     p15, 0, r0, c2, c0, 2       /* TTBCR = 0 (use TTBR0 for full 4 GB) */
    ldr     r0, =g_mmu_tlb_table
    orr     r0, r0, #0x5B               /* RGN=01, S=1, IRGN=01 */
    mcr     p15, 0, r0, c2, c0, 0       /* TTBR0 */
    dsb
    isb

    mrc     p15, 0, r0, c1, c0, 0       /* Read SCTLR */
    orr     r0, r0, #(1 << 0)           /* M: Enable MMU */
    orr     r0, r0, #(1 << 2)           /* C: Enable L1 D-Cache */
    orr     r0, r0, #(1 << 11)          /* Z: Enable Branch Prediction */
    orr     r0, r0, #(1 << 12)          /* I: Enable L1 I-Cache */
    mcr     p15, 0, r0, c1, c0, 0
    dsb
    isb

    /* 7. Enable VFPv3 & ARM NEON SIMD Coprocessors (CP10 and CP11) */
    mrc     p15, 0, r0, c1, c0, 2
    orr     r0, r0, #(0xF << 20)
    mcr     p15, 0, r0, c1, c0, 2
    isb
    mov     r0, #(1 << 30)
    vmsr    fpexc, r0

    /* 8. Enter Bare-Metal C Application */
    bl      main

hang:
    wfe
    b       hang
