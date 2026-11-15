module cv32e40p_int_controller (
	clk,
	rst_n,
	irq_i,
	irq_sec_i,
	irq_req_ctrl_o,
	irq_sec_ctrl_o,
	irq_id_ctrl_o,
	irq_wu_ctrl_o,
	mie_bypass_i,
	mip_o,
	m_ie_i,
	u_ie_i,
	current_priv_lvl_i
);
	reg _sv2v_0;
	parameter PULP_SECURE = 0;
	input wire clk;
	input wire rst_n;
	input wire [31:0] irq_i;
	input wire irq_sec_i;
	output wire irq_req_ctrl_o;
	output wire irq_sec_ctrl_o;
	output reg [4:0] irq_id_ctrl_o;
	output wire irq_wu_ctrl_o;
	input wire [31:0] mie_bypass_i;
	output wire [31:0] mip_o;
	input wire m_ie_i;
	input wire u_ie_i;
	input wire [1:0] current_priv_lvl_i;
	wire global_irq_enable;
	wire [31:0] irq_local_qual;
	reg [31:0] irq_q;
	reg irq_sec_q;
	localparam cv32e40p_pkg_IRQ_MASK = 32'hffff0888;
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0) begin
			irq_q <= 1'sb0;
			irq_sec_q <= 1'b0;
		end
		else begin
			irq_q <= irq_i & cv32e40p_pkg_IRQ_MASK;
			irq_sec_q <= irq_sec_i;
		end
	assign mip_o = irq_q;
	assign irq_local_qual = irq_q & mie_bypass_i;
	assign irq_wu_ctrl_o = |(irq_i & mie_bypass_i);
	generate
		if (PULP_SECURE) begin : genblk1
			assign global_irq_enable = ((u_ie_i || irq_sec_i) && (current_priv_lvl_i == 2'b00)) || (m_ie_i && (current_priv_lvl_i == 2'b11));
		end
		else begin : genblk1
			assign global_irq_enable = m_ie_i;
		end
	endgenerate
	assign irq_req_ctrl_o = |irq_local_qual && global_irq_enable;
	localparam [31:0] cv32e40p_pkg_CSR_MEIX_BIT = 11;
	localparam [31:0] cv32e40p_pkg_CSR_MSIX_BIT = 3;
	localparam [31:0] cv32e40p_pkg_CSR_MTIX_BIT = 7;
	always @(*) begin
		if (_sv2v_0)
			;
		if (irq_local_qual[31])
			irq_id_ctrl_o = 5'd31;
		else if (irq_local_qual[30])
			irq_id_ctrl_o = 5'd30;
		else if (irq_local_qual[29])
			irq_id_ctrl_o = 5'd29;
		else if (irq_local_qual[28])
			irq_id_ctrl_o = 5'd28;
		else if (irq_local_qual[27])
			irq_id_ctrl_o = 5'd27;
		else if (irq_local_qual[26])
			irq_id_ctrl_o = 5'd26;
		else if (irq_local_qual[25])
			irq_id_ctrl_o = 5'd25;
		else if (irq_local_qual[24])
			irq_id_ctrl_o = 5'd24;
		else if (irq_local_qual[23])
			irq_id_ctrl_o = 5'd23;
		else if (irq_local_qual[22])
			irq_id_ctrl_o = 5'd22;
		else if (irq_local_qual[21])
			irq_id_ctrl_o = 5'd21;
		else if (irq_local_qual[20])
			irq_id_ctrl_o = 5'd20;
		else if (irq_local_qual[19])
			irq_id_ctrl_o = 5'd19;
		else if (irq_local_qual[18])
			irq_id_ctrl_o = 5'd18;
		else if (irq_local_qual[17])
			irq_id_ctrl_o = 5'd17;
		else if (irq_local_qual[16])
			irq_id_ctrl_o = 5'd16;
		else if (irq_local_qual[15])
			irq_id_ctrl_o = 5'd15;
		else if (irq_local_qual[14])
			irq_id_ctrl_o = 5'd14;
		else if (irq_local_qual[13])
			irq_id_ctrl_o = 5'd13;
		else if (irq_local_qual[12])
			irq_id_ctrl_o = 5'd12;
		else if (irq_local_qual[cv32e40p_pkg_CSR_MEIX_BIT])
			irq_id_ctrl_o = cv32e40p_pkg_CSR_MEIX_BIT;
		else if (irq_local_qual[cv32e40p_pkg_CSR_MSIX_BIT])
			irq_id_ctrl_o = cv32e40p_pkg_CSR_MSIX_BIT;
		else if (irq_local_qual[cv32e40p_pkg_CSR_MTIX_BIT])
			irq_id_ctrl_o = cv32e40p_pkg_CSR_MTIX_BIT;
		else if (irq_local_qual[10])
			irq_id_ctrl_o = 5'd10;
		else if (irq_local_qual[2])
			irq_id_ctrl_o = 5'd2;
		else if (irq_local_qual[6])
			irq_id_ctrl_o = 5'd6;
		else if (irq_local_qual[9])
			irq_id_ctrl_o = 5'd9;
		else if (irq_local_qual[1])
			irq_id_ctrl_o = 5'd1;
		else if (irq_local_qual[5])
			irq_id_ctrl_o = 5'd5;
		else if (irq_local_qual[8])
			irq_id_ctrl_o = 5'd8;
		else if (irq_local_qual[0])
			irq_id_ctrl_o = 5'd0;
		else if (irq_local_qual[4])
			irq_id_ctrl_o = 5'd4;
		else
			irq_id_ctrl_o = cv32e40p_pkg_CSR_MTIX_BIT;
	end
	assign irq_sec_ctrl_o = irq_sec_q;
	initial _sv2v_0 = 0;
endmodule
