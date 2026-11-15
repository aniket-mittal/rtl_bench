module mg_06422(input clk,input rst,input [4:0] reg_R_addr,input [4:0] reg_W_addr,input [31:0] wdata,input [31:0] pc_i,input reg_we,input EPCWrite,input CauseWrite,input [1:0] IntCause,output [31:0] rdata,output [31:0] epc_o);
reg [31:0] register[12:14]; 
 integer i; 
 assign rdata = register[reg_R_addr]; 
 assign epc_o = register[14]; 
 [MASKED] 
 endmodule