module rtlpp_03555 (
  input aclk,
  input aresetn,
  input [1:0] s_axi_awid,
  input [63:0] s_axi_awaddr,
  input [15:0] s_axi_awlen,
  input [5:0] s_axi_awsize,
  input [3:0] s_axi_awburst,
  input [1:0] s_axi_awlock,
  input [7:0] s_axi_awcache,
  input [5:0] s_axi_awprot,
  input [7:0] s_axi_awqos,
  input [1:0] s_axi_awvalid,
  output [1:0] s_axi_awready,
  input [127:0] s_axi_wdata,
  input [15:0] s_axi_wstrb,
  input [1:0] s_axi_wlast,
  input [1:0] s_axi_wvalid,
  output [1:0] s_axi_wready,
  output [1:0] s_axi_bid,
  output [3:0] s_axi_bresp,
  output [1:0] s_axi_bvalid,
  input [1:0] s_axi_bready,
  input [1:0] s_axi_arid,
  input [63:0] s_axi_araddr,
  input [15:0] s_axi_arlen,
  input [5:0] s_axi_arsize,
  input [3:0] s_axi_arburst,
  input [1:0] s_axi_arlock,
  input [7:0] s_axi_arcache,
  input [5:0] s_axi_arprot,
  input [7:0] s_axi_arqos,
  input [1:0] s_axi_arvalid,
  output [1:0] s_axi_arready,
  output [1:0] s_axi_rid,
  output [127:0] s_axi_rdata,
  output [3:0] s_axi_rresp,
  output [1:0] s_axi_rlast,
  output [1:0] s_axi_rvalid,
  input [1:0] s_axi_rready,
  output [0:0] m_axi_awid,
  output [31:0] m_axi_awaddr,
  output [7:0] m_axi_awlen,
  output [2:0] m_axi_awsize,
  output [1:0] m_axi_awburst,
  output [0:0] m_axi_awlock,
  output [3:0] m_axi_awcache,
  output [2:0] m_axi_awprot,
  output [3:0] m_axi_awregion,
  output [3:0] m_axi_awqos,
  output [0:0] m_axi_awvalid,
  input [0:0] m_axi_awready,
  output [63:0] m_axi_wdata,
  output [7:0] m_axi_wstrb,
  output [0:0] m_axi_wlast,
  output [0:0] m_axi_wvalid,
  input [0:0] m_axi_wready,
  input [0:0] m_axi_bid,
  input [1:0] m_axi_bresp,
  input [0:0] m_axi_bvalid,
  output [0:0] m_axi_bready,
  output [0:0] m_axi_arid,
  output [31:0] m_axi_araddr,
  output [7:0] m_axi_arlen,
  output [2:0] m_axi_arsize,
  output [1:0] m_axi_arburst,
  output [0:0] m_axi_arlock,
  output [3:0] m_axi_arcache,
  output [2:0] m_axi_arprot,
  output [3:0] m_axi_arregion,
  output [3:0] m_axi_arqos,
  output [0:0] m_axi_arvalid,
  input [0:0] m_axi_arready,
  input [0:0] m_axi_rid,
  input [63:0] m_axi_rdata,
  input [1:0] m_axi_rresp,
  input [0:0] m_axi_rlast,
  input [0:0] m_axi_rvalid,
  output [0:0] m_axi_rready
);

// Internal logic
// Crossbar switch functionality and other required logic go here.

assign s_axi_awready = 1'b0;
assign s_axi_wready = 1'b0;
assign s_axi_bid = 2'b00;
assign s_axi_bresp = 4'b0000;
assign s_axi_bvalid = 2'b00;
assign s_axi_arready = 1'b0;
assign s_axi_rid = 2'b00;
assign s_axi_rdata = 128'b0;
assign s_axi_rresp = 4'b0000;
assign s_axi_rlast = 2'b00;
assign s_axi_rvalid = 2'b00;
assign m_axi_awid = 1'b0;
assign m_axi_awaddr = 32'b0;
assign m_axi_awlen = 8'b0;
assign m_axi_awsize = 3'b0;
assign m_axi_awburst = 2'b0;
assign m_axi_awlock = 1'b0;
assign m_axi_awcache = 4'b0;
assign m_axi_awprot = 3'b0;
assign m_axi_awregion = 4'b0;
assign m_axi_awqos = 4'b0;
assign m_axi_awvalid = 1'b0;
assign m_axi_wdata = 64'b0;
assign m_axi_wstrb = 8'b0;
assign m_axi_wlast = 1'b0;
assign m_axi_wvalid = 1'b0;
assign m_axi_bready = 1'b0;
assign m_axi_arid = 1'b0;
assign m_axi_araddr = 32'b0;
assign m_axi_arlen = 8'b0;
assign m_axi_arsize = 3'b0;
assign m_axi_arburst = 2'b0;
assign m_axi_arlock = 1'b0;
assign m_axi_arcache = 4'b0;
assign m_axi_arprot = 3'b0;
assign m_axi_arregion = 4'b0;
assign m_axi_arqos = 4'b0;
assign m_axi_arvalid = 1'b0;
assign m_axi_rready = 1'b0;

endmodule