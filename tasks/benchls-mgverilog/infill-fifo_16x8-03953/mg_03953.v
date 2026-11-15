module mg_03953(input [7:0] d_i,input we_i,input wp_inc_i,output [7:0] q_o,input rp_inc_i,output full_o,output data_available_o,input sys_clk_i,input sys_reset_i);
reg [7:0] fifo[15:0]; 
  reg [3:0] rp; 
  reg [3:0] wp; 
  assign full_o = (wp == (rp-1)); 
  assign data_available_o = ~(wp == rp); 
  assign q_o = fifo[rp]; 
  [MASKED] 
 endmodule