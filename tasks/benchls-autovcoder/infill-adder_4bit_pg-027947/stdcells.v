// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module NAND2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 & A2);
endmodule

module NOR2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 | A2);
endmodule

module XNOR2_X1 (input A, input B, output ZN);
  assign ZN = ~(A ^ B);
endmodule

module OAI21_X1 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A & (B1 | B2));
endmodule

module AOI22_X1 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2));
endmodule

module OAI22_X1 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2));
endmodule

module FA_X1 (input A, input B, input CI, output CO, output S);
  assign CO = (A & B) | (CI & (A | B));
  assign S = A ^ B ^ CI;
endmodule
