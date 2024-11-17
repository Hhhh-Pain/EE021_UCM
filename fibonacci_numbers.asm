.globl main
.data
	Max: .asciiz "What number do you want to go up to? : "
	newNumber: .asciiz ", "
	title:	.asciiz "The Fib Numbers are: \n"
	zeroFloat: .float 0.0 				# also numOne
	oneFloat: .float 1.0	
.text
	main:
		lwc1 $f2, zeroFloat
		lwc1 $f4, oneFloat
		lwc1 $f10, zeroFloat
		jal giveMaxValue
		jal printTitle
		#prints first 2 values
		li $v0, 2
		add.s $f12, $f2, $f2
		syscall
		jal printComma
		li $v0, 2
		add.s $f12, $f2, $f4
		syscall
		jal printComma
	loop:
		c.le.s $f0, $f12			# if f0 is greater than f12, go to 'end'
		bc1t end				# if f12 is less than f0, and that is true, go to 'end'
		
		add.s $f12, $f2, $f4
		jal printFloat
		jal printComma
		add.s $f6, $f12, $f10
		add.s $f2, $f4, $f10
		add.s $f4, $f6, $f10
		j loop
		
	end:
		li $v0, 10
		syscall
		
	
	giveMaxValue:
		li $v0, 4			# print string
		la $a0, Max
		syscall
		
		li $v0, 6 			# give input, float, non-double
		syscall
		jr $ra
		
	printFloat:
		li $v0, 2  			# print float
		#add.s $f12, $f0, $f1		# alr done in loop
		syscall
		jr $ra
		
	printComma:
		li $v0, 4
		la $a0, newNumber
		syscall
		jr $ra

	printTitle:
		li $v0, 4
		la $a0, title
		syscall
		jr $ra
