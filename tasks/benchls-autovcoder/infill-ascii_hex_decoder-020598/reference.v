module autovcoder_020598 (
    charIn,
    nybleOut
);

  input [7:0] charIn;
  output [3:0] nybleOut;

  parameter _0_ = 7'h30;
  parameter _1_ = 7'h31;
  parameter _2_ = 7'h32;
  parameter _3_ = 7'h33;
  parameter _4_ = 7'h34;
  parameter _5_ = 7'h35;
  parameter _6_ = 7'h36;
  parameter _7_ = 7'h37;
  parameter _8_ = 7'h38;
  parameter _9_ = 7'h39;
  parameter _A_ = 7'b1x0_0001;
  parameter _B_ = 7'b1x0_0010;
  parameter _C_ = 7'b1x0_0011;
  parameter _D_ = 7'b1x0_0100;
  parameter _E_ = 7'b1x0_0101;
  parameter _F_ = 7'b1x0_0110;

  reg  [3:0] nybleOut;
  wire [6:0] charIn7;
  assign charIn7[6:0] = charIn[6:0];

  always @(*)
    casex (charIn7)
      _0_: nybleOut = 4'h0;
      _1_: nybleOut = 4'h1;
      _2_: nybleOut = 4'h2;
      _3_: nybleOut = 4'h3;
      _4_: nybleOut = 4'h4;
      _5_: nybleOut = 4'h5;
      _6_: nybleOut = 4'h6;
      _7_: nybleOut = 4'h7;
      _8_: nybleOut = 4'h8;
      _9_: nybleOut = 4'h9;
      _A_: nybleOut = 4'hA;
      _B_: nybleOut = 4'hB;
      _C_: nybleOut = 4'hC;
      _D_: nybleOut = 4'hD;
      _E_: nybleOut = 4'hE;
      _F_: nybleOut = 4'hF;
      default: nybleOut = 4'h0;
    endcase

endmodule

