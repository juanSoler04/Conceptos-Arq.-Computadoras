.data
A: .word 6
B: .word 6
C: .word 4
D: .word 0     ;el result de cuantos iguales
.code
ld r1,A(r0)
ld r2,B(r0)
ld r3,C(r0)
daddi r4, r0, 1    ; Inicializa r4 a 1 (r0 es siempre 0)
bne r1,r2,cont1
daddi r4,r4,1
cont1: bne r1,r3,cont2
daddi r4,r4,1
cont2: bne r2,r3,fin
daddi r4,r4,1
j fin
fin: sd r4,D(r0)
halt

;post etiqueta dejar un espacio
;podria evitar los branch taken con nop post instru de bne y el
;delay slot act