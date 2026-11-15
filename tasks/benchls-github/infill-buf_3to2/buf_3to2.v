module buf_3to2 ( 
	clk,rst,

	din,
	din_valid,
	din_ack,

	dout,
	dout_valid,
	dout_ack
);

input clk,rst;

input [23:0] din;
input din_valid;
output din_ack;

output [15:0] dout;
output dout_valid;
input dout_ack;

reg [47:0] storage;
reg [2:0] held;

wire din_ack = !rst & din_valid & (held < 4);
wire dout_valid = !rst & (held > 1);
assign dout = storage[15:0];

[MASKED]
endmodule