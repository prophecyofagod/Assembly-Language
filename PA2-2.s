	@--------------------------
	@	PA 2, problem 2
	@	Mario Saiz
	@       10/3/18
	@------------------
	@	You are given a secret message at label 'text' that needs to be
	@	decrypted according to the following rules.
	@	Bytes 0 and 4 need to have the operation EOR 0b1010 applied
	@	to them and written back to memory at the original location
	@	Bytes 1 and 5 need to ORR 0x40 applied to them
	@	and written back to memory at the original location
	@	Bytes 2 and 6 need to have AND 0x7F applied to them
	@	and written back to memory at the original location
	@	Bytes 3 and 7 should remain unchanged.
	@------------------
	.extern printf
	.global main
	.func main
main:
	PUSH	{LR}
	@	Code begins here
	LDR	R0, =text  @ address of message loaded into R0
	@	Your code goes here


	LDRB  R1, [R0, #0] @Load from address R0+0 into R1
	LDRB  R2, [R0, #1] @Load from address R0+1 into R2
	LDRB  R3, [R0, #2] @Load from address R0+2 into R3
	LDRB  R4, [R0, #3] @Load from address R0+3 into R4
	LDRB  R5, [R0, #4] @Load from address R0+4 into R5
	LDRB  R6, [R0, #5] @Load from address R0+5 into R6
	LDRB  R7, [R0, #6] @Load from address R0+6 into R7
	LDRB  R8, [R0, #7] @Load from address R0+7 into R8

	EOR   R1, R1, #0b1010 @EOR [R1, #0b1010] into R1
	ORR   R2, R2, #0x40   @ORR [R2, #0x40] into R2
	AND   R3, R3, #0x7F   @AND [R3, #0x7F] into R3
	EOR   R5, R5, #0b1010 @EOR [R5, #0b1010] into R5
	ORR   R6, R6, #0x40   @ORR [R6, #0x40] into R6
	AND   R7, R7, #0x7F   @AND [R7, #0x7F] into R7

	STRB  R1, [R0, #0]  @Store R1 from R0+0
	STRB  R2, [R0, #1]  @Store R2 from R0+1
	STRB  R3, [R0, #2]  @Store R3 from R0+2
        STRB  R5, [R0, #4]  @Store R5 from R0+4
        STRB  R6, [R0, #5]  @Store R6 from R0+5
        STRB  R7, [R0, #6]  @Store R7 from R0+6

    @ We are turning bits on and off, to change what the original message was into the secret message.
    @ The secret message is "Assembly".

	@	Code to print.  Do not touch
	LDR	R0, =out
	LDR	R1, =text
	BL	printf
	POP	{PC}

.data
text:	.byte 75,51,243,'e',103,34,0xEC,'y', 0		@ the secret message
out:	.asciz "%s\n"


