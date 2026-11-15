module part3(SW, KEY, LEDR, LEDG);
	input [17:0] SW;
	input [2:0] KEY; 
	output [17:0] LEDR;
	output reg [2:0] LEDG;
	assign  LEDR = SW;

	[MASKED]
endmodule