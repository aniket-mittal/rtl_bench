module flash_mp (
	clk_i,
	rst_ni,
	flash_disable_i,
	if_sel_i,
	region_cfgs_i,
	bank_cfgs_i,
	info_page_cfgs_i,
	erase_suspend_i,
	erase_suspend_done_o,
	req_i,
	phase_i,
	req_addr_i,
	req_part_i,
	info_sel_i,
	addr_ovfl_i,
	rd_i,
	prog_i,
	pg_erase_i,
	bk_erase_i,
	rd_done_o,
	prog_done_o,
	erase_done_o,
	error_o,
	req_o,
	rd_o,
	prog_o,
	scramble_en_o,
	ecc_en_o,
	he_en_o,
	pg_erase_o,
	bk_erase_o,
	erase_suspend_o,
	rd_done_i,
	prog_done_i,
	erase_done_i
);
	reg _sv2v_0;
	input clk_i;
	input rst_ni;
	localparam signed [31:0] prim_mubi_pkg_MuBi4Width = 4;
	input wire [3:0] flash_disable_i;
	input wire [1:0] if_sel_i;
	localparam signed [31:0] flash_ctrl_pkg_MpRegions = 8;
	input wire [(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (9 * (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19)) - 1 : (9 * (1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18))) + (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 17)):(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? 0 : ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)] region_cfgs_i;
	localparam signed [31:0] flash_ctrl_reg_pkg_RegNumBanks = 2;
	localparam [31:0] flash_ctrl_pkg_NumBanks = flash_ctrl_reg_pkg_RegNumBanks;
	input wire [1:0] bank_cfgs_i;
	localparam signed [31:0] flash_ctrl_reg_pkg_NumInfoTypes = 3;
	localparam signed [31:0] flash_ctrl_pkg_InfoTypes = flash_ctrl_reg_pkg_NumInfoTypes;
	function automatic integer flash_ctrl_pkg_max_info_pages;
		input reg signed [95:0] infos;
		reg signed [31:0] current_max;
		begin
			current_max = 0;
			begin : sv2v_autoblock_1
				reg signed [31:0] i;
				for (i = 0; i < flash_ctrl_pkg_InfoTypes; i = i + 1)
					if (infos[(2 - i) * 32+:32] > current_max)
						current_max = infos[(2 - i) * 32+:32];
			end
			flash_ctrl_pkg_max_info_pages = current_max;
		end
	endfunction
	localparam signed [31:0] flash_ctrl_pkg_InfosPerBank = flash_ctrl_pkg_max_info_pages(96'h0000000a0000000100000002);
	input wire [(((flash_ctrl_pkg_NumBanks * flash_ctrl_pkg_InfoTypes) * flash_ctrl_pkg_InfosPerBank) * ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width)) - 1:0] info_page_cfgs_i;
	input erase_suspend_i;
	output wire erase_suspend_done_o;
	input req_i;
	input wire [1:0] phase_i;
	function automatic integer prim_util_pkg_vbits;
		input integer value;
		prim_util_pkg_vbits = (value == 1 ? 1 : $clog2(value));
	endfunction
	localparam signed [31:0] flash_ctrl_pkg_BankW = prim_util_pkg_vbits(flash_ctrl_pkg_NumBanks);
	localparam signed [31:0] flash_ctrl_reg_pkg_RegPagesPerBank = 256;
	localparam [31:0] flash_ctrl_pkg_PagesPerBank = flash_ctrl_reg_pkg_RegPagesPerBank;
	localparam signed [31:0] flash_ctrl_pkg_PageW = prim_util_pkg_vbits(flash_ctrl_pkg_PagesPerBank);
	localparam signed [31:0] flash_ctrl_pkg_AllPagesW = flash_ctrl_pkg_BankW + flash_ctrl_pkg_PageW;
	input [flash_ctrl_pkg_AllPagesW - 1:0] req_addr_i;
	input wire req_part_i;
	localparam signed [31:0] flash_ctrl_pkg_InfoTypesWidth = prim_util_pkg_vbits(flash_ctrl_pkg_InfoTypes);
	input [flash_ctrl_pkg_InfoTypesWidth - 1:0] info_sel_i;
	input addr_ovfl_i;
	input rd_i;
	input prog_i;
	input pg_erase_i;
	input bk_erase_i;
	output wire rd_done_o;
	output wire prog_done_o;
	output wire erase_done_o;
	output wire error_o;
	output wire req_o;
	output wire rd_o;
	output wire prog_o;
	output wire scramble_en_o;
	output wire ecc_en_o;
	output wire he_en_o;
	output wire pg_erase_o;
	output wire bk_erase_o;
	output wire erase_suspend_o;
	input rd_done_i;
	input prog_done_i;
	input erase_done_i;
	localparam signed [31:0] TotalRegions = 9;
	wire [flash_ctrl_pkg_AllPagesW - 1:0] bank_page_addr;
	wire [flash_ctrl_pkg_BankW - 1:0] bank_addr;
	wire [flash_ctrl_pkg_PageW - 1:0] page_addr;
	assign bank_page_addr = req_addr_i;
	assign bank_addr = req_addr_i[flash_ctrl_pkg_AllPagesW - 1-:flash_ctrl_pkg_BankW];
	assign page_addr = req_addr_i[flash_ctrl_pkg_PageW - 1:0];
	reg [1:0] bk_erase_en;
	wire data_rd_en;
	wire data_prog_en;
	wire data_pg_erase_en;
	wire data_bk_erase_en;
	wire data_scramble_en;
	wire data_ecc_en;
	wire data_he_en;
	wire info_rd_en;
	wire info_prog_en;
	wire info_pg_erase_en;
	wire info_bk_erase_en;
	wire info_scramble_en;
	wire info_ecc_en;
	wire info_he_en;
	wire hw_sel;
	assign hw_sel = if_sel_i == 2'd2;
	wire data_part_sel;
	wire info_part_sel;
	assign data_part_sel = req_part_i == 1'b0;
	assign info_part_sel = req_part_i == 1'b1;
	wire addr_invalid;
	wire bank_invalid;
	wire [flash_ctrl_pkg_PageW - 1:0] end_addr;
	generate
		if (1) begin : gen_no_bank_check
			wire [flash_ctrl_pkg_BankW - 1:0] unused_bank_addr;
			assign unused_bank_addr = bank_addr;
			assign bank_invalid = 1'sb0;
		end
	endgenerate
	function automatic [flash_ctrl_pkg_PageW - 1:0] sv2v_cast_A51FF;
		input reg [flash_ctrl_pkg_PageW - 1:0] inp;
		sv2v_cast_A51FF = inp;
	endfunction
	localparam [flash_ctrl_pkg_PageW - 1:0] flash_ctrl_pkg_DataPartitionEndAddr = sv2v_cast_A51FF(255);
	localparam signed [95:0] flash_ctrl_pkg_InfoTypeSize = 96'h0000000a0000000100000002;
	localparam [(flash_ctrl_pkg_InfoTypes * flash_ctrl_pkg_PageW) - 1:0] flash_ctrl_pkg_InfoPartitionEndAddr = {sv2v_cast_A51FF(flash_ctrl_pkg_InfoTypeSize[64+:32] - 1), sv2v_cast_A51FF(flash_ctrl_pkg_InfoTypeSize[32+:32] - 1), sv2v_cast_A51FF(flash_ctrl_pkg_InfoTypeSize[0+:32] - 1)};
	assign end_addr = (data_part_sel ? flash_ctrl_pkg_DataPartitionEndAddr : flash_ctrl_pkg_InfoPartitionEndAddr[(2 - info_sel_i) * flash_ctrl_pkg_PageW+:flash_ctrl_pkg_PageW]);
	assign addr_invalid = req_i & (((page_addr > end_addr) | bank_invalid) | addr_ovfl_i);
	wire invalid_data_txn;
	wire [(9 * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) - 1:0] sw_data_attrs;
	wire [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18:0] sw_sel_cfg;
	wire [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18:0] hw_sel_cfg;
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < TotalRegions; _gv_i_1 = _gv_i_1 + 1) begin : gen_region_attrs
			localparam i = _gv_i_1;
			assign sw_data_attrs[((8 - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 1)-:(((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 23 : 1 - ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22)) + 1) >= ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 23 : 1 - ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22)) + 0) ? (((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 1) - ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 0)) + 1 : (((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 0) - ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) + 1)) + 1)] = 2'd3;
			assign sw_data_attrs[((8 - i) * (2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))) + ((((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)) - 1)-:(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18))] = region_cfgs_i[(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? 0 : ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18) + (i * (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18)))+:(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18))];
		end
	endgenerate
	flash_mp_data_region_sel #(.Regions(TotalRegions)) u_sw_sel(
		.req_i(req_i & ~hw_sel),
		.phase_i(2'd3),
		.addr_i(bank_page_addr),
		.region_attrs_i(sw_data_attrs),
		.sel_cfg_o(sw_sel_cfg)
	);
	localparam signed [31:0] flash_ctrl_pkg_HwDataRules = 1;
	function automatic [3:0] sv2v_cast_CFE33;
		input reg [3:0] inp;
		sv2v_cast_CFE33 = inp;
	endfunction
	function automatic [9:0] sv2v_cast_10;
		input reg [9:0] inp;
		sv2v_cast_10 = inp;
	endfunction
	function automatic [(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 23 : 1 - ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22)) - 1:0] sv2v_cast_90E2D;
		input reg [(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? (((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 23 : 1 - ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22)) - 1:0] inp;
		sv2v_cast_90E2D = inp;
	endfunction
	localparam [(2 + (((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 22) >= 0 ? ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 19 : 1 - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18))) - 1:0] flash_ctrl_pkg_HwDataAttr = {2'd1, sv2v_cast_90E2D({sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), 9'b000000000, sv2v_cast_10(flash_ctrl_pkg_NumBanks * flash_ctrl_pkg_PagesPerBank)})};
	flash_mp_data_region_sel #(.Regions(flash_ctrl_pkg_HwDataRules)) u_hw_sel(
		.req_i(req_i & hw_sel),
		.phase_i(phase_i),
		.addr_i(bank_page_addr),
		.region_attrs_i(flash_ctrl_pkg_HwDataAttr),
		.sel_cfg_o(hw_sel_cfg)
	);
	wire [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 18:0] data_region_cfg;
	assign data_region_cfg = (hw_sel ? hw_sel_cfg : sw_sel_cfg);
	wire [31:0] unused_region_base;
	wire [31:0] unused_region_size;
	function automatic [31:0] sv2v_cast_32;
		input reg [31:0] inp;
		sv2v_cast_32 = inp;
	endfunction
	assign unused_region_base = sv2v_cast_32(data_region_cfg[18-:9]);
	assign unused_region_size = sv2v_cast_32(data_region_cfg[9-:10]);
	always @(*) begin
		if (_sv2v_0)
			;
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 0; i < flash_ctrl_pkg_NumBanks; i = i + 1)
				begin : bank_comps
					bk_erase_en[i] = ((bank_addr == i[flash_ctrl_pkg_BankW - 1:0]) & bank_cfgs_i[i]) & ~hw_sel;
				end
		end
	end
	wire data_en;
	function automatic prim_mubi_pkg_mubi4_test_true_strict;
		input reg [3:0] val;
		prim_mubi_pkg_mubi4_test_true_strict = sv2v_cast_CFE33(4'h6) == val;
	endfunction
	assign data_en = (data_part_sel & ~addr_invalid) & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[46-:4]);
	assign data_rd_en = (data_en & rd_i) & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[42-:4]);
	assign data_prog_en = (data_en & prog_i) & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[38-:4]);
	assign data_pg_erase_en = (data_en & pg_erase_i) & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[34-:4]);
	assign data_bk_erase_en = bk_erase_i & |bk_erase_en;
	assign data_scramble_en = (data_en & (rd_i | prog_i)) & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[30-:4]);
	assign data_ecc_en = (data_en & (rd_i | prog_i)) & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[26-:4]);
	assign data_he_en = data_en & prim_mubi_pkg_mubi4_test_true_strict(data_region_cfg[22-:4]);
	assign invalid_data_txn = (req_i & data_part_sel) & ~(((data_rd_en | data_prog_en) | data_pg_erase_en) | data_bk_erase_en);
	reg [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) - 1:0] hw_page_cfg;
	localparam signed [31:0] flash_ctrl_pkg_HwInfoRules = 5;
	reg [4:0] unused_rule_match;
	localparam signed [31:0] flash_ctrl_pkg_InfoPageW = prim_util_pkg_vbits(flash_ctrl_pkg_InfosPerBank);
	wire [flash_ctrl_pkg_InfoPageW - 1:0] info_page_addr;
	wire [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) - 1:0] page_cfg;
	wire info_en;
	wire invalid_info_txn;
	localparam [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) - 1:0] flash_ctrl_pkg_CfgAllowRead = {sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h9), sv2v_cast_CFE33(4'h9), sv2v_cast_CFE33(4'h9), sv2v_cast_CFE33(4'h9), sv2v_cast_CFE33(4'h6)};
	localparam [((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) - 1:0] flash_ctrl_pkg_CfgAllowReadProgErase = {sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6), sv2v_cast_CFE33(4'h6)};
	localparam [0:0] flash_ctrl_pkg_CreatorSeedIdx = 0;
	localparam [flash_ctrl_pkg_PageW - 1:0] flash_ctrl_pkg_IsolatedInfoPage = 3;
	localparam [flash_ctrl_pkg_BankW - 1:0] flash_ctrl_pkg_SeedBank = 0;
	localparam [flash_ctrl_pkg_InfoTypesWidth - 1:0] flash_ctrl_pkg_SeedInfoSel = 0;
	function automatic [flash_ctrl_pkg_InfoTypesWidth - 1:0] sv2v_cast_2788C;
		input reg [flash_ctrl_pkg_InfoTypesWidth - 1:0] inp;
		sv2v_cast_2788C = inp;
	endfunction
	function automatic [flash_ctrl_pkg_AllPagesW - 1:0] sv2v_cast_D3E47;
		input reg [flash_ctrl_pkg_AllPagesW - 1:0] inp;
		sv2v_cast_D3E47 = inp;
	endfunction
	localparam [(flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) - 1:0] flash_ctrl_pkg_IsolatedPageSel = {sv2v_cast_2788C(flash_ctrl_pkg_SeedInfoSel), sv2v_cast_D3E47({flash_ctrl_pkg_SeedBank, flash_ctrl_pkg_IsolatedInfoPage})};
	localparam [0:0] flash_ctrl_pkg_OwnerSeedIdx = 1;
	localparam [flash_ctrl_pkg_PageW - 1:0] flash_ctrl_pkg_CreatorInfoPage = 1;
	localparam signed [31:0] flash_ctrl_pkg_NumSeeds = 2;
	localparam [flash_ctrl_pkg_PageW - 1:0] flash_ctrl_pkg_OwnerInfoPage = 2;
	localparam [(flash_ctrl_pkg_NumSeeds * (flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW)) - 1:0] flash_ctrl_pkg_SeedInfoPageSel = {sv2v_cast_2788C(flash_ctrl_pkg_SeedInfoSel), sv2v_cast_D3E47({flash_ctrl_pkg_SeedBank, flash_ctrl_pkg_CreatorInfoPage}), sv2v_cast_2788C(flash_ctrl_pkg_SeedInfoSel), sv2v_cast_D3E47({flash_ctrl_pkg_SeedBank, flash_ctrl_pkg_OwnerInfoPage})};
	function automatic [(flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) - 1:0] sv2v_cast_8D066;
		input reg [(flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) - 1:0] inp;
		sv2v_cast_8D066 = inp;
	endfunction
	function automatic [((((32'sd4 + 32'sd4) + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) - 1:0] sv2v_cast_8C20B;
		input reg [((((32'sd4 + 32'sd4) + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) - 1:0] inp;
		sv2v_cast_8C20B = inp;
	endfunction
	localparam [(5 * (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + 2) + ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width))) - 1:0] flash_ctrl_pkg_HwInfoPageAttr = {sv2v_cast_8D066(flash_ctrl_pkg_SeedInfoPageSel[(1 - flash_ctrl_pkg_CreatorSeedIdx) * (flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW)+:flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW]), 2'd0, sv2v_cast_8C20B(flash_ctrl_pkg_CfgAllowRead), sv2v_cast_8D066(flash_ctrl_pkg_SeedInfoPageSel[(1 - flash_ctrl_pkg_OwnerSeedIdx) * (flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW)+:flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW]), 2'd0, sv2v_cast_8C20B(flash_ctrl_pkg_CfgAllowRead), sv2v_cast_8D066(flash_ctrl_pkg_SeedInfoPageSel[(1 - flash_ctrl_pkg_CreatorSeedIdx) * (flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW)+:flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW]), 2'd1, sv2v_cast_8C20B(flash_ctrl_pkg_CfgAllowReadProgErase), sv2v_cast_8D066(flash_ctrl_pkg_SeedInfoPageSel[(1 - flash_ctrl_pkg_OwnerSeedIdx) * (flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW)+:flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW]), 2'd1, sv2v_cast_8C20B(flash_ctrl_pkg_CfgAllowReadProgErase), sv2v_cast_8D066(flash_ctrl_pkg_IsolatedPageSel), 2'd1, sv2v_cast_8C20B(flash_ctrl_pkg_CfgAllowReadProgErase)};
	always @(*) begin
		if (_sv2v_0)
			;
		hw_page_cfg = 1'sb0;
		unused_rule_match = 1'sb0;
		if (hw_sel && req_i) begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 0; i < flash_ctrl_pkg_HwInfoRules; i = i + 1)
				begin : hw_info_region_comps
					if (((bank_page_addr == flash_ctrl_pkg_HwInfoPageAttr[((4 - i) * (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + 2) + ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width))) + (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 1)) - (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) - 1) - (flash_ctrl_pkg_AllPagesW - 1)))-:flash_ctrl_pkg_AllPagesW]) && (info_sel_i == flash_ctrl_pkg_HwInfoPageAttr[((4 - i) * (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + 2) + ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width))) + (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 1)) - (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) - 1) - (flash_ctrl_pkg_InfoTypesWidth + (flash_ctrl_pkg_AllPagesW - 1))))-:((flash_ctrl_pkg_InfoTypesWidth + (flash_ctrl_pkg_AllPagesW - 1)) >= (flash_ctrl_pkg_AllPagesW + 0) ? ((flash_ctrl_pkg_InfoTypesWidth + (flash_ctrl_pkg_AllPagesW - 1)) - (flash_ctrl_pkg_AllPagesW + 0)) + 1 : ((flash_ctrl_pkg_AllPagesW + 0) - (flash_ctrl_pkg_InfoTypesWidth + (flash_ctrl_pkg_AllPagesW - 1))) + 1)])) && (phase_i == flash_ctrl_pkg_HwInfoPageAttr[((4 - i) * (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + 2) + ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width))) + (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 1)-:(((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 5) >= ((((32'sd4 + 32'sd4) + (32'sd4 + 32'sd4)) + (32'sd4 + 32'sd4)) + 4) ? ((((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 1) - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 0)) + 1 : ((((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 0) - (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + 1)) + 1)])) begin
						unused_rule_match[i] = 1'b1;
						hw_page_cfg = flash_ctrl_pkg_HwInfoPageAttr[((4 - i) * (((flash_ctrl_pkg_InfoTypesWidth + flash_ctrl_pkg_AllPagesW) + 2) + ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width))) + (((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) - 1)-:(((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width];
					end
				end
		end
	end
	assign info_page_addr = req_addr_i[flash_ctrl_pkg_InfoPageW - 1:0];
	assign page_cfg = (hw_sel ? hw_page_cfg : info_page_cfgs_i[((((bank_addr * flash_ctrl_pkg_InfoTypes) + info_sel_i) * flash_ctrl_pkg_InfosPerBank) + info_page_addr) * ((((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width)+:(((((prim_mubi_pkg_MuBi4Width + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width) + prim_mubi_pkg_MuBi4Width]);
	assign info_en = (info_part_sel & ~addr_invalid) & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[27-:4]);
	assign info_rd_en = (info_en & rd_i) & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[23-:4]);
	assign info_prog_en = (info_en & prog_i) & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[19-:4]);
	assign info_pg_erase_en = (info_en & pg_erase_i) & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[15-:4]);
	assign info_bk_erase_en = (info_part_sel & bk_erase_i) & |bk_erase_en;
	assign info_scramble_en = (info_en & (rd_i | prog_i)) & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[11-:4]);
	assign info_ecc_en = (info_en & (rd_i | prog_i)) & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[7-:4]);
	assign info_he_en = info_en & prim_mubi_pkg_mubi4_test_true_strict(page_cfg[3-:prim_mubi_pkg_MuBi4Width]);
	assign invalid_info_txn = (req_i & info_part_sel) & ~(((info_rd_en | info_prog_en) | info_pg_erase_en) | info_bk_erase_en);
	assign rd_o = req_i & (data_rd_en | info_rd_en);
	assign prog_o = req_i & (data_prog_en | info_prog_en);
	assign pg_erase_o = req_i & (data_pg_erase_en | info_pg_erase_en);
	assign bk_erase_o = req_i & (data_bk_erase_en | info_bk_erase_en);
	assign scramble_en_o = req_i & (data_scramble_en | info_scramble_en);
	assign ecc_en_o = req_i & (data_ecc_en | info_ecc_en);
	assign he_en_o = req_i & (data_he_en | info_he_en);
	assign req_o = ((rd_o | prog_o) | pg_erase_o) | bk_erase_o;
	reg txn_err;
	wire no_allowed_txn;
	function automatic prim_mubi_pkg_mubi4_test_true_loose;
		input reg [3:0] val;
		prim_mubi_pkg_mubi4_test_true_loose = sv2v_cast_CFE33(4'h9) != val;
	endfunction
	assign no_allowed_txn = req_i & (prim_mubi_pkg_mubi4_test_true_loose(flash_disable_i) | ((addr_invalid | invalid_data_txn) | invalid_info_txn));
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			txn_err <= 1'b0;
		else if (txn_err)
			txn_err <= 1'b0;
		else if (no_allowed_txn)
			txn_err <= 1'b1;
	assign rd_done_o = rd_done_i | txn_err;
	assign prog_done_o = prog_done_i | txn_err;
	assign erase_done_o = erase_done_i | txn_err;
	assign error_o = txn_err;
	wire erase_valid;
	assign erase_valid = pg_erase_o | bk_erase_o;
	assign erase_suspend_o = erase_valid & erase_suspend_i;
	assign erase_suspend_done_o = (erase_suspend_i & ~erase_valid) | (erase_suspend_o & erase_done_o);
	initial _sv2v_0 = 0;
endmodule
