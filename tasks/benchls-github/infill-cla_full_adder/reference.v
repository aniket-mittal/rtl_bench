module cla_full_adder(
		input	a,
		input	b,
		input	c,
		output	g,
		output	p,
		output	s);

	assign g = a & b;
	assign p = a ^ b;
	assign s = a ^ (b ^ c);

endmodule