		@---------------------
		@	Programming Assignment 6, Problem 2
		@	Your required header information goes here
		@   Marc & Mario
		@
		@--------------------
		@	You are to write a function that performs integer division
		@	Your function must be called div.  It takes two values, a and b passed as parameters,
		@	and should return a/b.  Code is given for you that tests
		@	your program.  Upon successful completion the following values should print
		@	0
		@	1
		@	11
		@	4
		@	5
	.extern printf
        .global main
        .func main
main:		@	DO NOT TOUCH!
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}

		@---------------------
		@	div function.  Your code goes here!
		@---------------------

div:
		@CODE FROM PG. 113\

		PUSH {LR}           @ Push Link register --> where memory address is stored.
        PUSH {R4-R12}       @ Push on stack at the beginning of function.

        MOV R2, R1          @ MOV R1 into R2
        MOV R1, R0          @ MOV R0 into R1

		MOV R4, R2          @ Put divisor in R4.
		CMP R4, R1, LSR #1  @ Double it until 2 x R4 > divisor

		Div1:
		MOVLS R4, R4, LSL #1
		CMP R4, R1, LSR #1
		BLS Div1
		MOV R3, #0          @ Initialize the quotient

		Div2:
		CMP R1, R4          @ Can we subtract R4?
		SUBCS R1, R1, R4    @ If we can, do so.
		ADC R3, R3, R3      @ Double quotient & add new bit
		MOV R4, R4, LSR #1  @ Halve R4
		CMP R4, R2          @ Loop until it's past the original divisor
		BHS Div2

        MOV R0, R3          @ Move quotient into R0
		POP {R4-R12}        @ Pop everything off at the end
		POP	{PC}            @ Pop program counter --> return statement

		@End Code

		@Check phone for example of using PUSH & POP (PA5-2)





		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
