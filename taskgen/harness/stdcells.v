// Behavioural models of common standard cells (combinational and simple flops), for gate-level
// netlists that instantiate library cells without shipping the library.
//
// Nangate 45nm Open Cell Library (FreePDK45) naming: <FUNC>_X<drive>, inputs A/A1../B1../C1../S/CI/D,
// outputs Z (non-inverting) or ZN (inverting), flops CK/D/RN/SN/Q/QN. Function per the Nangate liberty
// file; drive strength does not change function.
// OSU FreePDK45 / osu018 naming: <FUNC>X<drive>, inputs A/B/C/D, output Y.
//
// Converters copy only the cells a design instantiates into a read-only rtl/stdcells.v.
// Every module here is one self-contained `module ... endmodule` with no dependencies.

module INV_X1 (input A, output ZN);
  assign ZN = ~A;
endmodule

module INV_X2 (input A, output ZN);
  assign ZN = ~A;
endmodule

module INV_X4 (input A, output ZN);
  assign ZN = ~A;
endmodule

module INV_X8 (input A, output ZN);
  assign ZN = ~A;
endmodule

module INV_X16 (input A, output ZN);
  assign ZN = ~A;
endmodule

module INV_X32 (input A, output ZN);
  assign ZN = ~A;
endmodule

module BUF_X1 (input A, output Z);
  assign Z = A;
endmodule

module BUF_X2 (input A, output Z);
  assign Z = A;
endmodule

module BUF_X4 (input A, output Z);
  assign Z = A;
endmodule

module BUF_X8 (input A, output Z);
  assign Z = A;
endmodule

module BUF_X16 (input A, output Z);
  assign Z = A;
endmodule

module BUF_X32 (input A, output Z);
  assign Z = A;
endmodule

module CLKBUF_X1 (input A, output Z);
  assign Z = A;
endmodule

module CLKBUF_X2 (input A, output Z);
  assign Z = A;
endmodule

module CLKBUF_X3 (input A, output Z);
  assign Z = A;
endmodule

module NAND2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 & A2);
endmodule

module NAND2_X2 (input A1, input A2, output ZN);
  assign ZN = ~(A1 & A2);
endmodule

module NAND2_X4 (input A1, input A2, output ZN);
  assign ZN = ~(A1 & A2);
endmodule

module NOR2_X1 (input A1, input A2, output ZN);
  assign ZN = ~(A1 | A2);
endmodule

module NOR2_X2 (input A1, input A2, output ZN);
  assign ZN = ~(A1 | A2);
endmodule

module NOR2_X4 (input A1, input A2, output ZN);
  assign ZN = ~(A1 | A2);
endmodule

module AND2_X1 (input A1, input A2, output ZN);
  assign ZN = A1 & A2;
endmodule

module AND2_X2 (input A1, input A2, output ZN);
  assign ZN = A1 & A2;
endmodule

module AND2_X4 (input A1, input A2, output ZN);
  assign ZN = A1 & A2;
endmodule

module OR2_X1 (input A1, input A2, output ZN);
  assign ZN = A1 | A2;
endmodule

module OR2_X2 (input A1, input A2, output ZN);
  assign ZN = A1 | A2;
endmodule

module OR2_X4 (input A1, input A2, output ZN);
  assign ZN = A1 | A2;
endmodule

module NAND3_X1 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 & A2 & A3);
endmodule

module NAND3_X2 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 & A2 & A3);
endmodule

module NAND3_X4 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 & A2 & A3);
endmodule

module NOR3_X1 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 | A2 | A3);
endmodule

module NOR3_X2 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 | A2 | A3);
endmodule

module NOR3_X4 (input A1, input A2, input A3, output ZN);
  assign ZN = ~(A1 | A2 | A3);
endmodule

module AND3_X1 (input A1, input A2, input A3, output ZN);
  assign ZN = A1 & A2 & A3;
endmodule

module AND3_X2 (input A1, input A2, input A3, output ZN);
  assign ZN = A1 & A2 & A3;
endmodule

module AND3_X4 (input A1, input A2, input A3, output ZN);
  assign ZN = A1 & A2 & A3;
endmodule

module OR3_X1 (input A1, input A2, input A3, output ZN);
  assign ZN = A1 | A2 | A3;
endmodule

module OR3_X2 (input A1, input A2, input A3, output ZN);
  assign ZN = A1 | A2 | A3;
endmodule

module OR3_X4 (input A1, input A2, input A3, output ZN);
  assign ZN = A1 | A2 | A3;
endmodule

module NAND4_X1 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 & A2 & A3 & A4);
endmodule

module NAND4_X2 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 & A2 & A3 & A4);
endmodule

module NAND4_X4 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 & A2 & A3 & A4);
endmodule

