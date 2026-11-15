module DataDelay(clk, in_data, out_data);

	parameter data_width = 8;
	parameter delay = 1;

	input clk;
	input[data_width - 1 : 0] in_data;
	output[data_width - 1 : 0] out_data;

	genvar i;
	generate
		for (i = 0; i < delay; i = i + 1) begin : pip
			reg[data_width - 1 : 0] tmp;
			if(i == 0) begin
				always @(posedge clk)
					tmp <= in_data;
			end else begin
				always @(posedge clk)
					tmp <= pip[i - 1].tmp;
			end
		end

		assign out_data = pip[delay - 1].tmp;

	endgenerate
	

endmodule