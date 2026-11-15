module cv32e40p_ff_one (
	in_i,
	first_one_o,
	no_ones_o
);
	parameter LEN = 32;
	input wire [LEN - 1:0] in_i;
	output wire [$clog2(LEN) - 1:0] first_one_o;
	output wire no_ones_o;
	localparam NUM_LEVELS = $clog2(LEN);
	wire [(LEN * NUM_LEVELS) - 1:0] index_lut;
	wire [(2 ** NUM_LEVELS) - 1:0] sel_nodes;
	wire [((2 ** NUM_LEVELS) * NUM_LEVELS) - 1:0] index_nodes;
	genvar _gv_j_3;
	generate
		for (_gv_j_3 = 0; _gv_j_3 < LEN; _gv_j_3 = _gv_j_3 + 1) begin : genblk1
			localparam j = _gv_j_3;
			assign index_lut[j * NUM_LEVELS+:NUM_LEVELS] = $unsigned(j);
		end
	endgenerate
	genvar _gv_k_2;
	genvar _gv_l_1;
	genvar _gv_level_1;
	generate
		for (_gv_level_1 = 0; _gv_level_1 < NUM_LEVELS; _gv_level_1 = _gv_level_1 + 1) begin : genblk2
			localparam level = _gv_level_1;
			if (level < (NUM_LEVELS - 1)) begin : genblk1
				for (_gv_l_1 = 0; _gv_l_1 < (2 ** level); _gv_l_1 = _gv_l_1 + 1) begin : genblk1
					localparam l = _gv_l_1;
					assign sel_nodes[((2 ** level) - 1) + l] = sel_nodes[((2 ** (level + 1)) - 1) + (l * 2)] | sel_nodes[(((2 ** (level + 1)) - 1) + (l * 2)) + 1];
					assign index_nodes[(((2 ** level) - 1) + l) * NUM_LEVELS+:NUM_LEVELS] = (sel_nodes[((2 ** (level + 1)) - 1) + (l * 2)] == 1'b1 ? index_nodes[(((2 ** (level + 1)) - 1) + (l * 2)) * NUM_LEVELS+:NUM_LEVELS] : index_nodes[((((2 ** (level + 1)) - 1) + (l * 2)) + 1) * NUM_LEVELS+:NUM_LEVELS]);
				end
			end
			if (level == (NUM_LEVELS - 1)) begin : genblk2
				for (_gv_k_2 = 0; _gv_k_2 < (2 ** level); _gv_k_2 = _gv_k_2 + 1) begin : genblk1
					localparam k = _gv_k_2;
					if ((k * 2) < (LEN - 1)) begin : genblk1
						assign sel_nodes[((2 ** level) - 1) + k] = in_i[k * 2] | in_i[(k * 2) + 1];
						assign index_nodes[(((2 ** level) - 1) + k) * NUM_LEVELS+:NUM_LEVELS] = (in_i[k * 2] == 1'b1 ? index_lut[(k * 2) * NUM_LEVELS+:NUM_LEVELS] : index_lut[((k * 2) + 1) * NUM_LEVELS+:NUM_LEVELS]);
					end
					if ((k * 2) == (LEN - 1)) begin : genblk2
						assign sel_nodes[((2 ** level) - 1) + k] = in_i[k * 2];
						assign index_nodes[(((2 ** level) - 1) + k) * NUM_LEVELS+:NUM_LEVELS] = index_lut[(k * 2) * NUM_LEVELS+:NUM_LEVELS];
					end
					if ((k * 2) > (LEN - 1)) begin : genblk3
						assign sel_nodes[((2 ** level) - 1) + k] = 1'b0;
						assign index_nodes[(((2 ** level) - 1) + k) * NUM_LEVELS+:NUM_LEVELS] = 1'sb0;
					end
				end
			end
		end
	endgenerate
	assign first_one_o = index_nodes[0+:NUM_LEVELS];
	assign no_ones_o = ~sel_nodes[0];
endmodule
