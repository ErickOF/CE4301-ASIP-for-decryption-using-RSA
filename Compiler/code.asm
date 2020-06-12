;-------------------------------------------
; Programa para ilustrar una entrada posible
;-------------------------------------------
.const
num    =    29
num2   =   400
cadena = 0x230
a      =    28
b      = 0x2C3

.text
CICLO_INFINITO:
ldr
LDR R1, a (R0)
LDR R2, b (R1)
LDR R3, 32 (R2)
add R4, 2, R2
AND R4, R4, R2
ANDI R4, R4, 29
JMP CICLO_INFINITO
STR R4, a (R0)
