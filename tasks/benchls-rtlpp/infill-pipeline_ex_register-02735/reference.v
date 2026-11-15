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

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // reset logic
      rd_value <= 32'b0;
      write_data <= 32'b0;
      branch_jump_flag <= 1'b0;
      branch_PC <= 1'b0;
      branch_addr <= 16'b0;
      write_reg_addr_out <= 5'b0;
      memory_write <= 1'b0;
      memory_to_reg <= 1'b0;
      reg_write <= 1'b0;
    end else if (enable_CPU && !flush) begin
      // ALU operation logic
      write_reg_addr_out <= write_reg_addr_in_inw;
      
      case (alu_op_inw)
        6'b000000: rd_value <= rs_inw + rt_inw; // ADD
        6'b000001: rd_value <= rs_inw - rt_inw; // SUB
        6'b000010: rd_value <= rs_inw & rt_inw; // AND
        6'b000011: rd_value <= rs_inw | rt_inw; // OR
        6'b000100: rd_value <= rs_inw ^ rt_inw; // XOR
        6'b000101: rd_value <= (rs_inw < rt_inw) ? 32'b1 : 32'b0; // SLT
        // Additional ALU operations can be added here
        default: rd_value <= 32'b0;
      endcase

      if (alu_src_inw) begin
        write_data <= imm_inw;
      end else begin
        write_data <= rt_inw;
      end

      memory_write <= memory_write_inw;
      memory_to_reg <= memory_to_reg_inw;
      reg_write <= reg_write_inw;

      if (branch_isc_flag_inw && (rd_value == 32'b0)) begin
        branch_jump_flag <= 1'b1;
        branch_PC <= 1'b1;
        branch_addr <= pc_next_inw;
      end else begin
        branch_jump_flag <= 1'b0;
        branch_PC <= 1'b0;
      end
    end
  end
endmodule