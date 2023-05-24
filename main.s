.thumb              @ Assembles using thumb mode
.cpu cortex-m3      @ Generates Cortex-M3 instructions
.syntax unified

.include "ivt.s"
.include "gpio_map.inc"
.include "rcc_map.inc"

.section .text
.align	1
.syntax unified
.thumb
.global __main
/* This function sets the bits A[4:0] as digital outputs, and A[6:5] as 
 * digital inputs.
 * Local variables (32-bit words):
 *     - counter: a 5 bits constant that represents numbers in range [-16, 15]
 *     - buttonA: boolean indicating whether the button A is pressed or not
 *     - buttonB: boolean indicating whether the button B is pressed or not
 * Frame size: 24 B
 * +---------+
 * | counter | r7
 * + --------+
 * | buttonA | r7 + 4
 * + --------+
 * | buttonB | r7 + 8
 * + --------+
 * |         |
 * + --------+
 * | r7      |
 * + --------+
 * | lr      |
 * + --------+S
 */
__main:
    # Prologue
    push    {r7, lr}
    sub     sp, #16
    add     r7, sp, #0  
setup: @ Starts peripheral settings
    # enables clock in Port A
    ldr     r0, =RCC_BASE
    mov     r1, #4
    str     r1, [r0, RCC_APB2ENR_OFFSET]
    # configures pin 0 to 7 in GPIOA_CRL
    ldr     r0, =GPIOA_BASE @ moves base address of GPIOA registers
    ldr     r1, =0x48833333 @ PA[4:0] works as output, PA[6:5] as inputs
    str     r1, [r0, GPIOx_CRL_OFFSET] @ M[GPIOA_CRL] gets 0x48833333
    # disables pin 8 to 15 in GPIOA_CRL
    ldr     r1, =0x44444444
    str     r1, [r0, GPIOx_CRH_OFFSET] @ M[GPIOA_CRL] gets 0x44444444
    # initializes variables
    eor     r0, r0       @ clears r0
    str     r0, [r7]     @ counter = 0
    str     r0, [r7, #4] @ buttonA = 0
    str     r0, [r7, #8] @ buttonB = 0
loop: @ Starts microcontroller logic
    # read_button implements the functionality of is_button_pressed()
    # buttonA = read_button(PORTA, PIN6)
    # buttonB = read_button(PORTA, PIN7)
    # if (buttonA && buttonB)
    #     counter = 0;
    # else if (buttonA && !buttonB)
    #     counter++;
    # else if (!buttonA && buttonB)
    #     counter--;
    # output(counter);
    b       loop
