module DataWidthConvert(i, o);

	parameter data_width_in = 32;
	parameter data_width_out = 4;	

	input[data_width_in - 1 : 0] i;
	output[data_width_out - 1 : 0] o;

	generate
		if(data_width_in >= data_width_out) begin
			assign o = i[data_width_in - 1 : 0];
		end else begin 
			assign o = {{data_width_out - data_width_in{1'b0}} ,i};
		end
	endgenerate
endmodule