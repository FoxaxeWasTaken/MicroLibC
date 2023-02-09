bits 64
section .text
global strpbrk

strpbrk:
    enter 0, 0
    xor rdx, rdx
    xor rcx, rcx
    mov rax, rdi
    jmp .loop

.loop:
    mov r8b, byte [rax + rcx]
    cmp r8b, 0
    jz .end_fail
    jmp .sub_loop

.sub_loop:
    cmp byte [rsi + rdx], 0
    jz .set_next
    cmp byte [rsi + rdx], r8b
    jz .end_success
    inc rdx
    jmp .sub_loop

.set_next:
    inc rcx
    xor rdx, rdx
    jmp .loop

.end_success:
    add rax, rcx
    leave
    ret

.end_fail:
    xor rax, rax
    leave
    ret
