module origen_055045(
    input [5:0] Op,
    input [5:0] Func,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemWrite,
    output reg nPC_sel,
    output reg ExtOp,
    output reg [2:0] ALUOp,
    output reg Jump,
    output reg RegRa,
    output reg JReg,
    output reg Jalr,
    output reg Lb
);

    parameter special = 6'b000000;
    parameter ori = 6'b001101;
    parameter lw = 6'b100011;
    parameter sw = 6'b101011;
    parameter beq = 6'b000100;
    parameter j = 6'b000010;
    parameter jal = 6'b000011;
    parameter lb = 6'b100000;

    [MASKED]

endmodule