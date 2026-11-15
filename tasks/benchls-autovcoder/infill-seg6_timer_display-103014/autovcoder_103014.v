module autovcoder_103014 (
    SEG1,
    SEG2,
    SEG3,
    SEG4,
    SEG5,
    SEG6,
    CLK_1Hz,
    CLK_50MHz,
    Res
);
  // output
  output reg [6:0] SEG1, SEG2, SEG3, SEG4, SEG5, SEG6;
  output reg CLK_1Hz;
  // input
  input CLK_50MHz, Res;
  // register
  reg [27:0] CLK_1Hz_count = 0;
  // parameter
  parameter A = 7'b100_0110, B = 7'b111_1001, C = 7'b100_0000,
			 D = 7'b111_1000, E = 7'b111_1001, F = 7'b011_0000,
			 G = 7'b100_0000, H = 7'b001_1001, I = 7'b000_0000,
			 X = 7'b111_1111;
  reg [4:0] count = 5'd0;

  // 50MHz --> 1Hz = 1s
  always @(posedge CLK_50MHz) begin
    if (CLK_1Hz_count > 25000000) begin  // (1Hz)25000000 or (10KHz)5000
      CLK_1Hz = ~CLK_1Hz;
      CLK_1Hz_count = 1'd0;
    end else CLK_1Hz_count = CLK_1Hz_count + 1;
  end

  // 7 Segment Display
  [MASKED]
endmodule

