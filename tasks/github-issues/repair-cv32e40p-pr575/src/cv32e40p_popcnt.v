module cv32e40p_popcnt (
	in_i,
	result_o
);
	input wire [31:0] in_i;
	output wire [5:0] result_o;
	wire [31:0] cnt_l1;
	wire [23:0] cnt_l2;
	wire [15:0] cnt_l3;
	wire [9:0] cnt_l4;
	genvar _gv_l_2;
	genvar _gv_m_2;
	genvar _gv_n_1;
	genvar _gv_p_1;
	generate
		for (_gv_l_2 = 0; _gv_l_2 < 16; _gv_l_2 = _gv_l_2 + 1) begin : genblk1
			localparam l = _gv_l_2;
			assign cnt_l1[l * 2+:2] = {1'b0, in_i[2 * l]} + {1'b0, in_i[(2 * l) + 1]};
		end
		for (_gv_m_2 = 0; _gv_m_2 < 8; _gv_m_2 = _gv_m_2 + 1) begin : genblk2
			localparam m = _gv_m_2;
			assign cnt_l2[m * 3+:3] = {1'b0, cnt_l1[(2 * m) * 2+:2]} + {1'b0, cnt_l1[((2 * m) + 1) * 2+:2]};
		end
		for (_gv_n_1 = 0; _gv_n_1 < 4; _gv_n_1 = _gv_n_1 + 1) begin : genblk3
			localparam n = _gv_n_1;
			assign cnt_l3[n * 4+:4] = {1'b0, cnt_l2[(2 * n) * 3+:3]} + {1'b0, cnt_l2[((2 * n) + 1) * 3+:3]};
		end
		for (_gv_p_1 = 0; _gv_p_1 < 2; _gv_p_1 = _gv_p_1 + 1) begin : genblk4
			localparam p = _gv_p_1;
			assign cnt_l4[p * 5+:5] = {1'b0, cnt_l3[(2 * p) * 4+:4]} + {1'b0, cnt_l3[((2 * p) + 1) * 4+:4]};
		end
	endgenerate
	assign result_o = {1'b0, cnt_l4[0+:5]} + {1'b0, cnt_l4[5+:5]};
endmodule
