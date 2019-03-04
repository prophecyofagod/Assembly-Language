	@ Factorial, PA4-2
	@ Mario Saiz
	@ 10/22/18

	.extern printf
	.extern scanf
	.global main
	.func main
main:	PUSH	{LR}
	LDR	R0, =prompt	@ Get address of prompt
	BL	printf		@ Print prompt to screen
	LDR	R0, =in		@ Get addr of input format string
	LDR	R1, =n		@ Get addr of n
	BL	scanf		@ Put value in n using scanf
	LDR	R0, =n		@ Addr of n into R0
	LDR	R0, [R0]	@ n is now in R0
	@-------------
	@ Your code goes here.  Put n! in R2
	@-------------

    _start:
        MOV R3, #1 @ Start off with putting 1 into R3

    _loop:
        CMP R0, #0 @ Comparing the answer in R0 to the number 0
        MULGT R3, R3, R0 @ Multiplying R0 & R3, storing it into R3, only if the R0 is bigger than 0
        SUBGT R0, R0, #1 @ Subtracting R0 & 1, storing it into R0, only if the R0 is bigger than 0
        BGT _loop @ If greater than, then branch ends
        MOV R2, R3 @ Move answer from R3 into R2

        @ This does the factorial of numbers, and stores it into R2.

	@-------------
	@ Do NOT alter code past this line.
	@-------------
	MOV	R1, R2
	LDR	R0, =out
	BL 	printf
	POP	{PC}

.data
n:	.word 0
prompt:	.asciz "Enter n: "
in:	.asciz "%d"
out:	.asciz "factorial is: %d\n"

