module mg_08619(input [31:0] Din,output [31:0] Dout,input CLK);
reg [31:0]tmp_out [1:0]; 
 reg CE; 
 [MASKED] 
 assign Dout = tmp_out[1]; 
 endmodule