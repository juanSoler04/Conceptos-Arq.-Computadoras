;Registros              Nombres         ¿Para que se los utiliza?          

;r0                     $zero($0)         siempre retorna 0
;r1                     $at              (Assembler Temporary)reservado para uso por el ensamblador
;r2,r3                  $v0,$v1           valor retornado por subrutina
;r4-r7                  $a0-$a3           argumentos para una subrutina
;r8-r15 y r24-r25       $t0-$t9           temporarios para subrutinas
;r16-r23                $s0-$s7           variables de subrutinas. Preservar sus valores
;r26-r27                $k0,$k1           usados por manejador de interrupciones/trap
;r28                    $gp              (Global Pointer)puntero global (acceso a var static/extern)
;r29                    $sp              (Stack Pointer)puntero de pila
;r30                    $fp              (Frame Pointer)noveno registro de variable
;r31                    $ra              (Return Address)retorno de subrutina
