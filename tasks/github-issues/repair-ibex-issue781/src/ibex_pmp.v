module ibex_pmp (
	clk_i,
	rst_ni,
	csr_pmp_cfg_i,
	csr_pmp_addr_i,
	priv_mode_i,
	pmp_req_addr_i,
	pmp_req_type_i,
	pmp_req_err_o
);
	reg _sv2v_0;
	parameter [31:0] PMPGranularity = 0;
	parameter [31:0] PMPNumChan = 2;
	parameter [31:0] PMPNumRegions = 4;
	input wire clk_i;
	input wire rst_ni;
	input wire [(PMPNumRegions * 6) - 1:0] csr_pmp_cfg_i;
	input wire [(PMPNumRegions * 34) - 1:0] csr_pmp_addr_i;
	input wire [(PMPNumChan * 2) - 1:0] priv_mode_i;
	input wire [(PMPNumChan * 34) - 1:0] pmp_req_addr_i;
	input wire [(PMPNumChan * 2) - 1:0] pmp_req_type_i;
	output wire [0:PMPNumChan - 1] pmp_req_err_o;
	wire [33:0] region_start_addr [0:PMPNumRegions - 1];
	wire [33:PMPGranularity + 2] region_addr_mask [0:PMPNumRegions - 1];
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_match_high;
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_match_low;
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_match_both;
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_perm_check;
	reg [PMPNumChan - 1:0] access_fault;
	genvar _gv_r_1;
	generate
		for (_gv_r_1 = 0; _gv_r_1 < PMPNumRegions; _gv_r_1 = _gv_r_1 + 1) begin : g_addr_exp
			localparam r = _gv_r_1;
			if (r == 0) begin : g_entry0
				assign region_start_addr[r] = (csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 4-:2] == 2'b01 ? 34'h000000000 : csr_pmp_addr_i[((PMPNumRegions - 1) - r) * 34+:34]);
			end
			else begin : g_oth
				assign region_start_addr[r] = (csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 4-:2] == 2'b01 ? csr_pmp_addr_i[((PMPNumRegions - 1) - (r - 1)) * 34+:34] : csr_pmp_addr_i[((PMPNumRegions - 1) - r) * 34+:34]);
			end
			genvar _gv_b_2;
			for (_gv_b_2 = PMPGranularity + 2; _gv_b_2 < 34; _gv_b_2 = _gv_b_2 + 1) begin : g_bitmask
				localparam b = _gv_b_2;
				if (b == (PMPGranularity + 2)) begin : g_bit0
					assign region_addr_mask[r][b] = csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 4-:2] != 2'b11;
				end
				else begin : g_others
					assign region_addr_mask[r][b] = (csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 4-:2] != 2'b11) | ~&csr_pmp_addr_i[(((PMPNumRegions - 1) - r) * 34) + ((b - 1) >= (PMPGranularity + 2) ? b - 1 : ((b - 1) + ((b - 1) >= (PMPGranularity + 2) ? ((b - 1) - (PMPGranularity + 2)) + 1 : ((PMPGranularity + 2) - (b - 1)) + 1)) - 1)-:((b - 1) >= (PMPGranularity + 2) ? ((b - 1) - (PMPGranularity + 2)) + 1 : ((PMPGranularity + 2) - (b - 1)) + 1)];
				end
			end
		end
	endgenerate
	genvar _gv_c_1;
	generate
		for (_gv_c_1 = 0; _gv_c_1 < PMPNumChan; _gv_c_1 = _gv_c_1 + 1) begin : g_access_check
			localparam c = _gv_c_1;
			genvar _gv_r_2;
			for (_gv_r_2 = 0; _gv_r_2 < PMPNumRegions; _gv_r_2 = _gv_r_2 + 1) begin : g_regions
				localparam r = _gv_r_2;
				assign region_match_low[(c * PMPNumRegions) + r] = pmp_req_addr_i[(((PMPNumChan - 1) - c) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)] >= (region_start_addr[r][33:PMPGranularity + 2] & region_addr_mask[r]);
				assign region_match_high[(c * PMPNumRegions) + r] = pmp_req_addr_i[(((PMPNumChan - 1) - c) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)] <= csr_pmp_addr_i[(((PMPNumRegions - 1) - r) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)];
				assign region_match_both[(c * PMPNumRegions) + r] = (region_match_low[(c * PMPNumRegions) + r] & region_match_high[(c * PMPNumRegions) + r]) & (csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 4-:2] != 2'b00);
				assign region_perm_check[(c * PMPNumRegions) + r] = (((pmp_req_type_i[((PMPNumChan - 1) - c) * 2+:2] == 2'b00) & csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 2]) | ((pmp_req_type_i[((PMPNumChan - 1) - c) * 2+:2] == 2'b01) & csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 1])) | ((pmp_req_type_i[((PMPNumChan - 1) - c) * 2+:2] == 2'b10) & csr_pmp_cfg_i[((PMPNumRegions - 1) - r) * 6]);
			end
			always @(*) begin
				if (_sv2v_0)
					;
				access_fault[c] = priv_mode_i[((PMPNumChan - 1) - c) * 2+:2] != 2'b11;
				begin : sv2v_autoblock_1
					reg signed [31:0] r;
					for (r = PMPNumRegions - 1; r >= 0; r = r - 1)
						if (region_match_both[(c * PMPNumRegions) + r])
							access_fault[c] = (priv_mode_i[((PMPNumChan - 1) - c) * 2+:2] == 2'b11 ? csr_pmp_cfg_i[(((PMPNumRegions - 1) - r) * 6) + 5] & ~region_perm_check[(c * PMPNumRegions) + r] : ~region_perm_check[(c * PMPNumRegions) + r]);
				end
			end
			assign pmp_req_err_o[c] = access_fault[c];
		end
	endgenerate
	initial _sv2v_0 = 0;
endmodule
