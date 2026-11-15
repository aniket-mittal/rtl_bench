module rtlpp_07747
   (
    clock,
    cs_b,
    pico,
    poci,
    reset,
    spi_clk
   );
  input clock;
  output cs_b;
  output pico;
  input poci;
  input reset;
  output spi_clk;
  
  reg cs_b;
  reg pico;
  reg spi_clk;
  
  wire [10:0] axi_vip_0_M_AXI_ARADDR;
  wire [2:0] axi_vip_0_M_AXI_ARPROT;
  wire axi_vip_0_M_AXI_ARREADY;
  wire axi_vip_0_M_AXI_ARVALID;
  wire [10:0] axi_vip_0_M_AXI_AWADDR;
  wire [2:0] axi_vip_0_M_AXI_AWPROT;
  wire axi_vip_0_M_AXI_AWREADY;
  wire axi_vip_0_M_AXI_AWVALID;
  wire axi_vip_0_M_AXI_BREADY;
  wire [1:0] axi_vip_0_M_AXI_BRESP;
  wire axi_vip_0_M_AXI_BVALID;
  wire [31:0] axi_vip_0_M_AXI_RDATA;
  wire axi_vip_0_M_AXI_RREADY;
  wire [1:0] axi_vip_0_M_AXI_RRESP;
  wire axi_vip_0_M_AXI_RVALID;
  wire [31:0] axi_vip_0_M_AXI_WDATA;
  wire axi_vip_0_M_AXI_WREADY;
  wire [3:0] axi_vip_0_M_AXI_WSTRB;
  wire axi_vip_0_M_AXI_WVALID;
  wire clock_1;
  wire poci_1;
  wire reset_1;
  wire spi_controller_inter_0_cs_b;
  wire spi_controller_inter_0_pico;
  wire spi_controller_inter_0_spi_clk;

  assign clock_1 = clock;
  assign poci_1 = poci;
  assign reset_1 = reset;
  assign cs_b = spi_controller_inter_0_cs_b;
  assign pico = spi_controller_inter_0_pico;
  assign spi_clk = spi_controller_inter_0_spi_clk;

  // Embedded functionality of spi_Sim_axi_vip_0_0
  // Logic for axi_vip_0 module starts here
  
  // Please replace this section with the logic for axi_vip_0 
  // based on your original spi_Sim_axi_vip_0_0 IP block behavior
  
  assign axi_vip_0_M_AXI_ARREADY = 1'b1;
  assign axi_vip_0_M_AXI_AWREADY = 1'b1;
  assign axi_vip_0_M_AXI_BVALID = 1'b1;
  assign axi_vip_0_M_AXI_BRESP = 2'b00;
  assign axi_vip_0_M_AXI_RVALID = 1'b1;
  assign axi_vip_0_M_AXI_RRESP = 2'b00;
  assign axi_vip_0_M_AXI_RDATA = 32'h00000000;
  assign axi_vip_0_M_AXI_WREADY = 1'b1;

  // Embedded functionality of spi_Sim_spi_controller_inter_0_0
  // Logic for spi_controller_inter_0 module starts here
  
  // Please replace this section with the logic for spi_controller_inter_0
  // based on your original spi_Sim_spi_controller_inter_0_0 IP block behavior
  
  assign spi_controller_inter_0_spi_clk = clock_1;
  assign spi_controller_inter_0_pico = 1'b0;
  assign spi_controller_inter_0_cs_b = 1'b0;
  
endmodule