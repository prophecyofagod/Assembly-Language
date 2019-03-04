		@---------------------
		@	Programming Assignment 6, Problem 1
		@	Mario Saiz and Marc Valdoria
		@       11/9/18
		@---------------------
		@ In those you will use the provided function pow to comput
		@ a^b - 3a
		@ You must set up the arguments to pow and call it using BL
		@ The result should be in R4 after the program completes
	.extern printf
	.global	main
	.func main
main:	PUSH {LR}
	@	Your code goes here

	LDR R0, =a
	LDR R1, =b

	LDR R0, [R0]
    LDR R1, [R1]

	BL pow

	LDR R2, =a
    LDR R2, [R2]

	MOV R3, #3
	MUL R4, R2, R3
	SUB R4, R0, R4


	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out
	MOV	R1, R4
	BL 	printf
	POP	{PC}

	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:
    PUSH		{LR}
	PUSH		{R4-R6}
	MOV		R4, R1
	MOV		R5, #1
loop:
    CMP		R4, #0
	BEQ		exit
	MUL		R5, R0, R5
	SUB		R4, R4, #1
	BAL		loop
exit:
    MOV		R0, R5
	POP		{R4-R6}
	POP		{PC}

.data
a:	.word	3
b:	.word	4
out:	.asciz "Answer: %d\n"
