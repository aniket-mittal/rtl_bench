module autovcoder_073617 (
    clk,
    reset,
    en,
    dir,
    BCD,
    cout
);
  input clk, reset, en, dir;
  output [3:0] BCD;
  output reg cout;
  reg [3:0] BCD, outputs;

  always @* begin
    if (en == 0) begin
      outputs <= BCD;
      cout <= 0;
    end else if (en == 1 && dir == 1) begin
      if (BCD >= 4'b0000 && BCD <= 4'b1000) begin
        {cout, outputs} = BCD + 4'b0001;
      end else if (BCD == 4'b1001) begin
        outputs <= 4'b0000;
        cout <= 1;
      end else begin
        outputs <= 4'b0000;
        cout <= 0;
      end
    end else if (en == 1 && dir == 0) begin
      if (BCD >= 4'b0001 && BCD <= 4'b1001) begin
        outputs <= BCD - 4'b0001;
        cout <= 0;
      end else if (BCD == 4'b0000) begin
        outputs <= 4'b1001;
        cout <= 1;
      end else begin
        outputs <= 4'b0000;
        cout <= 0;
      end
    end else begin
      outputs <= 4'bxxxx;
      cout <= 1'bx;
    end
  end

  always @(negedge clk, posedge reset) begin
    if (reset == 1) BCD <= 4'b0000;
    else BCD <= outputs;
  end
endmodule

