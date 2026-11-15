module mg_00934(input clk_i,input rst_i,input stall_i,input take_branch_i,input [29:0] branch_pc_i,output [31:0] ir_o,output [29:0] nextpc_o,output reg re_o,output [29:0] rmemaddr_o,input [31:0] rmemdata_i);
reg [29:0] pc; 
 initial begin 
  pc = 0; 
 end 
 assign nextpc_o = take_branch_i ? branch_pc_i : pc + 30'b1; 
 assign rmemaddr_o = nextpc_o; 
 assign ir_o = rmemdata_i; 
 [MASKED] 
 endmodule