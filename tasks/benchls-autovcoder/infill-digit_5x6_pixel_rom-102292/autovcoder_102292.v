module autovcoder_102292 (
    output [29:0] OUT,
    input  [ 3:0] IN
);
  reg [29:0] pixels;

  assign OUT[5:0]   = pixels[5:0];
  assign OUT[11:6]  = pixels[11:6];
  assign OUT[17:12] = pixels[17:12];
  assign OUT[23:18] = pixels[23:18];
  assign OUT[29:24] = pixels[29:24];

  // pixel information to make a 5x6 representation of each digit
  [MASKED]
endmodule

