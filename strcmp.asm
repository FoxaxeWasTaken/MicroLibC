bits 64
section .text
global strcmp

strcmp:
    enter 0, 0
    xor rcx, rcx
    jmp .loop

.loop:
    mov al, [rdi + rcx]
    cmp al, [rsi + rcx]
    jne .end_check_not_equal
    cmp al, 0
    jz .end_equal
    inc rcx
    jmp .loop

.end_equal:
    xor rax, rax
    leave
    ret

.end_check_not_equal:
    cmp al, [rsi + rcx]
    jg .end_greater
    jmp .end_lesser

.end_greater:
    mov rax, 1
    leave
    ret

.end_lesser:
    mov rax, -1
    leave
    ret
