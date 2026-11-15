module rtlpp_03349(
	input [4:0] selector,
	input [31:0] data_input,
	output reg selected_output );

	always @( * )
	begin
		case ( selector )
			5'b00000: selected_output = data_input[0];
			5'b00001: selected_output = data_input[1];
			5'b00010: selected_output = data_input[2];
			5'b00011: selected_output = data_input[3];
			5'b00100: selected_output = data_input[4];
			5'b00101: selected_output = data_input[5];
			5'b00110: selected_output = data_input[6];
			5'b00111: selected_output = data_input[7];
			5'b01000: selected_output = data_input[8];
			5'b01001: selected_output = data_input[9];
			5'b01010: selected_output = data_input[10];
			5'b01011: selected_output = data_input[11];
			5'b01100: selected_output = data_input[12];
			5'b01101: selected_output = data_input[13];
			5'b01110: selected_output = data_input[14];
			5'b01111: selected_output = data_input[15];
			5'b10000: selected_output = data_input[16];
			5'b10001: selected_output = data_input[17];
			5'b10010: selected_output = data_input[18];
			5'b10011: selected_output = data_input[19];
			5'b10100: selected_output = data_input[20];
			5'b10101: selected_output = data_input[21];
			5'b10110: selected_output = data_input[22];
			5'b10111: selected_output = data_input[23];
			5'b11000: selected_output = data_input[24];
			5'b11001: selected_output = data_input[25];
			5'b11010: selected_output = data_input[26];
			5'b11011: selected_output = data_input[27];
			5'b11100: selected_output = data_input[28];
			5'b11101: selected_output = data_input[29];
			5'b11110: selected_output = data_input[30];
			5'b11111: selected_output = data_input[31];
		endcase
	end
endmodule