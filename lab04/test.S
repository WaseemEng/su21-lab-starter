# Declare main as a global symbol
.globl main

.text 

# Define the main function
main: 
    # Load the address of num into a1
    la a1, num

    # Load the value at the address in a1 into a2
    lw a2, 0(a1)

    # Call the factorial function
    jal factorial

    # Load the address of result into s1
    la s1, result

    # Store the result (a2) into the address in s1
    sw a2, 0(s1)

    # Jump to write_tohost
    j write_tohost
    
# Define the factorial function
factorial: 
    # Function prologue
    addi sp, sp, -12   # Allocate space on the stack
    sw a2, 8(sp)       # Save a2 on the stack
    sw a3, 4(sp)       # Save a3 on the stack
    sw ra, 0(sp)       # Save ra on the stack

    # Check if a2 > 1
    addi t0, x0, 1 
    
    ble a2, t0, label1  # Branch to "label1" if a2 <= 1
    # Recursive case: a2 * factorial(a2 - 1)
    addi a2, a2, -1   # a2 - 1
    jal factorial     # Recursive call


    # Restore saved registers from the stack
    lw ra, 0(sp)      
    lw a3, 4(sp)      
    lw a2, 8(sp)      
    addi sp, sp, 12   
    # Calculate the result: a3 * a2
    mul a2, a3, a2 
    ret              # Return

label1: 
 
    addi a2, x0, 1  #return 1

    # Function epilogue
    addi sp, sp, 12    # Deallocate stack space
    ret               # Return

# Define the data section
.data    
num: .word 4      # Initialize num with the value 3
result: .word 0   # Initialize result with 0

# Define the write_tohost function
write_tohost:
    li t1, 1
    sw t1, tohost, t5

# Align the memory
.align 12
.section ".tohost","aw",@progbits;                            
.align 4; .global tohost; tohost: .dword 0;                     
.align 4; .global fromhost; fromhost: .dword 0;

