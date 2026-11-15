module adi_jesd204_glue (
  input in_pll_powerdown,
  output out_pll_powerdown,
  output out_mcgb_rst,
  output out_pll_select_gnd
);

  [MASKED]
  assign out_pll_select_gnd = 1'b0;

endmodule