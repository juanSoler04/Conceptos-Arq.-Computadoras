.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
color_pelota: .word32 0x00FF0000 ; Azul
color_fondo: .word32 0x00FFFFFF ; Blanco
 .text
 lwu $s6, CONTROL($0)
 lwu $s7, DATA($0)
 lwu $v0, color_pelota($0)
 lwu $v1, color_fondo($0)
 daddi $s0, $0, 23 ; Coordenada X de la pelota
 daddi $s1, $0, 1 ; Coordenada Y de la pelota
 daddi $s2, $0, 1 ; Dirección X de la pelota
 daddi $s3, $0, 1 ; Dirección Y de la pelota
 daddi $s4, $0, 5 ; Comando para dibujar un punto
loop: sw $v1, 0($s7) ; Borra la pelota
 sb $s0, 4($s7)
 sb $s1, 5($s7)
 sd $s4, 0($s6)
 dadd $s0, $s0, $s2 ; Mueve la pelota en la dirección actual
 dadd $s1, $s1, $s3
 daddi $t1, $0, 48 ; Comprueba que la pelota no esté en la columna de más
 slt $t0, $t1, $s0 ; a la derecha. Si es así, cambia la dirección en X.
 dsll $t0, $t0, 1
 dsub $s2, $s2, $t0
 slt $t0, $t1, $s1 ; Comprueba que la pelota no esté en la fila de más arriba.
 dsll $t0, $t0, 1 ; Si es así, cambia la dirección en Y.
 dsub $s3, $s3, $t0
 slti $t0, $s0, 1 ; Comprueba que la pelota no esté en la columna de más
 dsll $t0, $t0, 1 ; a la izquierda. Si es así, cambia la dirección en X.
 dadd $s2, $s2, $t0
 slti $t0, $s1, 1 ; Comprueba que la pelota no esté en la fila de más abajo.
 dsll $t0, $t0, 1 ; Si es así, cambia la dirección en Y.
 dadd $s3, $s3, $t0
 sw $v0, 0($s7) ; Dibuja la pelota.
 sb $s0, 4($s7)
 sb $s1, 5($s7)
 sd $s4, 0($s6)
 daddi $t0, $0, 500 ; Hace una demora para que el rebote no sea tan rápido.
demora: daddi $t0, $t0, -1 ; Esto genera una infinidad de RAW y BTS pero...
 bnez $t0, demora ; ¡hay que hacer tiempo igualmente!
 j loop
