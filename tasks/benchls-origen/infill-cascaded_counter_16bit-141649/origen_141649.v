module origen_141649 (
    input wire clk,
    input wire reset,
    input wire enable_1,
    input wire enable_2,
    input wire enable_3,
    output wire [15:0] count,
    output wire [3:0] overflow_count
);

reg [15:0] counter;
reg [3:0] overflow;

[MASKED]

assign count = counter;
assign overflow_count = overflow;

endmodule