module autovcoder_031081 #(
    parameter C_s_axis_TDATA_WIDTH = 32,
    parameter C_m_axis_TDATA_WIDTH = 32,
    parameter C_m_axis_START_COUNT = 32,
    parameter C_S_AXIS_RXS_TDATA_WIDTH = 32,
    parameter C_M_AXIS_TXC_TDATA_WIDTH = 32,
    parameter C_m_axis_txc_START_COUNT = 32,
    parameter ENABLE_LEN = 1
) (

    // Ports of Axi Master Bus Interface m_axis
    input        m_axis_txd_tvalid,
    input        m_axis_txd_tlast,
    input        m_axis_txd_tready,
    input [11:0] tx_pkt_byte_cnt,
    input        tx_pkt_byte_cnt_vld,

    input                                       s_axis_rxs_aclk,
    input                                       s_axis_rxs_aresetn,
    output                                      s_axis_rxs_tready,
    input  [    C_S_AXIS_RXS_TDATA_WIDTH-1 : 0] s_axis_rxs_tdata,
    input  [(C_S_AXIS_RXS_TDATA_WIDTH/8)-1 : 0] s_axis_rxs_tkeep,
    input                                       s_axis_rxs_tlast,
    input                                       s_axis_rxs_tvalid,

    input                                           m_axis_txc_aclk,
    input                                           m_axis_txc_aresetn,
    output reg                                      m_axis_txc_tvalid,
    output reg [    C_M_AXIS_TXC_TDATA_WIDTH-1 : 0] m_axis_txc_tdata,
    output reg [(C_M_AXIS_TXC_TDATA_WIDTH/8)-1 : 0] m_axis_txc_tkeep,
    output reg                                      m_axis_txc_tlast,
    input                                           m_axis_txc_tready
);

  reg [2:0] tx_ctrl_state;
  localparam WAIT_FOR_REQ = 1, SEND_CTRL_PKTS = 2, WAIT_FOR_NXT = 4;

  reg [7:0] send_ctrl_words;
  localparam WORD0 = 1, WORD1 = 2, WORD2 = 4, WORD3 = 8, WORD4 = 16, WORD5 = 32;

  assign s_axis_rxs_tready = 1'b1;


  reg len_fifo_rd_en;
  wire [11:0] len_fifo_dout;
  generate
    if (ENABLE_LEN) begin

    end else begin
      assign len_fifo_dout = 12'hFFF;
    end
  endgenerate

  [MASKED]
endmodule

