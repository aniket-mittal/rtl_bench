module twenty_to_eight #(
	parameter WORD_LEN = 66
)
(
	input clk,arst,
	
	input [20*WORD_LEN-1:0] din,
	input din_valid,
	output din_ready,
	
	output reg [8*WORD_LEN-1:0] dout,
	input dout_ready,
	output reg dout_valid
);

// Possible states :
//   0: holding 0, accept 20, 8 out
//   1: holding 12, no accept, 8 out
//   2: holding 4, accept 20, 8 out
//   3: holding 16, no accept, 8 out
//   4: holding 8, no accept, 8 out
reg [4:0] state;

wire din_wanted = state[0] | state[2];
wire input_wait = din_wanted & !din_valid;
wire output_wait = dout_valid & !dout_ready;
assign din_ready = din_wanted & !output_wait;

always @(posedge clk or posedge arst) begin
	if (arst) state <= 5'b1;
	else if (!input_wait & !output_wait) 
		state <= {state [3:0],state[4]};
end

reg [16*WORD_LEN-1:0] surplus;
always @(posedge clk or posedge arst) begin
	if (arst) begin
		dout <= 0;
		dout_valid <= 0;
	end
	else begin
		if (dout_valid & dout_ready) dout_valid <= 1'b0;		
		if (!input_wait & !output_wait) begin
			dout_valid <= 1'b1;
			if (state[0]) begin
				dout <= din[8*WORD_LEN-1:0];
				surplus <= din[20*WORD_LEN-1:8*WORD_LEN];				
			end
			if (state[1]) begin 
				dout <= surplus[8*WORD_LEN-1:0];
				surplus <= {{(12*WORD_LEN){1'b0}},surplus[12*WORD_LEN-1:8*WORD_LEN]};				
			end
			if (state[2]) begin
				dout[4*WORD_LEN-1:0] <= surplus[4*WORD_LEN-1:0];
				dout[8*WORD_LEN-1:4*WORD_LEN] <= din[4*WORD_LEN-1:0];
				surplus <= din[20*WORD_LEN-1:4*WORD_LEN];
			end
			if (state[3]) begin
				dout <= surplus[8*WORD_LEN-1:0];
				surplus <= {{(8*WORD_LEN){1'b0}},surplus[16*WORD_LEN-1:8*WORD_LEN]};
			end
			if (state[4]) begin
				dout <= surplus[8*WORD_LEN-1:0];
			end
		end
	end	
end
endmodule