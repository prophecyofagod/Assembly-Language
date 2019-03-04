	@  PA5-1.s  starter code
	@  Your required header information goes here!
	@@@@@@@@@@@@@@@@@
	.extern printf
	.func printf
	.global main
main:
	PUSH {LR}
	LDR R0, =n	@ Load address of input integer n
	LDR R0, [R0]	@ n is now in R0
	LDR R1, =result	@ address of result string now in R1
	ADD R1, R1, #7	@ Address of last character of result in R1
	@@@@ Your code goes here!


	@@@ Do not modify beyond this line
	LDR R0, =outstring
	LDR R1, =result
	BL printf
	POP {PC}
.data
result:	.asciz "........"
outstring: .asciz "%s\n"
n:	.byte 131
