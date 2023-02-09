bits 64
section .text
global strchr

strchr:
    enter 0, 0
    mov rax, rdi
    xor rcx, rcx
    jmp .loop

.loop:
    cmp byte [rax + rcx], 0
    jz .end_fail
    cmp byte [rax + rcx], sil
    jz .end_success
    inc rcx
    jmp .loop

.end_success:
    add rax, rcx
    leave
    ret

.end_fail:
    xor rax, rax
    leave
    ret
