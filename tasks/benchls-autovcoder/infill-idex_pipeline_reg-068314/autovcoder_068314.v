module autovcoder_068314 (
    clk,
    reset,
    write,
    RegWrite_in,
    MemtoReg_in,
    MemRead_in,
    MemWrite_in,
    ALUSrc_in,
    Branch_in,
    ALUop_in,
    pc_in,
    ALU_A_in,
    ALU_B_in,
    imm_in,
    funct7_in,
    funct3_in,
    rs1_in,
    rs2_in,
    rd_in,

    RegWrite_out,
    MemtoReg_out,
    MemRead_out,
    MemWrite_out,
    ALUSrc_out,
    Branch_out,
    ALUop_out,
    pc_out,
    ALU_A_out,
    ALU_B_out,
    imm_out,
    funct7_out,
    funct3_out,
    rs1_out,
    rs2_out,
    rd_out
);

  input clk, write, reset;
  input RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, Branch_in;
  input [1:0] ALUop_in;
  input ALUSrc_in;
  input [31:0] pc_in, ALU_A_in, ALU_B_in, imm_in;
  input [4:0] rs1_in, rs2_in, rd_in;
  input [2:0] funct3_in;
  input [6:0] funct7_in;

  output reg RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, Branch_out;
  output reg [1:0] ALUop_out;
  output reg ALUSrc_out;
  output reg [31:0] pc_out, ALU_A_out, ALU_B_out, imm_out;
  output reg [4:0] rs1_out, rs2_out, rd_out;
  output reg [2:0] funct3_out;
  output reg [6:0] funct7_out;

  [MASKED]

endmodule

