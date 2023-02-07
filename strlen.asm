bits 64
section .text
global strlen

strlen:
    enter 0, 0
    xor rax, rax
    jmp loop

loop:
    cmp byte [rdi + rax], 0
    jz end
    inc rax
    jmp loop

end:
    leave
    ret
