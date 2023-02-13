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
    cmp al, 'A'
    jb .check_r8
    cmp al, 'Z'
    ja .check_r8
    add al, 0x20
    cmp al, r8b
    jnz .end
    inc rcx
    jmp .loop

.check_r8:
    cmp r8b, 'A'
    jb .end
    cmp r8b, 'Z'
    ja .end
    add r8b, 0x20
    cmp al, r8b
    jnz .end
    inc rcx
    jmp .loop

.end:
    sub al, r8b
    movsx rax, al
    leave
    ret
