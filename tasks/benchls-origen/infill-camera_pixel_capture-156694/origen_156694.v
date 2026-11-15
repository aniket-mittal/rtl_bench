module origen_156694(
    input RES,
    input CLK,
    input [7:0] D,
    input HREF,
    input VSYNC,
    input [14:0] x_in,
    input [14:0] y_in,
    output reg [7:0] PIXEL,
    output reg SAMP_RDY,
    output reg [14:0] x_out,
    output reg [14:0] y_out
);

reg [15:0] TEMP;
reg reg_valid;
reg [15:0] count_bit;

[MASKED]

endmodule