.data

pergunta: .asciiz "Digite sua idade: "
msg1: .asciiz "Voce e menor de idade"
msg2: .asciiz "Voce e maior de idade"

idade: .byte

.macro end_program
.data
mensagem: .asciiz "\nprograma encerrado\n"
.text
	li $v0, 4
	la $a0, mensagem
	
	syscall
	
	la $v0, 10
	
	syscall
	
.end_macro

.text

	li $v0, 4	#instrucao de printar inteiro enviada para $a0
	la $a0, pergunta	#registrador "adress zero" printa pergunta
	
	syscall
	
	li $v0, 5	#ler um inteiro e armazenar no registrador $v0
	
	syscall
	
	###########################################################
	#registradores do tipo T armazenam informacoes temporarias#
	###########################################################
	
	move $t1, $v0	#mover o conteudo de $v0 para $t1
	
	li $t0, 18		#atribui valor 18 a $t0
	
	blt $t1, $t0, menor	#brench  if less than compara se $t1 e menor que
					#$t2, se sim, desvia para a linha, no caso MENOR
					
	#blt pula as linhas antes de menor, ou seja, else pode ser interpretado
	#como um codigo entre BLT e a instrucao referenciada.
	
	bge $t1, $t0, maior #compara se e maior ou igual.
	
	menor:
	
		li $v0, 4
		la $a0, msg1
		
		syscall
		
		j after
	
	maior:
	
		li $v0, 4
		la $a0, msg2
		
		syscall
		
		j after
		
	after:
	
	
	end_program
