module rtlpp_02861(
  input s_axi_aclk,
  input s_axi_aresetn,
  input s_axi_awvalid,
  input [10:0] s_axi_awaddr,
  output s_axi_awready,
  input [2:0] s_axi_awprot,
  input s_axi_wvalid,
  input [31:0] s_axi_wdata,
  input [3:0] s_axi_wstrb,
  output s_axi_wready,
  output s_axi_bvalid,
  output [1:0] s_axi_bresp,
  input s_axi_bready,
  input s_axi_arvalid,
  input [10:0] s_axi_araddr,
  output s_axi_arready,
  input [2:0] s_axi_arprot,
  output s_axi_rvalid,
  input s_axi_rready,
  output [1:0] s_axi_rresp,
  output [31:0] s_axi_rdata,
  output irq,
  input m_dest_axi_aclk,
  input m_dest_axi_aresetn,
  output [31:0] m_dest_axi_awaddr,
  output [7:0] m_dest_axi_awlen,
  output [2:0] m_dest_axi_awsize,
  output [1:0] m_dest_axi_awburst,
  output [2:0] m_dest_axi_awprot,
  output [3:0] m_dest_axi_awcache,
  output m_dest_axi_awvalid,
  input m_dest_axi_awready,
  output [63:0] m_dest_axi_wdata,
  output [7:0] m_dest_axi_wstrb,
  input m_dest_axi_wready,
  output m_dest_axi_wvalid,
  output m_dest_axi_wlast,
  input m_dest_axi_bvalid,
  input [1:0] m_dest_axi_bresp,
  output m_dest_axi_bready,
  input fifo_wr_clk,
  input fifo_wr_en,
  input [31:0] fifo_wr_din,
  output fifo_wr_overflow,
  input fifo_wr_sync,
  output fifo_wr_xfer_req
);

// Internal wire and registers declarations
reg [31:0] awaddr;
reg [7:0] awlen;
reg [2:0] awsize;
reg [1:0] awburst;
reg [2:0] awprot;
reg [3:0] awcache;
reg awvalid;
reg [63:0] wdata;
reg [7:0] wstrb;
reg wvalid;
reg wlast;
reg bready;

assign s_axi_awready = 1'b1;
assign s_axi_wready = 1'b1;
assign s_axi_bvalid = 1'b1;
assign s_axi_bresp = 2'b00;
assign s_axi_arready = 1'b1;
assign s_axi_rvalid = 1'b1;
assign s_axi_rresp = 2'b00;
assign s_axi_rdata = 32'h00000000;
assign irq = 1'b0;

assign m_dest_axi_awaddr = awaddr;
assign m_dest_axi_awlen = awlen;
assign m_dest_axi_awsize = awsize;
assign m_dest_axi_awburst = awburst;
assign m_dest_axi_awprot = awprot;
assign m_dest_axi_awcache = awcache;
assign m_dest_axi_awvalid = awvalid;

assign m_dest_axi_wdata = wdata;
assign m_dest_axi_wstrb = wstrb;
assign m_dest_axi_wvalid = wvalid;
assign m_dest_axi_wlast = wlast;
assign m_dest_axi_bready = bready;

assign fifo_wr_overflow = 1'b0;
assign fifo_wr_xfer_req = 1'b0;

always @(posedge s_axi_aclk) begin
  if (~s_axi_aresetn) begin
    awaddr <= 32'h0;
    awlen <= 8'h0;
    awsize <= 3'b0;
    awburst <= 2'b0;
    awprot <= 3'b0;
    awcache <= 4'b0;
    awvalid <= 1'b0;
    wdata <= 64'b0;
    wstrb <= 8'b0;
    wvalid <= 1'b0;
    wlast <= 1'b0;
    bready <= 1'b0;
  end else if (s_axi_awvalid && s_axi_wvalid) begin
    awaddr <= {21'b0, s_axi_awaddr};
    awlen <= 8'h0;
    awsize <= 3'b010;
    awburst <= 2'b01;
    awprot <= s_axi_awprot;
    awcache <= 4'b0;
    awvalid <= 1'b1;
    wdata <= {s_axi_wdata, s_axi_wdata};
    wstrb <= {s_axi_wstrb, s_axi_wstrb};
    wvalid <= 1'b1;
    wlast <= 1'b1;
    bready <= 1'b1;
  end
end

endmodule