BITS 64

SECTION .text

EXTERN memcpy

GLOBAL memmove

memmove:
        mov rax, 0

compare:
        cmp rsi, rdi
        je return
        cmp rsi, rdi
        jg src_greater

src_lower:
        cmp rdx, 0
        je return
        dec rdx
        mov r8b, BYTE [rsi + rdx]
        mov BYTE [rdi + rdx], r8b
        jmp src_lower

src_greater:
        call memcpy wrt ..plt
        ret

return:
        mov rax, rdi
        ret