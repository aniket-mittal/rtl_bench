module origen_007089 (
    input wire clk,
    input wire rst,
    input wire [5:0] instFunc,
    input wire [5:0] opcode,
    input wire [1:0] ALUOp,
    output reg [2:0] ALUOperation
);

    // Opcodes
    localparam OPCODE_ADDI = 6'b001000;
    localparam OPCODE_ORI  = 6'b001101;
    localparam OPCODE_XORI = 6'b001110;
    localparam OPCODE_ANDI = 6'b001100;

    // Function codes
    localparam FUNC_ADD = 6'b100000;
    localparam FUNC_SUB = 6'b100010;
    localparam FUNC_AND = 6'b100100;
    localparam FUNC_OR  = 6'b100101;
    localparam FUNC_SLT = 6'b101010;

    // ALU operations
    localparam ALU_ADD = 3'b010;
    localparam ALU_SUB = 3'b110;
    localparam ALU_AND = 3'b000;
    localparam ALU_OR  = 3'b001;
    localparam ALU_SLT = 3'b111;
    localparam ALU_XOR = 3'b011;

    [MASKED]

endmodule