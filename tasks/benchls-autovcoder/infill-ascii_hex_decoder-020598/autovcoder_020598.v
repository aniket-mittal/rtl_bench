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

  [MASKED]

endmodule

