// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module INV_X1 (input A, output ZN);
  assign ZN = ~A;
endmodule

module AOI22_X1 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2));
endmodule
