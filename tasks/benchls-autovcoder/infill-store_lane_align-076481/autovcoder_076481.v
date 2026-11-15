module autovcoder_076481 (
    addrtail,
    width,
    inval,
    out_wbyte_enable,
    outval
);

  input wire [1:0] addrtail;
  input wire [1:0] width;
  input wire [31:0] inval;
  output reg [3:0] out_wbyte_enable;
  output reg [31:0] outval;

  wire [3:0] addrtail_width;
  assign addrtail_width = {addrtail, width};

  [MASKED]

endmodule

