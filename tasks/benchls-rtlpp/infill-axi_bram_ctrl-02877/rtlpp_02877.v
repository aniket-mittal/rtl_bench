module rtlpp_02877(
  input s_axi_aclk,
  input s_axi_aresetn,
  input [11:0] s_axi_awid,
  input [12:0] s_axi_awaddr,
  input [7:0] s_axi_awlen,
  input [2:0] s_axi_awsize,
  input [1:0] s_axi_awburst,
  input s_axi_awlock,
  input [3:0] s_axi_awcache,
  input [2:0] s_axi_awprot,
  input s_axi_awvalid,
  output reg s_axi_awready,
  input [31:0] s_axi_wdata,
  input [3:0] s_axi_wstrb,
  input s_axi_wlast,
  input s_axi_wvalid,
  output reg s_axi_wready,
  output reg [11:0] s_axi_bid,
  output reg [1:0] s_axi_bresp,
  output reg s_axi_bvalid,
  input s_axi_bready,
  input [11:0] s_axi_arid,
  input [12:0] s_axi_araddr,
  input [7:0] s_axi_arlen,
  input [2:0] s_axi_arsize,
  input [1:0] s_axi_arburst,
  input s_axi_arlock,
  input [3:0] s_axi_arcache,
  input [2:0] s_axi_arprot,
  input s_axi_arvalid,
  output reg s_axi_arready,
  output reg [11:0] s_axi_rid,
  output reg [31:0] s_axi_rdata,
  output reg [1:0] s_axi_rresp,
  output reg s_axi_rlast,
  output reg s_axi_rvalid,
  input s_axi_rready,
  output reg bram_rst_a,
  output reg bram_clk_a,
  output reg bram_en_a,
  output reg [3:0] bram_we_a,
  output reg [12:0] bram_addr_a,
  output reg [31:0] bram_wrdata_a,
  input [31:0] bram_rddata_a
);

  // Internal signals
  reg [12:0] internal_addr;
  reg [31:0] internal_data;
  reg [3:0] internal_we;
  reg [7:0] burst_counter;
  reg rdata_valid;

  [MASKED]

endmodule