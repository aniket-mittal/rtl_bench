module Emodule (A, B, S, E, Bb);

  input [3:0] A, B, S;
  output [3:0] E, Bb;
  wire [3:0]  ABS3, ABbS2;

  not Bb0gate(Bb[0], B[0]);
  not Bb1gate(Bb[1], B[1]);
  not Bb2gate(Bb[2], B[2]);
  not Bb3gate(Bb[3], B[3]);

  and ABS30gate(ABS3[0], A[0], B[0], S[3]);
  and ABS31gate(ABS3[1], A[1], B[1], S[3]);
  and ABS32gate(ABS3[2], A[2], B[2], S[3]);
  and ABS33gate(ABS3[3], A[3], B[3], S[3]);

  and ABbS20gate(ABbS2[0], A[0], Bb[0], S[2]);
  and ABbS21gate(ABbS2[1], A[1], Bb[1], S[2]);
  and ABbS22gate(ABbS2[2], A[2], Bb[2], S[2]);
  and ABbS23gate(ABbS2[3], A[3], Bb[3], S[2]);

  nor E0gate(E[0], ABS3[0], ABbS2[0]);
  nor E1gate(E[1], ABS3[1], ABbS2[1]);
  nor E2gate(E[2], ABS3[2], ABbS2[2]);
  nor E3gate(E[3], ABS3[3], ABbS2[3]);

endmodule