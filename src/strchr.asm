bits 64
section .text
global strchr
global index

index:
    jmp strchr

strchr:
    enter 0, 0
    mov rax, rdi
    xor rcx, rcx
    jmp .loop

.loop:
    cmp byte [rax + rcx], sil
    jz .end_success
    cmp byte [rax + rcx], 0
    jz .end_fail
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
