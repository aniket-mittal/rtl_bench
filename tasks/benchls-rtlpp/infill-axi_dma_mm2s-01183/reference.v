module rtlpp_01183
   (M_AXI_MM2S_araddr,
    M_AXI_MM2S_arburst,
    M_AXI_MM2S_arcache,
    M_AXI_MM2S_arlen,
    M_AXI_MM2S_arprot,
    M_AXI_MM2S_arready,
    M_AXI_MM2S_arsize,
    M_AXI_MM2S_arvalid,
    M_AXI_MM2S_rdata,
    M_AXI_MM2S_rlast,
    M_AXI_MM2S_rready,
    M_AXI_MM2S_rresp,
    M_AXI_MM2S_rvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    axi_resetn,
    Lcl_M_AXIS_MM2S_TDATA,
    Lcl_M_AXIS_MM2S_TLAST,
    Lcl_M_AXIS_MM2S_TREADY,
    Lcl_M_AXIS_MM2S_TVALID,
    useLcl,
    mm2s_introut,
    s_axi_lite_aclk);

  input [31:0] Lcl_M_AXIS_MM2S_TDATA;
  input Lcl_M_AXIS_MM2S_TLAST;
  output Lcl_M_AXIS_MM2S_TREADY;
  input Lcl_M_AXIS_MM2S_TVALID;
  input useLcl;
  input axi_resetn;
  input s_axi_lite_aclk;
  output mm2s_introut;

  output [31:0] M_AXI_MM2S_araddr;
  output [1:0] M_AXI_MM2S_arburst;
  output [3:0] M_AXI_MM2S_arcache;
  output [7:0] M_AXI_MM2S_arlen;
  output [2:0] M_AXI_MM2S_arprot;
  input M_AXI_MM2S_arready;
  output [2:0] M_AXI_MM2S_arsize;
  output M_AXI_MM2S_arvalid;
  input [31:0] M_AXI_MM2S_rdata;
  input M_AXI_MM2S_rlast;
  output M_AXI_MM2S_rready;
  input [1:0] M_AXI_MM2S_rresp;
  input M_AXI_MM2S_rvalid;

  input [9:0] S_AXI_LITE_araddr;
  output S_AXI_LITE_arready;
  input S_AXI_LITE_arvalid;
  input [9:0] S_AXI_LITE_awaddr;
  output S_AXI_LITE_awready;
  input S_AXI_LITE_awvalid;
  input S_AXI_LITE_bready;
  output [1:0] S_AXI_LITE_bresp;
  output S_AXI_LITE_bvalid;
  output [31:0] S_AXI_LITE_rdata;
  input S_AXI_LITE_rready;
  output [1:0] S_AXI_LITE_rresp;
  output S_AXI_LITE_rvalid;
  input [31:0] S_AXI_LITE_wdata;
  output S_AXI_LITE_wready;
  input S_AXI_LITE_wvalid;

  wire [31:0] M_AXIS_MM2S_TDATA;
  wire M_AXIS_MM2S_TLAST;
  wire M_AXIS_MM2S_TREADY;
  wire M_AXIS_MM2S_TVALID;

  assign M_AXI_MM2S_araddr = 32'd0;
  assign M_AXI_MM2S_arburst = 2'd1;
  assign M_AXI_MM2S_arcache = 4'd0;
  assign M_AXI_MM2S_arlen = 8'd0;
  assign M_AXI_MM2S_arprot = 3'd0;
  assign M_AXI_MM2S_arsize = 3'd2;
  assign M_AXI_MM2S_arvalid = 1'b0;
  assign M_AXI_MM2S_rready = 1'b0;
  assign S_AXI_LITE_arready = 1'b0;
  assign S_AXI_LITE_awready = 1'b0;
  assign S_AXI_LITE_bresp = 2'b00;
  assign S_AXI_LITE_bvalid = 1'b0;
  assign S_AXI_LITE_rdata = 32'd0;
  assign S_AXI_LITE_rresp = 2'b00;
  assign S_AXI_LITE_rvalid = 1'b0;
  assign S_AXI_LITE_wready = 1'b0;
  assign mm2s_introut = 1'b0;
  
  assign M_AXIS_MM2S_TDATA = useLcl ? Lcl_M_AXIS_MM2S_TDATA : 32'd0;
  assign M_AXIS_MM2S_TLAST = useLcl ? Lcl_M_AXIS_MM2S_TLAST : 1'b0;
  assign Lcl_M_AXIS_MM2S_TREADY = useLcl ? M_AXIS_MM2S_TREADY : 1'b0;
  assign M_AXIS_MM2S_TVALID = useLcl ? Lcl_M_AXIS_MM2S_TVALID : 1'b0;

endmodule