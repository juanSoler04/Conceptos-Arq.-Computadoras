.data
texto: .asciiz  ; El mensaje a mostrar
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
lwu $s0, DATA(r0) ; $s0 = dirección de DATA
lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL

;uso control 9 para leer un msj en la direc texto
loop: daddi $t0,$0,9
sd $t0, 0($s1) ; CONTROL recibe 9
lbu $t1,0($s0)    ;tomo el caract de data
sd $t1,texto($0)   ;lo guardo en texto
;daddi $t3,$0,1

daddi $t0, $0, texto ; $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0) ; DATA recibe el puntero al comienzo del mensaje

;daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
;sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla

daddi $t0, $0, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje
j loop
;al no tener cond de corte seguira imp infinitamente 
halt