module rtlpp_00506 (
	input wire			clk,
	input wire			clk_ena,

	input wire			init,
	output wire [31:0]	crc,

	input wire			in_valid,
	input wire  [1:0]	in_data,
	input wire			shift,
	output wire [1:0]	out_data
);

	reg  [31:0]		crc_reg;
	wire [31:0]		data0_crc_sig, data1_crc_sig;

	function [31:0] calc_crc32;
		input [31:0] crc;
		input data;
		calc_crc32 = {1'b0, crc[31:1]} ^ ((crc[0] ^ data)? 32'hedb88320 : 32'b0);
	endfunction

	assign data0_crc_sig = calc_crc32(crc_reg, in_data[0]);
	assign data1_crc_sig = calc_crc32(data0_crc_sig, in_data[1]);

	always @(posedge clk) begin
		if (clk_ena) begin
			if (init) begin
				crc_reg <= {32{1'b1}};
			end
			else if (in_valid) begin
				crc_reg <= data1_crc_sig;
			end
			else if (shift) begin
				crc_reg <= {2'b00, crc_reg[31:2]};
			end
		end
	end

	assign crc = crc_reg;
	assign out_data = ~crc_reg[1:0];

endmodule