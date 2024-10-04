#include "yarias-16.asm"

MEM_SIZE = 0x9600
MEM_START_ADDR = 0x400
DATA_SIZE = 0x0
BSS_SIZE = 0x200
TEXT_SIZE = MEM_SIZE - DATA_SIZE - BSS_SIZE
TEXT_ADDR = MEM_START_ADDR
DATA_ADDR = TEXT_SIZE + TEXT_ADDR
BSS_ADDR = DATA_SIZE + DATA_ADDR

#bankdef text
{
    #addr TEXT_ADDR
    #size TEXT_SIZE
    #outp 0
}

#bankdef data
{
    #addr DATA_ADDR
    #size DATA_SIZE
    #outp (TEXT_SIZE)*8
}

#bankdef bss
{
    #addr BSS_ADDR
    #size BSS_SIZE
    #outp (TEXT_SIZE + DATA_SIZE)*8
}

