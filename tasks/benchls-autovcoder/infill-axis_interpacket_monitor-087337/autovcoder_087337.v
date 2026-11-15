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

  [MASKED]

endmodule

