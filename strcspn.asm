bits 64
section .text
global strcspn

strcspn:
    enter 0, 0
    xor rax, rax
    xor rcx, rcx
    jmp .loop

.loop:
    mov r8b, byte [rdi + rax]
    cmp r8b, 0
    jz .end
    jmp .sub_loop

.sub_loop:
    mov r8b, byte [rsi + rcx]
    cmp r8b, 0
    jz .set_next
    cmp r8b, byte [rdi + rax]
    jz .end
    inc rcx
    jmp .sub_loop

.set_next:
    xor rcx, rcx
    inc rax
    jmp .loop

.end:
    leave
    ret
