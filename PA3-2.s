@Mario Saiz
@10/12/18

@Vending machine code

    .global main
    .extern printf
main:
    @@@ Print out "menu" of choices.
    LDR R0, =msg0
    BL printf
    LDR R0, =msg1
    BL printf
    LDR R0, =msg2
    BL printf
    LDR R0, =msg3
    BL printf
    LDR R0, =msg4
    BL printf
    @@@ Have user enter in their selection
    @@@ Store selection in variable select
    LDR R0, =inp
    LDR R1, =select
    BL scanf
    @@@ Prompt user for quantity
    LDR R0, =msg5
    BL printf
    @@@ Have user enter value into variable
    @@@ Quantity
    LDR R0, =inp
    LDR R1, =quantity
    BL scanf

    LDR R1, =select  @Address of var select
    LDR R1, [R1]     @Value of select in R1

    @Your modifications will begin at this point

@peanut
    CMP R1, #1        @Check for "peanuts"
    MOVEQ R3, #75       @Move 75 cents into R3
@chocolate
    CMP R1, #2        @Check for "chocolate"
    MOVEQ R3, #125      @Move 125 cents into R3
@pretzel
    CMP R1, #3       @Check for "pretzels"
    MOVEQ R3, #90      @Move 90 cents into R3

@Illegal
    CMP R1, #3       @Check if input is 3, it being the highest number you can have
    LDRGT R0, =msg7  @If we get here user entered
                     @an illegal selection so print
                     @error message and terminate
    BLGT printf

@Compute
    LDR R4, =quantity @Get address of var quantity
    LDR R4, [R4]      @Value of quantity now in R4
    MUL R1, R3, R4    @Multiply number of cents times quantity
                      @and put result in R1
    LDR R0, =msg6     @Final message
    BL printf
    MOV R7, #1        @Normal exit
    SWI #0


@This program should display a menu, making the user choose between 3 options
@Then it will prompt them to input an amount they want
@It will then compute the amounts and display how much it costs, depending on the item, cost, and amount
@I am also making this program display an error message if one of the choices (#1-#3) aren't in that range.

.data
select: .word 0
quantity: .word 0
msg0: .asciz "CSC2301 Vending machine!\n"
msg1: .asciz "Enter your choice:\n"
msg2: .asciz "1 for peanuts @ 75 cents\n"
msg3: .asciz "2 for chocolate @ $1.25\n"
msg4: .asciz "3 for pretzels @ 90 cents\n"
msg5: .asciz "Enter quantity\n";
msg6: .asciz "Your total is: %d cents\n";
msg7: .asciz "Illegal selection.  Goodbye\n"
inp: .asciz "%d"


