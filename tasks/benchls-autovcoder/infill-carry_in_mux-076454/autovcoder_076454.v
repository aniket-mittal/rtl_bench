module autovcoder_076454 (
    mux_alt_cin,
    c4_in,
    c_skip4_in,
    c_skip8_in,

    r4_in_b,
    p4_in_b,
    p8_in_b,

    c_in
);

  input mux_alt_cin;
  input c4_in;
  input c_skip4_in;
  input c_skip8_in;

  input r4_in_b;
  input p4_in_b;
  input p8_in_b;

  output c_in;

  wire [2:0] sel;

  parameter is_le_cin_below = "false";
  parameter le_skip_en = "false";

  //----------------------------------------------------------------------------------------------------------------
  parameter is_le_cin_inv = "false";  //le carry input invert, default is "true"
  wire mux_alt_cin_in = (is_le_cin_inv == "false") ? mux_alt_cin : ~mux_alt_cin;
  //----------------------------------------------------------------------------------------------------------------

`ifndef CS_SW_IGNORE
  assign sel = {!p8_in_b, !p4_in_b, !r4_in_b};
  [MASKED]


  specify

    (mux_alt_cin => c_in) = (0, 0);
    (c4_in => c_in) = (0, 0);
    (c_skip4_in => c_in) = (0, 0);
    (c_skip8_in => c_in) = (0, 0);
    (p8_in_b => c_in) = (0, 0);
    (p4_in_b => c_in) = (0, 0);
    (r4_in_b => c_in) = (0, 0);


  endspecify

`endif

endmodule

