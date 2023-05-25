.section .text
.include "gpio_map.inc"
.align	1
.syntax unified
.thumb
.global digital_read
.thumb_func
.type	digital_read, %function
digital_read:
        str     r2, [r0, GPIOx_IDR_OFFSET]
        lsr     r2, r1
        mov     r0, r2
        bx      lr
