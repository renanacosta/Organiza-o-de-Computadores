.data
mensagem: .asciiz "Voce gosta do Gremio?"
mgremio: .asciiz "BELEZA!!!"
mnaogremio: .asciiz " o problema é seu!"
mcancelar: .asciiz "voce não tem capacidade para isso!!"

.text
li $v0, 50  # ativa o serviço de confirm dialog
la $a0,mensagem
syscall


beq $a0,0,GREMIO_FAN
beq $a0,1,FRACO
beq $a0,2,CANCELAR

GREMIO_FAN:
li $v0,55
la $a0,mgremio
syscall
j FIM

FRACO:
li $v0,55
la $a0,mnaogremio
syscall
j FIM

CANCELAR:
li $v0,55
la $a0,mcancelar
syscall


FIM:
  