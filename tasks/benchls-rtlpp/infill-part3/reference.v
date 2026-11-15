module part3(SW, KEY, LEDR, LEDG);
	input [17:0] SW;
	input [2:0] KEY; 
	output [17:0] LEDR;
	output reg [2:0] LEDG;
	assign  LEDR = SW;

	always@(*)
	begin
		case(KEY)
			3'b000: LEDG = SW[17:15];
			3'b001: LEDG = SW[14:12];
			3'b010: LEDG = SW[11:9];
			3'b011: LEDG = SW[8:6];
			3'b100: LEDG = SW[5:3];
			3'b101: LEDG = SW[2:0];
			default: LEDG = 3'b000;
		endcase
	end
endmodule