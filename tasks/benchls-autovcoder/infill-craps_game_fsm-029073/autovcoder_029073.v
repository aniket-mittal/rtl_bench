module autovcoder_029073 (
    Rb,
    Reset,
    CLK,
    Sum,
    Roll,
    Win,
    Lose
);
  input Rb;
  input Reset;
  input CLK;
  input [3:0] Sum;
  output Roll;
  output Win;
  output Lose;
  reg Roll;
  reg Win;
  reg Lose;

  reg [2:0] State;
  reg [2:0] Nextstate;
  reg [3:0] Point;
  reg Sp;
  initial begin
    State = 0;
    Nextstate = 0;
    Point = 2;
  end
  [MASKED]
  always @(posedge CLK) begin
    State <= Nextstate;
    if (Sp == 1'b1) begin
      Point <= Sum;
    end
  end
endmodule

