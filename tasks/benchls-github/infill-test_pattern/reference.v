module test_pattern (clk,aclr,ena,val);

parameter WIDTH = 16;
input clk,ena,aclr;
output [WIDTH-1:0] val;

reg [WIDTH-1:0] val /* synthesis preserve */;

always @(posedge clk or posedge aclr) begin
	if (aclr) val <= 0;
	else begin
		val <= val + (ena ? 43 : 0);
	end
end

endmodule