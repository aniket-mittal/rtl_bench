module Summodule(E, D, C, M, F, AEB);

  input [3:0] E, D, C;
  input M; 
  output [3:0] F;
  output AEB;
  wire [3:0] EXD, CM;

  xor EXD0gate(EXD[0], E[0], D[0]);
  xor EXD1gate(EXD[1], E[1], D[1]);
  xor EXD2gate(EXD[2], E[2], D[2]);
  xor EXD3gate(EXD[3], E[3], D[3]);

  or CM0gate(CM[0], C[0], M);
  or CM1gate(CM[1], C[1], M);
  or CM2gate(CM[2], C[2], M);
  or CM3gate(CM[3], C[3], M);

  xor F0gate(F[0], EXD[0], CM[0]);
  xor F1gate(F[1], EXD[1], CM[1]);
  xor F2gate(F[2], EXD[2], CM[2]);
  xor F3gate(F[3], EXD[3], CM[3]);

  and AEBgate(AEB, F[0], F[1], F[2], F[3]);

endmodule