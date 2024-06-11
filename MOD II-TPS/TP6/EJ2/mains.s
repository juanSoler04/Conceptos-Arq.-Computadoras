.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
MSJ: .asciiz "ingrese numero (0-5) :"
cero: .asciiz "cero"                                ;PREG SI ES LA UNICA MANERA DE IMP LA CADENA???
uno: .asciiz "uno"
dos: .asciiz "dos"
tres: .asciiz "tres"
cuatro: .asciiz "cuatro"
cinco: .asciiz "cinco"

.code
lwu $s0, DATA(r0)
lwu $s1, CONTROL(r0)

jal ingreso
dadd $a0,$0,$v0
jal imprimir
final: halt


ingreso:
daddi $t0,$0,6    ;función 6: limpiar pantalla alfanumérica
sd $t0,0($s1)

daddi $t0,$0,MSJ  ;imp el mensaje
sd $t0,0($s0)
daddi $t0,$0,4
sd $t0,0($s1)

daddi $t0,$0,9      ;ingreso el num
sd $t0,0($s1)
lbu $v0,0($s0)     ;traigo el num de data
daddi $v0,$v0,-48   ;voy al num real 
jr $ra             ;vuelvo al main


imprimir: 
daddi $t0,$0,0    ;ini para ir preguntando
daddi $t1,$0,cero    ;preciso aumentar en 8 para ir a la etiqueta 1, y asi....
loop: beq $a0,$t0, mostrar
daddi $t1,$t1,8
daddi $t0,$t0,1
j loop

mostrar: ;imp el mensaje
dadd $t0,$0,$t1  
sd $t0,0($s0)
daddi $t0,$0,4
sd $t0,0($s1)
jr $ra