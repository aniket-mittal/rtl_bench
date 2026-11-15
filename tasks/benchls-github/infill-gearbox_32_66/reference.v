module gearbox_32_33 (
	input clk,arst,
	input [31:0] din,  // bit 0 is sent first
	input din_valid,
	input din_slip,		// drop bit 0 of the current din
	output [32:0] dout, // bit 0 is sent first
	output reg dout_valid
);

reg [63:0] storage;
reg [5:0] holding;

// make it explicit that holding will never be greater than 32
// to help synthesis with the shifter
wire [63:0] aligned_din = holding[5] ? 
				{din,32'b0} :
				(din << holding[4:0]);

always @(posedge clk or posedge arst) begin
	if (arst) begin
		holding <= 0;
		storage <= 0;
		dout_valid <= 1'b0;
	end
	else begin
		dout_valid <= 1'b0;
		if (din_valid) begin
			
			if (din_slip) begin
				// with 31 in and 33 out, holding decreases by 2, mod 33
				if (holding == 0) holding <= 6'd31;
				else if (holding == 1) holding <= 6'd32;
				else holding <= holding - 6'd2;
			end
			else begin
				// with 32 in and 33 out, holding decreases by 1, mod 33
				if (holding == 0) holding <= 6'd32;
				else holding <= holding - 6'd1;
			end
			
			// when you are holding 32 bits there is no output,
			// don't shift the storage, otherwise remove the low
			// order 33 bits.
			storage <= (holding[5] ? storage : (storage >> 6'd33)) |
						 (din_slip ? (aligned_din >> 1'b1) : aligned_din);		
						 
			// the output will be valid unless we are not holding any
			// bits at all.
			dout_valid <= (holding == 0) ? 1'b0 :
						 (din_slip && holding == 6'd1) ? 1'b0 :
						 1'b1;
		end
	end
end

assign dout = storage [32:0];

endmodule

module gearbox_32_66 (
	input clk,arst,
	input [31:0] din,  // bit 0 is sent first
	input din_valid,
	input slip_to_frame,
	output [65:0] dout, // bit 0 is sent first
	output dout_valid,
	
	// this is the number of bit slips used to find the lock
	// intended for debug / test
	output reg [6:0] slip_count
);

////////////////////////////////////
// workhorse 32 to 33 unit

reg gb33_slip;
wire [32:0] gb33_dout;
wire gb33_dout_valid;

gearbox_32_33 gb33 (
	.clk(clk),
	.arst(arst),
	.din(din),  // bit 0 is sent first
	.din_valid(din_valid),
	.din_slip(gb33_slip),	// drop bit 0 of the current din
	.dout(gb33_dout), // bit 0 is sent first
	.dout_valid(gb33_dout_valid)
);
wire correct_framing = ^gb33_dout[1:0];

////////////////////////////////////
// alternate 33 bit halves with slip control

reg first_half;
reg [32:0] prev_word;

always @(posedge clk or posedge arst) begin
	if (arst) begin 
		first_half <= 1'b1;
		gb33_slip <= 1'b0;
		prev_word <= 33'b0;
		slip_count <= 7'h0;
	end
	else begin
		if (din_valid) gb33_slip <= 1'b0;
	
		// alternate reading 33 bit halves
		if (gb33_dout_valid) begin
			first_half <= ~first_half;
			if (first_half) prev_word <= gb33_dout;
		end
		
		// when in search mode check the framing bits
		// they should be different if the alignment 
		// is correct.
		
		if (slip_to_frame) begin
			if (gb33_dout_valid & first_half & !correct_framing) begin
				// this isn't right, do a slip
				gb33_slip <= 1'b1;	
				slip_count <= slip_count + 1'b1;
			end
		end		
	end
end

assign dout = {gb33_dout,prev_word};
assign dout_valid = gb33_dout_valid & !first_half;

endmodule