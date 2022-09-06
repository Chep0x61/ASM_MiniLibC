BITS 64

SECTION .text

GLOBAL strlen

strlen:
        mov rax, 0

compare:
        cmp BYTE [rdi + rax], 0
        je return
        inc rax
        jmp compare

return:
        ret