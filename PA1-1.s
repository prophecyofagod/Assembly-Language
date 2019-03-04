	@-----------------
	@	  CSC2301 PA 1-1,
	@	  This code computes 6*x - 7.
	@         You must make it compute: 2*x^2 - 5*x + 3
        @         R1 contains intial val, R3 contains final result.
	@------------------
	.extern printf
	.global main
	.func main
	@	  Setup the value we are going to compute on
	@	  You should only change x for testing purposes
main:	PUSH	{LR}
	LDR	R1, =x    @  Load address of x
	LDR	R1, [R1]  @  x is now in R1
	@------------------
	@   Your modifcations go here
	@------------------
	MOV	R2, #2      @  Load the value 2 into R2
	MUL	R3, R1, R1  @  The value x^2 is now in R3
	MUL 	R3, R2, R3  @  The Value 2*x^2 is now in R3
	MVN	R4, #4	    @  Load the value of -5 into R4
	MUL	R5, R1, R4  @  R5 is now -5x
	MOV	R6, #3	    @  R6 is now 3
	ADD	R7, R5, R6  @  R7 is now -5*x+3 
	ADD	R3, R3, R7  @  R3 now contains the result 2*x^2-5*x+3
	@------------------
	@    Don't modify the rest of this code!
	@------------------
	LDR 	R0, =out    @ Grab address of string for printf
	MOV	R1, R3	    @ Copy result into correct register
	BL 	printf
	POP	{PC}

	
	.data
x:	.word 2
out:	.asciz "%d\n"
