module big_sigma_1_512 (x,result);
input [63:0] x;
output [63:0] result;

wire [63:0] ror14,ror18,ror41;

	assign ror14 = {x[14-1:0],x[63:14]};
	assign ror18 = {x[18-1:0],x[63:18]};
	assign ror41 = {x[41-1:0],x[63:41]};
	assign result = ror14 ^ ror18 ^ ror41;

endmodule