module mg_08041(clk, cs, ns);
input clk; 
 input [7:0] cs; 
 output [7:0] ns; 
 integer is; 
 [MASKED] 
 assign ns = is; 
 endmodule