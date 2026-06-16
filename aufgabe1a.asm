<<<<<<< HEAD
; aufgabe1a.asm - der Code-Schnipsel aus Aufgabe 1(a) als aufrufbare Funktion
section .text
global aufgabe1a
aufgabe1a:
    mov rax, 1
    mov rcx, 5
    xor rdx, rdx
.loop:
    imul rax, rcx
    dec rcx
    jnz .loop
    shr rax, 1
    and rax, 0xFF
    sub rax, 4
    ret
=======
; aufgabe1a.asm - der Code-Schnipsel aus Aufgabe 1(a) als aufrufbare Funktion
section .text
global aufgabe1a
aufgabe1a:
    mov rax, 1
    mov rcx, 5
    xor rdx, rdx
.loop:
    imul rax, rcx
    dec rcx
    jnz .loop
    shr rax, 1
    and rax, 0xFF
    sub rax, 4
    ret
>>>>>>> 4773b1585f4737ef13ae20eee0e14b097dac7ec0
section .note.GNU-stack noalloc noexec nowrite progbits