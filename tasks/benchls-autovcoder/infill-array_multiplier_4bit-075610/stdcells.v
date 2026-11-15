// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module AND2_X1 (input A1, input A2, output ZN);
  assign ZN = A1 & A2;
endmodule

module FA_X1 (input A, input B, input CI, output CO, output S);
  assign CO = (A & B) | (CI & (A | B));
  assign S = A ^ B ^ CI;
endmodule

module HA_X1 (input A, input B, output CO, output S);
  assign CO = A & B;
  assign S = A ^ B;
endmodule
