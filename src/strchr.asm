BITS 64

SECTION .text

GLOBAL strchr

strchr:
        mov rax, 0
        mov r8, 0

compare:
        cmp BYTE [rdi + r8], sil
        je return
        cmp BYTE [rdi + r8], 0
        je return_null
        inc r8
        jmp compare 

return:
        mov rax, rdi
        add rax, r8
        ret

return_null:
        mov rax, 0
        ret