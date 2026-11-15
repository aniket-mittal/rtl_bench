// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module INV_X1 (input A, output ZN);
  assign ZN = ~A;
endmodule

module AND2_X1 (input A1, input A2, output ZN);
  assign ZN = A1 & A2;
endmodule

module XOR2_X1 (input A, input B, output Z);
  assign Z = A ^ B;
endmodule

module XNOR2_X1 (input A, input B, output ZN);
  assign ZN = ~(A ^ B);
endmodule

module AOI21_X1 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A | (B1 & B2));
endmodule
