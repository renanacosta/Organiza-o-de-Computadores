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



.text
lw $t0, teste
sub $t0,$t0,2
beq $t0, 1, IFZAO
j GAME_OVER

IFZAO:
   add $t0, $t0,1
   sw $t0, teste
   sw $t0, var
   
 GAME_OVER:
 sw $t0, minha_var
   

