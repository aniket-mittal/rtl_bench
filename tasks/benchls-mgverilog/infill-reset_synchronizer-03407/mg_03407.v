module mg_03407 (input clk,input in_rst_n,output out_rst_n);
reg [1:0] ff; 
 [MASKED] 
 assign out_rst_n = ff[0]; 
 endmodule