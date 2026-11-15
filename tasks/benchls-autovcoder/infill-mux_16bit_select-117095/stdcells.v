// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module INV_X2 (input A, output ZN);
  assign ZN = ~A;
endmodule

module NAND2_X2 (input A1, input A2, output ZN);
  assign ZN = ~(A1 & A2);
endmodule

module OAI21_X2 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A & (B1 | B2));
endmodule

module MUX2_X2 (input A, input B, input S, output Z);
  assign Z = S ? B : A;
endmodule
