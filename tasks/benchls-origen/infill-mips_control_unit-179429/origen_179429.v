module origen_179429(
    OPCode,
    FunctCode,
    MemtoReg,
    MemWrite,
    Branch,
    ALUsrc,
    ALUop,
    EXTop,
    RegDst,
    RegWrite,
    Jadr,
    Jsrc
);

    input [5:0] OPCode, FunctCode;
    output reg [1:0] MemtoReg;
    output reg MemWrite;
    output reg [2:0] Branch;
    output reg [1:0] ALUsrc;
    output reg [3:0] ALUop;
    output reg [1:0] EXTop;
    output reg [1:0] RegDst;
    output reg RegWrite;
    output reg Jadr;
    output reg Jsrc;

    wire addu, subu, ori, lw, sw, beq, lui, jal, jr, nop;

    assign addu = (OPCode == 6'b000000 && FunctCode == 6'b100001);
    assign subu = (OPCode == 6'b000000 && FunctCode == 6'b100011);
    assign ori = (OPCode == 6'b001101);
    assign lw = (OPCode == 6'b100011);
    assign sw = (OPCode == 6'b101011);
    assign beq = (OPCode == 6'b000100);
    assign lui = (OPCode == 6'b001111);
    assign jal = (OPCode == 6'b000011);
    assign jr = (OPCode == 6'b000000 && FunctCode == 6'b001000);
    assign nop = (OPCode == 6'b000000 && FunctCode == 6'b000000);

    [MASKED]

endmodule