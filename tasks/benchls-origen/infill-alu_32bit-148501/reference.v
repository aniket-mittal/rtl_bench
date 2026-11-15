module origen_148501 (
    input [31:0] data1,
    input [31:0] data2,
    input [2:0] ctrl,
    input clk,
    output reg oCarry,
    output reg oZero,
    output reg [31:0] out
);

    wire [31:0] add_result, sub_result, and_result, xor_result, or_result;
    wire add_carry, sub_carry;

    // Instantiate adder module
    Adder adder_inst (
        .a(data1),
        .b(data2),
        .sum(add_result),
        .carry(add_carry)
    );

    // Instantiate subtractor module
    Subtractor sub_inst (
        .a(data1),
        .b(data2),
        .diff(sub_result),
        .borrow(sub_carry)
    );

    // Instantiate bitwise AND module
    BitwiseAND and_inst (
        .a(data1),
        .b(data2),
        .result(and_result)
    );

    // Instantiate bitwise XOR module
    BitwiseXOR xor_inst (
        .a(data1),
        .b(data2),
        .result(xor_result)
    );

    // Instantiate bitwise OR module
    BitwiseOR or_inst (
        .a(data1),
        .b(data2),
        .result(or_result)
    );

    // Implement output logic
    always @(posedge clk) begin
        case (ctrl)
            3'b000: begin // Addition
                out <= add_result;
                oCarry <= add_carry;
            end
            3'b001: begin // Subtraction
                out <= sub_result;
                oCarry <= sub_carry;
            end
            3'b010: begin // Bitwise AND
                out <= and_result;
                oCarry <= 1'b0;
            end
            3'b011: begin // Bitwise XOR
                out <= xor_result;
                oCarry <= 1'b0;
            end
            3'b100: begin // Bitwise OR
                out <= or_result;
                oCarry <= 1'b0;
            end
            default: begin
                out <= 32'b0;
                oCarry <= 1'b0;
            end
        endcase

        oZero <= (out == 32'b0);
    end

endmodule

module Adder (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    output carry
);
    assign {carry, sum} = a + b;
endmodule

module Subtractor (
    input [31:0] a,
    input [31:0] b,
    output [31:0] diff,
    output borrow
);
    assign {borrow, diff} = a - b;
endmodule

module BitwiseAND (
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);
    assign result = a & b;
endmodule

module BitwiseXOR (
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);
    assign result = a ^ b;
endmodule

module BitwiseOR (
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);
    assign result = a | b;
endmodule