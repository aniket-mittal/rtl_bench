module autovcoder_101203 (
    address,
    sout
);

  input [5:0] address;
  output reg [3:0] sout;

  wire [1:0] row;
  wire [3:0] col;

  assign row = {address[5], address[0]};
  assign col = address[4:1];

  [MASKED]

endmodule

