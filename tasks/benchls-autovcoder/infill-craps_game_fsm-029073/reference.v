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
  always @(Rb or Reset or Sum or State) begin
    Sp = 1'b0;
    Roll = 1'b0;
    Win = 1'b0;
    Lose = 1'b0;
    Nextstate = 0;
    case (State)
      0: begin
        if (Rb == 1'b1) begin
          Nextstate = 1;
        end
      end
      1: begin
        if (Rb == 1'b1) begin
          Roll = 1'b1;
        end else if (Sum == 7 | Sum == 11) begin
          Nextstate = 2;
        end else if (Sum == 2 | Sum == 3 | Sum == 12) begin
          Nextstate = 3;
        end else begin
          Sp = 1'b1;
          Nextstate = 4;
        end
      end
      2: begin
        Win = 1'b1;
        if (Reset == 1'b1) begin
          Nextstate = 0;
        end
      end
      3: begin
        Lose = 1'b1;
        if (Reset == 1'b1) begin
          Nextstate = 0;
        end
      end
      4: begin
        if (Rb == 1'b1) begin
          Nextstate = 5;
        end
      end
      5: begin
        if (Rb == 1'b1) begin
          Roll = 1'b1;
        end else if (Sum == Point) begin
          Nextstate = 2;
        end else if (Sum == 7) begin
          Nextstate = 3;
        end else begin
          Nextstate = 4;
        end
      end
      default: begin
        Nextstate = 0;

      end
    endcase
  end
  always @(posedge CLK) begin
    State <= Nextstate;
    if (Sp == 1'b1) begin
      Point <= Sum;
    end
  end
endmodule

