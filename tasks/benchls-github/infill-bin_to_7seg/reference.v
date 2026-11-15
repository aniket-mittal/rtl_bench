module bin_to_7seg	(bin,seg);
input	[3:0]	bin;
output	[6:0]	seg;
reg		[6:0]	seg;

always @(bin) begin
	
	case(bin)
		4'h0: seg = 7'b1000000;		//  output = 0 indicates a lit segment
		4'h1: seg = 7'b1111001;		// ---0---
		4'h2: seg = 7'b0100100; 	// |	 |
		4'h3: seg = 7'b0110000; 	// 5	 1
		4'h4: seg = 7'b0011001; 	// |	 |
		4'h5: seg = 7'b0010010; 	// ---6---
		4'h6: seg = 7'b0000010; 	// |	 |
		4'h7: seg = 7'b1111000; 	// 4	 2
		4'h8: seg = 7'b0000000; 	// |	 |
		4'h9: seg = 7'b0011000; 	// ---3---
		4'ha: seg = 7'b0001000;
		4'hb: seg = 7'b0000011;
		4'hc: seg = 7'b1000110;
		4'hd: seg = 7'b0100001;
		4'he: seg = 7'b0000110;
		4'hf: seg = 7'b0001110;
		default : seg = 7'b1111111;
	endcase
end

endmodule