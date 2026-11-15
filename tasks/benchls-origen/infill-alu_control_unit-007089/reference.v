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

    always @(*) begin
        casez ({ALUOp, opcode})
            {2'b??, OPCODE_ADDI}: ALUOperation = ALU_ADD;
            {2'b??, OPCODE_ORI}:  ALUOperation = ALU_OR;
            {2'b??, OPCODE_XORI}: ALUOperation = ALU_XOR;
            {2'b??, OPCODE_ANDI}: ALUOperation = ALU_AND;
            {2'b00, 6'b??????}:   ALUOperation = ALU_ADD;
            {2'b?1, 6'b??????}:   ALUOperation = ALU_SUB;
            {2'b10, 6'b??????}: begin
                case (instFunc)
                    FUNC_ADD: ALUOperation = ALU_ADD;
                    FUNC_SUB: ALUOperation = ALU_SUB;
                    FUNC_AND: ALUOperation = ALU_AND;
                    FUNC_OR:  ALUOperation = ALU_OR;
                    FUNC_SLT: ALUOperation = ALU_SLT;
                    default:  ALUOperation = 3'bxxx;
                endcase
            end
            default: ALUOperation = 3'bxxx;
        endcase
    end

endmodule