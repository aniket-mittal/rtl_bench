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

	always @(posedge Clk, posedge Reset)
	begin
		if (Reset) 
		begin
			state <= I;
			row <= 4'b1111;  	
			col <= 4'b1111;		  	
			i <= 4'b1111;
			j <= 4'b1111;			
		end
		else				
		begin
			case (state)	
				I:
				begin
					state <= SOLVE;
						
					row <= 0;
					col <= 0;
					i <= 0;
					j <= 0;
					puzzle[0][0] <= 5'd0; puzzle[0][1] <= 5'd5; puzzle[0][2] <= 5'd0; puzzle[0][3] <= 5'd3; puzzle[0][4] <= 5'd1; puzzle[0][5] <= 5'd4; puzzle[0][6] <= 5'd0; puzzle[0][7] <= 5'd6; puzzle[0][8] <= 5'd0;
					puzzle[1][0] <= 5'd8; puzzle[1][1] <= 5'd7; puzzle[1][2] <= 5'd0; puzzle[1][3] <= 5'd0; puzzle[1][4] <= 5'd0; puzzle[1][5] <= 5'd9; puzzle[1][6] <= 5'd4; puzzle[1][7] <= 5'd0; puzzle[1][8] <= 5'd3;
					puzzle[2][0] <= 5'd6; puzzle[2][1] <= 5'd4; puzzle[2][2] <= 5'd3; puzzle[2][3] <= 5'd5; puzzle[2][4] <= 5'd0; puzzle[2][5] <= 5'd7; puzzle[2][6] <= 5'd1; puzzle[2][7] <= 5'd9; puzzle[2][8] <= 5'd2;
					puzzle[3][0] <= 5'd0; puzzle[3][1] <= 5'd0; puzzle[3][2] <= 5'd7; puzzle[3][3] <= 5'd8; puzzle[3][4] <= 5'd0; puzzle[3][5] <= 5'd5; puzzle[3][6] <= 5'd2; puzzle[3][7] <= 5'd1; puzzle[3][8] <= 5'd0;
					puzzle[4][0] <= 5'd4; puzzle[4][1] <= 5'd1; puzzle[4][2] <= 5'd0; puzzle[4][3] <= 5'd9; puzzle[4][4] <= 5'd0; puzzle[4][5] <= 5'd0; puzzle[4][6] <= 5'd0; puzzle[4][7] <= 5'd0; puzzle[4][8] <= 5'd0;
					puzzle[5][0] <= 5'd0; puzzle[5][1] <= 5'd2; puzzle[5][2] <= 5'd5; puzzle[5][3] <= 5'd0; puzzle[5][4] <= 5'd6; puzzle[5][5] <= 5'd1; puzzle[5][6] <= 5'd9; puzzle[5][7] <= 5'd0; puzzle[5][8] <= 5'd7;
					puzzle[6][0] <= 5'd7; puzzle[6][1] <= 5'd9; puzzle[6][2] <= 5'd0; puzzle[6][3] <= 5'd2; puzzle[6][4] <= 5'd5; puzzle[6][5] <= 5'd0; puzzle[6][6] <= 5'd8; puzzle[6][7] <= 5'd4; puzzle[6][8] <= 5'd0;
					puzzle[7][0] <= 5'd0; puzzle[7][1] <= 5'd0; puzzle[7][2] <= 5'd4; puzzle[7][3] <= 5'd0; puzzle[7][4] <= 5'd9; puzzle[7][5] <= 5'd6; puzzle[7][6] <= 5'd0; puzzle[7][7] <= 5'd0; puzzle[7][8] <= 5'd5;
					puzzle[8][0] <= 5'd0; puzzle[8][1] <= 5'd3; puzzle[8][2] <= 5'd0; puzzle[8][3] <= 5'd1; puzzle[8][4] <= 5'd0; puzzle[8][5] <= 5'd8; puzzle[8][6] <= 5'd6; puzzle[8][7] <= 5'd7; puzzle[8][8] <= 5'd0;

					solu[0][0] <= 5'd2; solu[0][1] <= 5'd5; solu[0][2] <= 5'd9; solu[0][3] <= 5'd3; solu[0][4] <= 5'd1; solu[0][5] <= 5'd4; solu[0][6] <= 5'd7; solu[0][7] <= 5'd6; solu[0][8] <= 5'd8;
					solu[1][0] <= 5'd8; solu[1][1] <= 5'd7; solu[1][2] <= 5'd1; solu[1][3] <= 5'd6; solu[1][4] <= 5'd2; solu[1][5] <= 5'd9; solu[1][6] <= 5'd4; solu[1][7] <= 5'd5; solu[1][8] <= 5'd3;
					solu[2][0] <= 5'd6; solu[2][1] <= 5'd4; solu[2][2] <= 5'd3; solu[2][3] <= 5'd5; solu[2][4] <= 5'd8; solu[2][5] <= 5'd7; solu[2][6] <= 5'd1; solu[2][7] <= 5'd9; solu[2][8] <= 5'd2;
					solu[3][0] <= 5'd9; solu[3][1] <= 5'd6; solu[3][2] <= 5'd7; solu[3][3] <= 5'd8; solu[3][4] <= 5'd3; solu[3][5] <= 5'd5; solu[3][6] <= 5'd2; solu[3][7] <= 5'd1; solu[3][8] <= 5'd4;
					solu[4][0] <= 5'd4; solu[4][1] <= 5'd1; solu[4][2] <= 5'd8; solu[4][3] <= 5'd9; solu[4][4] <= 5'd7; solu[4][5] <= 5'd2; solu[4][6] <= 5'd5; solu[4][7] <= 5'd3; solu[4][8] <= 5'd6;
					solu[5][0] <= 5'd3; solu[5][1] <= 5'd2; solu[5][2] <= 5'd5; solu[5][3] <= 5'd4; solu[5][4] <= 5'd6; solu[5][5] <= 5'd1; solu[5][6] <= 5'd9; solu[5][7] <= 5'd8; solu[5][8] <= 5'd7;
					solu[6][0] <= 5'd7; solu[6][1] <= 5'd9; solu[6][2] <= 5'd6; solu[6][3] <= 5'd2; solu[6][4] <= 5'd5; solu[6][5] <= 5'd3; solu[6][6] <= 5'd8; solu[6][7] <= 5'd4; solu[6][8] <= 5'd1;
					solu[7][0] <= 5'd1; solu[7][1] <= 5'd8; solu[7][2] <= 5'd4; solu[7][3] <= 5'd7; solu[7][4] <= 5'd9; solu[7][5] <= 5'd6; solu[7][6] <= 5'd3; solu[7][7] <= 5'd2; solu[7][8] <= 5'd5;
					solu[8][0] <= 5'd5; solu[8][1] <= 5'd3; solu[8][2] <= 5'd2; solu[8][3] <= 5'd1; solu[8][4] <= 5'd4; solu[8][5] <= 5'd8; solu[8][6] <= 5'd6; solu[8][7] <= 5'd7; solu[8][8] <= 5'd9;
				end		
				SOLVE: 
				begin
					if (CheckSolu)
					begin
						state <= CHECK;
						i <= 0;
						j <= 0;
					end
					else if (R && col != 8) 
					begin
						col <= col + 1;
						i <= col + 1;
					end
					else if (L && col != 0) 
					begin
						col <= col - 1;
						i <= col - 1;
					end
					else if (U && row != 0) 
					begin
						row <= row - 1;
						j <= row - 1;
					end
					else if (D && row != 8) 
					begin
						row <= row + 1;
						j <= row + 1;
					end
					else if (C) 
					begin
						puzzle[row][col] <= userIn;
					end
				end
				CHECK:
				begin
					if (i == 8 && j == 8 && puzzle[i][j] == solu[i][j])
					begin
						state <= CORRECT;
					end
					else if (puzzle[i][j] != solu[i][j])
					begin
						state <= INCORRECT;
					end

					puzzle_ij <= puzzle[i][j];
					solu_ij <= solu[i][j];
					j <= j + 1;

					if (j == 8)
					begin
						j <= 0;
						i <= i + 1;		
					end
				end
				CORRECT:
				begin
					if (Ack)
					begin
						state <= I;
					end
				end
				INCORRECT:
				begin
					if (Ack)
					begin
						state <= I;
					end
				end
				default:		
					state <= UNK;
			endcase
		end
	end
endmodule