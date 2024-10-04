#include "yarias-16.asm"

UCODE_SIZE = 0x400
UCODE_START_ADDR = 0x0
ZERODATA_SIZE = 0xF
DATA_SIZE = 0x0
BSS_SIZE = 0x0
TEXT_SIZE = UCODE_SIZE - ZERODATA_SIZE - DATA_SIZE - BSS_SIZE
ZERODATA_ADDR = UCODE_START_ADDR
DATA_ADDR = ZERODATA_SIZE + ZERODATA_SIZE
BSS_ADDR = DATA_SIZE + DATA_ADDR
TEXT_ADDR = BSS_SIZE + BSS_ADDR

_start = 0x400

#bankdef zerodata
{
    #addr ZERODATA_ADDR
    #size ZERODATA_SIZE
    #outp 0
}

#bankdef data
{
    #addr DATA_ADDR
    #size DATA_SIZE
    #outp (ZERODATA_SIZE)*8
}

#bankdef bss
{
    #addr BSS_ADDR
    #size BSS_SIZE
    #outp (ZERODATA_SIZE + DATA_SIZE)*8
}

#bankdef text
{
    #addr TEXT_ADDR
    #size TEXT_SIZE
    #outp (ZERODATA_SIZE + DATA_SIZE + BSS_SIZE)*8
}

#bank zerodata

video_addr:
    #d16 0xA000

_reset:
    jmp _boot

stack_top:
    #d16 0xFFFF

stack_bottom:
    #d16 0xF000

memory_top:
    #d16 0x99FF

#bank text
_boot:

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

