module rtlpp_11173 (
    output  [7:0]  gmii_rx_d,
    output        gmii_rx_dv,
    output        gmii_rx_err,
    output        tx_clk,
    output        rx_clk,
    output  [3:0] mii_rx_d,
    output        mii_rx_dv,
    output        mii_rx_err,
    output        mii_col,
    output        mii_crs,
    output        set_10,
    output        set_100,
    output        set_1000,
    output        hd_ena,
    output        led_col,
    output        led_crs,
    output        led_an,
    output        led_disp_err,
    output        led_char_err,
    output        led_link,
    output        tx_clkena,
    output        rx_clkena,
    output        rx_recovclkout,
    output [15:0] readdata,
    output        waitrequest,
    output        txp,
    output        pcs_pwrdn_out,
    output [16:0] reconfig_fromgxb,
    input   [7:0] gmii_tx_d,
    input         gmii_tx_en,
    input         gmii_tx_err,
    input   [3:0] mii_tx_d,
    input         mii_tx_en,
    input         mii_tx_err,
    input         reset_tx_clk,
    input         reset_rx_clk,
    input   [4:0] address,
    input         read,
    input  [15:0] writedata,
    input         write,
    input         clk,
    input         reset,
    input         rxp,
    input         ref_clk,
    input         gxb_pwrdn_in,
    input         gxb_cal_blk_clk,
    input         reconfig_clk,
    input   [3:0] reconfig_togxb,
    input         reconfig_busy
);

reg [7:0] gmii_rx_d_reg;
reg gmii_rx_dv_reg;
reg gmii_rx_err_reg;
reg tx_clk_reg;
reg rx_clk_reg;
reg [3:0] mii_rx_d_reg;
reg mii_rx_dv_reg;
reg mii_rx_err_reg;
reg mii_col_reg;
reg mii_crs_reg;
reg set_10_reg;
reg set_100_reg;
reg set_1000_reg;
reg hd_ena_reg;
reg led_col_reg;
reg led_crs_reg;
reg led_an_reg;
reg led_disp_err_reg;
reg led_char_err_reg;
reg led_link_reg;
reg tx_clkena_reg;
reg rx_clkena_reg;
reg rx_recovclkout_reg;
reg [15:0] readdata_reg;
reg waitrequest_reg;
reg txp_reg;
reg pcs_pwrdn_out_reg;
reg [16:0] reconfig_fromgxb_reg;

assign gmii_rx_d = gmii_rx_d_reg;
assign gmii_rx_dv = gmii_rx_dv_reg;
assign gmii_rx_err = gmii_rx_err_reg;
assign tx_clk = tx_clk_reg;
assign rx_clk = rx_clk_reg;
assign mii_rx_d = mii_rx_d_reg;
assign mii_rx_dv = mii_rx_dv_reg;
assign mii_rx_err = mii_rx_err_reg;
assign mii_col = mii_col_reg;
assign mii_crs = mii_crs_reg;
assign set_10 = set_10_reg;
assign set_100 = set_100_reg;
assign set_1000 = set_1000_reg;
assign hd_ena = hd_ena_reg;
assign led_col = led_col_reg;
assign led_crs = led_crs_reg;
assign led_an = led_an_reg;
assign led_disp_err = led_disp_err_reg;
assign led_char_err = led_char_err_reg;
assign led_link = led_link_reg;
assign tx_clkena = tx_clkena_reg;
assign rx_clkena = rx_clkena_reg;
assign rx_recovclkout = rx_recovclkout_reg;
assign readdata = readdata_reg;
assign waitrequest = waitrequest_reg;
assign txp = txp_reg;
assign pcs_pwrdn_out = pcs_pwrdn_out_reg;
assign reconfig_fromgxb = reconfig_fromgxb_reg;

[MASKED]

endmodule