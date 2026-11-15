module rtlpp_06612(
  aclk, aresetn, s_axi_awid, s_axi_awaddr,
  s_axi_awlen, s_axi_awsize, s_axi_awburst, s_axi_awlock, s_axi_awcache, s_axi_awprot,
  s_axi_awregion, s_axi_awqos, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb,
  s_axi_wlast, s_axi_wvalid, s_axi_wready, s_axi_bid, s_axi_bresp, s_axi_bvalid, s_axi_bready,
  s_axi_arid, s_axi_araddr, s_axi_arlen, s_axi_arsize, s_axi_arburst, s_axi_arlock,
  s_axi_arcache, s_axi_arprot, s_axi_arregion, s_axi_arqos, s_axi_arvalid, s_axi_arready,
  s_axi_rid, s_axi_rdata, s_axi_rresp, s_axi_rlast, s_axi_rvalid, s_axi_rready, m_axi_awid,
  m_axi_awaddr, m_axi_awlen, m_axi_awsize, m_axi_awburst, m_axi_awlock, m_axi_awcache,
  m_axi_awprot, m_axi_awregion, m_axi_awqos, m_axi_awvalid, m_axi_awready, m_axi_wdata,
  m_axi_wstrb, m_axi_wlast, m_axi_wvalid, m_axi_wready, m_axi_bid, m_axi_bresp, m_axi_bvalid,
  m_axi_bready, m_axi_arid, m_axi_araddr, m_axi_arlen, m_axi_arsize, m_axi_arburst,
  m_axi_arlock, m_axi_arcache, m_axi_arprot, m_axi_arregion, m_axi_arqos, m_axi_arvalid,
  m_axi_arready, m_axi_rid, m_axi_rdata, m_axi_rresp, m_axi_rlast, m_axi_rvalid, m_axi_rready
);

input aclk;
input aresetn;
input [2:0] s_axi_awid;
input [38:0] s_axi_awaddr;
input [7:0] s_axi_awlen;
input [2:0] s_axi_awsize;
input [1:0] s_axi_awburst;
input [0:0] s_axi_awlock;
input [3:0] s_axi_awcache;
input [2:0] s_axi_awprot;
input [3:0] s_axi_awregion;
input [3:0] s_axi_awqos;
input s_axi_awvalid;
output s_axi_awready;
input [511:0] s_axi_wdata;
input [63:0] s_axi_wstrb;
input s_axi_wlast;
input s_axi_wvalid;
output s_axi_wready;
output [2:0] s_axi_bid;
output [1:0] s_axi_bresp;
output s_axi_bvalid;
input s_axi_bready;
input [2:0] s_axi_arid;
input [38:0] s_axi_araddr;
input [7:0] s_axi_arlen;
input [2:0] s_axi_arsize;
input [1:0] s_axi_arburst;
input [0:0] s_axi_arlock;
input [3:0] s_axi_arcache;
input [2:0] s_axi_arprot;
input [3:0] s_axi_arregion;
input [3:0] s_axi_arqos;
input s_axi_arvalid;
output s_axi_arready;
output [2:0] s_axi_rid;
output [511:0] s_axi_rdata;
output [1:0] s_axi_rresp;
output s_axi_rlast;
output s_axi_rvalid;
input s_axi_rready;
output [2:0] m_axi_awid;
output [38:0] m_axi_awaddr;
output [7:0] m_axi_awlen;
output [2:0] m_axi_awsize;
output [1:0] m_axi_awburst;
output [0:0] m_axi_awlock;
output [3:0] m_axi_awcache;
output [2:0] m_axi_awprot;
output [3:0] m_axi_awregion;
output [3:0] m_axi_awqos;
output m_axi_awvalid;
input m_axi_awready;
output [511:0] m_axi_wdata;
output [63:0] m_axi_wstrb;
output m_axi_wlast;
output m_axi_wvalid;
input m_axi_wready;
input [2:0] m_axi_bid;
input [1:0] m_axi_bresp;
input m_axi_bvalid;
output m_axi_bready;
output [2:0] m_axi_arid;
output [38:0] m_axi_araddr;
output [7:0] m_axi_arlen;
output [2:0] m_axi_arsize;
output [1:0] m_axi_arburst;
output [0:0] m_axi_arlock;
output [3:0] m_axi_arcache;
output [2:0] m_axi_arprot;
output [3:0] m_axi_arregion;
output [3:0] m_axi_arqos;
output m_axi_arvalid;
input m_axi_arready;
input [2:0] m_axi_rid;
input [511:0] m_axi_rdata;
input [1:0] m_axi_rresp;
input m_axi_rlast;
input m_axi_rvalid;
output m_axi_rready;

// internal signals
reg s_axi_awready_reg, s_axi_wready_reg, s_axi_bvalid_reg, s_axi_arready_reg, s_axi_rvalid_reg;
reg [2:0] s_axi_bid_reg, s_axi_rid_reg;
reg [1:0] s_axi_bresp_reg, s_axi_rresp_reg;
reg [511:0] s_axi_rdata_reg;
reg s_axi_rlast_reg;

