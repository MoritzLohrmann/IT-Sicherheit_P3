<<<<<<< HEAD
; checksum.asm
; long checksum(const long *arr, long len);
;   rdi = arr  (Zeiger auf long-Array)
;   rsi = len  (Anzahl der Elemente)
;   Rueckgabe in rax

section .text
global checksum

checksum:
    push rbp                  ; callee-saved rbp sichern
    mov  rbp, rsp             ; Stackframe aufbauen
    push rbx                  ; rbx ist callee-saved -> sichern

    xor  rax, rax             ; rax = 0  -> Akkumulator (Summe der Quadrate)
    xor  rcx, rcx             ; rcx = 0  -> Schleifenindex i

.loop:
    cmp  rcx, rsi             ; Vergleich i mit len
    jge  .done                ; falls i >= len: Schleife beenden

    lea  rdx, [rdi + rcx*8]   ; rdx = &arr[i]   (long = 8 Byte pro Element)
    mov  rbx, [rdx]           ; rbx = arr[i]
    imul rbx, rbx             ; rbx = arr[i] * arr[i]
    add  rax, rbx             ; Summe += arr[i]^2

    inc  rcx                  ; i++
    jmp  .loop                ; naechster Durchlauf

.done:
    shl  rax, 1               ; Linksverschiebung um 1 (entspricht * 2)
    sub  rax, 3               ; Subtraktion von 3
    mov  r8, 0xFFFFFFFF       ; Maske 0x00000000FFFFFFFF laden (r8 ist caller-saved)
    and  rax, r8              ; Maskierung der unteren 32 Bit (obere 32 Bit -> 0)

    pop  rbx                  ; rbx wiederherstellen
    pop  rbp                  ; rbp wiederherstellen
    ret                       ; Ergebnis steht in rax

=======
; checksum.asm
; long checksum(const long *arr, long len);
;   rdi = arr  (Zeiger auf long-Array)
;   rsi = len  (Anzahl der Elemente)
;   Rueckgabe in rax

section .text
global checksum

checksum:
    push rbp                  ; callee-saved rbp sichern
    mov  rbp, rsp             ; Stackframe aufbauen
    push rbx                  ; rbx ist callee-saved -> sichern

    xor  rax, rax             ; rax = 0  -> Akkumulator (Summe der Quadrate)
    xor  rcx, rcx             ; rcx = 0  -> Schleifenindex i

.loop:
    cmp  rcx, rsi             ; Vergleich i mit len
    jge  .done                ; falls i >= len: Schleife beenden

    lea  rdx, [rdi + rcx*8]   ; rdx = &arr[i]   (long = 8 Byte pro Element)
    mov  rbx, [rdx]           ; rbx = arr[i]
    imul rbx, rbx             ; rbx = arr[i] * arr[i]
    add  rax, rbx             ; Summe += arr[i]^2

    inc  rcx                  ; i++
    jmp  .loop                ; naechster Durchlauf

.done:
    shl  rax, 1               ; Linksverschiebung um 1 (entspricht * 2)
    sub  rax, 3               ; Subtraktion von 3
    mov  r8, 0xFFFFFFFF       ; Maske 0x00000000FFFFFFFF laden (r8 ist caller-saved)
    and  rax, r8              ; Maskierung der unteren 32 Bit (obere 32 Bit -> 0)

    pop  rbx                  ; rbx wiederherstellen
    pop  rbp                  ; rbp wiederherstellen
    ret                       ; Ergebnis steht in rax

>>>>>>> 4773b1585f4737ef13ae20eee0e14b097dac7ec0
section .note.GNU-stack noalloc noexec nowrite progbits   ; nicht ausfuehrbarer Stack