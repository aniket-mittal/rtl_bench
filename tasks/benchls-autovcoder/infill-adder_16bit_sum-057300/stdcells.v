// Behavioural models of the standard cells this design instantiates (Nangate 45nm Open Cell Library /
// OSU FreePDK45 functions). Added by the task converter; the original design ships no cell library.

module INVX2 (input A, output Y);
  assign Y = ~A;
endmodule

module NAND2X1 (input A, input B, output Y);
  assign Y = ~(A & B);
endmodule

module XOR2X1 (input A, input B, output Y);
  assign Y = A ^ B;
endmodule

module OAI21X1 (input A, input B, input C, output Y);
  assign Y = ~((A | B) & C);
endmodule