module NOR4_X1 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 | A2 | A3 | A4);
endmodule

module NOR4_X2 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 | A2 | A3 | A4);
endmodule

module NOR4_X4 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = ~(A1 | A2 | A3 | A4);
endmodule

module AND4_X1 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = A1 & A2 & A3 & A4;
endmodule

module AND4_X2 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = A1 & A2 & A3 & A4;
endmodule

module AND4_X4 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = A1 & A2 & A3 & A4;
endmodule

module OR4_X1 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = A1 | A2 | A3 | A4;
endmodule

module OR4_X2 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = A1 | A2 | A3 | A4;
endmodule

module OR4_X4 (input A1, input A2, input A3, input A4, output ZN);
  assign ZN = A1 | A2 | A3 | A4;
endmodule

module XOR2_X1 (input A, input B, output Z);
  assign Z = A ^ B;
endmodule

module XOR2_X2 (input A, input B, output Z);
  assign Z = A ^ B;
endmodule

module XNOR2_X1 (input A, input B, output ZN);
  assign ZN = ~(A ^ B);
endmodule

module XNOR2_X2 (input A, input B, output ZN);
  assign ZN = ~(A ^ B);
endmodule

module AOI21_X1 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A | (B1 & B2));
endmodule

module AOI21_X2 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A | (B1 & B2));
endmodule

module AOI21_X4 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A | (B1 & B2));
endmodule

module OAI21_X1 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A & (B1 | B2));
endmodule

module OAI21_X2 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A & (B1 | B2));
endmodule

module OAI21_X4 (input A, input B1, input B2, output ZN);
  assign ZN = ~(A & (B1 | B2));
endmodule

module AOI22_X1 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2));
endmodule

module AOI22_X2 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2));
endmodule

module AOI22_X4 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2));
endmodule

module OAI22_X1 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2));
endmodule

module OAI22_X2 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2));
endmodule

module OAI22_X4 (input A1, input A2, input B1, input B2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2));
endmodule

module AOI211_X1 (input A, input B, input C1, input C2, output ZN);
  assign ZN = ~((C1 & C2) | A | B);
endmodule

module AOI211_X2 (input A, input B, input C1, input C2, output ZN);
  assign ZN = ~((C1 & C2) | A | B);
endmodule

module AOI211_X4 (input A, input B, input C1, input C2, output ZN);
  assign ZN = ~((C1 & C2) | A | B);
endmodule

module OAI211_X1 (input A, input B, input C1, input C2, output ZN);
  assign ZN = ~((C1 | C2) & A & B);
endmodule

module OAI211_X2 (input A, input B, input C1, input C2, output ZN);
  assign ZN = ~((C1 | C2) & A & B);
endmodule

module OAI211_X4 (input A, input B, input C1, input C2, output ZN);
  assign ZN = ~((C1 | C2) & A & B);
endmodule

