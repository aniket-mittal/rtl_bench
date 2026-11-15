module rtlpp_05384 (
  input clk,
  input reset,
  input signed [7:0] x_in,
  output signed [9:0] y_out,
  output reg clk2
);

  parameter hold = 0, sample = 1;
  reg [1:0] state;
  reg [4:0] count;
  reg signed [7:0] x;
  reg signed [25:0] i0;
  reg signed [20:0] i1;
  reg signed [15:0] i2;
  reg signed [13:0] i2d1, i2d2, c1, c0;
  reg signed [12:0] c1d1, c1d2, c2;
  reg signed [11:0] c2d1, c2d2, c3;

  always @(posedge clk or posedge reset) begin : FSM
    if (reset) begin
      count <= 0;
      state <= hold;
      clk2 <= 0;
    end else begin
      if (count == 31) begin
        count <= 0;
        state <= sample;
        clk2 <= 1;
      end else begin
        count <= count + 1;
        state <= hold;
        clk2 <= 0;
      end
    end
  end

  always @(posedge clk or posedge reset) begin : Int
    if (reset) begin
      x <= 0;
      i0 <= 0;
      i1 <= 0;
      i2 <= 0;
    end else begin
      x <= x_in;
      i0 <= i0 + x;
      i1 <= i1 + i0[25:5];
      i2 <= i2 + i1[20:5];
    end
  end

  always @(posedge clk or posedge reset) begin : Comb
    if (reset) begin
      c0 <= 0; c1 <= 0; c2 <= 0; c3 <= 0;
      i2d1 <= 0; i2d2 <= 0; c1d1 <= 0; c1d2 <= 0;
      c2d1 <= 0; c2d2 <= 0;
    end else if (state == sample) begin
      c0 <= i2[15:2];
      i2d1 <= c0;
      i2d2 <= i2d1;
      c1 <= c0 - i2d2;
      c1d1 <= c1[13:1];
      c1d2 <= c1d1;
      c2 <= c1[13:1] - c1d2;
      c2d1 <= c2[12:1];
      c2d2 <= c2d1;
      c3 <= c2[12:1] - c2d2;
    end
  end

  assign y_out = c3[11:2];

endmodule