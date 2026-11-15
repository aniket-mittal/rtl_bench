module mg_04965 (input clk,input rst,input i_wbs_we,input i_wbs_cyc,input [3:0] i_wbs_sel,input [31:0] i_wbs_dat,input i_wbs_stb,output reg o_wbs_ack,output reg [31:0] o_wbs_dat,input [31:0] i_wbs_adr,output reg o_wbs_int);
localparam ADDR_0 = 32'h00000000; 
 localparam ADDR_1 = 32'h00000001; 
 localparam ADDR_2 = 32'h00000002; 
 [MASKED] 
 endmodule