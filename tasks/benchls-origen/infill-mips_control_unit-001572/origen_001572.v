module origen_001572(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] PCsel,
    output reg [1:0] EXTsel,
    output reg [2:0] ALUsel,
    output reg Bsel,
    output reg DMEn,
    output reg [1:0] A3sel,
    output reg [1:0] WDsel,
    output reg GRFEn
);

    // Instruction type decoding
    wire addu, subu, ori, lui, lw, sw, beq, jal, jr, j, jalr;

    assign addu = (opcode == 6'b000000) && (func == 6'b100001);
    assign subu = (opcode == 6'b000000) && (func == 6'b100011);
    assign ori  = (opcode == 6'b001101);
    assign lui  = (opcode == 6'b001111);
    assign lw   = (opcode == 6'b100011);
    assign sw   = (opcode == 6'b101011);
    assign beq  = (opcode == 6'b000100);
    assign jal  = (opcode == 6'b000011);
    assign jr   = (opcode == 6'b000000) && (func == 6'b001000);
    assign j    = (opcode == 6'b000010);
    assign jalr = (opcode == 6'b000000) && (func == 6'b001001);

    // Control signal generation
    [MASKED]

endmodule