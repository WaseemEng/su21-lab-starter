.import lotsofaccumulators.s

.data
inputarray: .word 1,2,3,4,5,6,7,0

TestPassed: .asciiz "Test Passed!"
TestFailed: .asciiz "Test Failed!"

.text
# Tests if the given implementation of accumulate is correct.
#Input: a0 contains a pointer to the version of accumulate in question. See lotsofaccumulators.s for more details
#
#
#
#The main function currently runs a simple test that checks if accumulator works on the given input array. All versions of accumulate should pass this.
#Modify the test so that you can catch the bugs in four of the five solutions!
main:
    la a0 inputarray
    
    #corrections for acuumulatorone
    li s0 -1
    addi sp sp -4 #prolougue
    sw s0 0(sp)
    jal accumulatorone #jump and link to function
     lw t1 0(sp)
     addi sp sp 4   #epilogue
     li t0 28
     bne s0 t1 Fail 
     beq a0 t0 Pass
    
    # corrections for acuumulatortwo 
    # li t0 50
    # addi sp sp -4 #prolougue
    # sw t0 4(sp)
    # jal accumulatortwo  #jump and link to function
    # lw t0 4(sp)
    # addi sp sp 4  #epilogue
    # li t1 50
    # bne t0 t1 Fail
    # li t0 28
    # beq a0 t0 Pass
    
    #function3  acuumulatorthree is correct
     
     # corrections for accumaltorfour
     # li t2 50  # didn't initialized t2 in function
     # jal accumulatorfour
     # li t0 28
     # beq a0 t0 Pass
     
     # corrections for accumaltor five
      # jal accumulatorfive
      # li t0 0
     #  beq a0 t0 Pass 
    
    
   

    
Fail:
    la a0 TestFailed
    jal print_string
    j End
Pass:
    la a0 TestPassed
    jal print_string
End:
    jal exit

print_int:
	mv a1 a0
    li a0 1
    ecall
    jr ra
    
print_string:
	mv a1 a0
    li a0 4
    ecall
    jr ra
    
exit:
    li a0 10
    ecall
