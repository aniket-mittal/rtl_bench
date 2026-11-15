module rtlpp_01291 (
  ap_clk,
  ap_rst_n,
  s_axilite_AWVALID,
  s_axilite_AWREADY,
  s_axilite_AWADDR,
  s_axilite_WVALID,
  s_axilite_WREADY,
  s_axilite_WDATA,
  s_axilite_WSTRB,
  s_axilite_BVALID,
  s_axilite_BREADY,
  s_axilite_BRESP,
  s_axilite_ARVALID,
  s_axilite_ARREADY,
  s_axilite_ARADDR,
  s_axilite_RVALID,
  s_axilite_RREADY,
  s_axilite_RDATA,
  s_axilite_RRESP,
  in0_V_TREADY,
  in0_V_TVALID,
  in0_V_TDATA,
  out_V_TREADY,
  out_V_TVALID,
  out_V_TDATA
);

input wire ap_clk;
input wire ap_rst_n;
input wire s_axilite_AWVALID;
output wire s_axilite_AWREADY;
input wire [4 : 0] s_axilite_AWADDR;
input wire s_axilite_WVALID;
output wire s_axilite_WREADY;
input wire [31 : 0] s_axilite_WDATA;
input wire [3 : 0] s_axilite_WSTRB;
output wire s_axilite_BVALID;
input wire s_axilite_BREADY;
output wire [1 : 0] s_axilite_BRESP;
input wire s_axilite_ARVALID;
output wire s_axilite_ARREADY;
input wire [4 : 0] s_axilite_ARADDR;
output wire s_axilite_RVALID;
input wire s_axilite_RREADY;
output wire [31 : 0] s_axilite_RDATA;
output wire [1 : 0] s_axilite_RRESP;
output wire in0_V_TREADY;
input wire in0_V_TVALID;
input wire [23 : 0] in0_V_TDATA;
input wire out_V_TREADY;
output wire out_V_TVALID;
output wire [23 : 0] out_V_TDATA;

// Internal registers
reg awready_reg = 0, wready_reg = 0, bvalid_reg = 0, arready_reg = 0, rvalid_reg = 0;
reg [1:0] bresp_reg = 0, rresp_reg = 0;
reg [31:0] rdata_reg = 0;
reg in0_tready_reg = 0, out_tvalid_reg = 0;
reg [23:0] out_tdata_reg = 0;

always @(posedge ap_clk) begin
  if (!ap_rst_n) begin
    awready_reg <= 0;
    wready_reg <= 0;
    bvalid_reg <= 0;
    arready_reg <= 0;
    rvalid_reg <= 0;
    bresp_reg <= 0;
    rresp_reg <= 0;
    rdata_reg <= 0;
    in0_tready_reg <= 0;
    out_tvalid_reg <= 0;
    out_tdata_reg <= 0;
  end else begin
    awready_reg <= s_axilite_AWVALID;
    wready_reg <= s_axilite_WVALID;
    bvalid_reg <= s_axilite_WVALID && s_axilite_AWVALID && !bvalid_reg;
    bresp_reg <= 2'b00;  // OKAY response for AXI4-Lite
    arready_reg <= s_axilite_ARVALID;
    rvalid_reg <= s_axilite_ARVALID && !rvalid_reg;
    rresp_reg <= 2'b00;  // OKAY response for AXI4-Lite
    rdata_reg <= 0;  // Put some logic to read data

    // AXI Stream Interface logic
    in0_tready_reg <= 1;  // Always ready to accept input data
    if (in0_V_TVALID && in0_tready_reg) begin
      out_tdata_reg <= in0_V_TDATA;  // Pass-through or add padding logic here
      out_tvalid_reg <= 1;
    end else begin
      out_tvalid_reg <= 0;
    end
  end
end

assign s_axilite_AWREADY = awready_reg;
assign s_axilite_WREADY = wready_reg;
assign s_axilite_BVALID = bvalid_reg;
assign s_axilite_BRESP = bresp_reg;
assign s_axilite_ARREADY = arready_reg;
assign s_axilite_RVALID = rvalid_reg;
assign s_axilite_RDATA = rdata_reg;
assign s_axilite_RRESP = rresp_reg;
assign in0_V_TREADY = in0_tready_reg;
assign out_V_TVALID = out_tvalid_reg;
assign out_V_TDATA = out_tdata_reg;

endmodule