// AW Channel
always @(posedge aclk or negedge aresetn) begin
  if (!aresetn) begin
    s_axi_awready_reg <= 0;
  end else begin
    if (s_axi_awvalid && !s_axi_awready) begin
      s_axi_awready_reg <= 1;
    end else if (s_axi_awready && !s_axi_awvalid) begin
      s_axi_awready_reg <= 0;
    end
  end
end

assign s_axi_awready = s_axi_awready_reg;

// W Channel
always @(posedge aclk or negedge aresetn) begin
  if (!aresetn) begin
    s_axi_wready_reg <= 0;
  end else begin
    if (s_axi_wvalid && !s_axi_wready_reg) begin
      s_axi_wready_reg <= 1;
    end else if (s_axi_wready_reg && !s_axi_wvalid) begin
      s_axi_wready_reg <= 0;
    end
  end
end

assign s_axi_wready = s_axi_wready_reg;

// B Channel
always @(posedge aclk or negedge aresetn) begin
  if (!aresetn) begin
    s_axi_bvalid_reg <= 0;
    s_axi_bid_reg <= 0;
    s_axi_bresp_reg <= 0;
  end else begin
    if (s_axi_wlast && s_axi_wvalid && s_axi_wready_reg) begin
      s_axi_bvalid_reg <= 1;
      s_axi_bid_reg <= s_axi_awid;
      s_axi_bresp_reg <= 2'b00;
    end else if (s_axi_bvalid_reg && s_axi_bready) begin
      s_axi_bvalid_reg <= 0;
    end
  end
end

assign s_axi_bvalid = s_axi_bvalid_reg;
assign s_axi_bid = s_axi_bid_reg;
assign s_axi_bresp = s_axi_bresp_reg;

// AR Channel
always @(posedge aclk or negedge aresetn) begin
  if (!aresetn) begin
    s_axi_arready_reg <= 0;
  end else begin
    if (s_axi_arvalid && !s_axi_arready_reg) begin
      s_axi_arready_reg <= 1;
    end else if (s_axi_arready_reg && !s_axi_arvalid) begin
      s_axi_arready_reg <= 0;
    end
  end
end

assign s_axi_arready = s_axi_arready_reg;

// R Channel
always @(posedge aclk or negedge aresetn) begin
  if (!aresetn) begin
    s_axi_rvalid_reg <= 0;
    s_axi_rid_reg <= 0;
    s_axi_rdata_reg <= 0;
    s_axi_rresp_reg <= 0;
    s_axi_rlast_reg <= 0;
  end else begin
    if (s_axi_arvalid && s_axi_arready_reg) begin
      s_axi_rvalid_reg <= 1;
      s_axi_rid_reg <= s_axi_arid;
      s_axi_rdata_reg <= 512'h0;
      s_axi_rresp_reg <= 2'b00;
      s_axi_rlast_reg <= 1;
    end else if (s_axi_rready && s_axi_rvalid_reg) begin
      s_axi_rvalid_reg <= 0;
    end
  end
end

assign s_axi_rvalid = s_axi_rvalid_reg;
assign s_axi_rid = s_axi_rid_reg;
assign s_axi_rdata = s_axi_rdata_reg;
assign s_axi_rresp = s_axi_rresp_reg;
assign s_axi_rlast = s_axi_rlast_reg;

// Master Interface Assignments
assign m_axi_awid = s_axi_awid;
assign m_axi_awaddr = s_axi_awaddr;
assign m_axi_awlen = s_axi_awlen;
assign m_axi_awsize = s_axi_awsize;
assign m_axi_awburst = s_axi_awburst;
assign m_axi_awlock = s_axi_awlock;
assign m_axi_awcache = s_axi_awcache;
assign m_axi_awprot = s_axi_awprot;
assign m_axi_awregion = s_axi_awregion;
assign m_axi_awqos = s_axi_awqos;
assign m_axi_awvalid = s_axi_awvalid;

assign m_axi_wdata = s_axi_wdata;
assign m_axi_wstrb = s_axi_wstrb;
assign m_axi_wlast = s_axi_wlast;
assign m_axi_wvalid = s_axi_wvalid;

assign m_axi_bready = s_axi_bready;

assign m_axi_arid = s_axi_arid;
assign m_axi_araddr = s_axi_araddr;
assign m_axi_arlen = s_axi_arlen;
assign m_axi_arsize = s_axi_arsize;
assign m_axi_arburst = s_axi_arburst;
assign m_axi_arlock = s_axi_arlock;
assign m_axi_arcache = s_axi_arcache;
assign m_axi_arprot = s_axi_arprot;
assign m_axi_arregion = s_axi_arregion;
assign m_axi_arqos = s_axi_arqos;
assign m_axi_arvalid = s_axi_arvalid;

assign m_axi_rready = s_axi_rready;

endmodule