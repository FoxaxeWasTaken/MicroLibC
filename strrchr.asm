bits 64
section .text
global strrchr

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

strrchr:
    enter 0, 0
    xor rax, rax
    call strlen
    dec rax
    mov rcx, rax
    mov rax, rdi
    jmp .loop

.loop:
    cmp rcx, 0
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
