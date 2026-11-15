module autovcoder_098969 (
    input clk,
    input rst,
    input median_hs,
    input median_vs,
    input median_de,
    input [23:0] median,
    output reg hsv_hs,
    output reg hsv_vs,
    output reg hsv_de,
    output [23:0] hsv
);

  wire [7:0] red, green, blue;
  wire [7:0] hue, saturation, value;

  assign red   = median[23:16];
  assign green = median[15:8];
  assign blue  = median[7:0];

  assign hsv   = {hue, saturation, value};

  reg [7:0] max;
  reg [7:0] min;

  assign hue = 8'd0;  //ignored
  assign saturation = max - min;
  assign value = max;

  [MASKED]

  always @(posedge clk) begin
    hsv_hs <= median_hs;
    hsv_vs <= median_vs;
    hsv_de <= median_de;
  end
endmodule

