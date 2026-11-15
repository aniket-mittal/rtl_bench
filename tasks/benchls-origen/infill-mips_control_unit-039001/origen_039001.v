module origen_039001(
    input [5:0] OPCode,
    input [5:0] FunctCode,
    output reg [1:0] MemtoReg,
    output reg MemWrite,
    output reg [2:0] Branch,
    output reg [1:0] ALUsrc,
    output reg [3:0] ALUop,
    output reg [1:0] EXTop,
    output reg [1:0] RegDst,
    output reg RegWrite,
    output reg Jadr,
    output reg Jsrc
);

    // Instruction opcodes
    localparam R_TYPE = 6'b000000;
    localparam ORI    = 6'b001101;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam LUI    = 6'b001111;
    localparam JAL    = 6'b000011;

    // R-type function codes
    localparam ADDU   = 6'b100001;
    localparam SUBU   = 6'b100011;
    localparam JR     = 6'b001000;

    [MASKED]

endmodule