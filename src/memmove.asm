bits 64
section .text
global memmove

memmove:
    enter 0, 0
    mov rax, rdi
    xor rcx, rcx
    cmp rdi, rsi
    jbe .loop_forward
    dec rdx
    add rsi, rdx
    add rdi, rdx
    inc rdx
    neg rdx
    jmp .loop_backward

.loop_backward:
    cmp rdx, rcx
    jz .end
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    dec rcx
    jmp .loop_backward

.loop_forward:
    cmp rdx, rcx
    jz .end
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .loop_forward

.end:
    leave
    ret
