module autovcoder_026862 (

    input [4 : 0]  din,
    output    kcode,
    output [3 : 0]  dout
);

  reg [3 : 0] dout_c;
  reg         kcode_c;

  [MASKED]

  assign dout  = dout_c;
  assign kcode = kcode_c;

endmodule

