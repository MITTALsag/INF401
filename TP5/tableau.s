   .data
debutTAB: .skip 5*4 @ reservation de 20 octets
                @ sans valeur initiale

   .text
   .global main
main:

    LDR R0, ptr_debutTAB        @ R0 <-- adresse de debutTAB
    MOV R1, #11
    MOV R2, #0

    B cond_tq                   @ saut vers cond pour debut de la boncle

corps_tq:                       @ coprs de la boucle

    STR R1, [R0, R2, LSL #2]    @ R1 --> [R0 + 4*R2]
    ADD R1, #11
    ADD R2, #1

cond_tq:

    CMP R2, #4
    BLS corps_tq                @ tant que R2 <= 4

fin:  BX LR

ptr_debutTAB : .word debutTAB

