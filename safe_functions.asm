<<<<<<< HEAD
section .text
global safe_strcpy
global memzero_secure

; size_t safe_strcpy(char *dst, size_t dst_size, const char *src)
; rdi=dst, rsi=dst_size, rdx=src -> rax=Anzahl kopierter Zeichen
safe_strcpy:
    push rbp
    mov  rbp, rsp
    xor  rax, rax             ; i = 0 (zaehlt die kopierten Zeichen)
    test rsi, rsi             ; dst_size == 0?
    jz   .done                ; dann nichts tun, nicht mal '\0' passt
    mov  r8, rsi
    dec  r8                   ; r8 = dst_size - 1, letztes Byte bleibt fuers '\0'
.copy_loop:
    cmp  rax, r8              ; Limit erreicht?
    jae  .terminate           ; ja -> abbrechen, Puffer laeuft nicht ueber
    mov  cl, [rdx + rax]      ; cl = src[i]
    test cl, cl               ; Stringende ('\0') erreicht?
    jz   .terminate
    mov  [rdi + rax], cl      ; dst[i] = src[i]
    inc  rax                  ; i++
    jmp  .copy_loop
.terminate:
    mov  byte [rdi + rax], 0  ; '\0' anhaengen (immer nullterminiert)
.done:
    pop  rbp
    ret

; void memzero_secure(void *ptr, size_t size)
; rdi=ptr, rsi=size
memzero_secure:
    push rbp
    mov  rbp, rsp
    xor  rax, rax             ; al = 0 (Fuellwert)
    xor  rcx, rcx             ; i = 0
.zero_loop:
    cmp  rcx, rsi             ; alle Bytes durch?
    jae  .zdone
    mov  byte [rdi + rcx], al ; ptr[i] = 0
    inc  rcx                  ; i++
    jmp  .zero_loop
.zdone:
    mfence                    ; Schreibzugriffe sicher abschliessen
    pop  rbp
    ret

=======
section .text
global safe_strcpy
global memzero_secure

; size_t safe_strcpy(char *dst, size_t dst_size, const char *src)
; rdi=dst, rsi=dst_size, rdx=src -> rax=Anzahl kopierter Zeichen
safe_strcpy:
    push rbp
    mov  rbp, rsp
    xor  rax, rax             ; i = 0 (zaehlt die kopierten Zeichen)
    test rsi, rsi             ; dst_size == 0?
    jz   .done                ; dann nichts tun, nicht mal '\0' passt
    mov  r8, rsi
    dec  r8                   ; r8 = dst_size - 1, letztes Byte bleibt fuers '\0'
.copy_loop:
    cmp  rax, r8              ; Limit erreicht?
    jae  .terminate           ; ja -> abbrechen, Puffer laeuft nicht ueber
    mov  cl, [rdx + rax]      ; cl = src[i]
    test cl, cl               ; Stringende ('\0') erreicht?
    jz   .terminate
    mov  [rdi + rax], cl      ; dst[i] = src[i]
    inc  rax                  ; i++
    jmp  .copy_loop
.terminate:
    mov  byte [rdi + rax], 0  ; '\0' anhaengen (immer nullterminiert)
.done:
    pop  rbp
    ret

; void memzero_secure(void *ptr, size_t size)
; rdi=ptr, rsi=size
memzero_secure:
    push rbp
    mov  rbp, rsp
    xor  rax, rax             ; al = 0 (Fuellwert)
    xor  rcx, rcx             ; i = 0
.zero_loop:
    cmp  rcx, rsi             ; alle Bytes durch?
    jae  .zdone
    mov  byte [rdi + rcx], al ; ptr[i] = 0
    inc  rcx                  ; i++
    jmp  .zero_loop
.zdone:
    mfence                    ; Schreibzugriffe sicher abschliessen
    pop  rbp
    ret

>>>>>>> 4773b1585f4737ef13ae20eee0e14b097dac7ec0
section .note.GNU-stack noalloc noexec nowrite progbits   ; Stack nicht ausfuehrbar