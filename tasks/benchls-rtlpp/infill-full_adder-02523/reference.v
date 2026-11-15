module rtlpp_02523(X, Y, Z, S, C);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = (X & Y) | (Y & Z) | (Z & X);
  assign S = X ^ Y ^ Z;
endmodule