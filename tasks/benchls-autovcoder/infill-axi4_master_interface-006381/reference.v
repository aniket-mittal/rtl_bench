module autovcoder_006381 (
    // Reset, Clock
    input ARESETN,
    input ACLK,

    // Master Write Address
    input      [ 0:0] M_AXI_AWID,
    input      [31:0] M_AXI_AWADDR,
    input      [ 7:0] M_AXI_AWLEN,    // Burst Length: 0-255
    input      [ 2:0] M_AXI_AWSIZE,   // Burst Size: Fixed 2'b011
    input      [ 1:0] M_AXI_AWBURST,  // Burst Type: Fixed 2'b01(Incremental Burst)
    input             M_AXI_AWLOCK,   // Lock: Fixed 2'b00
    input      [ 3:0] M_AXI_AWCACHE,  // Cache: Fiex 2'b0011
    input      [ 2:0] M_AXI_AWPROT,   // Protect: Fixed 2'b000
    input      [ 3:0] M_AXI_AWQOS,    // QoS: Fixed 2'b0000
    input      [ 0:0] M_AXI_AWUSER,   // User: Fixed 32'd0
    input             M_AXI_AWVALID,
    output reg        M_AXI_AWREADY,

    // Master Write Data
    input      [31:0] M_AXI_WDATA,
    input      [ 3:0] M_AXI_WSTRB,
    input             M_AXI_WLAST,
    input      [ 0:0] M_AXI_WUSER,
    input             M_AXI_WVALID,
    output reg        M_AXI_WREADY,

    // Master Write Response
    output reg [0:0] M_AXI_BID,
    output reg [1:0] M_AXI_BRESP,
    output reg [0:0] M_AXI_BUSER,
    output           M_AXI_BVALID,
    input            M_AXI_BREADY,

    // Master Read Address
    input      [ 0:0] M_AXI_ARID,
    input      [31:0] M_AXI_ARADDR,
    input      [ 7:0] M_AXI_ARLEN,
    input      [ 2:0] M_AXI_ARSIZE,
    input      [ 1:0] M_AXI_ARBURST,
    //  input [1:0]  M_AXI_ARLOCK,
    input      [ 0:0] M_AXI_ARLOCK,
    input      [ 3:0] M_AXI_ARCACHE,
    input      [ 2:0] M_AXI_ARPROT,
    input      [ 3:0] M_AXI_ARQOS,
    input      [ 0:0] M_AXI_ARUSER,
    input             M_AXI_ARVALID,
    output reg        M_AXI_ARREADY,

    // Master Read Data 
    output reg [ 0:0] M_AXI_RID,
    output     [31:0] M_AXI_RDATA,
    output reg [ 1:0] M_AXI_RRESP,
    output            M_AXI_RLAST,
    output reg [ 0:0] M_AXI_RUSER,
    output            M_AXI_RVALID,
    input             M_AXI_RREADY
);

  initial begin
    M_AXI_AWREADY = 1;
    M_AXI_WREADY = 1;
    M_AXI_BID = 0;
    M_AXI_BRESP = 0;
    M_AXI_BUSER = 0;
    //M_AXI_BVALID = 0;
    M_AXI_ARREADY = 1;
    M_AXI_RID = 0;
    //M_AXI_RDATA = 0;
    M_AXI_RRESP = 0;
    //M_AXI_RLAST = 0;
    M_AXI_RUSER = 0;
    //M_AXI_RVALID = 0;
  end

  reg axi_rena;

  reg [31:0] count, rcount;
  always @(posedge ACLK or negedge ARESETN) begin
    if (!ARESETN) begin
      count <= 32'd0;
      rcount <= 32'd0;
      axi_rena <= 0;
      //        M_AXI_RVALID<=1'b0;
    end else begin
      if (M_AXI_RLAST) begin
        axi_rena <= 0;
      end else if (M_AXI_ARVALID) begin
        axi_rena <= 1;
      end

      if (axi_rena) begin
        count <= count + 32'd1;
      end else begin
        count <= 0;
      end

      if (M_AXI_RVALID & M_AXI_RREADY) begin
        rcount <= rcount + 32'd1;
      end
    end
  end
  assign M_AXI_RDATA  = {rcount, rcount};
  assign M_AXI_RLAST  = (axi_rena & (count == 255)) ? 1 : 0;
  assign M_AXI_RVALID = axi_rena;

  reg axi_wvalid;

  always @(posedge ACLK or negedge ARESETN) begin
    if (!ARESETN) begin
      axi_wvalid <= 0;
    end else begin
      if (M_AXI_BREADY) begin
        axi_wvalid <= 0;
      end else if (M_AXI_WVALID & M_AXI_WLAST) begin
        axi_wvalid <= 1;
      end
    end
  end

  assign M_AXI_BVALID = axi_wvalid;

endmodule

