// ALU Module
module origen_011883(
    input [7:0] INPUT1,
    input [7:0] INPUT2,
    input [2:0] SELECT,
    output [7:0] OUTPUT
);

reg [7:0] OUT;

always @(*) begin
    case(SELECT)
        3'b000: OUT = INPUT1;              // Pass-through
        3'b001: OUT = INPUT1 + INPUT2;     // Addition
        3'b010: OUT = INPUT1 & INPUT2;     // Bitwise AND
        3'b011: OUT = INPUT1 | INPUT2;     // Bitwise OR
        default: OUT = 8'b0;               // Default case
    endcase
end

assign OUTPUT = OUT;

endmodule

// Testbench Module
