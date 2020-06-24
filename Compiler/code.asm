;-------------------------------------------
; Programa para ilustrar una entrada posible
;-------------------------------------------
.const
num1  =   29H
num2  =   F9h
num3  =   3ah
num4  = 0x230
num5  = 0x2C3
num6  =    28
num7  =   1010
num8  =  0b010
num9  =  1100b
num10 =  1100B
num11 =   223b

.text
LOOP:
	LDR R1, num1 (R0)
	LDR R2, num2 (R1)
	LDR R3, 32 (R2)
	ADD R4, R4, R2
	ADD R4, R4, 29
TEST:
	CMP R4, 0x0
	JNE LOOP
	STR R4, num1 (R0)
	CMP R3, R2
	JEQ TEST
END:
	ADD R0, R0, 0x1
