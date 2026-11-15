module origen_048262(
    input [3:0] condition,
    input set_condition,
    input [4:0] controls,
    input [1:0] format,
    output reg [10:0] signals
);

    localparam ALU = 2'b00;
    localparam LOAD_STORE = 2'b01;
    localparam BRANCH = 2'b10;

    localparam ADD = 5'b00000;
    localparam ADDI = 5'b00001;
    localparam SUB = 5'b00010;
    localparam SUBI = 5'b00011;
    localparam AND = 5'b00100;
    localparam ANDI = 5'b00101;
    localparam OR = 5'b00110;
    localparam ORI = 5'b00111;

    localparam RM = 5'b00000;
    localparam IMM = 5'b00001;

    [MASKED]

endmodule