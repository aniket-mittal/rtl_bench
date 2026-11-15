module origen_106707 #(
    parameter WIDTH_I = 16,
    parameter WIDTH_O = 4
)(
    input wire clk,
    input wire cs,
    input wire rw,
    input wire [WIDTH_I-1:0] p_i,
    output reg flow,
    output reg [WIDTH_O-1:0] p_o
);

    reg [WIDTH_I-1:0] p_buf;
    reg [$clog2(WIDTH_I/WIDTH_O)-1:0] counter;
    reg cs_prev;

    [MASKED]

endmodule