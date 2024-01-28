; Программа считает количество ненулевых ячеек
; и делит значение на 8.

ORG 0x20
RESULT: WORD ? ; 0-256
COUNT8: WORD ?
CURR_CELL: WORD 0x7FF
START: CALL COUNT_MEM
HLT

COUNT_MEM: LD #8
PUSH
CLA
CMP (CURR_CELL)
BEQ COUNT_LOOP
POP
DEC
PUSH
CLA
COUNT_LOOP: SWAM CURR_CELL
BEQ COUNT_END
SWAM CURR_CELL
CLA
CMP -(CURR_CELL)
BEQ COUNT_LOOP
POP
DEC
PUSH
BNE COUNT_LOOP
SWAM RESULT
INC
SWAM RESULT
POP
ADD #8
PUSH
BR COUNT_LOOP

COUNT_END: POP
SUB #8
BEQ RETURN
LD RESULT
INC
ST RESULT
BR RETURN

RETURN: RET
