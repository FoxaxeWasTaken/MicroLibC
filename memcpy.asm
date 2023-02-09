bits 64
section .text
global memcpy

memcpy:
    enter 0, 0
    mov rax, rdi
    xor rcx, rcx
    jmp .loop

.loop:
    cmp rdx, rcx
    jz .end
    mov R8B, byte [rsi + rcx]
    mov byte [rax + rcx], R8B
    inc rcx
    jmp .loop

.end:
    leave
    ret
