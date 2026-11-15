module origen_213865(
    input clk,
    input rst,
    input [32:0] x1,
    input [32:0] y1,
    input [8:0] base_ei,
    input enable,
    output [32:0] x2,
    output [8:0] base_eo,
    output valid
);

    reg [0:0] rX2_s;
    reg [31:0] rX2_significand;
    reg [8:0] _base_e;
    reg _valid;

    wire X1_s = x1[32];
    wire [31:0] X1_significand = x1[31:0];
    wire Y1_s = y1[32];
    wire [31:0] Y1_significand = y1[31:0];

    [MASKED]

    assign x2 = {rX2_s, rX2_significand};
    assign base_eo = _base_e;
    assign valid = _valid;

endmodule