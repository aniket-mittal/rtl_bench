module rtlpp_02877(
  input s_axi_aclk,
  input s_axi_aresetn,
  input [11:0] s_axi_awid,
  input [12:0] s_axi_awaddr,
  input [7:0] s_axi_awlen,
  input [2:0] s_axi_awsize,
  input [1:0] s_axi_awburst,
  input s_axi_awlock,
  input [3:0] s_axi_awcache,
  input [2:0] s_axi_awprot,
  input s_axi_awvalid,
  output reg s_axi_awready,
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
  input [12:0] s_axi_araddr,
  input [7:0] s_axi_arlen,
  input [2:0] s_axi_arsize,
  input [1:0] s_axi_arburst,
  input s_axi_arlock,
  input [3:0] s_axi_arcache,
  input [2:0] s_axi_arprot,
  input s_axi_arvalid,
  output reg s_axi_arready,
  output reg [11:0] s_axi_rid,
  output reg [31:0] s_axi_rdata,
  output reg [1:0] s_axi_rresp,
  output reg s_axi_rlast,
  output reg s_axi_rvalid,
  input s_axi_rready,
  output reg bram_rst_a,
  output reg bram_clk_a,
  output reg bram_en_a,
  output reg [3:0] bram_we_a,
  output reg [12:0] bram_addr_a,
  output reg [31:0] bram_wrdata_a,
  input [31:0] bram_rddata_a
);

  // Internal signals
  reg [12:0] internal_addr;
  reg [31:0] internal_data;
  reg [3:0] internal_we;
  reg [7:0] burst_counter;
  reg rdata_valid;

  always @(posedge s_axi_aclk) begin
    if(!s_axi_aresetn) begin
      s_axi_awready <= 0;
      s_axi_wready <= 0;
      s_axi_bid <= 0;
      s_axi_bresp <= 0;
      s_axi_bvalid <= 0;
      s_axi_arready <= 0;
      s_axi_rid <= 0;
      s_axi_rdata <= 0;
      s_axi_rresp <= 0;
      s_axi_rlast <= 0;
      s_axi_rvalid <= 0;
      bram_rst_a <= 0;
      bram_clk_a <= 0;
      bram_en_a <= 0;
      bram_we_a <= 0;
      bram_addr_a <= 0;
      bram_wrdata_a <= 0;
      internal_addr <= 0;
      internal_data <= 0;
      internal_we <= 0;
      burst_counter <= 0;
      rdata_valid <= 0;
    end else begin
      // AXI Write Address Channel
      if (s_axi_awvalid && !s_axi_awready) begin
        s_axi_awready <= 1;
        internal_addr <= s_axi_awaddr;
        burst_counter <= s_axi_awlen;
      end else if (s_axi_awready && !s_axi_awvalid) begin
        s_axi_awready <= 0;
      end

      // AXI Write Data Channel
      if (s_axi_wvalid && !s_axi_wready) begin
        s_axi_wready <= 1;
        internal_data <= s_axi_wdata;
        internal_we <= s_axi_wstrb;
        if (burst_counter > 0)
          burst_counter <= burst_counter - 1;
      end else if (s_axi_wready && !s_axi_wvalid) begin
        s_axi_wready <= 0;
      end

      // Write Response Channel
      if (s_axi_bready && s_axi_bvalid) begin
        s_axi_bvalid <= 0;
      end else if (!s_axi_bvalid && s_axi_wvalid && s_axi_wlast && s_axi_wready) begin
        s_axi_bvalid <= 1;
        s_axi_bid <= s_axi_awid;
        s_axi_bresp <= 2'b00; // OKAY response
      end

      // AXI Read Address Channel
      if (s_axi_arvalid && !s_axi_arready) begin
        s_axi_arready <= 1;
        s_axi_rid <= s_axi_arid;
        internal_addr <= s_axi_araddr;
        burst_counter <= s_axi_arlen;
        rdata_valid <= 1;
      end else if (s_axi_arready && !s_axi_arvalid) begin
        s_axi_arready <= 0;
      end

      // AXI Read Data Channel
      if (rdata_valid && s_axi_rready) begin
        s_axi_rdata <= bram_rddata_a;
        s_axi_rresp <= 2'b00; // OKAY response
        if (burst_counter > 0) begin
          burst_counter <= burst_counter - 1;
        end else begin
          s_axi_rlast <= 1;
          s_axi_rvalid <= 1;
          rdata_valid <= 0;
        end
      end else if (s_axi_rvalid && !s_axi_rready) begin
        s_axi_rvalid <= 0;
        s_axi_rlast <= 0;
      end

      // BRAM Control Signals
      bram_rst_a <= 0;
      bram_clk_a <= s_axi_aclk;
      bram_en_a <= s_axi_awvalid || s_axi_arvalid;
      bram_we_a <= internal_we;
      bram_addr_a <= internal_addr;
      bram_wrdata_a <= internal_data;
    end
  end

endmodule