module cv32e40p_load_store_unit (
	clk,
	rst_n,
	data_req_o,
	data_gnt_i,
	data_rvalid_i,
	data_err_i,
	data_err_pmp_i,
	data_addr_o,
	data_we_o,
	data_be_o,
	data_wdata_o,
	data_rdata_i,
	data_we_ex_i,
	data_type_ex_i,
	data_wdata_ex_i,
	data_reg_offset_ex_i,
	data_load_event_ex_i,
	data_sign_ext_ex_i,
	data_rdata_ex_o,
	data_req_ex_i,
	operand_a_ex_i,
	operand_b_ex_i,
	addr_useincr_ex_i,
	data_misaligned_ex_i,
	data_misaligned_o,
	data_atop_ex_i,
	data_atop_o,
	p_elw_start_o,
	p_elw_finish_o,
	lsu_ready_ex_o,
	lsu_ready_wb_o,
	busy_o
);
	reg _sv2v_0;
	parameter PULP_OBI = 0;
	input wire clk;
	input wire rst_n;
	output wire data_req_o;
	input wire data_gnt_i;
	input wire data_rvalid_i;
	input wire data_err_i;
	input wire data_err_pmp_i;
	output wire [31:0] data_addr_o;
	output wire data_we_o;
	output wire [3:0] data_be_o;
	output wire [31:0] data_wdata_o;
	input wire [31:0] data_rdata_i;
	input wire data_we_ex_i;
	input wire [1:0] data_type_ex_i;
	input wire [31:0] data_wdata_ex_i;
	input wire [1:0] data_reg_offset_ex_i;
	input wire data_load_event_ex_i;
	input wire [1:0] data_sign_ext_ex_i;
	output wire [31:0] data_rdata_ex_o;
	input wire data_req_ex_i;
	input wire [31:0] operand_a_ex_i;
	input wire [31:0] operand_b_ex_i;
	input wire addr_useincr_ex_i;
	input wire data_misaligned_ex_i;
	output reg data_misaligned_o;
	input wire [5:0] data_atop_ex_i;
	output wire [5:0] data_atop_o;
	output wire p_elw_start_o;
	output wire p_elw_finish_o;
	output wire lsu_ready_ex_o;
	output wire lsu_ready_wb_o;
	output wire busy_o;
	localparam DEPTH = 2;
	wire trans_valid;
	wire trans_ready;
	wire [31:0] trans_addr;
	wire trans_we;
	wire [3:0] trans_be;
	wire [31:0] trans_wdata;
	wire [5:0] trans_atop;
	wire resp_valid;
	wire [31:0] resp_rdata;
	wire resp_err;
	reg [1:0] cnt_q;
	reg [1:0] next_cnt;
	wire count_up;
	wire count_down;
	wire ctrl_update;
	wire [31:0] data_addr_int;
	reg [1:0] data_type_q;
	reg [1:0] rdata_offset_q;
	reg [1:0] data_sign_ext_q;
	reg data_we_q;
	reg data_load_event_q;
	wire [1:0] wdata_offset;
	reg [3:0] data_be;
	reg [31:0] data_wdata;
	wire misaligned_st;
	wire load_err_o;
	wire store_err_o;
	reg [31:0] rdata_q;
	always @(*) begin
		if (_sv2v_0)
			;
		case (data_type_ex_i)
			2'b00:
				if (misaligned_st == 1'b0)
					case (data_addr_int[1:0])
						2'b00: data_be = 4'b1111;
						2'b01: data_be = 4'b1110;
						2'b10: data_be = 4'b1100;
						2'b11: data_be = 4'b1000;
					endcase
				else
					case (data_addr_int[1:0])
						2'b00: data_be = 4'b0000;
						2'b01: data_be = 4'b0001;
						2'b10: data_be = 4'b0011;
						2'b11: data_be = 4'b0111;
					endcase
			2'b01:
				if (misaligned_st == 1'b0)
					case (data_addr_int[1:0])
						2'b00: data_be = 4'b0011;
						2'b01: data_be = 4'b0110;
						2'b10: data_be = 4'b1100;
						2'b11: data_be = 4'b1000;
					endcase
				else
					data_be = 4'b0001;
			2'b10, 2'b11:
				case (data_addr_int[1:0])
					2'b00: data_be = 4'b0001;
					2'b01: data_be = 4'b0010;
					2'b10: data_be = 4'b0100;
					2'b11: data_be = 4'b1000;
				endcase
		endcase
	end
	assign wdata_offset = data_addr_int[1:0] - data_reg_offset_ex_i[1:0];
	always @(*) begin
		if (_sv2v_0)
			;
		case (wdata_offset)
			2'b00: data_wdata = data_wdata_ex_i[31:0];
			2'b01: data_wdata = {data_wdata_ex_i[23:0], data_wdata_ex_i[31:24]};
			2'b10: data_wdata = {data_wdata_ex_i[15:0], data_wdata_ex_i[31:16]};
			2'b11: data_wdata = {data_wdata_ex_i[7:0], data_wdata_ex_i[31:8]};
		endcase
	end
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0) begin
			data_type_q <= 1'sb0;
			rdata_offset_q <= 1'sb0;
			data_sign_ext_q <= 1'sb0;
			data_we_q <= 1'b0;
			data_load_event_q <= 1'b0;
		end
		else if (ctrl_update) begin
			data_type_q <= data_type_ex_i;
			rdata_offset_q <= data_addr_int[1:0];
			data_sign_ext_q <= data_sign_ext_ex_i;
			data_we_q <= data_we_ex_i;
			data_load_event_q <= data_load_event_ex_i;
		end
	assign p_elw_start_o = data_load_event_ex_i && data_req_o;
	assign p_elw_finish_o = (data_load_event_q && data_rvalid_i) && !data_misaligned_ex_i;
	reg [31:0] data_rdata_ext;
	reg [31:0] rdata_w_ext;
	reg [31:0] rdata_h_ext;
	reg [31:0] rdata_b_ext;
	always @(*) begin
		if (_sv2v_0)
			;
		case (rdata_offset_q)
			2'b00: rdata_w_ext = resp_rdata[31:0];
			2'b01: rdata_w_ext = {resp_rdata[7:0], rdata_q[31:8]};
			2'b10: rdata_w_ext = {resp_rdata[15:0], rdata_q[31:16]};
			2'b11: rdata_w_ext = {resp_rdata[23:0], rdata_q[31:24]};
		endcase
	end
	always @(*) begin
		if (_sv2v_0)
			;
		case (rdata_offset_q)
			2'b00:
				if (data_sign_ext_q == 2'b00)
					rdata_h_ext = {16'h0000, resp_rdata[15:0]};
				else if (data_sign_ext_q == 2'b10)
					rdata_h_ext = {16'hffff, resp_rdata[15:0]};
				else
					rdata_h_ext = {{16 {resp_rdata[15]}}, resp_rdata[15:0]};
			2'b01:
				if (data_sign_ext_q == 2'b00)
					rdata_h_ext = {16'h0000, resp_rdata[23:8]};
				else if (data_sign_ext_q == 2'b10)
					rdata_h_ext = {16'hffff, resp_rdata[23:8]};
				else
					rdata_h_ext = {{16 {resp_rdata[23]}}, resp_rdata[23:8]};
			2'b10:
				if (data_sign_ext_q == 2'b00)
					rdata_h_ext = {16'h0000, resp_rdata[31:16]};
				else if (data_sign_ext_q == 2'b10)
					rdata_h_ext = {16'hffff, resp_rdata[31:16]};
				else
					rdata_h_ext = {{16 {resp_rdata[31]}}, resp_rdata[31:16]};
			2'b11:
				if (data_sign_ext_q == 2'b00)
					rdata_h_ext = {16'h0000, resp_rdata[7:0], rdata_q[31:24]};
				else if (data_sign_ext_q == 2'b10)
					rdata_h_ext = {16'hffff, resp_rdata[7:0], rdata_q[31:24]};
				else
					rdata_h_ext = {{16 {resp_rdata[7]}}, resp_rdata[7:0], rdata_q[31:24]};
		endcase
	end
	always @(*) begin
		if (_sv2v_0)
			;
		case (rdata_offset_q)
			2'b00:
				if (data_sign_ext_q == 2'b00)
					rdata_b_ext = {24'h000000, resp_rdata[7:0]};
				else if (data_sign_ext_q == 2'b10)
					rdata_b_ext = {24'hffffff, resp_rdata[7:0]};
				else
					rdata_b_ext = {{24 {resp_rdata[7]}}, resp_rdata[7:0]};
			2'b01:
				if (data_sign_ext_q == 2'b00)
					rdata_b_ext = {24'h000000, resp_rdata[15:8]};
				else if (data_sign_ext_q == 2'b10)
					rdata_b_ext = {24'hffffff, resp_rdata[15:8]};
				else
					rdata_b_ext = {{24 {resp_rdata[15]}}, resp_rdata[15:8]};
			2'b10:
				if (data_sign_ext_q == 2'b00)
					rdata_b_ext = {24'h000000, resp_rdata[23:16]};
				else if (data_sign_ext_q == 2'b10)
					rdata_b_ext = {24'hffffff, resp_rdata[23:16]};
				else
					rdata_b_ext = {{24 {resp_rdata[23]}}, resp_rdata[23:16]};
			2'b11:
				if (data_sign_ext_q == 2'b00)
					rdata_b_ext = {24'h000000, resp_rdata[31:24]};
				else if (data_sign_ext_q == 2'b10)
					rdata_b_ext = {24'hffffff, resp_rdata[31:24]};
				else
					rdata_b_ext = {{24 {resp_rdata[31]}}, resp_rdata[31:24]};
		endcase
	end
	always @(*) begin
		if (_sv2v_0)
			;
		case (data_type_q)
			2'b00: data_rdata_ext = rdata_w_ext;
			2'b01: data_rdata_ext = rdata_h_ext;
			2'b10, 2'b11: data_rdata_ext = rdata_b_ext;
		endcase
	end
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0)
			rdata_q <= 1'sb0;
		else if (resp_valid && ~data_we_q) begin
			if ((data_misaligned_ex_i == 1'b1) || (data_misaligned_o == 1'b1))
				rdata_q <= resp_rdata;
			else
				rdata_q <= data_rdata_ext;
		end
	assign data_rdata_ex_o = (resp_valid == 1'b1 ? data_rdata_ext : rdata_q);
	assign misaligned_st = data_misaligned_ex_i;
	assign load_err_o = (data_gnt_i && data_err_pmp_i) && ~data_we_o;
	assign store_err_o = (data_gnt_i && data_err_pmp_i) && data_we_o;
	always @(*) begin
		if (_sv2v_0)
			;
		data_misaligned_o = 1'b0;
		if ((data_req_ex_i == 1'b1) && (data_misaligned_ex_i == 1'b0))
			case (data_type_ex_i)
				2'b00:
					if (data_addr_int[1:0] != 2'b00)
						data_misaligned_o = 1'b1;
				2'b01:
					if (data_addr_int[1:0] == 2'b11)
						data_misaligned_o = 1'b1;
			endcase
	end
	assign data_addr_int = (addr_useincr_ex_i ? operand_a_ex_i + operand_b_ex_i : operand_a_ex_i);
	assign busy_o = (cnt_q != 2'b00) || trans_valid;
	assign trans_addr = (data_misaligned_ex_i ? {data_addr_int[31:2], 2'b00} : data_addr_int);
	assign trans_we = data_we_ex_i;
	assign trans_be = data_be;
	assign trans_wdata = data_wdata;
	assign trans_atop = data_atop_ex_i;
	generate
		if (PULP_OBI == 0) begin : genblk1
			assign trans_valid = data_req_ex_i && (cnt_q < DEPTH);
		end
		else begin : genblk1
			assign trans_valid = (cnt_q == 2'b00 ? data_req_ex_i && (cnt_q < DEPTH) : (data_req_ex_i && (cnt_q < DEPTH)) && resp_valid);
		end
	endgenerate
	assign lsu_ready_wb_o = (cnt_q == 2'b00 ? 1'b1 : resp_valid);
	assign lsu_ready_ex_o = (data_req_ex_i == 1'b0 ? 1'b1 : (cnt_q == 2'b00 ? trans_valid && trans_ready : (cnt_q == 2'b01 ? (resp_valid && trans_valid) && trans_ready : resp_valid)));
	assign ctrl_update = lsu_ready_ex_o && data_req_ex_i;
	assign count_up = trans_valid && trans_ready;
	assign count_down = resp_valid;
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case ({count_up, count_down})
			2'b00: next_cnt = cnt_q;
			2'b01: next_cnt = cnt_q - 1'b1;
			2'b10: next_cnt = cnt_q + 1'b1;
			2'b11: next_cnt = cnt_q;
		endcase
	end
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0)
			cnt_q <= 1'sb0;
		else
			cnt_q <= next_cnt;
	cv32e40p_obi_interface #(.TRANS_STABLE(1)) data_obi_i(
		.clk(clk),
		.rst_n(rst_n),
		.trans_valid_i(trans_valid),
		.trans_ready_o(trans_ready),
		.trans_addr_i(trans_addr),
		.trans_we_i(trans_we),
		.trans_be_i(trans_be),
		.trans_wdata_i(trans_wdata),
		.trans_atop_i(trans_atop),
		.resp_valid_o(resp_valid),
		.resp_rdata_o(resp_rdata),
		.resp_err_o(resp_err),
		.obi_req_o(data_req_o),
		.obi_gnt_i(data_gnt_i),
		.obi_addr_o(data_addr_o),
		.obi_we_o(data_we_o),
		.obi_be_o(data_be_o),
		.obi_wdata_o(data_wdata_o),
		.obi_atop_o(data_atop_o),
		.obi_rdata_i(data_rdata_i),
		.obi_rvalid_i(data_rvalid_i),
		.obi_err_i(data_err_i)
	);
	initial _sv2v_0 = 0;
endmodule
