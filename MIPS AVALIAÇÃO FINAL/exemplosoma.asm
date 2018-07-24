# EXERCICIO 2

.data
soma: .word 0
media: .word 0

str: .asciiz "entre com o numero"
mensagem: .asciiz "O resultado da soma é: "
mensagemMedia: .asciiz " O resultado da Média é: "

.text

li $t4, 4 

INICIO:
add $t2, $t2, 1

bgt $t2,$t4, FIM


li $v0, 51
la $a0, str
syscall
move $t1, $a0
add $t0, $t0, $t1
j INICIO



FIM:



li $v0, 56
la $a0, mensagem
move $a1, $t0     
syscall

div $s3, $t0, $t4

li $v0, 56
la $a0, mensagemMedia
move $a1, $s3
     
syscall