module AOI221_X1 (input A, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((C1 & C2) | A | (B1 & B2));
endmodule

module AOI221_X2 (input A, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((C1 & C2) | A | (B1 & B2));
endmodule

module AOI221_X4 (input A, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((C1 & C2) | A | (B1 & B2));
endmodule

module OAI221_X1 (input A, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((C1 | C2) & A & (B1 | B2));
endmodule

module OAI221_X2 (input A, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((C1 | C2) & A & (B1 | B2));
endmodule

module OAI221_X4 (input A, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((C1 | C2) & A & (B1 | B2));
endmodule

module AOI222_X1 (input A1, input A2, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2) | (C1 & C2));
endmodule

module AOI222_X2 (input A1, input A2, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2) | (C1 & C2));
endmodule

module AOI222_X4 (input A1, input A2, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((A1 & A2) | (B1 & B2) | (C1 & C2));
endmodule

module OAI222_X1 (input A1, input A2, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2) & (C1 | C2));
endmodule

module OAI222_X2 (input A1, input A2, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2) & (C1 | C2));
endmodule

module OAI222_X4 (input A1, input A2, input B1, input B2, input C1, input C2, output ZN);
  assign ZN = ~((A1 | A2) & (B1 | B2) & (C1 | C2));
endmodule

module OAI33_X1 (input A1, input A2, input A3, input B1, input B2, input B3, output ZN);
  assign ZN = ~((A1 | A2 | A3) & (B1 | B2 | B3));
endmodule

module MUX2_X1 (input A, input B, input S, output Z);
  assign Z = S ? B : A;
endmodule

module MUX2_X2 (input A, input B, input S, output Z);
  assign Z = S ? B : A;
endmodule

module FA_X1 (input A, input B, input CI, output CO, output S);
  assign CO = (A & B) | (CI & (A | B));
  assign S = A ^ B ^ CI;
endmodule

module HA_X1 (input A, input B, output CO, output S);
  assign CO = A & B;
  assign S = A ^ B;
endmodule

module LOGIC0_X1 (output Z);
  assign Z = 1'b0;
endmodule

module LOGIC1_X1 (output Z);
  assign Z = 1'b1;
endmodule

module DFF_X1 (input D, input CK, output reg Q, output QN);
  always @(posedge CK) Q <= D;
  assign QN = ~Q;
endmodule

module DFFR_X1 (input D, input RN, input CK, output reg Q, output QN);
  always @(posedge CK or negedge RN) if (!RN) Q <= 1'b0; else Q <= D;
  assign QN = ~Q;
endmodule

module DFFS_X1 (input D, input SN, input CK, output reg Q, output QN);
  always @(posedge CK or negedge SN) if (!SN) Q <= 1'b1; else Q <= D;
  assign QN = ~Q;
endmodule

module SDFF_X1 (input D, input SE, input SI, input CK, output reg Q, output QN);
  always @(posedge CK) Q <= SE ? SI : D;
  assign QN = ~Q;
endmodule

module DLH_X1 (input D, input G, output reg Q);
  always @* if (G) Q = D;
endmodule

module DLL_X1 (input D, input GN, output reg Q);
  always @* if (!GN) Q = D;
endmodule

module DFF_X2 (input D, input CK, output reg Q, output QN);
  always @(posedge CK) Q <= D;
  assign QN = ~Q;
endmodule

module DFFR_X2 (input D, input RN, input CK, output reg Q, output QN);
  always @(posedge CK or negedge RN) if (!RN) Q <= 1'b0; else Q <= D;
  assign QN = ~Q;
endmodule

module DFFS_X2 (input D, input SN, input CK, output reg Q, output QN);
  always @(posedge CK or negedge SN) if (!SN) Q <= 1'b1; else Q <= D;
  assign QN = ~Q;
endmodule

module SDFF_X2 (input D, input SE, input SI, input CK, output reg Q, output QN);
  always @(posedge CK) Q <= SE ? SI : D;
  assign QN = ~Q;
endmodule

module DLH_X2 (input D, input G, output reg Q);
  always @* if (G) Q = D;
endmodule

module DLL_X2 (input D, input GN, output reg Q);
  always @* if (!GN) Q = D;
endmodule

module INVX1 (input A, output Y);
  assign Y = ~A;
endmodule

module INVX2 (input A, output Y);
  assign Y = ~A;
endmodule

module INVX4 (input A, output Y);
  assign Y = ~A;
endmodule

module INVX8 (input A, output Y);
  assign Y = ~A;
endmodule

module BUFX2 (input A, output Y);
  assign Y = A;
endmodule

module BUFX4 (input A, output Y);
  assign Y = A;
endmodule

module NAND2X1 (input A, input B, output Y);
  assign Y = ~(A & B);
endmodule

module NAND3X1 (input A, input B, input C, output Y);
  assign Y = ~(A & B & C);
endmodule

module NOR2X1 (input A, input B, output Y);
  assign Y = ~(A | B);
endmodule

module NOR3X1 (input A, input B, input C, output Y);
  assign Y = ~(A | B | C);
endmodule

module AND2X1 (input A, input B, output Y);
  assign Y = A & B;
endmodule

module AND2X2 (input A, input B, output Y);
  assign Y = A & B;
endmodule

module OR2X1 (input A, input B, output Y);
  assign Y = A | B;
endmodule

module OR2X2 (input A, input B, output Y);
  assign Y = A | B;
endmodule

module XOR2X1 (input A, input B, output Y);
  assign Y = A ^ B;
endmodule

module XNOR2X1 (input A, input B, output Y);
  assign Y = ~(A ^ B);
endmodule

module AOI21X1 (input A, input B, input C, output Y);
  assign Y = ~((A & B) | C);
endmodule

module AOI22X1 (input A, input B, input C, input D, output Y);
  assign Y = ~((A & B) | (C & D));
endmodule

module OAI21X1 (input A, input B, input C, output Y);
  assign Y = ~((A | B) & C);
endmodule

module OAI22X1 (input A, input B, input C, input D, output Y);
  assign Y = ~((A | B) & (C | D));
endmodule

module HAX1 (input A, input B, output YC, output YS);
  assign YC = A & B;
  assign YS = A ^ B;
endmodule

module FAX1 (input A, input B, input C, output YC, output YS);
  assign YC = (A & B) | (C & (A | B));
  assign YS = A ^ B ^ C;
endmodule

module DFFPOSX1 (input CLK, input D, output reg Q);
  always @(posedge CLK) Q <= D;
endmodule

module DFFNEGX1 (input CLK, input D, output reg Q);
  always @(negedge CLK) Q <= D;
endmodule
