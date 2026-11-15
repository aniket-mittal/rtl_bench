module tlul_cmd_intg_gen (
	tl_i,
	tl_o
);
	reg _sv2v_0;
	parameter [0:0] EnableDataIntgGen = 1'b1;
	localparam signed [31:0] prim_mubi_pkg_MuBi4Width = 4;
	localparam signed [31:0] tlul_pkg_DataIntgWidth = 7;
	localparam signed [31:0] tlul_pkg_H2DCmdIntgWidth = 7;
	localparam signed [31:0] top_pkg_TL_AIW = 8;
	localparam signed [31:0] top_pkg_TL_AW = 32;
	localparam signed [31:0] top_pkg_TL_DW = 32;
	localparam signed [31:0] top_pkg_TL_DBW = top_pkg_TL_DW >> 3;
	localparam signed [31:0] top_pkg_TL_SZW = $clog2($clog2(top_pkg_TL_DBW) + 1);
	input wire [(((((7 + top_pkg_TL_SZW) + top_pkg_TL_AIW) + top_pkg_TL_AW) + top_pkg_TL_DBW) + top_pkg_TL_DW) + 23:0] tl_i;
	output reg [(((((7 + top_pkg_TL_SZW) + top_pkg_TL_AIW) + top_pkg_TL_AW) + top_pkg_TL_DBW) + top_pkg_TL_DW) + 23:0] tl_o;
	wire [(((prim_mubi_pkg_MuBi4Width + top_pkg_TL_AW) + 3) + top_pkg_TL_DBW) - 1:0] cmd;
	function automatic [(((prim_mubi_pkg_MuBi4Width + top_pkg_TL_AW) + 3) + top_pkg_TL_DBW) - 1:0] tlul_pkg_extract_h2d_cmd_intg;
		input reg [(((((7 + top_pkg_TL_SZW) + top_pkg_TL_AIW) + top_pkg_TL_AW) + top_pkg_TL_DBW) + top_pkg_TL_DW) + 23:0] tl;
		reg [(((prim_mubi_pkg_MuBi4Width + top_pkg_TL_AW) + 3) + top_pkg_TL_DBW) - 1:0] payload;
		reg unused_tlul;
		begin
			unused_tlul = ^tl;
			payload[top_pkg_TL_AW + (top_pkg_TL_DBW + 2)-:((top_pkg_TL_AW + (top_pkg_TL_DBW + 2)) >= (3 + (top_pkg_TL_DBW + 0)) ? ((top_pkg_TL_AW + (top_pkg_TL_DBW + 2)) - (3 + (top_pkg_TL_DBW + 0))) + 1 : ((3 + (top_pkg_TL_DBW + 0)) - (top_pkg_TL_AW + (top_pkg_TL_DBW + 2))) + 1)] = tl[top_pkg_TL_AW + (top_pkg_TL_DBW + 55)-:((top_pkg_TL_AW + (top_pkg_TL_DBW + 55)) >= (top_pkg_TL_DBW + 56) ? ((top_pkg_TL_AW + (top_pkg_TL_DBW + 55)) - (top_pkg_TL_DBW + 56)) + 1 : ((top_pkg_TL_DBW + 56) - (top_pkg_TL_AW + (top_pkg_TL_DBW + 55))) + 1)];
			payload[top_pkg_TL_DBW + 2-:((top_pkg_TL_DBW + 2) >= (top_pkg_TL_DBW + 0) ? ((top_pkg_TL_DBW + 2) - (top_pkg_TL_DBW + 0)) + 1 : ((top_pkg_TL_DBW + 0) - (top_pkg_TL_DBW + 2)) + 1)] = tl[6 + (top_pkg_TL_SZW + (top_pkg_TL_AIW + (top_pkg_TL_AW + (top_pkg_TL_DBW + 55))))-:((6 + (top_pkg_TL_SZW + ((32'sd8 + 32'sd32) + (top_pkg_TL_DBW + 55)))) >= (3 + (top_pkg_TL_SZW + ((32'sd8 + 32'sd32) + (top_pkg_TL_DBW + 56)))) ? ((6 + (top_pkg_TL_SZW + (top_pkg_TL_AIW + (top_pkg_TL_AW + (top_pkg_TL_DBW + 55))))) - (3 + (top_pkg_TL_SZW + (top_pkg_TL_AIW + (top_pkg_TL_AW + (top_pkg_TL_DBW + 56)))))) + 1 : ((3 + (top_pkg_TL_SZW + (top_pkg_TL_AIW + (top_pkg_TL_AW + (top_pkg_TL_DBW + 56))))) - (6 + (top_pkg_TL_SZW + (top_pkg_TL_AIW + (top_pkg_TL_AW + (top_pkg_TL_DBW + 55)))))) + 1)];
			payload[top_pkg_TL_DBW - 1-:top_pkg_TL_DBW] = tl[top_pkg_TL_DBW + 55-:((top_pkg_TL_DBW + 55) >= 56 ? top_pkg_TL_DBW : 57 - (top_pkg_TL_DBW + 55))];
			payload[prim_mubi_pkg_MuBi4Width + (top_pkg_TL_AW + (top_pkg_TL_DBW + 2))-:(((32'sd4 + 32'sd32) + (top_pkg_TL_DBW + 2)) >= (35 + (top_pkg_TL_DBW + 0)) ? ((prim_mubi_pkg_MuBi4Width + (top_pkg_TL_AW + (top_pkg_TL_DBW + 2))) - (top_pkg_TL_AW + (3 + (top_pkg_TL_DBW + 0)))) + 1 : ((top_pkg_TL_AW + (3 + (top_pkg_TL_DBW + 0))) - (prim_mubi_pkg_MuBi4Width + (top_pkg_TL_AW + (top_pkg_TL_DBW + 2)))) + 1)] = tl[18-:4];
			tlul_pkg_extract_h2d_cmd_intg = payload;
		end
	endfunction
	assign cmd = tlul_pkg_extract_h2d_cmd_intg(tl_i);
	localparam signed [31:0] tlul_pkg_H2DCmdMaxWidth = 57;
	wire [56:0] unused_cmd_payload;
	wire [6:0] cmd_intg;
	function automatic [56:0] sv2v_cast_57;
		input reg [56:0] inp;
		sv2v_cast_57 = inp;
	endfunction
	prim_secded_inv_64_57_enc u_cmd_gen(
		.data_i(sv2v_cast_57(cmd)),
		.data_o({cmd_intg, unused_cmd_payload})
	);
	wire [31:0] data_final;
	wire [6:0] data_intg;
	localparam signed [31:0] tlul_pkg_DataMaxWidth = 32;
	function automatic [31:0] sv2v_cast_32;
		input reg [31:0] inp;
		sv2v_cast_32 = inp;
	endfunction
	generate
		if (EnableDataIntgGen) begin : gen_data_intg
			genvar _gv_i_1;
			for (_gv_i_1 = 0; _gv_i_1 < top_pkg_TL_DBW; _gv_i_1 = _gv_i_1 + 1) begin : gen_data_fill
				localparam i = _gv_i_1;
				assign data_final[i * 8+:8] = (tl_i[(top_pkg_TL_DBW + 55) - ((top_pkg_TL_DBW - 1) - i)] ? tl_i[24 + (i * 8)+:8] : {8 {1'sb0}});
			end
			wire [31:0] unused_data;
			prim_secded_inv_39_32_enc u_data_gen(
				.data_i(sv2v_cast_32(data_final)),
				.data_o({data_intg, unused_data})
			);
		end
		else begin : gen_passthrough_data_intg
			assign data_final = tl_i[55-:32];
			assign data_intg = tl_i[7-:tlul_pkg_DataIntgWidth];
		end
	endgenerate
	always @(*) begin
		if (_sv2v_0)
			;
		tl_o = tl_i;
		tl_o[55-:32] = data_final;
		tl_o[14-:7] = cmd_intg;
		tl_o[7-:tlul_pkg_DataIntgWidth] = data_intg;
	end
	wire unused_tl;
	assign unused_tl = ^tl_i;
	initial _sv2v_0 = 0;
endmodule
