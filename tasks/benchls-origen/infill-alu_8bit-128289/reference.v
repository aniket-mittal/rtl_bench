module origen_128289(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output reg [7:0] result
);

always @(*) begin
    case(op)
        3'b000: result = a + b;  // Addition
        3'b001: result = a - b;  // Subtraction
        3'b010: result = a * b;  // Multiplication
        3'b011: result = (b == 0) ? 8'b0 : a / b;  // Division
        default: result = 8'b0;  // Default case
    endcase
end

endmodule

// Testbench
