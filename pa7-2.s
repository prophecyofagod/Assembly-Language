	@-----------
	@	Programming assignment 7, problem 2
	@	Mario Saiz and Marc Valdoria
	@------------------------------------
	@	Write a program to change lower case letters to
	@	upper case, and upper case letters to lwoer case
	@	in the provided string.  Spaces and non-letter
	@	characters should not be altered.
	@----------

	.extern printf
	.global	main
	.func main
main:	PUSH {LR}
		@ Your code goes here.

		@Flips all the uppercase to lowercase, and vice versa, ignoring numbers, symbols, and spaces.

            LDR R0, =string @loads string into R0
            MOV R2, #0 @moves 0 into R2 as a counter

        _loop:

            LDRB  R1, [R0, R2] @loads character from string and stores it into R1
            
	    CMP R1, #32 @compares character with space
	    BEQ _space @skips space
	    CMP R1, #55 @compares character to 7
	    BEQ _space @skips 7
	    EOR R1, R1, #32 @changes uppercase to lowercase, and vice versa
	    STRB R1, [R0, R2] @stores current character back to original
	    ADD R2, R2, #1 @add #1 to R2
	    CMP R2, #12 @compare R2 to 12
	    BLE _loop @branches to beginning of loop
	    BL _exit @exits program
	 
	 _space:
	    ADD R2, R2, #1 @add 1 to R2, to move to next character
	    BL _loop @goes back to the loop
	    
	 _exit:
	    @ Do not touch the rest of main.
	    LDR	R0, =string
	    BL	printf
	    POP {PC}
.data
@  This is the string you are to transform
string:  .asciz "ARM7 is Cool"
@  If you change the string you must update the length here
length:	.word 12
