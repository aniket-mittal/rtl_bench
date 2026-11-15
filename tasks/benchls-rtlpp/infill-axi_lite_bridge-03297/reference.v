module rtlpp_03297(
    input aclk,
    input aresetn,
    input [31:0] s_axi_awaddr,
    input [2:0] s_axi_awprot,
    input s_axi_awvalid,
    output s_axi_awready,
    input [31:0] s_axi_wdata,
    input [3:0] s_axi_wstrb,
    input s_axi_wvalid,
    output s_axi_wready,
    output [1:0] s_axi_bresp,
    output s_axi_bvalid,
    input s_axi_bready,
    input [31:0] s_axi_araddr,
    input [2:0] s_axi_arprot,
    input s_axi_arvalid,
    output s_axi_arready,
    output [31:0] s_axi_rdata,
    output [1:0] s_axi_rresp,
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

  // Internal registers for handshaking logic
  reg [31:0] r_awaddr, r_wdata, r_araddr;
  reg [2:0] r_awprot, r_arprot;
  reg [3:0] r_wstrb;
  reg r_awvalid, r_wvalid, r_bready, r_arvalid, r_rready;

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      r_awaddr <= 0;
      r_awprot <= 0;
      r_awvalid <= 0;
      r_wdata <= 0;
      r_wstrb <= 0;
      r_wvalid <= 0;
      r_bready <= 0;
      r_araddr <= 0;
      r_arprot <= 0;
      r_arvalid <= 0;
      r_rready <= 0;
    end else begin
      if (s_axi_awvalid && !r_awvalid) begin
        r_awaddr <= s_axi_awaddr;
        r_awprot <= s_axi_awprot;
        r_awvalid <= 1;
      end else if (m_axi_awready && r_awvalid) begin
        r_awvalid <= 0;
      end

      if (s_axi_wvalid && !r_wvalid) begin
        r_wdata <= s_axi_wdata;
        r_wstrb <= s_axi_wstrb;
        r_wvalid <= 1;
      end else if (m_axi_wready && r_wvalid) begin
        r_wvalid <= 0;
      end

      if (m_axi_bvalid && !r_bready) begin
        r_bready <= 1;
      end else if (s_axi_bready && r_bready) begin
        r_bready <= 0;
      end

      if (s_axi_arvalid && !r_arvalid) begin
        r_araddr <= s_axi_araddr;
        r_arprot <= s_axi_arprot;
        r_arvalid <= 1;
      end else if (m_axi_arready && r_arvalid) begin
        r_arvalid <= 0;
      end

      if (m_axi_rvalid && !r_rready) begin
        r_rready <= 1;
      end else if (s_axi_rready && r_rready) begin
        r_rready <= 0;
      end
    end
  end

  assign s_axi_awready = !r_awvalid;
  assign s_axi_wready = !r_wvalid;
  assign s_axi_bresp = m_axi_bresp;
  assign s_axi_bvalid = m_axi_bvalid;
  assign s_axi_arready = !r_arvalid;
  assign s_axi_rdata = m_axi_rdata;
  assign s_axi_rresp = m_axi_rresp;
  assign s_axi_rvalid = m_axi_rvalid;

  assign m_axi_awaddr = r_awaddr;
  assign m_axi_awprot = r_awprot;
  assign m_axi_awvalid = r_awvalid;
  assign m_axi_wdata = r_wdata;
  assign m_axi_wstrb = r_wstrb;
  assign m_axi_wvalid = r_wvalid;
  assign m_axi_bready = r_bready;
  assign m_axi_araddr = r_araddr;
  assign m_axi_arprot = r_arprot;
  assign m_axi_arvalid = r_arvalid;
  assign m_axi_rready = r_rready;

endmodule