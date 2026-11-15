module origen_137397(
    input [7:0] a,
    input [7:0] b,
    input [1:0] op,
    output reg [7:0] result
);

always @(*) begin
    case(op)
        2'b00: result = a + b;
        2'b01: result = a - b;
        2'b10: result = a * b;
        2'b11: result = (b != 0) ? a / b : 8'hFF; // Division by zero returns 0xFF
    endcase
end

endmodule

