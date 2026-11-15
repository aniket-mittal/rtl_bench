module autovcoder_091131 (  /*AUTOARG*/
    // Outputs
    phy2cs_data,
    phy2cs_k,
    txdata_fis,
    tx_charisk_fis,
    // Inputs
    clk_75m,
    host_rst,
    cs2phy_data,
    link_up,
    fsm2phy_k,
    rxdata_fis,
    rxcharisk
);
  //phy if system signal
  input clk_75m;  //75M
  input host_rst;

  //32 bit and 75M clock domain
  input [31:0] cs2phy_data;
  output reg [31:0] phy2cs_data;
  input link_up;
  output reg phy2cs_k;
  input fsm2phy_k;

  //32 bit and 75M clock domain
  input [31:0] rxdata_fis;
  input [3:0] rxcharisk;
  output [31:0] txdata_fis;
  output tx_charisk_fis;

  reg [31:0] rx_data_link_tmp;
  reg        phy_sync_0001;
  reg        phy_sync_0010;
  reg        phy_sync_0100;
  reg        phy_sync_1000;

  assign txdata_fis = cs2phy_data;
  assign tx_charisk_fis = fsm2phy_k;

  [MASKED]

  reg rx_k_tmp;

  always @(posedge clk_75m)  //for lost primitive 3737b57c
    if (~link_up) begin
      rx_k_tmp <= 0;
    end else if (rxcharisk[1] | rxcharisk[2] | rxcharisk[3]) begin
      rx_k_tmp <= 1;
    end else begin
      rx_k_tmp <= 0;
    end

  always @(posedge clk_75m)
    if (~link_up) begin
      phy2cs_k <= 0;
    end else if (rxcharisk[0]) begin
      phy2cs_k <= 1;
    end else begin
      phy2cs_k <= rx_k_tmp;
    end

endmodule

