module rtlpp_02530 (
  input aclk,
  input aresetn,
  input [31:0] S00_AXI_araddr,
  input [7:0] S00_AXI_arlen,
  input [2:0] S00_AXI_arsize,
  input [1:0] S00_AXI_arburst,
  input [0:0] S00_AXI_arlock,
  input [3:0] S00_AXI_arcache,
  input [2:0] S00_AXI_arprot,
  input [3:0] S00_AXI_arqos,
  input S00_AXI_arvalid,
  output S00_AXI_arready,
  output [63:0] S00_AXI_rdata,
  output [1:0] S00_AXI_rresp,
  output S00_AXI_rlast,
  output S00_AXI_rvalid,
  input S00_AXI_rready,
  input [31:0] S01_AXI_awaddr,
  input [7:0] S01_AXI_awlen,
  input [2:0] S01_AXI_awsize,
  input [1:0] S01_AXI_awburst,
  input [0:0] S01_AXI_awlock,
  input [3:0] S01_AXI_awcache,
  input [2:0] S01_AXI_awprot,
  input [3:0] S01_AXI_awqos,
  input S01_AXI_awvalid,
  output S01_AXI_awready,
  input [63:0] S01_AXI_wdata,
  input [7:0] S01_AXI_wstrb,
  input S01_AXI_wlast,
  input S01_AXI_wvalid,
  output S01_AXI_wready,
  output [1:0] S01_AXI_bresp,
  output S01_AXI_bvalid,
  input S01_AXI_bready,
  output [48:0] M00_AXI_awaddr,
  output [7:0] M00_AXI_awlen,
  output [2:0] M00_AXI_awsize,
  output [1:0] M00_AXI_awburst,
  output [0:0] M00_AXI_awlock,
  output [3:0] M00_AXI_awcache,
  output [2:0] M00_AXI_awprot,
  output [3:0] M00_AXI_awqos,
  output M00_AXI_awvalid,
  input M00_AXI_awready,
  output [63:0] M00_AXI_wdata,
  output [7:0] M00_AXI_wstrb,
  output M00_AXI_wlast,
  output M00_AXI_wvalid,
  input M00_AXI_wready,
  input [1:0] M00_AXI_bresp,
  input M00_AXI_bvalid,
  output M00_AXI_bready,
  output [48:0] M00_AXI_araddr,
  output [7:0] M00_AXI_arlen,
  output [2:0] M00_AXI_arsize,
  output [1:0] M00_AXI_arburst,
  output [0:0] M00_AXI_arlock,
  output [3:0] M00_AXI_arcache,
  output [2:0] M00_AXI_arprot,
  output [3:0] M00_AXI_arqos,
  output M00_AXI_arvalid,
  input M00_AXI_arready,
  input [63:0] M00_AXI_rdata,
  input [1:0] M00_AXI_rresp,
  input M00_AXI_rlast,
  input M00_AXI_rvalid,
  output M00_AXI_rready
);
  // Internal signals and registers
  reg r_S00_AXI_arready;
  reg [63:0] r_S00_AXI_rdata;
  reg [1:0] r_S00_AXI_rresp;
  reg r_S00_AXI_rlast;
  reg r_S00_AXI_rvalid;
  reg r_S01_AXI_awready;
  reg r_S01_AXI_wready;
  reg [1:0] r_S01_AXI_bresp;
  reg r_S01_AXI_bvalid;
  reg [48:0] r_M00_AXI_awaddr;
  reg [7:0] r_M00_AXI_awlen;
  reg [2:0] r_M00_AXI_awsize;
  reg [1:0] r_M00_AXI_awburst;
  reg [0:0] r_M00_AXI_awlock;
  reg [3:0] r_M00_AXI_awcache;
  reg [2:0] r_M00_AXI_awprot;
  reg [3:0] r_M00_AXI_awqos;
  reg r_M00_AXI_awvalid;
  reg [63:0] r_M00_AXI_wdata;
  reg [7:0] r_M00_AXI_wstrb;
  reg r_M00_AXI_wlast;
  reg r_M00_AXI_wvalid;
  reg r_M00_AXI_bready;
  reg [48:0] r_M00_AXI_araddr;
  reg [7:0] r_M00_AXI_arlen;
  reg [2:0] r_M00_AXI_arsize;
  reg [1:0] r_M00_AXI_arburst;
  reg [0:0] r_M00_AXI_arlock;
  reg [3:0] r_M00_AXI_arcache;
  reg [2:0] r_M00_AXI_arprot;
  reg [3:0] r_M00_AXI_arqos;
  reg r_M00_AXI_arvalid;
  reg r_M00_AXI_rready;

  assign S00_AXI_arready = r_S00_AXI_arready;
  assign S00_AXI_rdata = r_S00_AXI_rdata;
  assign S00_AXI_rresp = r_S00_AXI_rresp;
  assign S00_AXI_rlast = r_S00_AXI_rlast;
  assign S00_AXI_rvalid = r_S00_AXI_rvalid;
  assign S01_AXI_awready = r_S01_AXI_awready;
  assign S01_AXI_wready = r_S01_AXI_wready;
  assign S01_AXI_bresp = r_S01_AXI_bresp;
  assign S01_AXI_bvalid = r_S01_AXI_bvalid;
  assign M00_AXI_awaddr = r_M00_AXI_awaddr;
  assign M00_AXI_awlen = r_M00_AXI_awlen;
  assign M00_AXI_awsize = r_M00_AXI_awsize;
  assign M00_AXI_awburst = r_M00_AXI_awburst;
  assign M00_AXI_awlock = r_M00_AXI_awlock;
  assign M00_AXI_awcache = r_M00_AXI_awcache;
  assign M00_AXI_awprot = r_M00_AXI_awprot;
  assign M00_AXI_awqos = r_M00_AXI_awqos;
  assign M00_AXI_awvalid = r_M00_AXI_awvalid;
  assign M00_AXI_wdata = r_M00_AXI_wdata;
  assign M00_AXI_wstrb = r_M00_AXI_wstrb;
  assign M00_AXI_wlast = r_M00_AXI_wlast;
  assign M00_AXI_wvalid = r_M00_AXI_wvalid;
  assign M00_AXI_bready = r_M00_AXI_bready;
  assign M00_AXI_araddr = r_M00_AXI_araddr;
  assign M00_AXI_arlen = r_M00_AXI_arlen;
  assign M00_AXI_arsize = r_M00_AXI_arsize;
  assign M00_AXI_arburst = r_M00_AXI_arburst;
  assign M00_AXI_arlock = r_M00_AXI_arlock;
  assign M00_AXI_arcache = r_M00_AXI_arcache;
  assign M00_AXI_arprot = r_M00_AXI_arprot;
  assign M00_AXI_arqos = r_M00_AXI_arqos;
  assign M00_AXI_arvalid = r_M00_AXI_arvalid;
  assign M00_AXI_rready = r_M00_AXI_rready;

  // Reset logic and example implementation of some functionality (can be modified)
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      r_S00_AXI_arready <= 1'b0;
      r_S00_AXI_rdata <= 64'b0;
      r_S00_AXI_rresp <= 2'b0;
      r_S00_AXI_rlast <= 1'b0;
      r_S00_AXI_rvalid <= 1'b0;
      r_S01_AXI_awready <= 1'b0;
      r_S01_AXI_wready <= 1'b0;
      r_S01_AXI_bresp <= 2'b0;
      r_S01_AXI_bvalid <= 1'b0;
      r_M00_AXI_awaddr <= 49'b0;
      r_M00_AXI_awlen <= 8'b0;
      r_M00_AXI_awsize <= 3'b0;
      r_M00_AXI_awburst <= 2'b0;
      r_M00_AXI_awlock <= 1'b0;
      r_M00_AXI_awcache <= 4'b0;
      r_M00_AXI_awprot <= 3'b0;
      r_M00_AXI_awqos <= 4'b0;
      r_M00_AXI_awvalid <= 1'b0;
      r_M00_AXI_wdata <= 64'b0;
      r_M00_AXI_wstrb <= 8'b0;
      r_M00_AXI_wlast <= 1'b0;
      r_M00_AXI_wvalid <= 1'b0;
      r_M00_AXI_bready <= 1'b0;
      r_M00_AXI_araddr <= 49'b0;
      r_M00_AXI_arlen <= 8'b0;
      r_M00_AXI_arsize <= 3'b0;
      r_M00_AXI_arburst <= 2'b0;
      r_M00_AXI_arlock <= 1'b0;
      r_M00_AXI_arcache <= 4'b0;
      r_M00_AXI_arprot <= 3'b0;
      r_M00_AXI_arqos <= 4'b0;
      r_M00_AXI_arvalid <= 1'b0;
      r_M00_AXI_rready <= 1'b0;
    end else begin
      // Implement the actual logic of the module here
    end
  end

endmodule