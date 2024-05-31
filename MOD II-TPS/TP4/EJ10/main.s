;) Escribir un programa que cuente la cantidad de veces que un determinado caracter aparece en una cadena de texto. Observar
;cómo se almacenan en memoria los códigos ASCII de los caracteres (código de la letra “a” es 61H). Utilizar la instrucción lbu
;(load byte unsigned) para cargar códigos en registros.

.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar --- el asciiz termina siempre con un 0 que equi a null
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena

.code
dadd r4,r0,r0
lbu r2,car(r0)
dadd r3,r0,r0     ;ini para contar
loop: lbu r1,cadena(r4) 
nop                      ;renta tener 2 nop para evitar RAWS o no    PREGUNTAR!!!
nop
bne r1,r2, cont
daddi r3,r3,1
cont: daddi r4,r4,1  ;sig caract se avanza con 1?  si
bnez r1,loop
sd r3,cant(r0)
halt