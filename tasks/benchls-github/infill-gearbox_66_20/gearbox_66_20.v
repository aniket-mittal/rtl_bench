module gearbox_66_20 (
	input clk,
	input sclr,			// fixes the state, although not the data registers for reduced fanout
	input [65:0] din,	// lsbit sent first
	output reg din_ack,
	output reg [19:0] dout
);

reg [65:0] din_r  = 0 /* synthesis preserve */;
always @(posedge clk) begin
	if (din_ack) din_r <= din;
end

reg [5:0] gbstate  = 0 /* synthesis preserve */;
always @(posedge clk) begin
	if (gbstate[5] | sclr) gbstate <= 6'b0;
	else gbstate <= gbstate + 1'b1;	
end

reg [3:0] muxop = 0 /* synthesis preserve */;
[MASKED]

reg [18+66-1:0] storage = 0;
always @(posedge clk) begin
	if (sclr) din_ack <= 1'b0;
	else din_ack <= |muxop;
	case (muxop)
		4'h0 : storage <= {18'h0,storage[83:20]};
		4'h1 : storage <= {18'h0,din_r};
		4'h2 : storage <= {16'b0,din_r,storage[21:20]}; // din shl 2
		4'h3 : storage <= {14'b0,din_r,storage[23:20]}; // din shl 4
		4'h4 : storage <= {12'b0,din_r,storage[25:20]}; // din shl 6
		4'h5 : storage <= {10'b0,din_r,storage[27:20]}; // din shl 8
		4'h6 : storage <= {8'b0,din_r,storage[29:20]}; // din shl 10
		4'h7 : storage <= {6'b0,din_r,storage[31:20]}; // din shl 12
		4'h8 : storage <= {4'b0,din_r,storage[33:20]}; // din shl 14
		4'h9 : storage <= {2'b0,din_r,storage[35:20]}; // din shl 16
		4'ha : storage <= {din_r,storage[37:20]}; // din shl 18
		default : storage <= {18'h0,storage[83:20]};
	endcase
end

initial dout = 20'b0;
always @(posedge clk) begin
	dout <= storage [19:0];
end

endmodule