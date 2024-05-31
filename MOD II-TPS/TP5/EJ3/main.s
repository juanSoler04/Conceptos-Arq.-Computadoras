;Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm.
;Pista: la superficie de un triángulo se calcula como: 

.data
base: .double 5.85
altura: .double 13.47
res: .double 0

.code
l.d f1,base(r0)
l.d f2,altura(r0)

daddi r1,r0,2      ;le pongo el 2
mtc1 r1,f5         ;copio el 2 a un regis p.f
cvt.d.l f6,f5      ;conv el regis entero a p.f

mul.d f3,f1,f2
div.d f4,f3,f6  

;hace esta conv pero el num que se ve en MEM esta en hexa
cvt.l.d f7,f4    ;conv a entero el res
s.d f7, res(r0)
halt