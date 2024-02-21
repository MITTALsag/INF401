    .bss
xx: .word                                       @ Donne demmander a l'utilisateur

    .data
debut: .asciz "Entrer un nombre positif : "     @ Pour de l'affichage 

    .text
    .global main

main:

    LDR R1, LD_debut                            @ Ecrire la chaine debut
    BL EcrChaine

    LDR R1, LD_xx                               @ Lecture d'un entier
    BL Lire32

    LDR R1, [R1]                                @ Chargemant dans R1 de la valeur de cet entier

    b cond

corps:                                          @ corps de la boucle
    TST R1, #1                                  @ Test de la parité
    BEQ paire

    ADD R1, R1, R1, LSL #1                     @ Si impaire 
    ADD R1, R1, #1
    BL EcrNdecimal8

    B cond                                     @ Fin si (cond suffit pour passer à l'itération suivante)

paire:                                         @ Si paire
    LSR R1, R1, #1
    BL EcrNdecimal8


cond:                                           @ condition de la boucle
    CMP R1, #1
    BNE corps



fin: B exit  @ terminaison immédiate du processus (plus tard on saura faire mieux)


LD_xx: .word xx
LD_debut: .word debut
