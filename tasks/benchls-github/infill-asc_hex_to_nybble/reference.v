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
	always @(in) begin
		case (in)
			"0" : out = 4'h0;
			"1" : out = 4'h1;
			"2" : out = 4'h2;
			"3" : out = 4'h3;
			"4" : out = 4'h4;
			"5" : out = 4'h5;
			"6" : out = 4'h6;
			"7" : out = 4'h7;
			"8" : out = 4'h8;
			"9" : out = 4'h9;
			"A", "a" : out = 4'ha;
			"B", "b" : out = 4'hb;
			"C", "c" : out = 4'hc;
			"D", "d" : out = 4'hd;
			"E", "e" : out = 4'he;
			"F", "f" : out = 4'hf;
			default : out = 4'b0;
		endcase
	end
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