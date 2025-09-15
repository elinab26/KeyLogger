.section .data
# Table of the keyboard
keys:
    .fill 256, 1, 0
    
    #Escape key
    .org keys+1
    .byte 0x1B

    .org keys+2
    .byte '1'

    .org keys+3
    .byte '2'

    .org keys+4
    .byte '3'

    .org keys+5
    .byte '4'

    .org keys+6
    .byte '5'

    .org keys+7
    .byte '6'

    .org keys+8
    .byte '7'

    .org keys+9
    .byte '8'

    .org keys+10
    .byte '9'

    .org keys+11
    .byte '0'

    .org keys+12
    .byte '-'

    .org keys+13
    .byte '='

    .org keys+14
    .byte 0x8

    .org keys+15
    .byte 0x9

    .org keys+16
    .byte 'q'
    
    .org keys+17
    .byte 'w'

    .org keys+18
    .byte 'e'

    .org keys+19
    .byte 'r'

    .org keys+20
    .byte 't'

    .org keys+21
    .byte 'y'

    .org keys+22
    .byte 'u'

    .org keys+23
    .byte 'i'

    .org keys+24
    .byte 'o'

    .org keys+25
    .byte 'p'

    .org keys+26
    .byte '['

    .org keys+27
    .byte ']'

    .org keys+28
    .byte '\n'
    
    .org keys+29
    .byte 0x0

    .org keys+30
    .byte 'a'

    .org keys+31
    .byte 's'

    .org keys+32
    .byte 'd'

    .org keys+33
    .byte 'f'

    .org keys+34
    .byte 'g'

    .org keys+35
    .byte 'h'

    .org keys+36
    .byte 'j'

    .org keys+37
    .byte 'k'

    .org keys+38
    .byte 'l'

    .org keys+39
    .byte ';'

    .org keys+40
    .byte 0x27

    .org keys+41
    .byte 0x60

    .org keys+42
    .byte 0xf

    .org keys+43
    .byte '\'

    .org keys+44
    .byte 'z'

    .org keys+45
    .byte 'x'

    .org keys+46
    .byte 'c'

    .org keys+47
    .byte 'v'

    .org keys+48
    .byte 'b'

    .org keys+49
    .byte 'n'

    .org keys+50
    .byte 'm'

    .org keys+51
    .byte ','

    .org keys+52
    .byte '.'

    .org keys+53
    .byte '/'

    .org keys+54
    .byte 0xf

    .org keys+55
    .byte 0x0
    
    .org keys+56
    .byte 0x0

    .org keys+57
    .byte 0x20


.section .text

.globl main
.type	main, @function 
main:
    # Enter
    pushq %rbp
    movq %rsp, %rbp  

    

    movq %rbp, %rsp
    popq %rbp
    
    movq $60, %rax
    syscall