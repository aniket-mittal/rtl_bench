module origen_074835 (
    input wire signed [15:0] sig_in,
    input wire clk,
    input wire rst,
    output reg signed [15:0] sig_out
);

    reg signed [15:0] taps [32:0];
    reg signed [31:0] sum;
    integer i;

    [MASKED]

endmodule