module autovcoder_073855 (
    // inputs:
    atm_valid,
    dtm_valid,
    itm_valid,

    // outputs:
    compute_input_tm_cnt
);

  output [1:0] compute_input_tm_cnt;
  input atm_valid;
  input dtm_valid;
  input itm_valid;


  reg  [1:0] compute_input_tm_cnt;
  wire [2:0] switch_for_mux;
  assign switch_for_mux = {itm_valid, atm_valid, dtm_valid};
  [MASKED]



endmodule

