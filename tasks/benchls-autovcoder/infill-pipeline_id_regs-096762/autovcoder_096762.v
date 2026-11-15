module autovcoder_096762 (
    input clk,
    input clr,
    input [31:0] newPC,
    input [31:0] busA,
    input [31:0] busB,
    input [31:0] Inst,
    input ExtOp,
    input ALUSrc,
    input [3:0] ALUop,
    input RegDst,
    input MemWr,
    input RegWr,
    input RegWr_4,
    RegWr_3,
    RegWr_2,
    RegWr_1,  //the 4 controller of the REGISTER
    input MemtoReg,
    input Branch,
    input Jump,
    input l_r,  //the sign of the right or left shift
    input lorr,
    input [4:0] shift,
    input OVSel,
    output reg [31:0] newPC_f,
    output reg [31:0] busA_f,
    output reg [31:0] busB_f,
    output reg [31:0] Inst_f,
    output reg ExtOp_f,
    output reg ALUSrc_f,
    output reg [3:0] ALUop_f,
    output reg RegDst_f,
    output reg MemWr_f,
    output reg RegWr_f,
    output reg RegWr_4f,
    RegWr_3f,
    RegWr_2f,
    RegWr_1f,  //the 4 controller of the REGISTER
    output reg MemtoReg_f,
    output reg Branch_f,
    output reg Jump_f,
    output reg l_rf,  //the sign of the right or left shift
    output reg lorr_f,
    output reg [4:0] shift_f,
    output reg OVSel_f
);
  [MASKED]

endmodule

