bits 64
section .text
global strstr

strstr:
    enter 0, 0
    xor rcx, rcx
    mov rax, rdi
    jmp .check_null

.check_null:
    cmp byte [rsi], 0
    jz .end_success
    jmp .loop

.loop:
    mov r8b, byte [rax]
    cmp r8b, byte [rsi]
    jz .sub_loop
    cmp r8b, 0
    jz .end_fail
    inc rax
    jmp .loop

.sub_loop:
    inc rcx
    mov r8b, byte [rax + rcx]
    cmp byte [rsi + rcx], 0
    jz .end_success
    cmp r8b, byte [rsi + rcx]
    jnz .set_next
    jmp .sub_loop

.set_next:
    inc rax
    xor rcx, rcx
    jmp .loop

.end_success:
    leave
    ret

.end_fail:
    xor rax, rax
    leave
    ret
