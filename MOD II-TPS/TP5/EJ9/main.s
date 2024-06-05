.data
valor: .word 4
result: .word 0

.code
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial

sd $v0, result($0)
halt


factorial: bnez $a0,cont
daddi $v0,$zero,1       ;caso base
j fin
;push el dato
cont: daddi $sp,$sp,-8     
sd $a0,0($sp) 

daddi $a0,$a0,-1
;push la direc de retorno
daddi $sp,$sp,-8     
sd $ra,0($sp) 

jal factorial
;pop direc
ld $ra,0($sp)       ;puedo tocar $ra ??
daddi $sp,$sp,8
;pop dato
ld $a0,0($sp) 
daddi $sp,$sp,8

dmul $v0,$v0,$a0
fin: jr $ra

;NOTAS
; factorial(n) = n! = n x (n-1) x (n-2) x … x 3 x 2 x 1

;push :
; daddi $sp,$sp,-8   subo una celda de mem
; sd $t1,0($sp)      almaceno el dato

;pop : 
; ld $t1,0($sp)       extraigo el dato
; daddi $sp,$sp,8     bajo una celda

