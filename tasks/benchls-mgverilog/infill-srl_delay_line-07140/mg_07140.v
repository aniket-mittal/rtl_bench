module mg_07140 (clk,data,ce,a,q);
parameter DATA_WIDTH = 32'd1; 
 parameter ADDR_WIDTH = 32'd3; 
 parameter DEPTH = 32'd6; 
 input clk; 
 input [DATA_WIDTH-1:0] data; 
 input ce; 
 input [ADDR_WIDTH-1:0] a; 
 output [DATA_WIDTH-1:0] q; 
 reg[DATA_WIDTH-1:0] SRL_SIG [0:DEPTH-1]; 
 integer i; 
 [MASKED] 
 assign q = SRL_SIG[a]; 
 endmodule