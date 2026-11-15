module eight_input_rom (in,out);
input [7:0] in;
output out;
wire out /* synthesis keep */;

parameter [255:0] mask = 256'b0;

wire [3:0] t /* synthesis keep */;
wire [63:0] m0 = mask[63:0];
wire [63:0] m1 = mask[127:64];
wire [63:0] m2 = mask[191:128];
wire [63:0] m3 = mask[255:192];

assign t[0] = m0[in[5:0]];
assign t[1] = m1[in[5:0]];
assign t[2] = m2[in[5:0]];
assign t[3] = m3[in[5:0]];
assign out = t[in[7:6]];

endmodule