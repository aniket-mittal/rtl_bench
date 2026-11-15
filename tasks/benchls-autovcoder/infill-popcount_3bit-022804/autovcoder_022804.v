module autovcoder_022804 (
    // inputs:
    atm_valid,
    dtm_valid,
    itm_valid,

    // outputs:
    compute_tm_count
);

  output [1:0] compute_tm_count;
  input atm_valid;
  input dtm_valid;
  input itm_valid;

  reg  [1:0] compute_tm_count;
  wire [2:0] switch_for_mux;
  assign switch_for_mux = {itm_valid, atm_valid, dtm_valid};
  [MASKED]



endmodule

