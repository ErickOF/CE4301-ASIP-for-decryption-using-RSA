.const
p = 59
q = 61
; mod
n = 3599
; exp_decryption
d = 3163
; exp_encryption
e = 1987

.text
;base = 6 -> pixel
;exp = 3163 -> d
;mod = 3599 -> n
;
;c = 1
FOR_ROW:
    ; j = 0
    ADD     R31, R31, 640
    ; i = 0
    ADD     R30, R30, 320
    ; COLS = 640
    ADD     R29, R29, 640
FOR_COL:
    ; pos = COLS * i + j
    MULT    R28, R29, R30
    ADD     R27, R28, R31

    ; base: R0 = 6
    LDR     R0, (0) R27
    ; c = 1
    ADD     R1, 1
    ; exp: R2
    ADD     R2, d

;for _ in range(exp):
;   c = (c * base) % mod
RSA:
    ; Multiply
    MUL     R3, R1, R0
    ; (c * base) % n
    ADD     R4, n
DIV:
    
END_DIV:
    ; Move remainder
    ADD     R1, r16
    ; exp--
    SUB     R10, R10, 1
    ; while (exp != 0)
    CMP     R10, 0
    JNE     RSA

FINISH:
    JMP     FINISH
