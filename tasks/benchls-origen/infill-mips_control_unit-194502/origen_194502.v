module origen_194502(
    input [5:0] opcode,
    input [5:0] func,
    input zf,
    output reg [1:0] sel_dest,
    output reg [1:0] sel_data,
    output reg [1:0] sel_pc,
    output reg sel_opA,
    output reg sel_opB,
    output reg wr_en,
    output reg data_wr,
    output reg [5:0] alu_op
);

    parameter R_TYPE = 6'b000000;
    parameter ADDI = 6'b001000;
    parameter SLTI = 6'b001010;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter JUMP = 6'b000010;
    parameter JAL = 6'b000011;
    parameter JR = 6'b001000;

    parameter ADD = 6'b100000;
    parameter SUB = 6'b100010;
    parameter SLT = 6'b101010;
    parameter SLL = 6'b000000;
    parameter SRL = 6'b000010;

    [MASKED]

endmodule