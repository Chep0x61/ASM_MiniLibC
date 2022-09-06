BITS 64

SECTION .text

GLOBAL rindex

rindex:
        mov rax, 0
        mov r8, 0
        cmp BYTE [rdi], 0
        je return_null

compare:
        cmp BYTE [rdi + r8], sil
        je buffed
        cmp BYTE [rdi + r8], 0
        je return
        inc r8
        jmp compare

buffed:
        mov rax, rdi
        add rax, r8
        cmp sil, 0
        je return
        inc r8
        jmp compare

return_null:
        cmp sil, 0
        je buffed
        mov rax, 0
        ret

return:
        ret
