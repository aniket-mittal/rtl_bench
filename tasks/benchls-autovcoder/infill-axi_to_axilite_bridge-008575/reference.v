module autovcoder_008575 (
    input          user_clk,
    // Input AXI4-Lite interface
    input          t_awvalid,
    input  [ 31:0] t_awaddr,
    input  [  3:0] t_awlen,
    input  [  2:0] t_awregion,
    input  [  2:0] t_awsize,
    output         t_awready,
    input          t_wvalid,
    input  [127:0] t_wdata,
    input  [ 15:0] t_wstrb,
    input          t_wlast,
    output         t_wready,
    output         t_bvalid,
    input          t_bready,
    output [  1:0] t_bresp,
    input          t_arvalid,
    input  [ 31:0] t_araddr,
    input  [  3:0] t_arlen,
    input  [  2:0] t_arregion,
    input  [  2:0] t_arsize,
    output         t_arready,
    output         t_rvalid,
    input          t_rready,
    output [127:0] t_rdata,
    output [  1:0] t_rresp,
    output         t_rlast,
    // Output AXI4-Lite interface
    output         s_axi_awvalid,
    output [ 31:0] s_axi_awaddr,
    input          s_axi_awready,
    output         s_axi_wvalid,
    output [ 31:0] s_axi_wdata,
    output [  3:0] s_axi_wstrb,
    input          s_axi_wready,
    input          s_axi_bvalid,
    output         s_axi_bready,
    input  [  1:0] s_axi_bresp,
    output         s_axi_arvalid,
    input          s_axi_arready,
    output [ 31:0] s_axi_araddr,
    input          s_axi_rvalid,
    output         s_axi_rready,
    input  [ 31:0] s_axi_rdata,
    input  [  1:0] s_axi_rresp
);

  reg [3:0] rd_addr_nibble = 4'd0;

  /********* SHIM FOR TARGET AXI to AXI-LITE connection ***********/

  //- This shim enabless the 128-bit target AXI master to connect to
  //- 32-bit AXILITE interconnect
  //- All register operations issued by software are read-modify-write
  //- operations i.e. access to all bits of one entire register 

  /*
      In case of writes, it puts the appropriate 32-bit data slice based on
      value of wstrb. 
          wstrb         wdata bit locations
          ---------------------------------
          [0] = 1       [31:0]
          [4] = 1       [63:32]
          [8] = 1       [95:64]
          [12] = 1      [127:96]
          ---------------------------------
          
      In case of reads, it places the 32-bit read data value in the
      appropriate segment in the 128-bit read data bus based on the read
      address' lowest nibble value.
          araddr[3:0]     rdata segment
          -----------------------------
           4'b0000          [31:0]
           4'b0100          [63:32]
           4'b1000          [95:64]
           4'b1100          [127:96]
          -----------------------------
     */

  assign s_axi_awaddr = {16'd0, t_awaddr[15:0]};
  assign s_axi_awvalid = t_awvalid;
  assign t_awready = s_axi_awready;

  assign s_axi_wvalid = t_wvalid;
  //- Extract out valid write data based on strobe
  assign s_axi_wdata  = t_wstrb[0] ? t_wdata[31:0]  :
                      t_wstrb[4] ? t_wdata[63:32] :
                      t_wstrb[8] ? t_wdata[95:64] : t_wdata[127:96];
  assign s_axi_wstrb = 4'b1111;
  assign t_wready = s_axi_wready;

  assign t_bvalid = s_axi_bvalid;
  assign s_axi_bready = t_bready;
  assign t_bresp = s_axi_bresp;

  assign s_axi_arvalid = t_arvalid;
  assign s_axi_araddr = {16'd0, t_araddr[15:0]};
  assign t_arready = s_axi_arready;

  assign t_rvalid = s_axi_rvalid;
  assign s_axi_rready = t_rready;

  //- Latch onto the read address lowest nibble
  always @(posedge user_clk) if (s_axi_arvalid & s_axi_arready) rd_addr_nibble <= s_axi_araddr[3:0];

  //- Place the read 32-bit data into the appropriate 128-bit rdata
  //  location based on address nibble latched above
  assign t_rdata = (rd_addr_nibble == 4'hC) ? {s_axi_rdata,96'd0} :
                 (rd_addr_nibble == 4'h8) ? {32'd0,s_axi_rdata,64'd0} :
                 (rd_addr_nibble == 4'h4) ? {64'd0,s_axi_rdata,32'd0} :
                 {96'd0,s_axi_rdata};
  assign t_rresp = s_axi_rresp;
  assign t_rlast = s_axi_rvalid;

endmodule

