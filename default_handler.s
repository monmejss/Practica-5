.cpu cortex-m3
.section .text
.align	1
.syntax unified
.thumb
.global Default_Handler
Default_Handler: 
        b   .
.size   Default_Handler, .-Default_Handler
