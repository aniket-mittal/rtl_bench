module mg_03748(clk, in, out);
input clk; 
 input [29:0] in; 
 output [29:0] out; 
 parameter INC30_CENTER = 16; 
 reg [INC30_CENTER:0] out_r; 
 [MASKED] 
 assign out[29:INC30_CENTER] = in[29:INC30_CENTER] + out_r[INC30_CENTER]; 
 assign out[(INC30_CENTER - 1):0] = out_r; 
 endmodule