bits 64
section .text
global memfrob

memfrob:
    enter 0, 0
    mov rax, rdi
    xor rcx, rcx
    jmp .loop

.loop:
    cmp rcx, rsi
    jge .end
    mov dl, byte [rax + rcx]
    xor rdx, 0x2a
    mov byte [rax + rcx], dl
    inc rcx
    jmp .loop

.end:
    leave
    ret
