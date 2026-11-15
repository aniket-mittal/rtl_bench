module origen_162224(
    input clk,
    input rst_n,
    input [7:0] cap_flow,
    input [7:0] low_flow,
    output reg [7:0] out_flow
);

reg [3:0] CS;

parameter S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5,
          S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, S9 = 4'd9, S10 = 4'd10, S11 = 4'd11;

[MASKED]

endmodule