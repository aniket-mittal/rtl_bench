module mg_01128(input wire clk,input wire rst,input wire [31:0] p_data_i,output wire [31:0] p_addr_o,input wire seq_stop_inc_pc_i,input wire [31:0] jmp_pc_i,input wire jmp_pc_en_i,output wire [31:0] inst_o);
assign p_addr_o = pc_ff; 
 assign inst_o = p_data_i; 
 reg [31:0] pc_ff; 
 [MASKED] 
 endmodule