module origen_033371 (
    input [15:0] data1,
    input [15:0] data2,
    input [2:0] ALU_control_input,
    output reg [15:0] result,
    output reg [15:0] status_reg
);

    wire [31:0] mult_result;
    wire [31:0] shift_result;
    reg overflow, carry;

    assign mult_result = data1 * data2;
    assign shift_result = {16'b0, data1} << data2[3:0];

    always @(*) begin
        case (ALU_control_input)
            3'b000, 3'b001, 3'b011: {carry, result} = data1 + data2;
            3'b010: {carry, result} = data1 - data2;
            3'b100: result = mult_result[15:0];
            3'b101: result = data1 & data2;
            3'b110: result = shift_result[15:0];
            3'b111: result = data2;
            default: result = 16'b0;
        endcase

        case (ALU_control_input)
            3'b000, 3'b001, 3'b011, 3'b010: // Addition and Subtraction
                overflow = (data1[15] == data2[15]) && (result[15] != data1[15]);
            3'b100: // Multiplication
                overflow = |mult_result[31:16];
            3'b110: // Logical left shift
                overflow = |shift_result[31:16];
            default:
                overflow = 1'b0;
        endcase

        status_reg[15] = (result == 16'b0); // Zero flag
        status_reg[14] = result[15]; // Negative flag
        status_reg[13] = overflow; // Overflow flag

        case (ALU_control_input)
            3'b000, 3'b001, 3'b011, 3'b010: // Addition and Subtraction
                status_reg[12] = carry;
            3'b100: // Multiplication
                status_reg[12] = |mult_result[31:17];
            3'b110: // Logical left shift
                status_reg[12] = |shift_result[31:16];
            default:
                status_reg[12] = 1'b0;
        endcase

        status_reg[11:0] = 12'b0; // Lower 12 bits always zero
    end

endmodule