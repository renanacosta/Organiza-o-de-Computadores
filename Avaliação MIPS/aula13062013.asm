.data
frase: .asciiz "Leia um numero. Pressione 0 para sair"
resultado: .asciiz "O resultado dessa marofa eh:"
.text

INICIO:
la $a0, frase
li $v0, 51           # service 1 is print integer
syscall
# leitura realizada. 
add $t0, $t0, $a0
add  $t1,$t1,1

blt  $t1, 3, INICIO

la $a0, resultado
li $v0, 56
move $a1, $t0
syscall 




