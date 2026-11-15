module rtlpp_02912(
  input aclk,
  input aresetn,
  
  // Slave Interface Write Address Ports
  input [11:0] s_axi_awid,
  input [31:0] s_axi_awaddr,
  input [3:0] s_axi_awlen,
  input [2:0] s_axi_awsize,
  input [1:0] s_axi_awburst,
  input [1:0] s_axi_awlock,
  input [3:0] s_axi_awcache,
  input [2:0] s_axi_awprot,
  input [3:0] s_axi_awqos,
  input s_axi_awvalid,
  output s_axi_awready,

  // Slave Interface Write Data Ports
  input [11:0] s_axi_wid,
  input [31:0] s_axi_wdata,
  input [3:0] s_axi_wstrb,
  input s_axi_wlast,
  input s_axi_wvalid,
  output s_axi_wready,

  // Slave Interface Write Response Ports
  output [11:0] s_axi_bid,
  output [1:0] s_axi_bresp,
  output s_axi_bvalid,
  input s_axi_bready,

  // Slave Interface Read Address Ports
  input [11:0] s_axi_arid,
  input [31:0] s_axi_araddr,
  input [3:0] s_axi_arlen,
  input [2:0] s_axi_arsize,
  input [1:0] s_axi_arburst,
  input [1:0] s_axi_arlock,
  input [3:0] s_axi_arcache,
  input [2:0] s_axi_arprot,
  input [3:0] s_axi_arqos,
  input s_axi_arvalid,
  output s_axi_arready,

  // Slave Interface Read Data Ports
  output [11:0] s_axi_rid,
  output [31:0] s_axi_rdata,
  output [1:0] s_axi_rresp,
  output s_axi_rlast,
  output s_axi_rvalid,
  input s_axi_rready,

  // Master Interface Write Address Ports
  output [31:0] m_axi_awaddr,
  output [2:0] m_axi_awprot,
  output m_axi_awvalid,
  input m_axi_awready,

  // Master Interface Write Data Ports
  output [31:0] m_axi_wdata,
  output [3:0] m_axi_wstrb,
  output m_axi_wvalid,
  input m_axi_wready,

  // Master Interface Write Response Ports
  input [1:0] m_axi_bresp,
  input m_axi_bvalid,
  output m_axi_bready,

  // Master Interface Read Address Ports
  output [31:0] m_axi_araddr,
  output [2:0] m_axi_arprot,
  output m_axi_arvalid,
  input m_axi_arready,

  // Master Interface Read Data Ports
  input [31:0] m_axi_rdata,
  input [1:0] m_axi_rresp,
  input m_axi_rvalid,
  output m_axi_rready
);
  // Write address handshake
  assign s_axi_awready = m_axi_awready;
  assign m_axi_awaddr = s_axi_awaddr;
  assign m_axi_awprot = s_axi_awprot;
  assign m_axi_awvalid = s_axi_awvalid;

  // Write data handshake
  assign s_axi_wready = m_axi_wready;
  assign m_axi_wdata = s_axi_wdata;
  assign m_axi_wstrb = s_axi_wstrb;
  assign m_axi_wvalid = s_axi_wvalid;

  // Write response handshake
  assign s_axi_bid = s_axi_awid;
  assign s_axi_bresp = m_axi_bresp;
  assign s_axi_bvalid = m_axi_bvalid;
  assign m_axi_bready = s_axi_bready;

  // Read address handshake
  assign s_axi_arready = m_axi_arready;
  assign m_axi_araddr = s_axi_araddr;
  assign m_axi_arprot = s_axi_arprot;
  assign m_axi_arvalid = s_axi_arvalid;

  // Read data handshake
  assign s_axi_rid = s_axi_arid;
  assign s_axi_rdata = m_axi_rdata;
  assign s_axi_rresp = m_axi_rresp;
  assign s_axi_rlast = 1'b1; // Assuming single beat transfers
  assign s_axi_rvalid = m_axi_rvalid;
  assign m_axi_rready = s_axi_rready;

endmodule