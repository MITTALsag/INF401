    .data
cc: @ ne pas modifier cette partie
    .byte 0x42
    .byte 0x4f
    .byte 0x4e
    .byte 0x4a
    .byte 0x4f
    .byte 0x55
    .byte 0x52
    .byte 0x00     @ code de fin de chaine
    @ la suite pourra etr emofifiee
    .word 12
    .word 0x11223344
    .asciz "au revoir..."

    .text
    .global main
main:

@ impression de la chaine de caractere d'adresse cc
     ldr r1, LD_cc
     bl EcrChaine

@ impression de du decimale 12
    ldr r2, LD_num
    ldr r1, [r2]
    bl EcrNdecimal8

@ impression de la chaine "au revoir..."
    ldr r1, LD_asciz    @ = ldr r1, LD_cc ; add R1, #16
    bl EcrChaine


@ modification de la chaine d'adresse cc
    ldr r1, LD_cc

tanq: 
    ldrb r2, [r1]
    cmp r2, #0
    beq fintanq
    add r2, #32
    strb r2, [r1]
    add r1, #1 
    b tanq
fintanq:

@ impression de la chaine cc modifiee
     ldr r1, LD_cc
     bl EcrChaine

fin: B exit  @ terminaison immédiate du processus (plus tard on saura faire mieux)

LD_cc: .word cc
LD_num: .word cc+8
LD_asciz: .word cc+16

