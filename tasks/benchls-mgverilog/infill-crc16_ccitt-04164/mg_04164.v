module mg_04164 (clk ,reset ,enable ,init ,data_in ,crc_out);
input clk ; 
 input reset ; 
 input enable ; 
 input init ; 
 input data_in ; 
 output [15:0] crc_out; 
 reg [15:0] lfsr; 
 assign crc_out = lfsr; 
 [MASKED] 
 endmodule