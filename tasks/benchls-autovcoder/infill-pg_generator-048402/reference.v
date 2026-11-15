module autovcoder_048402 (
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
  wire FE_RN_5419_0;
  wire FE_RN_5418_0;
  wire FE_RN_5417_0;
  wire FE_RN_5416_0;

  INVX2 FE_RC_24348_0 (
      .A(i_a),
      .Y(FE_RN_5416_0)
  );
  NOR2X1 FE_RC_24347_0 (
      .A(FE_RN_5416_0),
      .B(i_b),
      .Y(FE_RN_5417_0)
  );
  INVX2 FE_RC_24346_0 (
      .A(i_a),
      .Y(FE_RN_5418_0)
  );
  INVX4 FE_RC_24345_0 (
      .A(FE_RN_5419_0),
      .Y(o_p)
  );
  AOI21X1 FE_RC_24344_0 (
      .A(FE_RN_5418_0),
      .B(i_b),
      .C(FE_RN_5417_0),
      .Y(FE_RN_5419_0)
  );
  AND2X2 U1 (
      .A(i_a),
      .B(i_b),
      .Y(o_g)
  );
endmodule

