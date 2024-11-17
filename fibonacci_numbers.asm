.globl main
.data
	Max: .asciiz "What number do you want to go up to? : "
	newNumber: .asciiz ", "
	title:	.asciiz "The Fibanacci Numbers up to your given number are: \n"
	zeroFloat: .float 0.0 			# also first number in the sequence
	oneFloat: .float 1.0			# second number in the sequence
.text
	main:
		lwc1 $f2, zeroFloat
		lwc1 $f4, oneFloat
		lwc1 $f10, zeroFloat
		jal giveMaxValue
		jal printTitle
		#prints first 2 values
		li $v0, 2
		add.s $f12, $f2, $f2		# $f12 = 0.0 + 0.0
		syscall
		jal printComma
		li $v0, 2
		add.s $f12, $f2, $f4		# $f12 = 0.0 + 1.0
		syscall
		jal printComma
	loop:
		add.s $f12, $f2, $f4		# $f12 = $f2 + $f4
		c.le.s $f0, $f12		# if f0 is greater than f12, go to 'end'  or in other words...
		bc1t end			# if f12 is less than f0, and if that is true, go to 'end'
						# f0 is your input max amount, and you want that to be LESS than your normal 
						# calculated amount
		jal printFloat
		jal printComma
		add.s $f2, $f4, $f10		# $f4 moves to $f2 (for the first number of the addition)
		add.s $f4, $f12, $f10		# $f12 moves to $f4 (for the second number of the addition
		j loop
		
	end:
		li $v0, 10			# ends code
		syscall
		
	
	giveMaxValue:
		li $v0, 4			# print string
		la $a0, Max
		syscall
		
		li $v0, 6 			# give input, float, non-double
		syscall				# result will be stored in $f0
		jr $ra
		
	printFloat:
		li $v0, 2  			# print float
		#add.s $f12, $f0, $f1		# alr done in loop
						# floats ONLY print in reg. $f12
		syscall
		jr $ra
		
	printComma:
		li $v0, 4			# print string
		la $a0, newNumber
		syscall
		jr $ra

	printTitle:
		li $v0, 4
		la $a0, title
		syscall
		jr $ra
