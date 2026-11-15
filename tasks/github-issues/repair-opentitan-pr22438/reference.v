module usb_fs_nb_in_pe (
	clk_48mhz_i,
	rst_ni,
	link_reset_i,
	link_active_i,
	dev_addr_i,
	in_xact_starting_o,
	in_xact_start_ep_o,
	in_ep_current_o,
	in_ep_rollback_o,
	in_ep_xact_end_o,
	in_ep_get_addr_o,
	in_ep_data_get_o,
	in_ep_newpkt_o,
	in_ep_enabled_i,
	in_ep_stall_i,
	in_ep_has_data_i,
	in_ep_data_i,
	in_ep_data_done_i,
	in_ep_iso_i,
	in_data_toggle_o,
	in_datatog_we_i,
	in_datatog_status_i,
	in_datatog_mask_i,
	rx_pkt_start_i,
	rx_pkt_end_i,
	rx_pkt_valid_i,
	rx_pid_i,
	rx_addr_i,
	rx_endp_i,
	tx_pkt_start_o,
	tx_pkt_end_i,
	tx_pid_o,
	tx_data_avail_o,
	tx_data_get_i,
	tx_data_o,
	event_timeout_in_o,
	event_nak_in_o,
	event_nodata_in_o
);
	reg _sv2v_0;
	parameter [4:0] NumInEps = 12;
	parameter [31:0] MaxInPktSizeByte = 32;
	parameter [31:0] AckTimeoutCnt = 73;
	localparam [31:0] InEpW = $clog2(NumInEps);
	localparam [31:0] PktW = $clog2(MaxInPktSizeByte);
	localparam [31:0] AckTimeoutCntW = $clog2(AckTimeoutCnt);
	input wire clk_48mhz_i;
	input wire rst_ni;
	input wire link_reset_i;
	input wire link_active_i;
	input wire [6:0] dev_addr_i;
	output wire in_xact_starting_o;
	output wire [3:0] in_xact_start_ep_o;
	output reg [3:0] in_ep_current_o;
	output reg in_ep_rollback_o;
	output wire in_ep_xact_end_o;
	output reg [PktW - 1:0] in_ep_get_addr_o;
	output reg in_ep_data_get_o;
	output reg in_ep_newpkt_o;
	input wire [NumInEps - 1:0] in_ep_enabled_i;
	input wire [NumInEps - 1:0] in_ep_stall_i;
	input wire [NumInEps - 1:0] in_ep_has_data_i;
	input wire [7:0] in_ep_data_i;
	input wire [NumInEps - 1:0] in_ep_data_done_i;
	input wire [NumInEps - 1:0] in_ep_iso_i;
	output wire [NumInEps - 1:0] in_data_toggle_o;
	input wire in_datatog_we_i;
	input wire [NumInEps - 1:0] in_datatog_status_i;
	input wire [NumInEps - 1:0] in_datatog_mask_i;
	input wire rx_pkt_start_i;
	input wire rx_pkt_end_i;
	input wire rx_pkt_valid_i;
	input wire [3:0] rx_pid_i;
	input wire [6:0] rx_addr_i;
	input wire [3:0] rx_endp_i;
	output reg tx_pkt_start_o;
	input wire tx_pkt_end_i;
	output reg [3:0] tx_pid_o;
	output wire tx_data_avail_o;
	input wire tx_data_get_i;
	output reg [7:0] tx_data_o;
	output wire event_timeout_in_o;
	output wire event_nak_in_o;
	output wire event_nodata_in_o;
	reg [2:0] in_xact_state;
	reg [2:0] in_xact_state_next;
	reg in_xact_end;
	assign in_ep_xact_end_o = in_xact_end;
	reg [NumInEps - 1:0] data_toggle_q;
	reg [NumInEps - 1:0] data_toggle_d;
	wire token_received;
	wire setup_token_received;
	wire in_token_received;
	wire ack_received;
	wire nak_received;
	wire more_data_to_send;
	wire ep_in_hw;
	wire ep_active;
	wire [3:0] in_ep_current_d;
	wire [1:0] rx_pid_type;
	wire [3:0] rx_pid;
	assign rx_pid_type = rx_pid_i[1:0];
	assign rx_pid = rx_pid_i;
	assign token_received = ((rx_pkt_end_i && rx_pkt_valid_i) && (rx_pid_type == 2'b01)) && (rx_addr_i == dev_addr_i);
	assign setup_token_received = token_received && (rx_pid == 4'b1101);
	assign in_token_received = token_received && (rx_pid == 4'b1001);
	assign ack_received = (rx_pkt_end_i && rx_pkt_valid_i) && (rx_pid == 4'b0010);
	assign nak_received = (rx_pkt_end_i && rx_pkt_valid_i) && (rx_pid == 4'b1010);
	assign ep_in_hw = {1'b0, rx_endp_i} < NumInEps;
	assign in_ep_current_d = (ep_in_hw ? rx_endp_i : {4 {1'sb0}});
	wire [InEpW - 1:0] in_ep_index;
	wire [InEpW - 1:0] in_ep_index_d;
	assign in_ep_index = in_ep_current_o[0+:InEpW];
	assign in_ep_index_d = in_ep_current_d[0+:InEpW];
	assign ep_active = in_ep_enabled_i[in_ep_index_d] & ep_in_hw;
	reg has_data_q;
	assign more_data_to_send = has_data_q & ~in_ep_data_done_i[in_ep_index];
	assign tx_data_avail_o = (in_xact_state == 3'd2) & more_data_to_send;
	wire in_starting;
	assign in_starting = ((in_xact_state == 3'd0) || (in_xact_state == 3'd5)) && in_token_received;
	assign in_xact_starting_o = in_starting & ep_active;
	assign in_xact_start_ep_o = in_ep_current_d;
	reg [AckTimeoutCntW - 1:0] timeout_cntdown_d;
	reg [AckTimeoutCntW - 1:0] timeout_cntdown_q;
	reg rollback_in_xact;
	always @(*) begin
		if (_sv2v_0)
			;
		in_xact_state_next = in_xact_state;
		in_xact_end = 1'b0;
		tx_pkt_start_o = 1'b0;
		tx_pid_o = 4'b0000;
		rollback_in_xact = 1'b0;
		timeout_cntdown_d = AckTimeoutCnt[AckTimeoutCntW - 1:0];
		(* full_case, parallel_case *)
		case (in_xact_state)
			3'd0:
				if (ep_active && in_token_received)
					in_xact_state_next = 3'd1;
				else
					in_xact_state_next = 3'd0;
			3'd1: begin
				tx_pkt_start_o = 1'b1;
				if (in_ep_iso_i[in_ep_index]) begin
					in_xact_state_next = 3'd2;
					tx_pid_o = 4'b0011;
				end
				else if (in_ep_stall_i[in_ep_index]) begin
					in_xact_state_next = 3'd0;
					tx_pid_o = 4'b1110;
				end
				else if (has_data_q) begin
					in_xact_state_next = 3'd2;
					tx_pid_o = {data_toggle_q[in_ep_index], 3'b011};
				end
				else begin
					in_xact_state_next = 3'd0;
					tx_pid_o = 4'b1010;
				end
			end
			3'd2:
				if (!more_data_to_send || (&in_ep_get_addr_o && tx_data_get_i)) begin
					if (in_ep_iso_i[in_ep_index]) begin
						in_xact_state_next = 3'd0;
						in_xact_end = has_data_q;
					end
					else if (tx_pkt_end_i)
						in_xact_state_next = 3'd4;
					else
						in_xact_state_next = 3'd3;
				end
				else
					in_xact_state_next = 3'd2;
			3'd3:
				if (tx_pkt_end_i)
					in_xact_state_next = 3'd4;
			3'd4: begin
				timeout_cntdown_d = timeout_cntdown_q - 1'b1;
				if (rx_pkt_start_i)
					in_xact_state_next = 3'd5;
				else if (timeout_cntdown_q == {AckTimeoutCntW {1'sb0}}) begin
					in_xact_state_next = 3'd0;
					rollback_in_xact = 1'b1;
				end
				else
					in_xact_state_next = 3'd4;
			end
			3'd5:
				if (ack_received) begin
					in_xact_state_next = 3'd0;
					in_xact_end = 1'b1;
				end
				else if (in_token_received) begin
					in_xact_state_next = (ep_active ? 3'd1 : 3'd0);
					rollback_in_xact = 1'b1;
				end
				else if (rx_pkt_end_i) begin
					in_xact_state_next = 3'd0;
					rollback_in_xact = 1'b1;
				end
				else
					in_xact_state_next = 3'd5;
			default: in_xact_state_next = 3'd0;
		endcase
	end
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni)
			timeout_cntdown_q <= AckTimeoutCnt[AckTimeoutCntW - 1:0];
		else
			timeout_cntdown_q <= timeout_cntdown_d;
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni)
			tx_data_o <= 1'sb0;
		else
			tx_data_o <= in_ep_data_i;
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni) begin
			in_xact_state <= 3'd0;
			in_ep_rollback_o <= 1'b0;
		end
		else if (link_reset_i || !link_active_i) begin
			in_xact_state <= 3'd0;
			in_ep_rollback_o <= 1'b0;
		end
		else begin
			in_xact_state <= in_xact_state_next;
			in_ep_rollback_o <= rollback_in_xact;
		end
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni)
			in_ep_get_addr_o <= 1'sb0;
		else if (in_xact_state == 3'd0)
			in_ep_get_addr_o <= 1'sb0;
		else if ((in_xact_state == 3'd2) && tx_data_get_i)
			in_ep_get_addr_o <= in_ep_get_addr_o + 1'b1;
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni) begin
			in_ep_newpkt_o <= 1'b0;
			in_ep_current_o <= 1'sb0;
			has_data_q <= 1'b0;
		end
		else if (in_token_received) begin
			in_ep_current_o <= in_ep_current_d;
			in_ep_newpkt_o <= 1'b1;
			has_data_q <= in_ep_has_data_i[in_ep_index_d];
		end
		else
			in_ep_newpkt_o <= 1'b0;
	always @(*) begin : proc_data_toggle_d
		if (_sv2v_0)
			;
		data_toggle_d = data_toggle_q;
		if (setup_token_received && ep_active)
			data_toggle_d[in_ep_index_d] = 1'b1;
		else if ((in_xact_state == 3'd5) && ack_received)
			data_toggle_d[in_ep_index] = ~data_toggle_q[in_ep_index];
		if (in_datatog_we_i)
			data_toggle_d = (data_toggle_d & ~in_datatog_mask_i) | (in_datatog_status_i & in_datatog_mask_i);
	end
	assign in_data_toggle_o = data_toggle_q;
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni)
			data_toggle_q <= 1'sb0;
		else if (link_reset_i)
			data_toggle_q <= 1'sb0;
		else
			data_toggle_q <= data_toggle_d;
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni)
			in_ep_data_get_o <= 1'b0;
		else if ((in_xact_state == 3'd2) && tx_data_get_i)
			in_ep_data_get_o <= 1'b1;
		else
			in_ep_data_get_o <= 1'b0;
	assign event_timeout_in_o = ((in_xact_state == 3'd4) || (((in_xact_state == 3'd5) && rx_pkt_end_i) && !nak_received)) & rollback_in_xact;
	assign event_nak_in_o = (in_xact_state == 3'd5) && nak_received;
	reg event_nodata_in_q;
	always @(posedge clk_48mhz_i or negedge rst_ni)
		if (!rst_ni)
			event_nodata_in_q <= 1'b0;
		else
			event_nodata_in_q <= in_starting & (ep_in_hw ? !in_ep_has_data_i[in_ep_index_d] : 1'b0);
	assign event_nodata_in_o = event_nodata_in_q;
	initial _sv2v_0 = 0;
endmodule
