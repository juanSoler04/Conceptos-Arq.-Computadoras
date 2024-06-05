;Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una
;tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
;La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

.data
numM: .word 7
tabla: .word 2,5,8,9,4
dim: .word 5
mayoresM: .word 0

.code
ld $a0,numM(r0)
ld $a1,tabla(r0)
ld $a2,dim(r0)
jal maximos              ;copia en r31 la direc de retorno 
sd $v0,mayoresM(r0)
halt

maximos: dadd $v0,$v0,r0   ;lo ini
dadd $t0,$t0,r0    ;para mov en la tabla
loop: slt $t1,$a0,$a1       ;deja 1 si a1 > a0 -- tabla > M  y sino 0
dadd $v0,$v0,$t1   ;si no es mayor le sumara 0
daddi $t0,$t0,8   ;sig elem
daddi $a2,$a2,-1
ld $a1,tabla($t0)
bnez $a2,loop
jr $ra    ;vuelve al main 


;preg si conviene usar branch target buffer o no
;BTB: 1.282 CPI
;sin BTB: 1.256 CPI