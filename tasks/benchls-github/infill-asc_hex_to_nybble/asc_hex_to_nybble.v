module asc_hex_to_nybble (in,out);
input [7:0] in;

output [3:0] out;
reg [3:0] out;

// method 1 is smaller, faster, and will output garbage for
//		non-hex characters.
//
// method 0 will output 0 for non-hex chars
//
parameter METHOD = 1;

generate
if (METHOD == 0) begin
	
	//////////////////////////////////////
	// METHOD = 0
	// illegal input bytes must output 0
	//////////////////////////////////////
	[MASKED]
end
else begin
	
	//////////////////////////////////////
	// METHOD = 1
	// illegal input bytes are don't care
	//////////////////////////////////////
	
	// 0:9 30 - 39 hex	
	// A:F 41 - 46 hex
	// a:f 61 - 66 hex
	always @(in) begin
		if (!in[6])	begin
			// numeric
			out = in[3:0];
		end
		else begin
			// Alpha - made these on paper
			// many variants would work			
			out[3] = 1'b1;
			out[2] = in[2] | (in[1] & in[0]);
			out[1] = in[0] ^ in[1];
			out[0] = !in[0];
		end
	end
end
endgenerate

endmodule