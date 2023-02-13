bits 64
section .text
global strcmp

strcmp:
    enter 0, 0
    xor rcx, rcx
    jmp .loop

.loop:
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
