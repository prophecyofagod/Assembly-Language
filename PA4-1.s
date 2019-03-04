
	@ Put the required header information here
	@ Mario Saiz
    @ 10/17/18

	.extern printf
	.extern scanf
	.global main
	.func main
main:
	PUSH	{LR}
	LDR	R2, =startval 	@ get addr of startval
	LDR	R2, [R2]	@ Load startval -> R2
	LDR	R3, =endval	@ get addr of endval
	LDR	R3, [R3]	@ Load endval -> R3
	@-------------
	@ Your code begins here
	@ Your code must put the final answer
	@ in R1.
	@-------------


    _counter:
        MOV R1, #0 @Counter
        MOV R5, #0 @Sum

	_loop:
        ADD R1, R1, #1 @Add 1 to R1 to go to the next register
        ADD R5, R1, R5 @Add R5 and R1, and store in R1
        CMP R1, R3 @Compare R1 with R3, so once it equals 5, it'll stop
        BNE _loop @If not equal, branch ends
        MOV R1, R5 @Move R5 into R1

        @Does a counter to keep going into the registers and adding 1 each time
        @At the end it adds 1+2+3+4+5 which will end up being 15


	@-------------
	@ Do NOT alter code past this line.
	@-------------
	LDR	R0, =out
	BL	printf
	POP	{PC}

.data
startval:	.word 1
endval:		.word 5
out:		.asciz "%d\n"
