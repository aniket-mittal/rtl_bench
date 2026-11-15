module rtlpp_00854(
  output clkout, 
  output sysclk_sel, 
  input io_pwron_rst_l, 
  input [2:0] sel, 
  input testmode_l, 
  input sysclk, 
  input divbypclk, 
  input byp_mult_sel_l, 
  input nstepsel, 
  input jtag_clock_dr, 
  input capture_l, 
  input bypmode
);

  wire force_altclk_l;
  wire altclk_sync_l;
  wire tck_sync;
  wire bypclk_sync_pre;
  wire bypclk_sync;
  wire tck_sync_pre;
  wire force_alt_clk_sync;
  wire mult_sel;
  wire nstep_clock_dr;
  wire clock_dr;
  wire altclk_sync_l_bar;
  wire sysclk_sel_bar;

  assign mult_sel = bypmode | nstepsel;
  assign force_altclk_l = sel[0];
  assign altclk_sync_pre = byp_mult_sel_l;
  assign bypclk_sync_pre = sel[2];
  assign tck_sync_pre = sel[1];

  // ctu_and2 equivalent
  assign nstep_clock_dr = jtag_clock_dr & capture_l;

  // ctu_mux21 equivalent
  assign clock_dr = testmode_l ? jtag_clock_dr : nstep_clock_dr;

  // ctu_clksel_async_synchronizer equivalent for mult_sel_clk
  reg mult_sel_clk_sync_ff1, mult_sel_clk_sync_ff2, mult_sel_clk_sync_ff3;
  always @(posedge sysclk or negedge io_pwron_rst_l) begin
    if (!io_pwron_rst_l) begin
      mult_sel_clk_sync_ff1 <= 1'b0;
      mult_sel_clk_sync_ff2 <= 1'b0;
      mult_sel_clk_sync_ff3 <= 1'b0;
    end else begin
      mult_sel_clk_sync_ff1 <= mult_sel;
      mult_sel_clk_sync_ff2 <= mult_sel_clk_sync_ff1;
      mult_sel_clk_sync_ff3 <= mult_sel_clk_sync_ff2;
    end
  end
  assign force_alt_clk_sync = mult_sel_clk_sync_ff3;

  // ctu_clksel_async_synchronizer equivalent for byp_mult_sel_sync
  reg byp_mult_sel_sync_ff1, byp_mult_sel_sync_ff2, byp_mult_sel_sync_ff3;
  always @(posedge divbypclk or negedge io_pwron_rst_l) begin
    if (!io_pwron_rst_l) begin
      byp_mult_sel_sync_ff1 <= 1'b0;
      byp_mult_sel_sync_ff2 <= 1'b0;
      byp_mult_sel_sync_ff3 <= 1'b0;
    end else begin
      byp_mult_sel_sync_ff1 <= altclk_sync_pre;
      byp_mult_sel_sync_ff2 <= byp_mult_sel_sync_ff1;
      byp_mult_sel_sync_ff3 <= byp_mult_sel_sync_ff2;
    end
  end
  assign altclk_sync_l = byp_mult_sel_sync_ff3;

  // ctu_clksel_async_synchronizer equivalent for bypclk_sync
  reg bypclk_sync_ff1, bypclk_sync_ff2, bypclk_sync_ff3;
  always @(posedge divbypclk or posedge io_pwron_rst_l) begin
    if (io_pwron_rst_l) begin
      bypclk_sync_ff1 <= 1'b0;
      bypclk_sync_ff2 <= 1'b0;
      bypclk_sync_ff3 <= 1'b0;
    end else begin
      bypclk_sync_ff1 <= bypclk_sync_pre;
      bypclk_sync_ff2 <= bypclk_sync_ff1;
      bypclk_sync_ff3 <= bypclk_sync_ff2;
    end
  end
  assign bypclk_sync = bypclk_sync_ff3;

  // ctu_clksel_async_synchronizer equivalent for tck_sync
  reg tck_sync_ff1, tck_sync_ff2, tck_sync_ff3;
  always @(posedge jtag_clock_dr or negedge io_pwron_rst_l) begin
    if (!io_pwron_rst_l) begin
      tck_sync_ff1 <= 1'b0;
      tck_sync_ff2 <= 1'b0;
      tck_sync_ff3 <= 1'b0;
    end else begin
      tck_sync_ff1 <= tck_sync_pre;
      tck_sync_ff2 <= tck_sync_ff1;
      tck_sync_ff3 <= tck_sync_ff2;
    end
  end
  assign tck_sync = tck_sync_ff3;

  // bw_u1_aoi22_4x equivalent
  assign clkout = ~((bypclk_sync & divbypclk) | (tck_sync & clock_dr));

  // ctu_inv equivalent 1
  assign altclk_sync_l_bar = ~altclk_sync_l;

  // bw_u1_oai21_4x equivalent
  assign sysclk_sel_bar = ~((~altclk_sync_l_bar & force_altclk_l) | force_alt_clk_sync);

  // ctu_inv equivalent 2
  assign sysclk_sel = ~sysclk_sel_bar;

endmodule