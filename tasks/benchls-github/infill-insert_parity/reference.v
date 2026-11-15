module insert_parity #(
	parameter WORDS = 5,
	parameter BITS_PER_WORD = 9
	
)(
	input [BITS_PER_WORD*WORDS-1:0] din,
	output [(1+BITS_PER_WORD)*WORDS-1:0] dout	
);

genvar i;
generate
	for (i=0; i<WORDS; i=i+1) begin : p
		wire [BITS_PER_WORD-1:0] tmp_in = din [(i+1)*BITS_PER_WORD-1:i*BITS_PER_WORD];
		wire pbit = (^tmp_in) ^ 1'b1;
		wire [BITS_PER_WORD:0] tmp_out = {pbit, tmp_in};
		assign dout[(i+1)*(BITS_PER_WORD+1)-1:i*(BITS_PER_WORD+1)] = tmp_out;
	end
endgenerate

endmodule