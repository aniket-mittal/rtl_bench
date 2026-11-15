module mg_10084(input sys_clk,input alu_rst,input [31:0] a,input [31:0] b,input valid_i,output [31:0] r,output reg valid_o);
reg r_one; 
 [MASKED] 
 assign r = r_one ? 32'h3f800000: 32'h00000000; 
 endmodule