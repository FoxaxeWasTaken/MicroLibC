bits 64
section .text
global strcasecmp

strcasecmp:
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
    jnz .check_al
    inc rcx
    jmp .loop

.check_al:
    mov r9b, al
    cmp r9b, 'A'
    jb .check_r8
    cmp r9b, 'Z'
    ja .check_r8
    add r9b, 0x20
    cmp r9b, r8b
    jnz .end
    inc rcx
    jmp .loop

.check_r8:
    mov r10b, r8b
    cmp r10b, 'A'
    jb .end
    cmp r10b, 'Z'
    ja .end
    add r10b, 0x20
    cmp r9b, r10b
    jnz .end
    inc rcx
    jmp .loop

.end:
    sub al, r8b
    movsx rax, al
    leave
    ret
