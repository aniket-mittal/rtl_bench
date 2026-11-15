module tern_node (clk,a,b,c,o);
parameter WIDTH = 8;
input clk;
input [WIDTH-1:0] a;
input [WIDTH-1:0] b;
input [WIDTH-1:0] c;
output [WIDTH+2-1:0] o;
reg [WIDTH+2-1:0] o;

always @(posedge clk) begin
	o <= a+b+c;
end
endmodule