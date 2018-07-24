# var = 1
#  while var < 5 {
#      soma = soma + var;
#      var ++;
#   } 

.data
  VAR: .word 1
  SOMA: .word 0

.text

lw $t1, VAR
lw $t2, SOMA

INICIO_WHILE:
blt $t1,5, MEU_WHILE
j FIM
MEU_WHILE:
add $t2,$t2,$t1 # soma = soma + var
add $t1, $t1, 1 # var ++
j INICIO_WHILE
FIM:
sw $t1, VAR
sw $t2, SOMA



 
  
   
     