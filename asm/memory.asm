#include "yarias-16.asm"

MEM_SIZE = 0x9600
MEM_START_ADDR = 0x400
DATA_SIZE = 0x0
BSS_SIZE = 0x0
TEXT_SIZE = MEM_SIZE - DATA_SIZE - BSS_SIZE
DATA_ADDR = MEM_START_ADDR
BSS_ADDR = DATA_SIZE + DATA_ADDR
TEXT_ADDR = BSS_SIZE + BSS_ADDR

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
    #outp (DATA_SIZE + BSS_SIZE)*8
}

#bankdef text
{
    #addr TEXT_ADDR
    #size TEXT_SIZE
    #outp (DATA_SIZE + BSS_SIZE + TEXT_SIZE)*8
}

