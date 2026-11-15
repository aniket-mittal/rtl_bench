module mg_07745 (input rst,input clk,input [19:0] inst_in,input i_fetch,input [5:0] a_src,input [10:0] pc_in,output [10:0] pc_out,output reg branch,output skip,output [3:0] lcount);
reg [10:0] r_loop_st; 
  reg [10:0] r_loop_end; 
  reg [5:0] r_loop_cnt; 
  reg r_loop_ena; 
  [MASKED] 
  assign pc_out = r_loop_st; 
  assign skip = (a_src[5:0] == 6'd0) ? inst_in[11] : 1'b0; 
  assign lcount = r_loop_cnt[3:0]; 
 endmodule