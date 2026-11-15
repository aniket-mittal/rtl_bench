module autovcoder_087337 (
    // clock and reset
    input wire clk156,
    input wire rstn156,
    input wire rst_sw156,

    // AXI-S slave interface
    input  wire [63:0] s_axis_tdata,
    input  wire [ 7:0] s_axis_tkeep,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,
    input  wire [24:0] s_axis_tuser,

    // AXI-S master interface
    output reg  [63:0] m_axis_tdata,
    output reg  [ 7:0] m_axis_tkeep,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready,
    output reg  [52:0] m_axis_tuser
);

  // pass through AXI-Stream tready singal
  assign s_axis_tready = m_axis_tready;

  // inter-packet cycles counter
  reg [27:0] cntr_inter_packet_cycles;

  // inter-packet cycles
  reg [27:0] inter_packet_cycles;

  // flag determining whether there is currently a packet transfer active on
  // the AXI-Stream interface
  reg axis_active;

  always @(posedge clk156) begin
    if (~rstn156 | rst_sw156) begin
      m_axis_tdata <= 64'b0;
      m_axis_tkeep <= 8'b0;
      m_axis_tvalid <= 1'b0;
      m_axis_tlast <= 1'b0;
      m_axis_tuser <= 53'b0;

      cntr_inter_packet_cycles <= 28'b0;
      inter_packet_cycles <= 28'b0;
      axis_active <= 1'b0;
    end else begin
      if (m_axis_tready) begin
        // AXI4-Stream slave is ready to receive data
        m_axis_tdata  <= s_axis_tdata;
        m_axis_tkeep  <= s_axis_tkeep;
        m_axis_tvalid <= s_axis_tvalid;
        m_axis_tlast  <= s_axis_tlast;

        if (s_axis_tvalid & ~axis_active) begin
          // this transfer starts a new packet. record inter-packet arrival
          // time
          inter_packet_cycles <= cntr_inter_packet_cycles + 28'b1;
          cntr_inter_packet_cycles <= 28'b0;

          // output inter-packet time in TUSER, if this is the last word of
          // the packet
          if (s_axis_tlast) begin
            m_axis_tuser <= {cntr_inter_packet_cycles + 28'b1, s_axis_tuser};
          end else begin
            m_axis_tuser <= 53'b0;
          end
        end else begin
          // this transfer does not start a new packet, keep inter-packet
          // arrival time
          inter_packet_cycles <= inter_packet_cycles;
          cntr_inter_packet_cycles <= cntr_inter_packet_cycles + 28'b1;

          // output inter-packet time in tuser, if this is the last word of
          // the packet
          if (s_axis_tlast) begin
            m_axis_tuser <= {inter_packet_cycles, s_axis_tuser};
          end else begin
            m_axis_tuser <= 53'b0;
          end
        end

        // does this word end the current transfer?
        axis_active <= s_axis_tvalid ? ~s_axis_tlast : axis_active;
      end else begin
        // AXI4-Stream slave currently not ready to receive data
        m_axis_tdata <= m_axis_tdata;
        m_axis_tkeep <= m_axis_tkeep;
        m_axis_tvalid <= m_axis_tvalid;
        m_axis_tlast <= m_axis_tlast;
        m_axis_tuser <= m_axis_tuser;

        inter_packet_cycles <= inter_packet_cycles;
        cntr_inter_packet_cycles <= cntr_inter_packet_cycles + 28'b1;
      end
    end
  end

endmodule

