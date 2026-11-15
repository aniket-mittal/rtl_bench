module adi_jesd204_glue (
  input in_pll_powerdown,
  output out_pll_powerdown,
  output out_mcgb_rst,
  output out_pll_select_gnd
);

  assign out_pll_powerdown = in_pll_powerdown;
  assign out_mcgb_rst = in_pll_powerdown;
  assign out_pll_select_gnd = 1'b0;

endmodule