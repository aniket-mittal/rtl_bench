module gray_plus_one (
	q,
	q_plus
);

parameter WIDTH = 6;

input [WIDTH-1:0] q;
output [WIDTH-1:0] q_plus;

	// Convert Q to binary wires
	//
	wire [WIDTH-1:0] q_to_bin;
	assign q_to_bin[WIDTH-1] = q[WIDTH-1];
	genvar i;
	generate
	for (i=WIDTH-2; i>=0; i=i-1)
	  begin: gry_to_bin
		assign q_to_bin[i] = q_to_bin[i+1] ^ q[i];
	  end
	endgenerate

	// increment the binary wires for q+
	// do it in gates, not a real + to encourage flattening
	//
	wire [WIDTH-1:0] inc_q;
	wire [WIDTH-1:0] inc_q_cout;
	assign inc_q[0] = !q_to_bin[0];
	assign inc_q_cout[0] = q_to_bin[0];
	generate
	for (i=1; i<WIDTH; i=i+1)
	  begin: plus_one
		assign inc_q[i] = inc_q_cout[i-1] ^ q_to_bin[i];
		assign inc_q_cout[i] = inc_q_cout[i-1] & q_to_bin[i];
	  end
	endgenerate

	// convert back to gray
	//
	assign q_plus = inc_q ^ (inc_q >> 1);

endmodule