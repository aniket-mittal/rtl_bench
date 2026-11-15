module rtlpp_07229(
    Clk, R, L, U, D, C, Reset, Ack, CheckSolu, userIn, 
    q_I, q_Solve, q_Check, q_Correct, q_Incorrect,
    i, j, row, col, puzzle_ij, solu_ij, disp_i, disp_j, disp_value
);
	
	input Clk, R, L, U, D, C; 
	input Reset, CheckSolu, Ack;
	input [4:0] userIn;
	
	reg [4:0] puzzle [0:8][0:8];	
	reg [4:0] solu [0:8][0:8];

	output reg [3:0] row, col;
	output reg [4:0] i, j;
	output reg [4:0] puzzle_ij, solu_ij;
	output q_I, q_Solve, q_Check, q_Correct, q_Incorrect;
	reg [4:0] state;	
	assign {q_Incorrect, q_Correct, q_Check, q_Solve, q_I} = state;
	
	input [4:0] disp_i, disp_j;
	output [4:0] disp_value;
	assign disp_value = puzzle[disp_i][disp_j];
	
	localparam I = 5'b00001, SOLVE = 5'b00010, CHECK = 5'b00100, CORRECT = 5'b01000, INCORRECT = 5'b10000, UNK = 5'bXXXXX;

	[MASKED]
endmodule