module rtlpp_02735 (
  input wire clk,
  input wire rst,
  input wire enable_CPU,
  input wire flush,
  input wire [31:0] rs_inw,
  input wire [31:0] rt_inw,
  input wire [31:0] imm_inw,
  input wire [31:0] write_back_data,
  input wire [31:0] alu_result_back,
  input wire [5:0] alu_op_inw,
  input wire [1:0] rs_forward_inw,
  input wire [1:0] rt_forward_inw,
  input wire alu_src_inw,
  input wire memory_write_inw,
  input wire memory_to_reg_inw,
  input wire reg_write_inw,
  input wire branch_isc_flag_inw,
  input wire [15:0] pc_next_inw,
  input wire [4:0] write_reg_addr_in_inw,
  output reg [31:0] rd_value,
  output reg [31:0] write_data,
  output reg branch_jump_flag,
  output reg branch_PC,
  output reg [15:0] branch_addr,
  output reg [4:0] write_reg_addr_out,
  output reg memory_write,
  output reg memory_to_reg,
  output reg reg_write
);

  [MASKED]
endmodule