#include "yarias-16.asm"

##bank microcode

#bank microcode

_boot:
; execution starts at 2
nop

xor r1, r1
xor r2, r2
xor r3, r3
xor r4, r4
xor r5, r5
xor r6, r6
xor r7, r7
xor r8, r8
xor r9, r9
xor r10, r10
xor r11, r11
xor r12, r12
xor r13, r13
xor r14, r14
xor r15, r15

ldi sp, 0xFFFD
mov fp, sp

jmp _start

