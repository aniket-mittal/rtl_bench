module otbn_rf_base_ff (
	clk_i,
	rst_ni,
	wr_addr_i,
	wr_en_i,
	wr_data_i,
	rd_addr_a_i,
	rd_data_a_o,
	rd_addr_b_i,
	rd_data_b_o,
	we_err_o
);
	localparam signed [31:0] otbn_pkg_BaseIntgWidth = 39;
	parameter [38:0] WordZeroVal = 1'sb0;
	input wire clk_i;
	input wire rst_ni;
	input wire [4:0] wr_addr_i;
	input wire wr_en_i;
	input wire [38:0] wr_data_i;
	input wire [4:0] rd_addr_a_i;
	output wire [38:0] rd_data_a_o;
	input wire [4:0] rd_addr_b_i;
	output wire [38:0] rd_data_b_o;
	output reg we_err_o;
	localparam signed [31:0] otbn_pkg_GprAw = 5;
	localparam signed [31:0] otbn_pkg_NGpr = 32;
	wire [38:0] rf_reg [0:31];
	wire [31:0] we_onehot;
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < otbn_pkg_NGpr; _gv_i_1 = _gv_i_1 + 1) begin : g_we_onehot
			localparam i = _gv_i_1;
			assign we_onehot[i] = (wr_addr_i == i) && wr_en_i;
		end
	endgenerate
	assign rf_reg[0] = WordZeroVal;
	genvar _gv_i_2;
	generate
		for (_gv_i_2 = 1; _gv_i_2 < otbn_pkg_NGpr; _gv_i_2 = _gv_i_2 + 1) begin : g_rf_flops
			localparam i = _gv_i_2;
			reg [38:0] rf_reg_q;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					rf_reg_q <= WordZeroVal;
				else if (we_onehot[i])
					rf_reg_q <= wr_data_i;
			assign rf_reg[i] = rf_reg_q;
		end
	endgenerate
	assign rd_data_a_o = rf_reg[rd_addr_a_i];
	assign rd_data_b_o = rf_reg[rd_addr_b_i];
	wire [31:0] we_onehot_buf;
	prim_buf #(.Width(32)) u_prim_buf(
		.in_i(we_onehot),
		.out_o(we_onehot_buf)
	);
	wire we_err;
	prim_onehot_check #(
		.AddrWidth(5),
		.AddrCheck(1),
		.EnableCheck(1)
	) u_prim_onehot_check(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.oh_i(we_onehot_buf),
		.addr_i(wr_addr_i),
		.en_i(wr_en_i),
		.err_o(we_err)
	);
	always @(posedge clk_i or negedge rst_ni) begin : p_err
		if (!rst_ni)
			we_err_o <= 1'sb0;
		else
			we_err_o <= we_err;
	end
endmodule
