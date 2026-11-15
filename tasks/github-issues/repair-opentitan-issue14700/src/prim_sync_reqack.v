module prim_sync_reqack (
	clk_src_i,
	rst_src_ni,
	clk_dst_i,
	rst_dst_ni,
	req_chk_i,
	src_req_i,
	src_ack_o,
	dst_req_o,
	dst_ack_i
);
	reg _sv2v_0;
	input clk_src_i;
	input rst_src_ni;
	input clk_dst_i;
	input rst_dst_ni;
	input wire req_chk_i;
	input wire src_req_i;
	output reg src_ack_o;
	output reg dst_req_o;
	input wire dst_ack_i;
	wire unused_req_chk;
	assign unused_req_chk = req_chk_i;
	reg src_fsm_ns;
	reg src_fsm_cs;
	reg dst_fsm_ns;
	reg dst_fsm_cs;
	reg src_req_d;
	reg src_req_q;
	wire src_ack;
	reg dst_ack_d;
	reg dst_ack_q;
	wire dst_req;
	wire src_handshake;
	wire dst_handshake;
	assign src_handshake = src_req_i & src_ack_o;
	assign dst_handshake = dst_req_o & dst_ack_i;
	prim_flop_2sync #(.Width(1)) req_sync(
		.clk_i(clk_dst_i),
		.rst_ni(rst_dst_ni),
		.d_i(src_req_q),
		.q_o(dst_req)
	);
	prim_flop_2sync #(.Width(1)) ack_sync(
		.clk_i(clk_src_i),
		.rst_ni(rst_src_ni),
		.d_i(dst_ack_q),
		.q_o(src_ack)
	);
	always @(*) begin : src_fsm
		if (_sv2v_0)
			;
		src_fsm_ns = src_fsm_cs;
		src_req_d = src_req_q;
		src_ack_o = 1'b0;
		(* full_case, parallel_case *)
		case (src_fsm_cs)
			1'd0: begin
				src_req_d = src_req_i;
				src_ack_o = src_ack;
				if (src_handshake)
					src_fsm_ns = 1'd1;
			end
			1'd1: begin
				src_req_d = ~src_req_i;
				src_ack_o = ~src_ack;
				if (src_handshake)
					src_fsm_ns = 1'd0;
			end
			default:
				;
		endcase
	end
	always @(*) begin : dst_fsm
		if (_sv2v_0)
			;
		dst_fsm_ns = dst_fsm_cs;
		dst_req_o = 1'b0;
		dst_ack_d = dst_ack_q;
		(* full_case, parallel_case *)
		case (dst_fsm_cs)
			1'd0: begin
				dst_req_o = dst_req;
				dst_ack_d = dst_ack_i;
				if (dst_handshake)
					dst_fsm_ns = 1'd1;
			end
			1'd1: begin
				dst_req_o = ~dst_req;
				dst_ack_d = ~dst_ack_i;
				if (dst_handshake)
					dst_fsm_ns = 1'd0;
			end
			default:
				;
		endcase
	end
	always @(posedge clk_src_i or negedge rst_src_ni)
		if (!rst_src_ni) begin
			src_fsm_cs <= 1'd0;
			src_req_q <= 1'b0;
		end
		else begin
			src_fsm_cs <= src_fsm_ns;
			src_req_q <= src_req_d;
		end
	always @(posedge clk_dst_i or negedge rst_dst_ni)
		if (!rst_dst_ni) begin
			dst_fsm_cs <= 1'd0;
			dst_ack_q <= 1'b0;
		end
		else begin
			dst_fsm_cs <= dst_fsm_ns;
			dst_ack_q <= dst_ack_d;
		end
	initial _sv2v_0 = 0;
endmodule
