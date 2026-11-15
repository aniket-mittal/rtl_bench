module D_FlipFlop_Set_Reset (CLK, CLR_n, D, PR_n, Q, Q_n);
  input CLK;
  input CLR_n;
  input D;
  input PR_n;
  output Q;
  output Q_n;

  reg Q;

  assign Q_n = ~Q;

  [MASKED]
endmodule