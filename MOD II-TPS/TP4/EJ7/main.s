;Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos son mayores que X. El
;resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar además otro arreglo llamado RES
;cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero correspondiente en el arreglo TABLA es mayor que X,
;mientras que un ‘0’ indicará que es menor o igual.

.data
tabla: .word 9,7,22,4,5,6,7,8,9,10
res: .space 80                          ;Reserva 80 bytes (10 enteros de 64 bits) -- 1 si num>X ^ 0 si num<X
numX: .word 6
cant: .word 0

.code
dadd r4,r4,r0    ;ini r4 para mov
daddi r10,r10,10   ;dim de la tabla
dadd r3,r3,r0   ;para cont
ld r1,numX(r4)   ;traigo numX
loop: ld r2,tabla(r4)
dadd r5,r5,r0   
slt r5,r1,r2     ;guarda 1 si el segundo es mayor que el primero
dadd r3,r3,r5    ;le suma 1 o 0 dep de si es > o <
sd r5,res(r4)
daddi r10,r10,-1
daddi r4,r4,8   ;sig elem
bnez r10,loop      ;conviene usar el branch target buffer
sd r3,cant(r0) 
halt


