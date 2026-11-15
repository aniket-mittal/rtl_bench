module rtlpp_02867 (
  input aclk,
  input aresetn,
  input [31:0] s_axi_awaddr,
  input [7:0] s_axi_awlen,
  input [2:0] s_axi_awsize,
  input [1:0] s_axi_awburst,
  input [0:0] s_axi_awlock,
  input [3:0] s_axi_awcache,
  input [2:0] s_axi_awprot,
  input [3:0] s_axi_awregion,
  input [3:0] s_axi_awqos,
  input s_axi_awvalid,
  output s_axi_awready,
  input [31:0] s_axi_wdata,
  input [3:0] s_axi_wstrb,
  input s_axi_wlast,
  input s_axi_wvalid,
  output s_axi_wready,
  output [1:0] s_axi_bresp,
  output s_axi_bvalid,
  input s_axi_bready,
  input [31:0] s_axi_araddr,
  input [7:0] s_axi_arlen,
  input [2:0] s_axi_arsize,
  input [1:0] s_axi_arburst,
  input [0:0] s_axi_arlock,
  input [3:0] s_axi_arcache,
  input [2:0] s_axi_arprot,
  input [3:0] s_axi_arregion,
  input [3:0] s_axi_arqos,
  input s_axi_arvalid,
  output s_axi_arready,
  output [31:0] s_axi_rdata,
  output [1:0] s_axi_rresp,
  output s_axi_rlast,
  output s_axi_rvalid,
  input s_axi_rready,
  output [31:0] m_axi_awaddr,
  output [2:0] m_axi_awprot,
  output m_axi_awvalid,
  input m_axi_awready,
  output [31:0] m_axi_wdata,
  output [3:0] m_axi_wstrb,
  output m_axi_wvalid,
  input m_axi_wready,
  input [1:0] m_axi_bresp,
  input m_axi_bvalid,
  output m_axi_bready,
  output [31:0] m_axi_araddr,
  output [2:0] m_axi_arprot,
  output m_axi_arvalid,
  input m_axi_arready,
  input [31:0] m_axi_rdata,
  input [1:0] m_axi_rresp,
  input m_axi_rvalid,
  output m_axi_rready
);

  // Internal signals for simple pass-through logic
  assign s_axi_awready = m_axi_awready;
  assign m_axi_awaddr = s_axi_awaddr;
  assign m_axi_awprot = s_axi_awprot;
  assign m_axi_awvalid = s_axi_awvalid;

  assign s_axi_wready = m_axi_wready;
  assign m_axi_wdata = s_axi_wdata;
  assign m_axi_wstrb = s_axi_wstrb;
  assign m_axi_wvalid = s_axi_wvalid;

  assign s_axi_bresp = m_axi_bresp;
  assign s_axi_bvalid = m_axi_bvalid;
  assign m_axi_bready = s_axi_bready;

  assign s_axi_arready = m_axi_arready;
  assign m_axi_araddr = s_axi_araddr;
  assign m_axi_arprot = s_axi_arprot;
  assign m_axi_arvalid = s_axi_arvalid;

  assign s_axi_rdata = m_axi_rdata;
  assign s_axi_rresp = m_axi_rresp;
  assign s_axi_rlast = m_axi_rvalid;
  assign s_axi_rvalid = m_axi_rvalid;
  assign m_axi_rready = s_axi_rready;

endmodule