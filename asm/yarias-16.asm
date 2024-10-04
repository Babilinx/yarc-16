#subruledef reg
{
    zero => 0x0
    ra => 0x1
    a1 => 0x2
    a2 => 0x3
    t1 => 0x4
    t3 => 0x5
    s4 => 0x6
    s5 => 0x7
    sp => 0x8
    a0 => 0x9
    s0 => 0xA
    fp => 0xA
    s1 => 0xB
    s2 => 0xC
    s3 => 0xD
    t0 => 0xE
    t4 => 0xF
}

#subruledef sreg  ; for instructions with 3 bit reg field
{
    sp => 0x0`3
    a0 => 0x1`3
    s0 => 0x2`3
    fp => 0x2`3
    s1 => 0x3`3
    s2 => 0x4`3
    s3 => 0x5`3
    t0 => 0x6`3
    t4 => 0x7`3
}

#ruledef 
{
    r_fmt {op: u2}, {funct5: u5}, {rs1d: reg}, {rs2: reg} => 0x0`1 @ funct5 @ rs1d @ rs2 @ op
    i_fmt {op: u2}, {funct3: u3}, {rs1d: reg}, {imm: u7} => funct3 @ imm[6:4] @ rs1d @ imm[3:0] @ op
    sr_fmt {op: u2}, {funct3: u3}, {rs2: reg}, {imm: u7} => funct3 @ imm @ rs2d @ op
    wi_fmt {op: u2}, {funct3: u3}, {rd: sreg}, {imm: u8} => funct3 @ imm @ rd @ op
    l_fmt {op: u2}, {funct3: u3}, {rd: sreg}, {imm: u5}, {rs1: sreg} => funct3 @ imm[4:1] @ rs1 @ imm[0:0] @ rd @ op
    s_fmt {op: u2}, {funct3: u3}, {imm: u5}, {rs1: sreg}, {rs2: sreg} => funct3 @ imm[4:1] @ rs1 @ imm[0:0] @ rs2 @ op
    b_fmt {op: u2}, {funct3: u3}, {rs1: sreg}, {imm: u8} => funct3 @ imm[7:4] @ rs1 @ imm[3:0] @ op
    j_fmt {op: u2}, {funct3: u3}, {imm: u11} => funct3 @ imm @ op
}

#ruledef
{
    ;; register type
    mv {rd: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x00`5, {rd}, {rs2}}
    
    slt {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x01`5, {rs1d}, {rs2}}
    slu {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x02`5, {rs1d}, {rs2}}
    seq {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x03`5, {rs1d}, {rs2}}
    sne {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x04`5, {rs1d}, {rs2}}
    slte {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x05`5, {rs1d}, {rs2}}
    sleu {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x06`5, {rs1d}, {rs2}}
    
    add {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x10`5, {rs1d}, {rs2}}
    sub {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x11`5, {rs1d}, {rs2}}
    and {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x12`5, {rs1d}, {rs2}}
    lls {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x13`5, {rs1d}, {rs2}}
    rls {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x14`5, {rs1d}, {rs2}}
    ras {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x15`5, {rs1d}, {rs2}}
    xor {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x16`5, {rs1d}, {rs2}}
    or  {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x17`5, {rs1d}, {rs2}}
    not {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x18`5, {rs1d}, {rs2}}
    mul {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x19`5, {rs1d}, {rs2}}
    div {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x1A`5, {rs1d}, {rs2}}
    rem {rs1d: reg}, {rs2: reg} => asm {r_fmt 0`2, 0x1B`5, {rs1d}, {rs2}}
    
    ;; immediate type
    addi {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x0`3, {rs1d}, {imm}}
    subi {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x1`3, {rs1d}, {imm}}
    andi {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x2`3, {rs1d}, {imm}}
    llsi {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x3`3, {rs1d}, {imm}}
    rlsi {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x4`3, {rs1d}, {imm}}
    rasi {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x5`3, {rs1d}, {imm}}
    
    slti {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x6`3, {rs1d}, {imm}}
    slui {rs1d: reg}, {imm: u7} => asm {i_fmt 1`2, 0x7`3, {rs1d}, {imm}}
    
    jr {imm: u8}({rs1: reg}) => asm {i_fmt 2`2, 0x0`3, {rs1}, {imm[7:1]}}
    jlr {imm: u8}({rs1: reg}) => asm {i_fmt 3`2, 0x0`3, {rs1}, {imm[7:1]}}
    
    ;; stack relative type
    swsp {rd: reg}, {imm: u7} => asm {sr_fmt 3`2, 0x1`3, {imm}, {rd}}
    lwsp {imm: u7}, {rs2} => asm {sr_fmt 2`2, 0x0`3, {imm}, {rs2}}
    
    ;; wide immediate type
    li {rd: sreg}, {imm: u8} => asm {wi_fmt 2`2, 0x0`3, {rd}, {imm}}
    lui {rd: sreg}, {imm: u8} => asm {wi_fmt 2`2, 0x0`3, {rd}, {imm}}
    adduipc {rd: sreg}, {imm: u8} => asm {wi_fmt 2`2, 0x0`3, {rd}, {imm}}
    addisp {rd: sreg}, {imm: u8} => asm {wi_fmt 2`2, 0x0`3, {rd}, {imm}}
    
    ;; load type
    lb {rd: sreg}, {imm: u5}({rs1: sreg}) => asm {l_fmt 3`2, 0x2`3, {rd}, {imm}, {rs1}}
    lw {rd: sreg}, {imm: u5}({rs1: sreg}) => asm {l_fmt 3`2, 0x3`3, {rd}, {imm}, {rs1}}
    
    ;; store type
    sb {imm: u5}({rs1: sreg}), {rs2: sreg} => asm {s_fmt 3`2, 0x4`3, {imm}, {rs1}, {rs2}}
    sw {imm: u5}({rs1: sreg}), {rs2: sreg} => asm {s_fmt 3`2, 0x5`3, {imm}, {rs1}, {rs2}}
    
    ;; branch type
    bz {imm: u9}, {rs1: sreg} => asm {b_fmt 3`2, 0x6`3, {rs1}, {imm[8:1]}}
    bz {imm: u9}, {rs1: sreg} => asm {b_fmt 3`2, 0x7`3, {rs1}, {imm[8:1]}}
    
    ;; jump type
    jmp {imm: u12} => asm {j_fmt 2`2, 0x6`3, {imm[11:1]}}
    jal {imm: u12} => asm {j_fmt 2`2, 0x6`3, {imm[11:1]}}
}

#ruledef
{
    ;; pseudoinstructions
    
    jmp {imm: u16} =>  ; only local jmp
    {
        assert(imm >=  0xF000)
        asm {jmp {imm[11:1]}}
    }
    jmp {imm: u16} => asm
    {
        lui t4, imm[15:8]
        jr imm[7:0](t4)
    }

}

