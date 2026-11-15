module autovcoder_076480 (
    addrtail,
    width,
    zext,
    inval,
    outval
);

  input wire [1:0] addrtail;
  input wire [1:0] width;
  input wire zext;
  input wire [31:0] inval;
  output reg [31:0] outval;

  wire [3:0] addrtail_width;
  assign addrtail_width = {addrtail, width};

  [MASKED]

endmodule

