;-------------------------------------------
; Programa para ilustrar una entrada posible
; ------------------------------------------
.const
num    =    29
num2   =   400
cadena = 0x230
a      =    28
b      = 0x2C3

.text
ciclo_infinito:
ldr
ldr R1, a (R0); Carga el puntero inicial
ldr R2, b (R1)
ldr R3, 32 (R2); Carga el valor verdadero
add R4, 2, R2
and R4, R4, R2
andi R4, R4, 29
jmp ciclo_infinito
str R4, a (R0)