module rtlpp_02917(
  input aclk,
  input aresetn,
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
  output reg s_axi_awready,
  input [11:0] s_axi_wid,
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
  input [31:0] s_axi_araddr,
  input [3:0] s_axi_arlen,
  input [2:0] s_axi_arsize,
  input [1:0] s_axi_arburst,
  input [1:0] s_axi_arlock,
  input [3:0] s_axi_arcache,
  input [2:0] s_axi_arprot,
  input [3:0] s_axi_arqos,
  input s_axi_arvalid,
  output reg s_axi_arready,
  output reg [11:0] s_axi_rid,
  output reg [31:0] s_axi_rdata,
  output reg [1:0] s_axi_rresp,
  output reg s_axi_rlast,
  output reg s_axi_rvalid,
  input s_axi_rready,
  output reg [31:0] m_axi_awaddr,
  output reg [2:0] m_axi_awprot,
  output reg m_axi_awvalid,
  input m_axi_awready,
  output reg [31:0] m_axi_wdata,
  output reg [3:0] m_axi_wstrb,
  output reg m_axi_wvalid,
  input m_axi_wready,
  input [1:0] m_axi_bresp,
  input m_axi_bvalid,
  output reg m_axi_bready,
  output reg [31:0] m_axi_araddr,
  output reg [2:0] m_axi_arprot,
  output reg m_axi_arvalid,
  input m_axi_arready,
  input [31:0] m_axi_rdata,
  input [1:0] m_axi_rresp,
  input m_axi_rvalid,
  output reg m_axi_rready
);

  // Write address channel handshake logic
  always @(posedge aclk) begin
    if (!aresetn) begin
      s_axi_awready <= 0;
    end else if (s_axi_awvalid && !s_axi_awready) begin
      s_axi_awready <= 1;
      m_axi_awaddr <= s_axi_awaddr;
      m_axi_awprot <= s_axi_awprot;
      m_axi_awvalid <= 1;
    end else if (m_axi_awready && m_axi_awvalid) begin
      s_axi_awready <= 0;
      m_axi_awvalid <= 0;
    end
  end

  // Write data channel handshake logic
  always @(posedge aclk) begin
    if (!aresetn) begin
      s_axi_wready <= 0;
    end else if (s_axi_wvalid && !s_axi_wready) begin
      s_axi_wready <= 1;
      m_axi_wdata <= s_axi_wdata;
      m_axi_wstrb <= s_axi_wstrb;
      m_axi_wvalid <= 1;
    end else if (m_axi_wready && m_axi_wvalid) begin
      s_axi_wready <= 0;
      m_axi_wvalid <= 0;
    end
  end

  // Write response channel logic
  always @(posedge aclk) begin
    if (!aresetn) begin
      s_axi_bvalid <= 0;
    end else if (m_axi_bvalid && !s_axi_bvalid) begin
      s_axi_bvalid <= 1;
      s_axi_bresp <= m_axi_bresp;
    end else if (s_axi_bready && s_axi_bvalid) begin
      s_axi_bvalid <= 0;
    end
  end

  // Read address channel handshake logic
  always @(posedge aclk) begin
    if (!aresetn) begin
      s_axi_arready <= 0;
    end else if (s_axi_arvalid && !s_axi_arready) begin
      s_axi_arready <= 1;
      m_axi_araddr <= s_axi_araddr;
      m_axi_arprot <= s_axi_arprot;
      m_axi_arvalid <= 1;
    end else if (m_axi_arready && m_axi_arvalid) begin
      s_axi_arready <= 0;
      m_axi_arvalid <= 0;
    end
  end

  // Read data channel logic
  always @(posedge aclk) begin
    if (!aresetn) begin
      s_axi_rvalid <= 0;
    end else if (m_axi_rvalid && !s_axi_rvalid) begin
      s_axi_rvalid <= 1;
      s_axi_rdata <= m_axi_rdata;
      s_axi_rresp <= m_axi_rresp;
    end else if (s_axi_rready && s_axi_rvalid) begin
      s_axi_rvalid <= 0;
    end
  end

endmodule