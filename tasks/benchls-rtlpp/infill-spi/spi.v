module spi(rst,clk,req,din,cmd,J);
	input rst,clk;
	input [7:0] din;
	input req;
	input cmd;
	output reg [3:0] J;
	reg [1:0] state;
	reg [7:0] data_buffer;
	reg [3:0] counter;
	
	[MASKED]
endmodule