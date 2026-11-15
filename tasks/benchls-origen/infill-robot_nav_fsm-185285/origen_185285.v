module origen_185285(
    input clk_100,
    input switch,
    input rst,
    input [3:0] distance_flag,
    output reg [2:0] dir,
    output reg [1:0] speed,
    output reg [1:0] choose
);

reg [3:0] state;
parameter s0 = 4'b0000, s11 = 4'b0001, s12 = 4'b0010, s13 = 4'b0011, s14 = 4'b0100,
          s21 = 4'b0101, s22 = 4'b0110, s23 = 4'b0111, s24 = 4'b1000;

reg [7:0] count_l, count_r, count_q;

[MASKED]

endmodule