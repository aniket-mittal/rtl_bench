// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module INV_X1 (input A, output ZN);
  assign ZN = ~A;
endmodule

module NAND2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 & A2);
endmodule

module NOR2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 | A2);
endmodule

module NAND3_X1 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 & A2 & A3);
endmodule

module NOR3_X1 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 | A2 | A3);
endmodule

module NAND4_X1 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 & A2 & A3 & A4);
endmodule

module OAI21_X1 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A & (B1 | B2));
endmodule

module OAI22_X1 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2));
endmodule
