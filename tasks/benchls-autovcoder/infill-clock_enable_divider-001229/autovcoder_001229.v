module autovcoder_001229 (
    CLOCK_50,
    reset,
    enable,
    divider,
    enabledelay1,
    enabledelay2,
    enabledelay3,
    enabledelay4,
    enabledelay5
);
  input CLOCK_50, reset;
  input [2:0] divider;
  output reg enable;
  output reg enabledelay1;
  output reg enabledelay2;
  output reg enabledelay3;
  output reg enabledelay4;
  output reg enabledelay5;
  reg [32:0] count;

  [MASKED]

  always @(posedge CLOCK_50 or negedge reset) begin
    if (!reset) begin
      enable <= 0;
      enabledelay1 <= 0;
      enabledelay2 <= 0;
      enabledelay3 <= 0;
      enabledelay4 <= 0;
      enabledelay5 <= 0;
    end else begin
      if (count == 0) enable <= 1;
      else enable <= 0;
      enabledelay1 <= enable;
      enabledelay2 <= enabledelay1;
      enabledelay3 <= enabledelay2;
      enabledelay4 <= enabledelay3;
      enabledelay5 <= enabledelay4;
    end
  end
endmodule

