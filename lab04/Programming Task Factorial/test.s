 .globl main  
 
  .text 
  
  main:
    la t0, num    
    lw a0, 0(t0)
    
    addi t0,x0,1    
    addi t1,x0,1     
    jal factorial    # jum to factorial 
        
    addi a1, t0, 0     
    la s0,result	
    sw a0,0(s0)	
    j write_tohost	# jump to write_tohost
          
factorial: 
    ble a0,t1,return	
    mv s0,a0		
    addi a0,s0,-1 	
    addi sp,sp,-8 	
    sw s0,0(sp)	
    sw ra, 4(sp)    	
    jal ra, factorial	
    lw s0,0(sp)	
    lw ra,4(sp)	
    addi sp,sp,8
    mul a0,a0,s0       
    jr ra
   
return:	
addi a0,x0,1		
jr ra			
             
write_tohost:
li x1, 1
sw x1, tohost, t5
j write_tohost

.data      
num: .word 4
result: .word 0	
.align 12
.section ".tohost","aw",@progbits;                            
.align 4; .global tohost; tohost: .dword 0;                     
.align 4; .global fromhost; fromhost: .dword 0;
  
