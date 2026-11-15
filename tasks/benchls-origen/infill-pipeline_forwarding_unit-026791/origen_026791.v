module origen_026791 (
    input [4:0] EX_Rs, EX_Rt, MEM_Rt, MEM_WriteReg, WB_WriteReg,
    input MEM_RegWrite, WB_RegWrite, ALUSrcSelect, ShiftSelect,
    input [5:0] MEM_OPCode, EX_OPCode,
    output reg [1:0] EX_ALUSrc, EX_Shift,
    output reg MEM_WriteData, EX_WriteData
);

    // Opcodes for store instructions
    localparam SW = 6'b101011;
    localparam SH = 6'b101001;
    localparam SB = 6'b101000;

    [MASKED]

endmodule