.data
par: .word 0
impar: .word 0

str: .asciiz "Entre com os numeros"
mensagemPar: .asciiz "A quantidade de numeros pares eh: "
mensagemImpar: .asciiz "A quantidade de numeros impares eh: "

.text      
li $t4,1

INICIO:
li $v0, 51
la $a0,str
syscall
move $t0,$a0
blt $t0,0,FIM

rem $t1,$t0,2 # resto
beq $t1,0, CONTAPARES # $t1 = 0 vai pro FIM
beq $t1,1, CONTAIMPARES

CONTAPARES:
add $t2,$t2,1  # t2 é contador de pares
j INICIO

CONTAIMPARES:
add $t3,$t3,1
# IMPLEMENTAR ABAIXO
# se $t1 = 1 contImpares++
# senão contPares++
j INICIO

FIM:
li $v0, 56
la $a0, mensagemPar
move $a1,$t2
syscall

li $v0, 56
la $a0, mensagemImpar
move $a1,$t3
syscall

# aqui IMPLEMENTAR impressão dos resultados
li $v0,10
syscall
#(exit, ou saida "elegante"!
