	@---------------------
	@	Programming Assignment 7, Problem 1
	@	Your required header information goes here
	@---------------------
	@	You are to write a function that computes factorial
	@	recursively.  Given a value 'n', your function must return n!
	@	Some test code is given to you.  The output should be
	@	1
	@	1
	@	120
	@	3628800
	@	4320
	.extern printf
	.global	main
	.func main
main:	@	DO NOT TOUCH main!
	PUSH	{LR}
	MOV	R0, #0		@ compute 0!
	BL	fact
	MOV     R1, R0
	LDR	R0, =output
	BL	printf
	MOV	R0, #1		@ compute 1!
	BL	fact
	MOV 	R1, R0
	LDR 	R0, =output
	BL	printf
	MOV	R0, #5		@ compute 5!
	BL	fact
	MOV 	R1, R0
	LDR	R0, =output
	BL 	printf
	MOV	R0, #10		@ compute 10!
	BL	fact
	MOV	R1, R0
	LDR	R0, =output
	BL	printf
	MOV	R0, #7		@ compute 7!
	BL	fact
	MOV	R9, R0		@ store off result in R9 for future use
	MOV	R0, #6		@ Compute 6!
	BL	fact
	SUB	R9, R9, R0	@ Compute 7! - 6!
	MOV	R1, R9
	LDR 	R0, =output
	BL	printf
	POP    {PC}

	@---------------------
	@	fact function.  Your code goes here!
	@---------------------
fact:
    @ If n == 0, return 1
    @ else, n * fact(n-1)
    @ n is in R0

    PUSH {LR}
    PUSH {R2}
    MOV R2, R0          @ Keep a copy of n and store into R2

    CMP R0, #0          @ compare n to 0
    MOVEQ R0, #1        @ if n == 0, then move 1 into n.
    BEQ _exit

    @else
    SUB R0, R0, #1      @ n - 1 and store result into R0.
    BL fact             @ after this call, R0 now contains fact(n-1)
    MUL R0, R2, R0      @ n * fact(n-1) and store into R0

_exit:
    POP {R2}
    POP {PC}


.data
output: .asciz "%d\n"
