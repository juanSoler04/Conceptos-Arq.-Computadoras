.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num: .word 7
long: .word 10
.code
ld r1, long(r0)
ld r2, num(r0)
dadd r3, r0, r0
dadd r10, r0, r0
loop: ld r4, tabla(r3)
nop
daddi r1, r1, -1   ;mov esta instru arriba del beq asi evito raws
beq r4, r2, listo
daddi r3, r3, 8   ;en la tabla se avanza de a 8 (1 byte)
bnez r1, loop
j fin
listo: daddi r10, r0, 1
fin: halt