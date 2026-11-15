module autovcoder_035368 (
    clk,
    d_icode,
    d_ifun,
    d_rA,
    d_rB,
    d_valC,
    d_valP,
    d_valA,
    d_valB,
    e_icode,
    e_ifun,
    e_rA,
    e_rB,
    e_valC,
    e_valP,
    e_valA,
    e_valB
);

  parameter n = 64;
  input clk;
  input [3:0] d_icode, d_ifun;
  input [3:0] d_rA;
  input [3:0] d_rB;
  input [n-1:0] d_valA;
  input [n-1:0] d_valB;
  input [n-1:0] d_valC;
  input [n-1:0] d_valP;
  output reg [3:0] e_icode, e_ifun;
  output reg [3:0] e_rA;
  output reg [3:0] e_rB;
  output reg [n-1:0] e_valA;
  output reg [n-1:0] e_valB;
  output reg [n-1:0] e_valC;
  output reg [n-1:0] e_valP;

  [MASKED]

endmodule

