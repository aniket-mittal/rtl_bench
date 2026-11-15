module gearbox_20_67 (
	input clk,arst,
	input [19:0] din,
	input slip_to_frame,	// 1=slip until you hit a properly framed word
	output [66:0] dout,
	output reg dout_valid	
);

reg loword_valid;
reg [22:0] loword;

// worst case : want 23 bits, have 22, need to take on 20 more
// therefore we need a 42 bit buffer
reg [41:0] storage;
reg [5:0] top_ptr;
reg [2:0] schedule; // [0,1] 22 bits, [2] 23 bits
reg mv_hi, mv_md;

reg [21:0] hiword,midword;
assign dout = {hiword,midword,loword};

wire enough_bits = (top_ptr > 6'd22) || (!schedule[2] && top_ptr == 6'd22);

[MASKED]
		
endmodule