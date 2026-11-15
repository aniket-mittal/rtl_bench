module origen_035854(
    input [5:0] Op,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALU_Asrc,
    output reg ALU_Bsrc,
    output reg Mem2Reg,
    output reg RegWrite,
    output reg MemWrite,
    output reg LinkPC,
    output reg [2:0] nPC_sel,
    output reg [1:0] ExtOp,
    output reg [2:0] ALUctrl
);

    // Instruction type decoding
    wire R_type = (Op == 6'b000000);
    wire ori = (Op == 6'b001101);
    wire lw = (Op == 6'b100011);
    wire sw = (Op == 6'b101011);
    wire beq = (Op == 6'b000100);
    wire lui = (Op == 6'b001111);
    wire jal = (Op == 6'b000011);
    wire j = (Op == 6'b000010);
    wire addiu = (Op == 6'b001001);

    // R-type instruction decoding
    wire jr = R_type && (func == 6'b001000);
    wire jalr = R_type && (func == 6'b001001);
    wire addu = R_type && (func == 6'b100001);
    wire subu = R_type && (func == 6'b100011);
    wire sll = R_type && (func == 6'b000000);

    [MASKED]

endmodule