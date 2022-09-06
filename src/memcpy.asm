BITS 64

SECTION .text

GLOBAL memcpy

memcpy:
        mov rax, 0
        mov r8, 0

compare:
        cmp rdx, r8
        je return
        mov cl, BYTE [rsi + r8]
        mov BYTE [rdi + r8], cl
        inc r8
        jmp compare

return:
        mov rax, rdi
        ret