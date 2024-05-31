; Escribir un programa que multiplique dos números enteros utilizando sumas repetidas (similar al Ejercicio 7 de la Práctica 1).
;El programa debe estar optimizado para su ejecución con la opción Delay Slot habilitada.

.data
A: .word 5
B: .word 4
RES: .word 0

.code
ld r1,A(r0)
ld r2,B(r0)
dadd r3,r0,r1 
daddi r2,r2,-1
loop: daddi r2,r2,-1
nop    ;evitar atascos RAW
bnez r2,loop
dadd r3,r3,r1    ;uso el delay slot
sd r3,RES(r0)
halt

;acordarse que el result me queda en hexadecimal y no decimal