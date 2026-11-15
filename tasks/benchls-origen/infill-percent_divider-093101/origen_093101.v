module origen_093101 (
    input wire clk,
    input wire reset,
    input wire [18:0] numerator,
    input wire [18:0] denominator,
    input wire enable,
    output reg done,
    output reg [7:0] percent
);

    reg [7:0] final_per;
    reg [1:0] state;
    reg [23:0] sum;

    localparam START = 2'b00;
    localparam CALCULATING = 2'b01;
    localparam FINISH = 2'b10;

    [MASKED]

endmodule