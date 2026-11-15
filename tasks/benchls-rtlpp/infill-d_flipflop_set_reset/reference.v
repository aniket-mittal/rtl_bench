module D_FlipFlop_Set_Reset (CLK, CLR_n, D, PR_n, Q, Q_n);
  input CLK;
  input CLR_n;
  input D;
  input PR_n;
  output Q;
  output Q_n;

  reg Q;

  assign Q_n = ~Q;

  always @(posedge CLK or negedge CLR_n or negedge PR_n) begin
    if (!CLR_n)
      Q <= 0;
    else if (!PR_n)
      Q <= 1;
    else
      Q <= D;
  end
endmodule