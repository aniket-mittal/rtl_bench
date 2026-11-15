module remove_parity #(
	parameter WORDS = 5,
	parameter BITS_PER_WORD = 9
	
)(
	input [(1+BITS_PER_WORD)*WORDS-1:0] din,
	output [BITS_PER_WORD*WORDS-1:0] dout	
);

genvar i;
generate
	for (i=0; i<WORDS; i=i+1) begin : p
		wire [BITS_PER_WORD-1:0] tmp_in = din [(i+1)*(BITS_PER_WORD+1)-2:
			i*(BITS_PER_WORD+1)];
		assign dout[(i+1)*BITS_PER_WORD-1:i*BITS_PER_WORD] = tmp_in;
	end
endgenerate

endmodule