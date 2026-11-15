// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module NOR2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 | A2);
endmodule

module AND2_X1 (input A1, input A2, output ZN);
  assign ZN = A1 & A2;
endmodule

module XOR2_X1 (input A, input B, output Z);
  assign Z = A ^ B;
endmodule
