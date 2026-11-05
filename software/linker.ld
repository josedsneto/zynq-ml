ENTRY(_start)

MEMORY
{
    /* Zybo Z7-10 has 1 GB DDR3L (0x00100000 .. 0x3FFFFFFF); reserve 256 MB */
    RAM (rwx) : ORIGIN = 0x00100000, LENGTH = 256M
}

SECTIONS
{
    .text : {
        KEEP(*(.vector_table))
        *(.text*)
        . = ALIGN(4096);
        *(.rodata*)
        . = ALIGN(4096);
    } > RAM

    .data : {
        . = ALIGN(64);
        *(.data*)
        . = ALIGN(64);
    } > RAM

    .bss (NOLOAD) : {
        . = ALIGN(16384);
        __bss_start__ = .;
        *(.mmu_tbl)
        *(.bss*)
        *(COMMON)
        . = ALIGN(64);
        __bss_end__ = .;
    } > RAM

    /* Dedicated 1 MiB Non-Cacheable DMA Window for S_AXI_HP0 <-> PL Tensor Engine */
    .dma_buf (NOLOAD) : ALIGN(0x00100000) {
        __dma_section_start = .;
        *(.dma_buf*)
        . = ALIGN(0x00100000);
        __dma_section_end = .;
    } > RAM

    /* 4 MiB Stack placed well above code, 34 MiB model blob, .bss and .dma_buf */
    . = ALIGN(0x00100000);
    _stack_bottom = .;
    . = . + 0x00400000;
    _stack_top = .;
}
