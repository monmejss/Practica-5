.cpu cortex-m3     
.extern __main
.section .text
.align	1
.syntax unified
.thumb
.global Reset_Handler
Reset_Handler:
        ldr     r0, =__main+1 
        bx      r0            
        b       .             
.size   Reset_Handler, .-Reset_Handler
