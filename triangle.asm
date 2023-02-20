.data
	side1: .byte
	side2: .byte
	side3: .byte
	int: .byte
	
.macro print_string(%msg)

	.data 	
		msg: .asciiz %msg
		
	.text
		
		li $v0, 4		
		la $a0, msg	
	
		syscall

.end_macro

.macro end_program

	.text
		
		print_string("\nPrograma finalizado com sucesso.")
		li $v0, 10
		
		syscall

.end_macro

.macro print_int(%value)

	.data	
	
		value: .byte %value
		
	.text
		
		li $v0, 1		
		la $a0, ($t1)
	
		syscall

.end_macro


.macro read_int(%var, %register)

	.data
		
		int: .byte
	
	.text
		
		li $v0, 5		
		
		syscall
		
		move %register, $v0
	
.end_macro

.macro equal(%r1, %r2, %r3)
		
	.text
	
	beq %r1, %r2, true
	j false
	
	true:
		li %r3, 1
		j end
	
	false:
		li %r3, 0
	
	end:
	
.end_macro
	
.text

	print_string("\n\nDigite o primeiro lado do triangulo: ")	
	read_int(side1, $t1)
	
	print_string("\n\nDigite o segundo lado do triangulo: ")	
	read_int(side1, $t2)
	
	print_string("\n\nDigite o terceiro lado do triangulo: ")	
	read_int(side1, $t3)	
	
	equal($t1, $t2, $s0)
	equal($t2, $t3, $s1)	
	equal($t1, $t3, $s2)
	
	equal($s0, $s1, $s3)
	
	li $t0, 1
	
	beq $s2, $s3, comp_zero
	
	bne $s2, $s3, not_equal
	
	comp_zero:
	
		beq $s2, $t0, equal
		
		j nothing_equal
	
	equal:
	
		print_string("\nTriangulo equilatero.")
		j after
		
	nothing_equal:
	
		print_string("\nTriangulo escaleno.")
		j after
		
	not_equal:
	
		print_string("\nTriangulo isoceles.")
		j after
		
	after:
	
		end_program