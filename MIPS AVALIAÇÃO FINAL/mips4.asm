# EXERCÍCIO 4

.data

mensagem: .asciiz "O resultado da soma dos vetores é: "

vetor1: .word 5 6 4 3 2
vetor2: .word 2 3 4 5 6

vetor3: .word 0 0 0 0 0

size: .word 5

.text

lw $t0,size

la $t1,vetor1
la $t2,vetor2
la $t3, vetor3

li $s4, 0
li $s0,4  
LOOP:

beq $t0, 0,FIM
lw $s1,0($t1)
lw $s2,0($t2)  
add $s3, $s1, $s2
sw $s3,0($t3)
add $s4, $s4, $s3

add $t1,$t1,$s0
add $t2,$t2,$s0
add $t3, $t3, $s0




sub $t0,$t0,1

j LOOP


FIM:

la $t1, vetor3
lw $t0,size
loopimpressao:
beq $t0, 0,fimloop1
lw $t2, 0($t1)
li  $v0, 1
move $a0,$t2
syscall
add $t1,$t1,4
sub $t0,$t0,1
j loopimpressao


fimloop1:

li $v0, 56 
la $a0, mensagem
move $a1, $s4    
syscall

li $v0,10
syscall
