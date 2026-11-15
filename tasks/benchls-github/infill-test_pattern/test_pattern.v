module test_pattern (clk,aclr,ena,val);

parameter WIDTH = 16;
input clk,ena,aclr;
output [WIDTH-1:0] val;

reg [WIDTH-1:0] val /* synthesis preserve */;

[MASKED]

endmodule