module rtlpp_03655(
  input aclk,
  input aresetn,
  input [31:0] s_axi_awaddr,
  input [2:0] s_axi_awprot,
  input [0:0] s_axi_awvalid,
  output reg [0:0] s_axi_awready,
  input [31:0] s_axi_wdata,
  input [3:0] s_axi_wstrb,
  input [0:0] s_axi_wvalid,
  output reg [0:0] s_axi_wready,
  output reg [1:0] s_axi_bresp,
  output reg [0:0] s_axi_bvalid,
  input [0:0] s_axi_bready,
  input [31:0] s_axi_araddr,
  input [2:0] s_axi_arprot,
  input [0:0] s_axi_arvalid,
  output reg [0:0] s_axi_arready,
  output reg [31:0] s_axi_rdata,
  output reg [1:0] s_axi_rresp,
  output reg [0:0] s_axi_rvalid,
  input [0:0] s_axi_rready,
  output reg [191:0] m_axi_awaddr,
  output reg [17:0] m_axi_awprot,
  output reg [5:0] m_axi_awvalid,
  input [5:0] m_axi_awready,
  output reg [191:0] m_axi_wdata,
  output reg [23:0] m_axi_wstrb,
  output reg [5:0] m_axi_wvalid,
  input [5:0] m_axi_wready,
  input [11:0] m_axi_bresp,
  input [5:0] m_axi_bvalid,
  output reg [5:0] m_axi_bready,
  output reg [191:0] m_axi_araddr,
  output reg [17:0] m_axi_arprot,
  output reg [5:0] m_axi_arvalid,
  input [5:0] m_axi_arready,
  input [191:0] m_axi_rdata,
  input [11:0] m_axi_rresp,
  input [5:0] m_axi_rvalid,
  output reg [5:0] m_axi_rready
);

  // Internal signals and registers
  // Your code for embedding the logic goes here.
  // This comment is an indicator of where to place the design-specific logic.

  always @(posedge aclk) begin
    if (!aresetn) begin
      // Reset logic here
      s_axi_awready <= 1'b0;
      s_axi_wready <= 1'b0;
      s_axi_bresp <= 2'b00;
      s_axi_bvalid <= 1'b0;
      s_axi_arready <= 1'b0;
      s_axi_rdata <= 32'b0;
      s_axi_rresp <= 2'b00;
      s_axi_rvalid <= 1'b0;
      
      m_axi_awaddr <= 192'b0;
      m_axi_awprot <= 18'b0;
      m_axi_awvalid <= 6'b0;
      m_axi_wdata <= 192'b0;
      m_axi_wstrb <= 24'b0;
      m_axi_wvalid <= 6'b0;
      m_axi_bready <= 6'b0;
      m_axi_araddr <= 192'b0;
      m_axi_arprot <= 18'b0;
      m_axi_arvalid <= 6'b0;
      m_axi_rready <= 6'b0;
    end else begin
      // Main logic goes here
    end
  end

endmodule