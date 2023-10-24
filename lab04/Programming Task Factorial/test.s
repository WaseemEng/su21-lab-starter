.globl	main

.text
main: 			
la	a1,number
lw a1,0(a1)		
#calling a function  	
jal	fact_with_rec 	
	
# storing return value in t2 
la a3,result
lw t2,0(a3)
addi t2,a0,0
sw t2,0(a3)

j write_tohost	# jump to write_tohost

#printing an integer result
addi	a1,t2,0 		
addi	a0,x0,1 		
ecall 		 		
#exit code 		
addi	a0,x0,10 	
ecall 		

##### function	with recursion #######
fact_with_rec: 	

#prologue
addi	sp,sp,-8	
sw		a1,0(sp)
sw		ra,4(sp)

addi	a0,x0,1 	
addi	t0,x0,1			
beq		a1,t0,done	

addi	a1,a1,-1	       #num-1
jal		fact_with_rec  #factorial(num-1)

lw		ra,4(sp)		
lw		t1,0(sp)		
mul		a0,a0,t1	 #num*factorial(num-1)


addi	sp,sp,8	

jr		ra			
# jump to calling
done:     	addi	a2,x0,1
jr		ra

write_tohost:
li x1, 1
sw x1, tohost, t5
j write_tohost


.data
number:	.word	4
result:  .word 0


.align 12
.section ".tohost","aw",@progbits;                            
.align 4; .global tohost; tohost: .dword 0;                 
.align 4; .global fromhost; fromhost: .dword 0; 

