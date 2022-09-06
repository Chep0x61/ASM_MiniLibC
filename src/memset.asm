BITS 64

SECTION .text

GLOBAL memset

memset:
        mov rax, 0
        mov r8, 0

compare: 
        cmp rdx, r8
        je return
        mov BYTE [rdi + r8], sil
        inc r8
        jmp compare

return:
        mov rax, rdi
        ret