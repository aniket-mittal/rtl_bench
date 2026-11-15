module mg_03220 (CLK, D, Q);
input CLK; 
 input D; 
 output reg Q; 
 always @(posedge CLK) 
 begin 
  Q <= D; 
 end 
 endmodule