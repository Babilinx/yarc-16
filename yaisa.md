# Yaisa

Yaisa have 43 instructions derivated from RISC-V compressed instructions.

## Changes from the last ISA

- Immediate are bigger (up to 11 bits)
    - Branch from +/- 256 B (near) or 32 KiB (far)
    - Jump from +/- 2 KiB (near) or 32 KiB (far)
    - Arithmetic with 8 bits immediate
    - Load/store with 5 bit immediate
- Add AUIPC for big jumps
- Add SWSP, LWSP and ADDI2SP for more easy stack accessible data
- Branch logic only check for zero or non-zero
- Set instructions do the arithmetic check
- Shift right immediate when possible (only even addresses)

# Instructions
## Format
```
Format  Meaning         15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0   Immediate size
R       Register        0|   funct5    | rd/rs1 |  rs2  | op    0
I       Immediate       funct3 | imm   | rd/rs1 |  imm  | op    7
SS      Stack-relative  funct3 |      imm       |  rs2  | op    7
WI      Wide Immediate  funct3 |      imm         | rd' | op    8
L       Load            funct3 |   imm   | rs1' |i| rd' | op    5
S       Store           funct3 |   imm   | rs1' |i| rs2'| op    5
B       Branch          funct3 |   imm   | rs1' |  imm  | op    8
J       Jump            funct3 |     jump target        | op    11
```

### Register type

MV  :   funct5 = 00000b     ;   op = 000b

SGT :   funct5 = 00001b     ;   op = 000b
SGU :   funct5 = 00010b     ;   op = 000b
SEQ :   funct5 = 00011b     ;   op = 000b
SNE :   funct5 = 00100b     ;   op = 000b
SLTE :   funct5 = 00110b     ;   op = 000b
SLEU :   funct5 = 00111b     ;   op = 000b

ADD :   funct5 = 10000b     ;   op = 000b
SUB :   funct5 = 10001b     ;   op = 000b
AND :   funct5 = 10010b     ;   op = 000b
LLS :   funct5 = 10011b     ;   op = 000b
RLS :   funct5 = 10100b     ;   op = 000b
RAS :   funct5 = 10101b     ;   op = 000b
XOR :   funct5 = 10110b     ;   op = 000b
OR  :   funct5 = 10111b     ;   op = 000b
NOT :   funct5 = 11000b     ;   op = 000b
MUL :   funct5 = 11001b     ;   op = 000b
DIV :   funct5 = 11010b     ;   op = 000b
REM :   funct5 = 11011b     ;   op = 000b

### Immediate type

ADDI:   funct3 = 000b       ;   op = 01b
SUBI:   funct3 = 001b       ;   op = 01b
ANDI:   funct3 = 010b       ;   op = 01b
LLSI:   funct3 = 011b       ;   op = 01b
RLSI:   funct3 = 100b       ;   op = 01b
RASI:   funct3 = 101b       ;   op = 01b

SLTI:   funct3 = 110b       ;   op = 01b
SLUI:   funct3 = 111b       ;   op = 01b

JLR :   funct3 = 000b       ;   op = 11b

### Stack-relative

SWSP:   funct3 = 001b       ;   op = 11b
LWSP:   funct3 = 000b       ;   op = 10b

### Wide Immediate type '

LI  :   funct3 = 001b       ;   op = 10b
LUI :   funct3 = 010b       ;   op = 10b
AUIPC:  funct3 = 011b       ;   op = 10b
ADDI2SP: funct3 = 100b      ;   op = 10b

JR  :   funct3 = 100b       ;   op = 10b

### Load type '

LB  :   funct3 = 010b       ;   op = 11b
LW  :   funct3 = 011b       ;   op = 11b

### Store type '

SB  :   funct3 = 100b       ;   op = 11b
SW  :   funct3 = 101b       ;   op = 11b

### Branch type '

BZ  :   funct3 = 110b       ;   op = 11b
BNZ :   funct3 = 111b       ;   op = 11b

### Jump type

JMP :   funct3 = 110b       ;   op = 10b
JAL :   funct3 = 111b       ;   op = 10b

## Description

### 

