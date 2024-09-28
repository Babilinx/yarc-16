#include "yarias-16.asm"

UCODE_SIZE = 0x400
UCODE_START_ADDR = 0x0
DATA_SIZE = 0x0
BSS_SIZE = 0x0
TEXT_SIZE = UCODE_SIZE - DATA_SIZE - BSS_SIZE
DATA_ADDR = UCODE_START_ADDR
BSS_ADDR = DATA_SIZE + DATA_ADDR
TEXT_ADDR = BSS_SIZE + BSS_ADDR

_start = 0x400

#bankdef data
{
    #addr DATA_ADDR
    #size DATA_SIZE
    #outp 0
}

#bankdef bss
{
    #addr BSS_ADDR
    #size BSS_SIZE
    #outp (DATA_SIZE)*8
}

#bankdef text
{
    #addr TEXT_ADDR
    #size TEXT_SIZE
    #outp (DATA_SIZE + BSS_SIZE)*8
}

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

    li sp, 0xFFFD
    mov fp, sp

    br _start

