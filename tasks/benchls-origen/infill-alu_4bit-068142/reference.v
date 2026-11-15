// ALU Module
module origen_068142(
    input [3:0] a,
    input [3:0] b,
    input [2:0] code,
    output reg [7:0] aluout
);

    wire [7:0] x, y;
    assign x = {4'b0000, a};
    assign y = {4'b0000, b};

    always @(*) begin
        case(code)
            3'b000: aluout = x + y;
            3'b001: aluout = x - y;
            3'b010: aluout = ~x;
            3'b011: aluout = a * b;
            3'b100: aluout = x & y;
            3'b101: aluout = x | y;
            3'b110: aluout = ~(x & y);
            3'b111: aluout = ~(x | y);
            default: aluout = 8'b0;
        endcase
    end
endmodule

// Testbench Module
