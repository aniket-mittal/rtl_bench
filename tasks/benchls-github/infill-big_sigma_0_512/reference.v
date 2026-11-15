module big_sigma_0_512 (x,result);
input [63:0] x;
output [63:0] result;

wire [63:0] ror28,ror34,ror39;

	assign ror28 = {x[28-1:0],x[63:28]};
	assign ror34 = {x[34-1:0],x[63:34]};
	assign ror39 = {x[39-1:0],x[63:39]};
	assign result = ror28 ^ ror34 ^ ror39;

endmodule