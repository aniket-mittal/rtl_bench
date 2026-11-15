module autovcoder_051933 (
    i_a,
    i_b,
    o_p,
    o_g
);
  input i_a;
  input i_b;
  output o_p;
  output o_g;

  // Internal wires
  wire FE_RN_52_0;
  wire FE_RN_50_0;
  wire FE_RN_49_0;
  wire FE_OFN17883_mult_c_out_12;

  INVX2 FE_RC_11977_0 (
      .A(i_a),
      .Y(FE_RN_49_0)
  );
  NOR2X1 FE_RC_11976_0 (
      .A(FE_RN_49_0),
      .B(FE_OFN17883_mult_c_out_12),
      .Y(FE_RN_50_0)
  );
  INVX4 FE_RC_11974_0 (
      .A(FE_RN_52_0),
      .Y(o_p)
  );
  AOI21X1 FE_RC_11973_0 (
      .A(FE_RN_49_0),
      .B(FE_OFN17883_mult_c_out_12),
      .C(FE_RN_50_0),
      .Y(FE_RN_52_0)
  );
  INVX8 FE_OFC21466_mult_c_out_12 (
      .A(i_b),
      .Y(FE_OFN17883_mult_c_out_12)
  );
  AND2X2 U1 (
      .A(i_a),
      .B(FE_OFN17883_mult_c_out_12),
      .Y(o_g)
  );
endmodule

