bits 64
section .text
global strncmp

strncmp:
    enter 0, 0
    xor rcx, rcx
    xor rax, rax
    xor r8, r8
    jmp .loop

.loop:
    cmp rcx, rdx
    jz .end
    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + rcx]
    cmp al, 0
    jz .end
    cmp r8b, 0
    jz .end
    cmp al, r8b
    jnz .end
    inc rcx
    jmp .loop

.end:
    sub al, r8b
    movsx rax, al
    leave
    ret
