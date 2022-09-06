BITS 64

SECTION .text

GLOBAL strpbrk

strpbrk:
        mov rax, 0
        mov r8b, 0
        mov r9, 0
        mov r10, 0
        cmp BYTE [rdi], 0
        je return_null
        cmp BYTE [rsi], 0
        je return_null

compare:
        mov r8b, BYTE [rsi + r10]
        cmp BYTE [rdi + r9], r8b
        je return
        cmp BYTE [rdi + r9], 0
        je return_null
        cmp r8b, 0
        je set_vals
        inc r10
        jmp compare

set_vals:
        mov r10, 0
        inc r9
        jmp compare


return:
        add rdi, r9
        mov rax, rdi
        ret

return_null:
        mov rax, 0
        ret