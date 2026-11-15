module twenty_to_five #(
	parameter WORD_LEN = 66
)
(
	input clk,arst,
	
	input [20*WORD_LEN-1:0] din,
	input din_valid,
	output din_ready,
	
	output [5*WORD_LEN-1:0] dout,
	input dout_ready,
	output dout_valid
);

reg [2:0] holding;  // holding 0..4 blocks of 5 words
reg [20*WORD_LEN-1:0] storage;

assign din_ready = 
	(holding == 3'b0) || 
	((holding == 3'b1) && dout_ready);
assign dout_valid = 
	(|holding);
assign dout = storage[5*WORD_LEN-1:0];

always @(posedge clk or posedge arst) begin
	if (arst) begin
		storage <= 0;
		holding <= 0;
	end
	else begin
		if (din_ready & din_valid) begin
			// if we are reloading it goes to 4 blocks available
			storage <= din;
			holding <= 3'b100;
		end
		else begin
			// not reloading
			// if the output side is ready lose one block
			if (dout_valid & dout_ready) begin
				holding <= holding - 1'b1;
				storage <= {{(5*WORD_LEN){1'b0}},
						storage[20*WORD_LEN-1:5*WORD_LEN]}; 
			end
		end
	end
end

endmodule