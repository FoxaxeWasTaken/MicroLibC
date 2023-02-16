bits 64
section .text
global ffs

ffs:
    enter 0, 0
    xor rax, rax
    cmp edi, 0
    jz .end
    bsf eax, edi
    inc eax
    jmp .end

.end:
    leave
    ret
