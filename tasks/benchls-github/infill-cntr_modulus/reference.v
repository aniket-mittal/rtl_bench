module cntr_modulus (clk,ena,rst,sload,sdata,sclear,q);

parameter WIDTH = 16;
parameter MOD_VAL = 50223;

input clk,ena,rst,sload,sclear;
input [WIDTH-1:0] sdata;

output [WIDTH-1:0] q;
reg [WIDTH-1:0] q;

wire maxed = (q == MOD_VAL-1) /* synthesis keep */;

always @(posedge clk or posedge rst) begin
	if (rst) q <= 0;
	else begin
		if (ena) begin
			if (sclear) q <= 0;
			else if (sload) q <= sdata;
			else q <= (maxed ? 0 : q) + (maxed ? 0 : 1'b1);
		end
	end
end

endmodule