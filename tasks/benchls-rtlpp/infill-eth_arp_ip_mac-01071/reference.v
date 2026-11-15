module rtlpp_01071
(
    input  wire        clk,
    input  wire        rst,

    input  wire        s_eth_hdr_valid,
    output wire        s_eth_hdr_ready,
    input  wire [47:0] s_eth_dest_mac,
    input  wire [47:0] s_eth_src_mac,
    input  wire [15:0] s_eth_type,
    input  wire [7:0]  s_eth_payload_axis_tdata,
    input  wire        s_eth_payload_axis_tvalid,
    output wire        s_eth_payload_axis_tready,
    input  wire        s_eth_payload_axis_tlast,
    input  wire        s_eth_payload_axis_tuser,

    output wire        m_eth_hdr_valid,
    input  wire        m_eth_hdr_ready,
    output wire [47:0] m_eth_dest_mac,
    output wire [47:0] m_eth_src_mac,
    output wire [15:0] m_eth_type,
    output wire [7:0]  m_eth_payload_axis_tdata,
    output wire        m_eth_payload_axis_tvalid,
    input  wire        m_eth_payload_axis_tready,
    output wire        m_eth_payload_axis_tlast,
    output wire        m_eth_payload_axis_tuser,

    output wire        arp_request_valid,
    input  wire        arp_request_ready,
    output wire [31:0] arp_request_ip,
    input  wire        arp_response_valid,
    output wire        arp_response_ready,
    input  wire        arp_response_error,
    input  wire [47:0] arp_response_mac,

    input  wire        s_ip_hdr_valid,
    output wire        s_ip_hdr_ready,
    input  wire [5:0]  s_ip_dscp,
    input  wire [1:0]  s_ip_ecn,
    input  wire [15:0] s_ip_length,
    input  wire [7:0]  s_ip_ttl,
    input  wire [7:0]  s_ip_protocol,
    input  wire [31:0] s_ip_source_ip,
    input  wire [31:0] s_ip_dest_ip,
    input  wire [7:0]  s_ip_payload_axis_tdata,
    input  wire        s_ip_payload_axis_tvalid,
    output wire        s_ip_payload_axis_tready,
    input  wire        s_ip_payload_axis_tlast,
    input  wire        s_ip_payload_axis_tuser,

    output wire        m_ip_hdr_valid,
    input  wire        m_ip_hdr_ready,
    output wire [47:0] m_ip_eth_dest_mac,
    output wire [47:0] m_ip_eth_src_mac,
    output wire [15:0] m_ip_eth_type,
    output wire [3:0]  m_ip_version,
    output wire [3:0]  m_ip_ihl,
    output wire [5:0]  m_ip_dscp,
    output wire [1:0]  m_ip_ecn,
    output wire [15:0] m_ip_length,
    output wire [15:0] m_ip_identification,
    output wire [2:0]  m_ip_flags,
    output wire [12:0] m_ip_fragment_offset,
    output wire [7:0]  m_ip_ttl,
    output wire [7:0]  m_ip_protocol,
    output wire [15:0] m_ip_header_checksum,
    output wire [31:0] m_ip_source_ip,
    output wire [31:0] m_ip_dest_ip,
    output wire [7:0]  m_ip_payload_axis_tdata,
    output wire        m_ip_payload_axis_tvalid,
    input  wire        m_ip_payload_axis_tready,
    output wire        m_ip_payload_axis_tlast,
    output wire        m_ip_payload_axis_tuser,

    output wire        rx_busy,
    output wire        tx_busy,
    output wire        rx_error_header_early_termination,
    output wire        rx_error_payload_early_termination,
    output wire        rx_error_invalid_header,
    output wire        rx_error_invalid_checksum,
    output wire        tx_error_payload_early_termination,
    output wire        tx_error_arp_failed,

    input  wire [47:0] local_mac,
    input  wire [31:0] local_ip
);

