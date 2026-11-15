module rtlpp_04362 (
  input s_axi_lite_aclk,
  input m_axi_s2mm_aclk,
  input axi_resetn,
  input s_axi_lite_awvalid,
  output reg s_axi_lite_awready,
  input [9:0] s_axi_lite_awaddr,
  input s_axi_lite_wvalid,
  output reg s_axi_lite_wready,
  input [31:0] s_axi_lite_wdata,
  output reg [1:0] s_axi_lite_bresp,
  output reg s_axi_lite_bvalid,
  input s_axi_lite_bready,
  input s_axi_lite_arvalid,
  output reg s_axi_lite_arready,
  input [9:0] s_axi_lite_araddr,
  output reg s_axi_lite_rvalid,
  input s_axi_lite_rready,
  output reg [31:0] s_axi_lite_rdata,
  output reg [1:0] s_axi_lite_rresp,
  output reg [31:0] m_axi_s2mm_awaddr,
  output reg [7:0] m_axi_s2mm_awlen,
  output reg [2:0] m_axi_s2mm_awsize,
  output reg [1:0] m_axi_s2mm_awburst,
  output reg [2:0] m_axi_s2mm_awprot,
  output reg [3:0] m_axi_s2mm_awcache,
  output reg m_axi_s2mm_awvalid,
  input m_axi_s2mm_awready,
  output reg [31:0] m_axi_s2mm_wdata,
  output reg [3:0] m_axi_s2mm_wstrb,
  output reg m_axi_s2mm_wlast,
  output reg m_axi_s2mm_wvalid,
  input m_axi_s2mm_wready,
  input [1:0] m_axi_s2mm_bresp,
  input m_axi_s2mm_bvalid,
  output reg m_axi_s2mm_bready,
  output reg s2mm_prmry_reset_out_n,
  input [31:0] s_axis_s2mm_tdata,
  input [3:0] s_axis_s2mm_tkeep,
  input s_axis_s2mm_tvalid,
  output reg s_axis_s2mm_tready,
  input s_axis_s2mm_tlast,
  output reg s2mm_introut,
  output reg [31:0] axi_dma_tstvec
);

  reg [31:0] awaddr_reg;
  reg [31:0] araddr_reg;
  reg [31:0] wdata_reg;
  reg [31:0] rdata_reg;
  reg [3:0] wstrb_reg;
  reg awvalid_reg, arvalid_reg, wvalid_reg, bready_reg;
  reg awready_reg, arready_reg, wready_reg, bvalid_reg, rvalid_reg;
  
  [MASKED]
endmodule