module rtlpp_07023               
  (input clk,                
   input reset,              
   input  [7:0] n_in,        
   input  [5:0] d_in,        
   output reg [5:0] r_out,   
   output reg [7:0] q_out);  

  reg [1:0] state;           
  parameter ini=2'b00, sub=2'b01, restore=2'b10, done=2'b11; 
                                             
  
  [MASKED]

endmodule