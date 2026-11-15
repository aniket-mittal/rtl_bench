module ibex_register_file (
	clk_i,
	rst_ni,
	test_en_i,
	raddr_a_i,
	rdata_a_o,
	raddr_b_i,
	rdata_b_o,
	waddr_a_i,
	wdata_a_i,
	we_a_i
);
	reg _sv2v_0;
	parameter [0:0] RV32E = 0;
	parameter [31:0] DataWidth = 32;
	input wire clk_i;
	input wire rst_ni;
	input wire test_en_i;
	input wire [4:0] raddr_a_i;
	output wire [DataWidth - 1:0] rdata_a_o;
	input wire [4:0] raddr_b_i;
	output wire [DataWidth - 1:0] rdata_b_o;
	input wire [4:0] waddr_a_i;
	input wire [DataWidth - 1:0] wdata_a_i;
	input wire we_a_i;
	localparam [31:0] ADDR_WIDTH = (RV32E ? 4 : 5);
	localparam [31:0] NUM_WORDS = 2 ** ADDR_WIDTH;
	wire [(NUM_WORDS * DataWidth) - 1:0] rf_reg;
	reg [((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) * DataWidth) + (DataWidth - 1) : ((3 - NUM_WORDS) * DataWidth) + (((NUM_WORDS - 1) * DataWidth) - 1)):((NUM_WORDS - 1) >= 1 ? DataWidth : (NUM_WORDS - 1) * DataWidth)] rf_reg_tmp;
	reg [NUM_WORDS - 1:1] we_a_dec;
	function automatic [4:0] sv2v_cast_5;
		input reg [4:0] inp;
		sv2v_cast_5 = inp;
	endfunction
	always @(*) begin : we_a_decoder
		if (_sv2v_0)
			;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1; i < NUM_WORDS; i = i + 1)
				we_a_dec[i] = (waddr_a_i == sv2v_cast_5(i) ? we_a_i : 1'b0);
		end
	end
	function automatic [DataWidth - 1:0] sv2v_cast_1659F;
		input reg [DataWidth - 1:0] inp;
		sv2v_cast_1659F = inp;
	endfunction
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			rf_reg_tmp <= {((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) {sv2v_cast_1659F(1'sb0)}};
		else begin : sv2v_autoblock_2
			reg signed [31:0] r;
			for (r = 1; r < NUM_WORDS; r = r + 1)
				if (we_a_dec[r])
					rf_reg_tmp[((NUM_WORDS - 1) >= 1 ? r : 1 - (r - (NUM_WORDS - 1))) * DataWidth+:DataWidth] <= wdata_a_i;
		end
	assign rf_reg[0+:DataWidth] = 1'sb0;
	assign rf_reg[DataWidth * (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1) - (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) - 1))+:DataWidth * ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)] = rf_reg_tmp[DataWidth * ((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1) - (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) - 1) : ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1)) : 1 - (((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1) - (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) - 1) : ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1)) - (NUM_WORDS - 1)))+:DataWidth * ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)];
	assign rdata_a_o = rf_reg[raddr_a_i * DataWidth+:DataWidth];
	assign rdata_b_o = rf_reg[raddr_b_i * DataWidth+:DataWidth];
	initial _sv2v_0 = 0;
endmodule
