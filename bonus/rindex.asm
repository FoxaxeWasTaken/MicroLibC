bits 64
section .text
global rindex

strlen:
    enter 0, 0
    xor rax, rax
    jmp .loop

.loop:
    cmp byte [rdi + rax], 0
    jz .end
    inc rax
    jmp .loop

.end:
    leave
    ret

rindex:
    enter 0, 0
    xor rax, rax
    call strlen
    mov rcx, rax
    mov rax, rdi
    jmp .loop

.loop:
    cmp rcx, -1
    jz .end_fail
    cmp byte [rax + rcx], sil
    jz .end_success
    dec rcx
    jmp .loop

.end_success:
    add rax, rcx
    leave
    ret

.end_fail:
    xor rax, rax
    leave
    ret
