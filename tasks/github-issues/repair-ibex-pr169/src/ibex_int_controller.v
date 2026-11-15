module ibex_int_controller (
	clk_i,
	rst_ni,
	irq_req_ctrl_o,
	irq_id_ctrl_o,
	ctrl_ack_i,
	ctrl_kill_i,
	irq_i,
	irq_id_i,
	m_IE_i
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_ni;
	output wire irq_req_ctrl_o;
	output wire [4:0] irq_id_ctrl_o;
	input wire ctrl_ack_i;
	input wire ctrl_kill_i;
	input wire irq_i;
	input wire [4:0] irq_id_i;
	input wire m_IE_i;
	reg [1:0] exc_ctrl_ns;
	reg [1:0] exc_ctrl_cs;
	wire irq_enable_ext;
	reg [4:0] irq_id_d;
	reg [4:0] irq_id_q;
	assign irq_enable_ext = m_IE_i;
	assign irq_req_ctrl_o = exc_ctrl_cs == 2'd1;
	assign irq_id_ctrl_o = irq_id_q;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			irq_id_q <= 1'sb0;
			exc_ctrl_cs <= 2'd0;
		end
		else begin
			irq_id_q <= irq_id_d;
			exc_ctrl_cs <= exc_ctrl_ns;
		end
	always @(*) begin
		if (_sv2v_0)
			;
		irq_id_d = irq_id_q;
		exc_ctrl_ns = exc_ctrl_cs;
		(* full_case, parallel_case *)
		case (exc_ctrl_cs)
			2'd0:
				if (irq_enable_ext && irq_i) begin
					exc_ctrl_ns = 2'd1;
					irq_id_d = irq_id_i;
				end
			2'd1:
				(* full_case, parallel_case *)
				case (1'b1)
					ctrl_ack_i: exc_ctrl_ns = 2'd2;
					ctrl_kill_i: exc_ctrl_ns = 2'd0;
					default: exc_ctrl_ns = 2'd1;
				endcase
			2'd2: exc_ctrl_ns = 2'd0;
			default: exc_ctrl_ns = 2'b0x;
		endcase
	end
	initial _sv2v_0 = 0;
endmodule
