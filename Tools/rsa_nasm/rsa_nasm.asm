global _start

section .data
newline:    db 0x0A, 0x0
buffer: times 50 db 0
p:          equ     59
q:          equ     61
; mod
n:          equ     3599
; exp_decryption
_d:         equ     3163
; exp_encryption
_e:         equ     1987


slen:
  	mov     rdx, 0

.next_c:
  	cmp     byte[rsi + rdx], 0
  	jz      .slen_end
  	inc     rdx
  	jmp     .next_c
.slen_end:
  	ret

; print(string)
print:
	push    rax
	push    rdi
	push    rdx
	call    slen
	mov     rax,1
	mov     rdi,1
	syscall
	pop     rdx
	pop     rdi
	pop     rax
	ret


println:
	call    print
	push    rsi
	mov     rsi, newline
	call    print
	pop     rsi
	ret

; mov rbx, length   length to print filled with spaces in the left
; iprintf(rax)
iprintf:
	push    rsi
	call    num2buffer
	mov     rsi, buffer
	call    println
	pop     rsi
	ret

num2buffer:
	push    rcx
	push    rdx
    mov     rcx, 0ah
	mov     byte[buffer + rbx + 1], 0
.pnfl01:
	dec     rbx
    mov     rdx, 0
    ; RDX:RAX / RCX  -->  Q=RAX  R=RDX
    div     rcx
    add     rdx, 48
    cmp     rax, 0
    jnz     .pnfl02
    cmp     rdx, 48
    jnz     .pnfl02
    mov     rdx, 32
.pnfl02:
	mov     byte[buffer + rbx], dl
    cmp     rbx, 0
    jnz     .pnfl01
	pop     rdx
	pop     rcx
	ret


; str2int(buffer)
str2int:
	push    rcx
	push    rbx
	push    rdx
	push    rdi
    ; looking for the end
	mov     rbx, 0
.buffx1:
	mov     cl, byte[buffer + rbx]
	cmp     cl, 0ah
	jz      .buffx2
	inc     rbx
	jmp     .buffx1
.buffx2:
	mov     rdi, 0
	mov     rcx, 1
.buffx3:
	mov     rax, 0
	mov     al, byte[buffer + rbx - 1]
    ; subtract ASCII of 0
	sub     al, 48
	mov     rdx, 0
	mul     rcx
	add     rdi, rax
	mov     rdx, 0
	mov     rax, 10
	mul     rcx
	mov     rcx, rax
	dec     rbx
	jnz     .buffx3
	mov     rax, rdi
	pop     rdi
	pop     rdx
	pop     rbx
	pop     rcx
	ret
;base = 6 -> pixel
;exp = 3163 -> _d
;mod = 3599 -> n
;
;c = 1
_start:
    ; base: rbx = 6
    mov     rbx, 6
    ; c = 1
    xor     rax, rax
    mov     rax, 1
    ; exp: r10
    mov     r10, _d

;for _ in range(exp):
;   c = (c * base) % mod
rsa:
    ; Multiply rax*src
    mul     rbx
    ; Compute rax/src
    ; Remainder into rdx
    ; (rax * rbx)%rcx -> (c * base) % n
    mov     rcx, n
    div     rcx
    ; Remainder from rdx to rax
    mov     rax, rdx
    ; exp--
    dec     r10
    ; while (exp != 0)
    cmp     r10, 0x0
    jne      rsa

finish:
    ; Call printf
    call    iprintf         ; Call printf(3):

    mov     rax, 60
	mov     rdi, 0
	syscall

