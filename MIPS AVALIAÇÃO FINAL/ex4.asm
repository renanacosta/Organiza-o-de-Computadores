

.data
#vetor a ser copiado
vetor1: .word 2,3,4,5
#vetor origem, que deverá ter os dados de vetor1
#vetor2: .space 128
vetor2: .word 0,0,0,0
#.space 128 é vetor de 4 posições multipicado por 32bits.
#Ou poderia ser vetor2:.word 0,0,0,0


size: .word 4

.text
#$t0 = tamanho do vetor = 4 elementos
lw $t0,size
#pega o endereço dos vetores em $t1 ( vetor1) e $t2 ( vetor2)
la $t1,vetor1
la $t2,vetor2

#cada posição do vetor é "word" ou seja, 32 bits.
# temos que pular na memória 4 em 4 bytes pois
#cada posição do vetor tem 32 bits ( 4 bytes)
li $s0,4   # cada indice do vetor tem 4 bytes.
LOOP:
# nós iremos subtrair a quantidade de elementos ate'chegar a zero.
#Se chegou, cai fora pois nçao podemos extrapolar o tamanho do vetor
beq $t0,0,FIM
lw $s1,0($t1)   # pega o dado atual do vetor1 e grava em s1
sw $s1,0($t2)   #salva s1 na posição de memoria apontada por t2
#(indice atual de vetor2)
#atualiza indices dos dois vetores par cópia
add $t1,$t1,$s0
add $t2,$t2,$s0
# esses dois adds corresponde um i++ em java para avançar para
#o próximo elemento do vetor.Como estamos lidando com cópia, então teremos indices
# usando como base o endereço dos vetores  

# decrementa o size, para quando chegar a zero, o beq funcionar e sair do programa
sub $t0,$t0,1

j LOOP
FIM:
#halt ou fim do programa
li $v0,10
syscall