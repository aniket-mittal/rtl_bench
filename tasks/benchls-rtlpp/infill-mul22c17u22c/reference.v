module mul22c17u22c (
	input [21:0] dix, 
	input [21:0] diy, 
	input [16:0] diz, 
	input iv, 
	output [21:0] dox, 
	output [21:0] doy, 
	output ov, 
	input clk
);
	reg [43:0] result_x, result_y;
	reg valid;
	always @ (posedge clk) begin
		if (iv) begin
			result_x <= dix * diz;
			result_y <= diy * diz;
			valid <= iv;
		end
	end
	assign dox = result_x[42:21];
	assign doy = result_y[42:21];
	assign ov = valid;
endmodule