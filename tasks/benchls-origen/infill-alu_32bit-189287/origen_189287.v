module origen_189287 (
    input reset,
    input [31:0] in_data_read_1,
    input [31:0] in_ex_mux,
    input [3:0] operation,
    output reg out_zero,
    output reg [31:0] alu_result
);

localparam AND = 4'b0000;
localparam OR = 4'b0001;
localparam XOR = 4'b0010;
localparam NOR = 4'b0011;
localparam ADD = 4'b0100;
localparam SUB = 4'b0101;
localparam LUI = 4'b0110;
localparam SLT = 4'b0111;
localparam SLL = 4'b1000;
localparam SRL = 4'b1001;
localparam SRA = 4'b1010;
localparam SLLV = 4'b1011;
localparam SRLV = 4'b1100;
localparam SRAV = 4'b1101;

[MASKED]

endmodule