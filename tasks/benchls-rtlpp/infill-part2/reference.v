module part2 (SW, LEDR);
	input [16:0] SW;
	output [7:0] LEDR;

	wire [7:0] m;

	assign m[0] = ( SW[15] & ~SW[0] & ~SW[8]) | (~SW[15] & SW[0]) ;
	assign m[1] = ( SW[15] & ~SW[1] & ~SW[9]) | (~SW[15] & SW[1]) ;
	assign m[2] = ( SW[15] & ~SW[2] & ~SW[10]) | (~SW[15] & SW[2]) ;
	assign m[3] = ( SW[15] & ~SW[3] & ~SW[11]) | (~SW[15] & SW[3]) ;
	assign m[4] = ( SW[15] & ~SW[4] & ~SW[12]) | (~SW[15] & SW[4]) ;
	assign m[5] = ( SW[15] & ~SW[5] & ~SW[13]) | (~SW[15] & SW[5]) ;
	assign m[6] = ( SW[15] & ~SW[6] & ~SW[14]) | (~SW[15] & SW[6]) ;
	assign m[7] = ( SW[15] & ~SW[7] & ~SW[15]) | (~SW[15] & SW[7]) ;

	assign LEDR = m;
endmodule