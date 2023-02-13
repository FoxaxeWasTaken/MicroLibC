bits 64
section .text
global memset

memset:
    enter 0, 0
    mov rax, rdi
    xor rcx, rcx
    jmp .loop

.loop:
    cmp rcx, rdx
    jz .end
    mov byte [rax + rcx], sil
    inc rcx
    jmp .loop

.end:
    leave
    ret
