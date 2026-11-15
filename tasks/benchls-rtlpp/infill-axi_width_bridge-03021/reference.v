module rtlpp_03021(
  input aclk,
  input aresetn,
  input [63:0]s_axi_awaddr,
  input [7:0]s_axi_awlen,
  input [2:0]s_axi_awsize,
  input [1:0]s_axi_awburst,
  input [0:0]s_axi_awlock,
  input [3:0]s_axi_awcache,
  input [2:0]s_axi_awprot,
  input [3:0]s_axi_awregion,
  input [3:0]s_axi_awqos,
  input s_axi_awvalid,
  output reg s_axi_awready,
  input [31:0]s_axi_wdata,
  input [3:0]s_axi_wstrb,
  input s_axi_wlast,
  input s_axi_wvalid,
  output reg s_axi_wready,
  output reg [1:0]s_axi_bresp,
  output reg s_axi_bvalid,
  input s_axi_bready,
  input [63:0]s_axi_araddr,
  input [7:0]s_axi_arlen,
  input [2:0]s_axi_arsize,
  input [1:0]s_axi_arburst,
  input [0:0]s_axi_arlock,
  input [3:0]s_axi_arcache,
  input [2:0]s_axi_arprot,
  input [3:0]s_axi_arregion,
  input [3:0]s_axi_arqos,
  input s_axi_arvalid,
  output reg s_axi_arready,
  output reg [31:0]s_axi_rdata,
  output reg [1:0]s_axi_rresp,
  output reg s_axi_rlast,
  output reg s_axi_rvalid,
  input s_axi_rready,
  output reg [63:0]m_axi_awaddr,
  output reg [2:0]m_axi_awprot,
  output reg m_axi_awvalid,
  input m_axi_awready,
  output reg [31:0]m_axi_wdata,
  output reg [3:0]m_axi_wstrb,
  output reg m_axi_wvalid,
  input m_axi_wready,
  input [1:0]m_axi_bresp,
  input m_axi_bvalid,
  output reg m_axi_bready,
  output reg [63:0]m_axi_araddr,
  output reg [2:0]m_axi_arprot,
  output reg m_axi_arvalid,
  input m_axi_arready,
  input [31:0]m_axi_rdata,
  input [1:0]m_axi_rresp,
  input m_axi_rvalid,
  output reg m_axi_rready
);

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      s_axi_awready <= 0;
      s_axi_wready <= 0;
      s_axi_bresp <= 2'b00;
      s_axi_bvalid <= 0;
      s_axi_arready <= 0;
      s_axi_rdata <= 32'b0;
      s_axi_rresp <= 2'b00;
      s_axi_rlast <= 0;
      s_axi_rvalid <= 0;
      m_axi_awaddr <= 64'b0;
      m_axi_awprot <= 3'b000;
      m_axi_awvalid <= 0;
      m_axi_wdata <= 32'b0;
      m_axi_wstrb <= 4'b0000;
      m_axi_wvalid <= 0;
      m_axi_bready <= 1;
      m_axi_araddr <= 64'b0;
      m_axi_arprot <= 3'b000;
      m_axi_arvalid <= 0;
      m_axi_rready <= 1;
    end else begin
      // AXI Write Address Channel
      if (s_axi_awvalid && !s_axi_awready) begin
        s_axi_awready <= 1;
        m_axi_awaddr <= s_axi_awaddr;
        m_axi_awprot <= s_axi_awprot;
        m_axi_awvalid <= 1;
      end else begin
        s_axi_awready <= 0;
        m_axi_awvalid <= 0;
      end

      // AXI Write Data Channel
      if (s_axi_wvalid && !s_axi_wready) begin
        s_axi_wready <= 1;
        m_axi_wdata <= s_axi_wdata;
        m_axi_wstrb <= s_axi_wstrb;
        m_axi_wvalid <= 1;
      end else begin
        s_axi_wready <= 0;
        m_axi_wvalid <= 0;
      end

      // AXI Write Response Channel
      if (m_axi_bvalid && !s_axi_bvalid) begin
        s_axi_bresp <= m_axi_bresp;
        s_axi_bvalid <= 1;
      end else if (s_axi_bready) begin
        s_axi_bvalid <= 0;
      end

      // AXI Read Address Channel
      if (s_axi_arvalid && !s_axi_arready) begin
        s_axi_arready <= 1;
        m_axi_araddr <= s_axi_araddr;
        m_axi_arprot <= s_axi_arprot;
        m_axi_arvalid <= 1;
      end else begin
        s_axi_arready <= 0;
        m_axi_arvalid <= 0;
      end

      // AXI Read Data Channel
      if (m_axi_rvalid && !s_axi_rvalid) begin
        s_axi_rdata <= m_axi_rdata;
        s_axi_rresp <= m_axi_rresp;
        s_axi_rlast <= 1; // Assuming single beat read
        s_axi_rvalid <= 1;
      end else if (s_axi_rready) begin
        s_axi_rvalid <= 0;
      end
    end
  end

endmodule