.data

	resultado: .byte

.text

	li $t0, 75
	li $t1, 25
	
	div $t0, $t1
	
	mflo $s0
	
	li $v0, 1
	la $a0, $s0
	syscall