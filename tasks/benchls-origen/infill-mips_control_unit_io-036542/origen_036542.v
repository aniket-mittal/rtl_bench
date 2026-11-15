module origen_036542(
    input [5:0] Opcode,
    input [21:0] Alu_resultHigh,
    input [5:0] Function_opcode,
    output reg RegDST,
    output reg ALUSrc,
    output reg MemorIOtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg IORead,
    output reg IOWrite,
    output reg Branch,
    output reg nBranch,
    output reg Jmp,
    output reg Jal,
    output reg I_format,
    output reg Sftmd,
    output reg [1:0] ALUOp,
    output reg Jrn
);

    wire R_format = (Opcode == 6'b000000);
    wire Lw = (Opcode == 6'b100011);
    wire Sw = (Opcode == 6'b101011);

    [MASKED]

endmodule