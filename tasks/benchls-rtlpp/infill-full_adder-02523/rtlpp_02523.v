module rtlpp_02523(X, Y, Z, S, C);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  [MASKED]
  assign S = X ^ Y ^ Z;
endmodule