localparam [1:0]
    STATE_IDLE = 2'd0,
    STATE_ARP_QUERY = 2'd1,
    STATE_WAIT_PACKET = 2'd2;

reg [1:0] state_reg, state_next;

reg outgoing_ip_hdr_valid_reg, outgoing_ip_hdr_valid_next;
wire outgoing_ip_hdr_ready;
reg [47:0] outgoing_eth_dest_mac_reg, outgoing_eth_dest_mac_next;
wire outgoing_ip_payload_axis_tready;

reg s_ip_hdr_ready_reg, s_ip_hdr_ready_next;

reg arp_request_valid_reg, arp_request_valid_next;

reg arp_response_ready_reg, arp_response_ready_next;

reg drop_packet_reg, drop_packet_next;

assign s_ip_hdr_ready = s_ip_hdr_ready_reg;
assign s_ip_payload_axis_tready = outgoing_ip_payload_axis_tready || drop_packet_reg;

assign arp_request_valid = arp_request_valid_reg;
assign arp_request_ip = s_ip_dest_ip;
assign arp_response_ready = arp_response_ready_reg;

assign tx_error_arp_failed = arp_response_error;

always @* begin
    state_next = STATE_IDLE;

    arp_request_valid_next = arp_request_valid_reg && !arp_request_ready;
    arp_response_ready_next = 1'b0;
    drop_packet_next = 1'b0;

    s_ip_hdr_ready_next = 1'b0;

    outgoing_ip_hdr_valid_next = outgoing_ip_hdr_valid_reg && !outgoing_ip_hdr_ready;
    outgoing_eth_dest_mac_next = outgoing_eth_dest_mac_reg;

    case (state_reg)
        STATE_IDLE: begin
            if (s_ip_hdr_valid) begin
                arp_request_valid_next = 1'b1;
                arp_response_ready_next = 1'b1;
                state_next = STATE_ARP_QUERY;
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_ARP_QUERY: begin
            arp_response_ready_next = 1'b1;

            if (arp_response_valid) begin
                if (arp_response_error) begin
                    s_ip_hdr_ready_next = 1'b1;
                    drop_packet_next = 1'b1;
                    state_next = STATE_WAIT_PACKET;
                end else begin
                    s_ip_hdr_ready_next = 1'b1;
                    outgoing_ip_hdr_valid_next = 1'b1;
                    outgoing_eth_dest_mac_next = arp_response_mac;
                    state_next = STATE_WAIT_PACKET;
                end
            end else begin
                state_next = STATE_ARP_QUERY;
            end
        end
        STATE_WAIT_PACKET: begin
            drop_packet_next = drop_packet_reg;

            if (s_ip_payload_axis_tlast && s_ip_payload_axis_tready && s_ip_payload_axis_tvalid) begin
                state_next = STATE_IDLE;
            end else begin
                state_next = STATE_WAIT_PACKET;
            end
        end
    endcase
end

always @(posedge clk) begin
    if (rst) begin
        state_reg <= STATE_IDLE;
        arp_request_valid_reg <= 1'b0;
        arp_response_ready_reg <= 1'b0;
        drop_packet_reg <= 1'b0;
        s_ip_hdr_ready_reg <= 1'b0;
        outgoing_eth_dest_mac_reg <= 48'h000000000000;
        outgoing_ip_hdr_valid_reg <= 1'b0;
    end else begin
        state_reg <= state_next;

        arp_request_valid_reg <= arp_request_valid_next;
        arp_response_ready_reg <= arp_response_ready_next;
        drop_packet_reg <= drop_packet_next;

        s_ip_hdr_ready_reg <= s_ip_hdr_ready_next;

        outgoing_ip_hdr_valid_reg <= outgoing_ip_hdr_valid_next;
        outgoing_eth_dest_mac_reg <= outgoing_eth_dest_mac_next;
    end
end

endmodule