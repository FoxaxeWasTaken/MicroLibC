bits 64
section .text
global strncmp

strncmp:
    enter 0, 0
    xor rcx, rcx
    jmp .loop

.loop:
    mov al, [rdi + rcx]
    cmp al, [rsi + rcx]
    jne .end_check_not_equal
    cmp al, 0
    jz .end_equal
    cmp rcx, rdx
    jge .end_equal
    inc rcx
    jmp .loop

.end_equal:
    xor rax, rax
    leave
    ret

.end_check_not_equal:
    sub al, [rsi + rcx]
    movsx rax, al
    leave
    ret
