	@  PA5-2.s  starter code
	@  Your required header information goes here!
	@@@@@@@@@@@@@@@@@
	.extern printf
	.func printf
	.global main
main:
	PUSH {LR}
	LDR R0, =inarray	@ Load address of inarray -> R0
	LDR R1, =outarray	@ Load address of outarray -> R1
	@@@@ Your code goes here!


	
	@@@ Do not modify beyond this line
	LDR R0, =outstring
	LDR R5, =outarray
	MOV R7, #10
loop:
	LDR R0, =outstring
	LDR R1, [R5], #4
	BL printf
	SUBS R7, R7, #1
	BNE loop
	POP {PC}
.data
inarray:	.word	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
outarray:	.skip 40
outstring:	.asciz "%d\n"
