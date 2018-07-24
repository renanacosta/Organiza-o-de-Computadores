#  teste = 1;
#  var = 0;
#  if teste == 1 {
#      teste = teste + 1;
#      var = teste;
#  }
#
.data
teste: .word 6
var: .word 4
minha_var: .word 10
meu_vetor: .word 1,2,3,4
meu_vetor2: .space 320
meu_vetor_size: .word 4
mensagem: .asciiz "A soma eh:"

.text

lw $t4,meu_vetor_size  # $t4 = tamanho

la $t0, meu_vetor   # $t0 = onde está o inicio do vetor

INICIO:
lw $t1, 0($t0)  # $dado lido do vetor apontado por $t0
add $s0,$s0,$t1   # $s0 = somatório dos elementos do vetor
add $t0,$t0,4    # $t0 => .word  => requer salto de 4 bytes
# para cada elemento do vetor
add $t2,$t2,1     # contador para controlar quantidade de elementos 
# do vetor
beq $t2, $t4, FIM   # chegou no tamanho do vetor? Se sim, game over. 
j INICIO

# registrador a ser impresso na tela: $s0


FIM:
li $v0,56  #   $v0 = 56
la $a0,mensagem
move $a1, $s0     #  #a1 = $s0
syscall

li $v0,1
move $a0,$s0
syscall






