// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module FA_X1 (input A, input B, input CI, output CO, output S);
  assign CO = (A & B) | (CI & (A | B));
  assign S = A ^ B ^ CI;
endmodule
