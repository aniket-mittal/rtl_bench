module origen_187371 #(
    parameter DATA_WIDTH = 32
) (
    input  wire [DATA_WIDTH-1:0] operand_A,
    input  wire [DATA_WIDTH-1:0] operand_B,
    input  wire [5:0] ALU_Control,
    output wire [DATA_WIDTH-1:0] ALU_result,
    output wire zero,
    output wire branch
);

    // Signed operands
    wire signed [DATA_WIDTH-1:0] signed_operand_A = operand_A;
    wire signed [DATA_WIDTH-1:0] signed_operand_B = operand_B;

    // Shift amount
    wire [4:0] shift_amount = operand_B[4:0];

    // Arithmetic shift right
    wire [2*DATA_WIDTH-1:0] shifted_signed_operand_A = { {DATA_WIDTH{signed_operand_A[DATA_WIDTH-1]}}, signed_operand_A };
    wire [DATA_WIDTH-1:0] arithmetic_shift_right = shifted_signed_operand_A[2*DATA_WIDTH-1:DATA_WIDTH];

    // ALU operations
    reg [DATA_WIDTH-1:0] result;
    always @(*) begin
        case (ALU_Control)
            6'b000000: result = signed_operand_A + signed_operand_B; // Addition
            6'b000001: result = signed_operand_A - signed_operand_B; // Subtraction
            6'b000010: result = operand_A ^ operand_B; // Bitwise XOR
            6'b000011: result = operand_A | operand_B; // Bitwise OR
            6'b000100: result = operand_A & operand_B; // Bitwise AND
            6'b000101: result = (signed_operand_A < signed_operand_B) ? 1'b1 : 1'b0; // Signed less-than
            6'b000110: result = (operand_A < operand_B) ? 1'b1 : 1'b0; // Unsigned less-than
            6'b000111: result = operand_A << shift_amount; // Logical shift left
            6'b001000: result = operand_A >> shift_amount; // Logical shift right
            6'b001001: result = arithmetic_shift_right; // Arithmetic shift right
            6'b001010: result = operand_A; // Pass-through
            6'b001011: result = (operand_A == operand_B) ? 1'b1 : 1'b0; // Equality check
            6'b001100: result = (operand_A != operand_B) ? 1'b1 : 1'b0; // Inequality check
            6'b001101: result = (signed_operand_A < signed_operand_B) ? 1'b1 : 1'b0; // Signed less-than
            6'b001110: result = (signed_operand_A >= signed_operand_B) ? 1'b1 : 1'b0; // Signed greater-than-or-equal
            6'b001111: result = (operand_A < operand_B) ? 1'b1 : 1'b0; // Unsigned less-than
            6'b010000: result = (operand_A >= operand_B) ? 1'b1 : 1'b0; // Unsigned greater-than-or-equal
            default: result = {DATA_WIDTH{1'b0}};
        endcase
    end

    // Zero and branch flags
    assign zero = (result == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;
    assign branch = (ALU_Control == 6'b000101 && result == 1'b1) ? 1'b1 : 1'b0;

    // ALU result
    assign ALU_result = result;

endmodule