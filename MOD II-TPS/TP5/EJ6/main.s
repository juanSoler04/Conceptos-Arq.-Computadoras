.data
valor1: .word 3
valor2: .word 2
result: .word 0

.text
ld $a0, valor1($0)
ld $a1, valor2($0)
jal a_la_potencia
sd $v0, result($0)
halt

a_la_potencia: daddi $v0, $0, 1
lazo: slt $t1, $a1, $0
bnez $t1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra

;La instrucción slt realiza la siguiente operación:  slt rd, rs, rt
;Si rs < rt, rd se establece en 1.
;Si rs!< rt (no es menor), rd se establece en 0.

;simula una potencia pero hace una de mas por lo que siempre da una potencia mas que lo puesto en valor2