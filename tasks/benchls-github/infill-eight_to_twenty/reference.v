module eight_to_twenty #(
	parameter WORD_LEN = 66
)
(
	input clk,arst,
	
	input [8*WORD_LEN-1:0] din, 
	input din_valid,
	output din_ready,
	
	output reg [20*WORD_LEN-1:0] dout,
	input dout_ready,
	output reg dout_valid		
);

// Possible states :
//	 0 : 20 out, no residue 
//   1 : holding 8 words
//   2 : holding 16 words
//   3 : 20 out, holding residue of 4
//   4 : holding 12 words
reg [4:0] state;

wire input_wait = din_ready & !din_valid;
wire output_wait = dout_valid & !dout_ready;
assign din_ready = !output_wait;

always @(posedge clk or posedge arst) begin
	if (arst) state <= 5'b1;
	else if (!input_wait & !output_wait)
		state <= {state [3:0],state[4]};
end

reg [4*WORD_LEN-1:0] surplus;
always @(posedge clk or posedge arst) begin
	if (arst) begin
		dout <= 0;
		dout_valid <= 0;
	end
	else begin
		if (!input_wait & !output_wait) begin
			if (state[0]) begin
				dout[8*WORD_LEN-1:0] <= din;
			end
			if (state[1]) begin
				dout[16*WORD_LEN-1:8*WORD_LEN] <= din;
			end
			if (state[2]) begin
				dout[20*WORD_LEN-1:16*WORD_LEN] <= din[4*WORD_LEN-1:0];
				surplus <= din[8*WORD_LEN-1:4*WORD_LEN];
				dout_valid <= 1'b1;
			end
			if (state[3]) begin
				dout[4*WORD_LEN-1:0] <= surplus;
				dout[12*WORD_LEN-1:4*WORD_LEN] <= din;
			end
			if (state[4]) begin
				dout[20*WORD_LEN-1:12*WORD_LEN] <= din;			
				dout_valid <= 1'b1;
			end
		end	
		
		if (dout_valid & dout_ready) dout_valid <= 1'b0;				
	end	
end
endmodule