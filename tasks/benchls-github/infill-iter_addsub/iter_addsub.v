module iter_addsub (
	input clk,sclr,
	input first,sub,
	input a,b,
	output sum
);

reg car;
assign sum = a ^ (sub ^ b) ^ (first ? sub : car);

[MASKED]

endmodule