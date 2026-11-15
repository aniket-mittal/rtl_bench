// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module XNOR2_X1 (input A, input B, output ZN);
  assign ZN = ~(A ^ B);
endmodule
