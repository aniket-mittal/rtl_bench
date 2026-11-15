module Dmodule (A, B, Bb, S, D);

  input [3:0] A, B, Bb, S;
  output [3:0] D;
  wire [3:0]  BbS1, BS0;  

  and BbS10gate(BbS1[0], Bb[0], S[1]);
  and BbS11gate(BbS1[1], Bb[1], S[1]);
  and BbS12gate(BbS1[2], Bb[2], S[1]);
  and BbS13gate(BbS1[3], Bb[3], S[1]);

  and BS00gate(BS0[0], B[0], S[0]);
  and BS01gate(BS0[1], B[1], S[0]);
  and BS02gate(BS0[2], B[2], S[0]);
  and BS03gate(BS0[3], B[3], S[0]);

  nor D0gate(D[0], BbS1[0], BS0[0], A[0]);
  nor D1gate(D[1], BbS1[1], BS0[1], A[1]);
  nor D2gate(D[2], BbS1[2], BS0[2], A[2]);
  nor D3gate(D[3], BbS1[3], BS0[3], A[3]);

endmodule