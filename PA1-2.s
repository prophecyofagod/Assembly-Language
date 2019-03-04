	@-----------------
	@	  CSC2301 PA 1-2,
	@	  You will use scanf to read an integer (x) from the user
	@         Then you will compute 2*x, 3*x, 4*x, 5*x, and 6*x.
	@         Those values you will put into R2, R3, R4, R5, and R6
	@	  R1 must contain the value x.
	@------------------
	.extern printf
	.extern scanf
	.global main
	.func main
main:	PUSH	{LR}
	@-------------------
	@ Your code starts here
	@-------------------
	LDR R0, =in       @ Load address of 'in' into R0
	LDR R1, =x
	BL scanf	  @ call scanf
	   @  Load address of 'x' into R1

	LDR R1, =x	  @  Load address of 'x' into R1
	LDR R1, [R1]      @  Given to you. Now value of 'x' in R1

	MOV R2, #2
	MUL R2, R2, R1

	MOV R3, #3
	MUL R3, R3, R1

	MOV R4, #4
	MUL R4, R4, R1
	
	MOV R5, #5
	MUL R5, R5, R1

	MOV R6, #6
	MUL R6, R6, R1

	@------------------
	@    Don't modify the rest of this code!
	@------------------
	LDR 	R0, =out    @ Grab address of string for printf
	PUSH	{R4-R6}
	BL 	printf
	POP	{R4-R6}
	POP	{PC}

	
	.data
x:	.word 0
out:	.asciz "x=%d, 2x=%d, 3x=%d, 4x=%d, 5x=%d, 6x=%d\n"
in:	.asciz "%d"
