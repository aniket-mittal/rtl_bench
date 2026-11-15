module reset_set(
  input clk,
  input nrst,
  input s,
  input r,
  output logic q = 0,   // aka "present state"
  output nq
);

[MASKED]

assign nq = ~q;

endmodule