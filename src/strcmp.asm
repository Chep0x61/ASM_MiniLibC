BITS 64

SECTION .text

GLOBAL strcmp

strcmp:
        mov rax, 0
        mov r8b, 0

compare:
        mov r8b, BYTE [rdi + rax]
        cmp BYTE [rsi + rax], r8b
        jne return
        cmp BYTE [rdi + rax], 0
        je return
        inc rax
        jmp compare

return:
        sub r8b, BYTE [rsi + rax]
        movsx rax, r8b
        ret