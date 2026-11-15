module origen_014164(
    input div_clk,
    input resetn,
    input div,
    input div_signed,
    input [31:0] x,
    input [31:0] y,
    output reg [31:0] s,
    output reg [31:0] r,
    output reg complete
);

reg [63:0] A;
reg [32:0] B;
reg [5:0] cnt;
reg x_sign, y_sign;

wire [31:0] x_abs = div_signed & x[31] ? -x : x;
wire [31:0] y_abs = div_signed & y[31] ? -y : y;

[MASKED]

endmodule