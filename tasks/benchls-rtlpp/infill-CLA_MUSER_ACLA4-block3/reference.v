module CLA_MUSER_ACLA4(
    input Ci,
    input G0, 
    input G1, 
    input G2, 
    input G3, 
    input P0, 
    input P1, 
    input P2, 
    input P3, 
    output C1, 
    output C2, 
    output C3, 
    output GG, 
    output GP
);
   
   wire XLXN_3;
   wire XLXN_36;
   wire XLXN_59;
   wire XLXN_100;
   wire XLXN_105;
   wire XLXN_108;
   wire XLXN_163;
   wire XLXN_164;
   wire XLXN_165;
   
   assign XLXN_3 = P0 & Ci;
   assign XLXN_59 = G0 & P1;
   assign C1 = G0 | XLXN_3;
   assign XLXN_36 = P1 & P0 & Ci;
   assign C2 = G1 | XLXN_59 | XLXN_36;
   assign XLXN_108 = P2 & G1;
   assign XLXN_105 = P2 & P1 & G0;
   assign XLXN_100 = P2 & P1 & P0 & Ci;
   assign C3 = G2 | XLXN_108 | XLXN_105 | XLXN_100;
   assign GP = P3 & P2 & P1 & P0;
   assign XLXN_163 = P3 & P2 & P1 & G0;
   assign XLXN_164 = P3 & P2 & G1;
   assign XLXN_165 = P3 & G2;
   assign GG = G3 | XLXN_165 | XLXN_164 | XLXN_163;

endmodule