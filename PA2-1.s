	@---------------------------
	@	PA 2, problem 1
	@   	 Mario Saiz
	@    	 10/3/18
	@------------------
	@ Rearrange the characters in the string text in the following way:
	@ The letter originally at position 0 should be moved to position 3
	@ The letter originally at position 1 should be moved to position 0
	@ The letter originally at position 3 should be moved to position 1
	@ The letter at position 2 should not move
	@ ------------------
	@		Code begins here
	.extern printf
	.global main
	.func main
main:
	PUSH 	{LR}		@ Don't touch
	LDR	R0, =text	@ address of text now in R0
	@ Your code goes here.  Use combo of LDRB, STRB to rearrange string

	LDRB  R1, [R0, #0]  @Load from address R0+0 into R1
	LDRB  R2, [R0, #1]  @Load from address R1+1 into R2
	LDRB  R3, [R0, #2]  @Load from address R2+2 into R3
	LDRB  R4, [R0, #3]  @Load from address R3+3 into R4

	STRB  R1, [R0, #3]  @Store R1 from R0+3
	STRB  R2, [R0, #0]  @Store R2 from R0+0
	STRB  R3, [R0, #2]  @Store R3 from R0+2
	STRB  R4, [R0, #1]  @Store R4 from R0+1

	@This program rearranges letters that are mixed up to make a word.
	@From "KDSE" to "DESK".



	@ Code to print the result.  Do not modify
	LDR R0, =out
	LDR R1, =text
	BL printf
	POP {PC}
.data
text:	.asciz "KDSE"
out:	.asciz "%s\n"
