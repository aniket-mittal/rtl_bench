module autovcoder_141656 (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [7:0] numerator,
    input wire [7:0] denominator,
    output reg [7:0] quotient,
    output reg [7:0] remainder,
    output reg done
);
    reg [7:0] temp_numerator;
    reg [7:0] temp_denominator;
    reg [3:0] count;
    reg state;

    [MASKED]
endmodule