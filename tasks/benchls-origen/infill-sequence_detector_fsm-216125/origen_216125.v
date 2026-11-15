module origen_216125 (
    input clk,
    input rst_n,
    input A,
    output reg K1,
    output reg K2
);

    localparam IDEL   = 2'b00;
    localparam START  = 2'b01;
    localparam STOP   = 2'b10;
    localparam CLEAR  = 2'b11;

    reg [1:0] state;

    [MASKED]

endmodule