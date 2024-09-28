#subruledef reg
{
    r0 => 0x0
    r1 => 0x1
    r2 => 0x2
    r3 => 0x3
    r4 => 0x4
    r5 => 0x5
    r6 => 0x6
    r7 => 0x7
    r8 => 0x8
    r9 => 0x9
    r10 => 0xA
    r11 => 0xB
    r12 => 0xC
    r13 => 0xD
    r14 => 0xE
    r15 => 0xF
    zero => 0x0
    a0 => 0x1
    a1 => 0x2
    a2 => 0x3
    a3 => 0x4
    a4 => 0x5
    s0 => 0x6
    s1 => 0x7
    s2 => 0x8
    s3 => 0x9
    s4 => 0xA
    t0 => 0xB
    t1 => 0xC
    ra => 0xD
    fp => 0xE
    sp => 0xF
}

#ruledef
{
    ;; base instructions
    ; ALU
    add {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x0 @ 0x0
    sub {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x1 @ 0x0
    mul {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x2 @ 0x0
    div {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x3 @ 0x0
    mod {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x4 @ 0x0
    and {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x5 @ 0x0
    or  {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x6 @ 0x0
    xor {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x7 @ 0x0
    not {rs1: reg}             => rs2 @ rs1 @ 0x8 @ 0x0
    lsh {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0x9 @ 0x0
    rsh {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0xA @ 0x0
    cmp {rs1: reg}, {rs2: reg} => rs2 @ rs1 @ 0xF @ 0x0
    addi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x0 @ 0x1
    subi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x1 @ 0x1
    muli {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x2 @ 0x1
    divi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x3 @ 0x1
    modi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x4 @ 0x1
    andi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x5 @ 0x1
    ori  {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x6 @ 0x1
    xori {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x7 @ 0x1
    lshi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0x9 @ 0x1
    rshi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0xA @ 0x1
    cmpi {rs1: reg}, {imm: u4} => imm @ rs1 @ 0xF @ 0x1
    
    ; memory
    lb {rd: reg}, {imm: u4}({rs1: reg})  => imm @ rs1 @ rd @ 0x4
    lw {rd: reg}, {imm: u4}({rs1: reg})  => imm @ rs1 @ rd @ 0x6
    sb {imm: u4}({rs1: reg}), {rs2: reg} => rs2 @ rs1 @ imm @ 0x5
    sw {imm: u4}({rs1: reg}), {rs2: reg} => rs2 @ rs1 @ imm @ 0x7
    
    ; registers
    ln {rd: reg}              => 0x0 @ 0x0 @ rd @ 0x2
    mov {rd: reg}, {rs1: reg} => 0x0 @ rs1 @ rd @ 0x3
    
    ; branching
    br  {imm: s8}({rs1: reg}) => imm[15:8] @ rs1 @ imm[7:0] @ 0xA
    blt {imm: s8}({rs1: reg}) => imm[15:8] @ rs1 @ imm[7:0] @ 0xB
    blu {imm: s8}({rs1: reg}) => imm[15:8] @ rs1 @ imm[7:0] @ 0xC
    bnz {imm: s8}({rs1: reg}) => imm[15:8] @ rs1 @ imm[7:0] @ 0xD
    jmp {imm: s8}({rs1: reg}) => imm[15:8] @ rs1 @ imm[7:0] @ 0xE
    jlr {imm: s8}({rs1: reg}) => imm[15:8] @ rs1 @ imm[7:0] @ 0xF
}

#ruledef
{
    ;; extension instructions
    ; ALU
    add {rs1: reg}, {imm: u4}  => imm @ rs1 @ 0x0 @ 0x1
    sub {rs1: reg}, {imm: u4}  => imm @ rs1 @ 0x1 @ 0x1
    mul {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x2 @ 0x1
    div {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x3 @ 0x1
    mod {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x4 @ 0x1
    and {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x5 @ 0x1
    or  {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x6 @ 0x1
    xor {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x7 @ 0x1
    lsh {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0x9 @ 0x1
    rsh {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0xA @ 0x1
    cmp {rs1: reg}, {imm: u4}  => rs2 @ rs1 @ 0xF @ 0x1
}

#ruledef
{	
    ; macros
    li {rd: reg}, {imm: u16} => asm {ln t0} @ {imm} @ asm {sw 0({rd}), t0}

    pop {rd: reg} => asm
    {
        subi sp, 2
        lw {rd}, 0(sp)
    }
    
    push {rs1: reg} => asm
    {
        sw 0(sp), {rs1}
        addi sp, 2
    }
}

