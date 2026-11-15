module autovcoder_055083 (
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
  wire FE_OCPN24167_adder_4_out_18;
  wire FE_RN_1068_0;
  wire FE_RN_1066_0;
  wire FE_RN_1065_0;

  BUFX2 FE_OCPC24167_adder_4_out_18 (
      .A(i_a),
      .Y(FE_OCPN24167_adder_4_out_18)
  );
  INVX2 FE_RC_14195_0 (
      .A(i_b),
      .Y(FE_RN_1065_0)
  );
  NOR2X1 FE_RC_14194_0 (
      .A(FE_RN_1065_0),
      .B(i_a),
      .Y(FE_RN_1066_0)
  );
  INVX4 FE_RC_14192_0 (
      .A(FE_RN_1068_0),
      .Y(o_p)
  );
  AOI21X1 FE_RC_14191_0 (
      .A(FE_RN_1065_0),
      .B(FE_OCPN24167_adder_4_out_18),
      .C(FE_RN_1066_0),
      .Y(FE_RN_1068_0)
  );
  AND2X2 U1 (
      .A(FE_OCPN24167_adder_4_out_18),
      .B(i_b),
      .Y(o_g)
  );
endmodule

