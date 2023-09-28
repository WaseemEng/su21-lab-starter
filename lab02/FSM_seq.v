// Code your design here
module fsm_sequence_det_MOORE(
    input clk,
    input reset,
    input in,
    output logic out);
    
    localparam A=0;
    localparam B=1;
    localparam C=2;
    //or
    //defparam enum logic [2-1:0] {A,B} state_type
    
    logic [1:0] current_state,next_state;
    
    //logic for current_state
    always @(posedge clk)
      begin
           if(reset)
                    current_state<=A;
           else
                    current_state<= next_state;
      end
          
      //logic for next_state
          always @(*)
            begin
              
              case(current_state)
               // next_state=in ? B:A;
                A: if(in==1)
                 next_state=B;
                else
                  next_state=A;
                
                B: if(in==1)
                 next_state=C;
                else
                  next_state=A;
                
                 C: if(in==1)
                 next_state=C;
                else
                  next_state=A;
                
              endcase
              
         end
        
  //logic for the output 
  //if moore output depend on current_state and if mealy it output depend on the current_state and inputs
        always @(*)
          begin
            out = (current_state == C  ) ? 1 : 0 ;
           // case(current_state)
             // A: out=A;
             // B: if(in==1)
             //   out=1;
             // else
             //   out=0;
                
            //endcase
          end
    
    
  endmodule