`define ADD 6'b100000
`define SUB 6'b100010
`define ORI 6'b001101
`define LW  6'b100011
`define SW  6'b101011
`define BEQ 6'b000100
`define J   6'b000010
`define JAL 6'b000011
`define JR  6'b001000
`define LUI 6'b001111

module origen_050139(
    input [31:0] instr,
    output reg RegWrite,
    output reg [1:0] Mem_to_Reg,
    output reg MemWrite,
    output reg [2:0] ALUctr,
    output reg ALUsrc,
    output reg if_j,
    output reg if_jal,
    output reg if_jr,
    output reg [1:0] RegDst,
    output reg [1:0] Ext_op,
    output reg Branch_on_equal,
    output reg [1:0] res
);

wire [5:0] op = instr[31:26];
wire [5:0] func = instr[5:0];

[MASKED]

endmodule