module mg_03919(input [55:0] Din,output [55:0] Dout);
parameter shift_count = 2; 
 wire [27:0] L; 
 wire [27:0] R; 
 assign L = Din[55:28]; 
 assign R = Din[27:0]; 
 [MASKED] 
 endmodule