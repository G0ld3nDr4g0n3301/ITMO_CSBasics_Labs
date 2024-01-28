; Программа выполняет целочисленное деление ячейки(беззнаковое число) 
; на другую ячейку(беззнаковое число)

ORG 0x20
RESULT: WORD ?
OP1: WORD 84
OP2: WORD 4
START: CALL BIT_COUNT
LD BIT_AMOUNT
ST RESULT
HLT

; Подсчёт количества разрядов в делимом
BIT_AMOUNT: WORD 16
MASK: WORD 0x8000
BIT_COUNT: LD OP1
CMP MASK
BNC RETURN
LD MASK
ROR
ST MASK
LOOP BIT_AMOUNT
BR BIT_COUNT
RETURN: RET
