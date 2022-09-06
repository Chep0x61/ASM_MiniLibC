BITS 64

SECTION .text

GLOBAL strncmp

strncmp:
        mov rax, 0
        mov r8b, 0
        mov r9b, 0
        cmp rdx, 0
        je return_null

compare:
        cmp rdx, 0
        je return
        mov r8b, BYTE [rdi + rax]
        mov r9b, BYTE [rsi + rax]
        cmp BYTE [rsi + rax], r8b
        jne return
        cmp r8b, 0
        je return
        inc rax
        dec rdx
        jmp compare

return:
        sub r8b, r9b
        movsx rax, r8b
        ret

return_null:
        mov rax, 0
        ret