module flash_mp_data_region_sel (
	req_i,
	phase_i,
	addr_i,
	region_attrs_i,
	sel_cfg_o
);
	reg _sv2v_0;
	parameter signed [31:0] Regions = 4;
	input req_i;
	input wire [1:0] phase_i;
	localparam signed [31:0] flash_ctrl_reg_pkg_RegNumBanks = 2;
	localparam [31:0] flash_ctrl_pkg_NumBanks = flash_ctrl_reg_pkg_RegNumBanks;
	function automatic integer prim_util_pkg_vbits;
		input integer value;
		prim_util_pkg_vbits = (value == 1 ? 1 : $clog2(value));
	endfunction
	localparam signed [31:0] flash_ctrl_pkg_BankW = prim_util_pkg_vbits(flash_ctrl_pkg_NumBanks);
	localparam signed [31:0] flash_ctrl_reg_pkg_RegPagesPerBank = 256;
	localparam [31:0] flash_ctrl_pkg_PagesPerBank = flash_ctrl_reg_pkg_RegPagesPerBank;
	localparam signed [31:0] flash_ctrl_pkg_PageW = prim_util_pkg_vbits(flash_ctrl_pkg_PagesPerBank);
	localparam signed [31:0] flash_ctrl_pkg_AllPagesW = flash_ctrl_pkg_BankW + flash_ctrl_pkg_PageW;
	input [flash_ctrl_pkg_AllPagesW - 1:0] addr_i;
	localparam signed [31:0] prim_mubi_pkg_MuBi4Width = 4;
	input wire [(Regions * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) - 1:0] region_attrs_i;
	output reg [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18:0] sel_cfg_o;
	reg [flash_ctrl_pkg_AllPagesW:0] region_end [0:Regions - 1];
	reg [Regions - 1:0] region_match;
	wire [Regions - 1:0] region_sel;
	assign region_sel[0] = region_match[0];
	genvar _gv_i_2;
	generate
		for (_gv_i_2 = 1; _gv_i_2 < Regions; _gv_i_2 = _gv_i_2 + 1) begin : gen_region_priority
			localparam i = _gv_i_2;
			assign region_sel[i] = region_match[i] & ~|region_match[i - 1:0];
		end
	endgenerate
	function automatic [3:0] sv2v_cast_CFE33;
		input reg [3:0] inp;
		sv2v_cast_CFE33 = inp;
	endfunction
	function automatic prim_mubi_pkg_mubi4_test_true_strict;
		input reg [3:0] val;
		prim_mubi_pkg_mubi4_test_true_strict = sv2v_cast_CFE33(4'h6) == val;
	endfunction
	always @(*) begin
		if (_sv2v_0)
			;
		begin : sv2v_autoblock_1
			reg signed [31:0] i;
			for (i = 0; i < Regions; i = i + 1)
				begin : gen_region_comps
					region_end[i] = {1'b0, region_attrs_i[(((Regions - 1) - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) - 1) - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 0) : -10)-:9]} + region_attrs_i[(((Regions - 1) - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) - 1) - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 9) : 0)-:10];
					region_match[i] = ((((addr_i >= region_attrs_i[(((Regions - 1) - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) - 1) - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 0) : -10)-:9]) & ({1'b0, addr_i} < region_end[i])) & (phase_i == region_attrs_i[(((Regions - 1) - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 1)-:(((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 23 : 1 - ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22)) + 1) >= ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 23 : 1 - ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22)) + 0) ? (((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 1) - ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 0)) + 1 : (((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 0) - ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 1)) + 1)])) & prim_mubi_pkg_mubi4_test_true_strict(region_attrs_i[(((Regions - 1) - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) - 1) - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) - 28) : -43)-:4])) & req_i;
				end
		end
	end
	always @(*) begin
		if (_sv2v_0)
			;
		sel_cfg_o = 1'sb0;
		begin : sv2v_autoblock_2
			reg signed [31:0] i;
			for (i = 0; i < Regions; i = i + 1)
				begin : gen_region_sel
					if (region_sel[i])
						sel_cfg_o = region_attrs_i[(((Regions - 1) - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) - 1)-:(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18))];
				end
		end
	end
	initial _sv2v_0 = 0;
endmodule
