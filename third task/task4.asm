.text
main:
    li      t0, 10000
    li      a3, 1
    li      a4, 0
    li      a1, 0
loop:
    beq     a4, zero, magic_br_1 # branch #1
    nop
    nop
    nop
    nop
    nop
    nop
    addi    a4, a4, 0
magic_br_1:
    beq     a3, zero, magic_br_2 # branch #2
    addi    a3, a3, 0
magic_br_2:

# ****** ADD HERE ******
    nop
    nop
    nop
    nop
    nop
    nop
    beq     a3, zero, foo_1 # branch #3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
foo_1:
    beq     a4, zero, foo_2 # branch #4
foo_2:

    addi    a1, a1, 1
    bne     a1, t0, loop
    addi    a1, a1, -1
# **********************

    addi    a1, a1, 1
    bne     a1, t0, loop
