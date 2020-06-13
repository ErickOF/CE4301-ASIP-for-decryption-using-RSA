;-------------------------------------------
; Programa para ilustrar una entrada posible
;-------------------------------------------
.const
num1  =   29H
num2  =   F9h
num3  = 2A3ah
num4  = 0x230
num5  = 0x2C3
num6  =    28
num7  =   1010
num8  =  0b010
num9  =  1100b
num10 =  1100B
num11 =   223b

.text
CICLO_INFINITO:
;ldr
LDR R1, a (R0)
LDR R2, b (R1)
LDR R3, 32 (R2)
;add R4, 2, R2
AND R4, R4, R2
AND R4, R4, 29
JMP CICLO_INFINITO
STR R4, a (R0)
