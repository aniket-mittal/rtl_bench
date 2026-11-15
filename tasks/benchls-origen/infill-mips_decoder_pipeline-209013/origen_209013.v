module origen_209013 (
    input [31:0] instr,
    input over,
    input Gez,
    output reg [1:0] NPCOp,
    output reg RFWr,
    output reg EXTOp,
    output reg [2:0] ALUOp,
    output reg DMWr,
    output reg [1:0] A3Sel,
    output reg [1:0] WDSel,
    output reg DMSel,
    output reg BSel,
    output reg [15:0] imm16,
    output reg [25:0] addr26,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] A3,
    output reg [1:0] Tuse_rs,
    output reg [1:0] Tuse_rt,
    output reg [1:0] Tnew_E,
    output reg [1:0] Tnew_M
);

    [MASKED]
endmodule