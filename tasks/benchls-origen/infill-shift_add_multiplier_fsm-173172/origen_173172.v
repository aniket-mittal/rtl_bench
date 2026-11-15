module origen_173172(
  input [3:0] a,
  input [3:0] b,
  input clock,
  input _reset,
  input _dav,
  output [5:0] p,
  output rfd
);

  reg [3:0] A, B;
  reg [5:0] P;
  reg RFD;
  reg [1:0] STAR;

  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

  [MASKED]

  assign p = P;
  assign rfd = RFD;

endmodule