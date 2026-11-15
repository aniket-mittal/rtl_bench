module CARRY4(CO, O, CI, CYINIT, DI, S);
  output [3:0] CO, O;
  input  CI, CYINIT;
  input  [3:0] DI, S;
  wire ci_or_cyinit;
  assign ci_or_cyinit = CI | CYINIT;
  assign O = S ^ {CO[2:0], ci_or_cyinit};
  assign CO[0] = S[0] ? ci_or_cyinit : DI[0];
  assign CO[1] = S[1] ? CO[0] : DI[1];
  assign CO[2] = S[2] ? CO[1] : DI[2];
  assign CO[3] = S[3] ? CO[2] : DI[3];
endmodule