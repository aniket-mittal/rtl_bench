module origen_211217(
    input [5:0] Op_i,
    output reg FlushMUX_o,
    output reg jumpCtrl_o,
    output reg brenchCtrl_o,
    output reg [1:0] WB_o,
    output reg [3:0] EX_o,
    output reg [1:0] MEM_o
);

    reg ALUSrc;
    reg [1:0] ALUOp;
    reg RegDst;
    reg MemWrite;
    reg MemRead;
    reg RegWrite;
    reg MemtoReg;

    [MASKED]
endmodule