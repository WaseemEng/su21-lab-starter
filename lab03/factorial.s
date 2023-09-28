.data
n: .word 8              # this is input  

.text
main:
    la s1, n            # loading the address of n in s1 save register
    addi t0, x0, 1      # Initializing  t0 to 1
    addi t1, x0, 1      # Initialize factorial result t1 to 1
    lw t3, 0(s1)        # load the value at address s2 in t3

loop:
    mul t1, t1, t0      # t1=t1*t0
    addi t0, t0, 1      # Increment t0
    ble t0, t3, loop    # Check if value in t0 is less than or equal to n, then  continue the loop
    add a1, x0, t1      #Load the factorial result (t1) into a1 for printing
    li a0, 1
    ecall
    addi a1, x0, '\n'   # Load the newline character into a1 for printing
    addi a0,x0,11
    ecall
    li a0, 10
    ecall               # Terminate the program

