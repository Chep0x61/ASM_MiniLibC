BITS 64

SECTION .text

GLOBAL strstr

strstr:
        mov rax, 0
        mov r8b, 0
        mov r10, 0
        cmp BYTE [rsi], 0
        je return
        cmp BYTE [rdi], 0
        je return_null

compare:
        mov r10, 0
        cmp BYTE [rdi], 0
        je return_null
        mov r8b, BYTE [rdi]
        cmp BYTE [rsi], r8b
        je parser
        inc rdi
        jmp compare

parser:
        cmp BYTE [rsi + r10], 0
        je return
        mov r8b, BYTE [rdi + r10]
        cmp BYTE [rsi + r10], r8b
        jne set_values
        inc r10
        jmp parser

set_values:
        inc rdi
        jmp compare

return_null:
        mov rax, 0
        ret

return:
        mov rax, rdi
        ret