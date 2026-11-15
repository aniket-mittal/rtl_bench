module origen_101606(
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg [1:0] ALUOp,
    output reg JALR,
    output reg Jump,
    output reg PCtoReg,
    output reg [1:0] PCregsrc
);

    // Instruction type constants
    parameter R_TYPE = 7'b0110011;
    parameter LW     = 7'b0000011;
    parameter SW     = 7'b0100011;
    parameter RTypeI = 7'b0010011;
    parameter BR     = 7'b1100011;
    parameter jumplr = 7'b1100111;
    parameter jumpl  = 7'b1101111;
    parameter LUI    = 7'b0110111;
    parameter AUIPC  = 7'b0010111;

    [MASKED]

endmodule