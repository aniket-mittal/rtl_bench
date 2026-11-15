module rtlpp_08778(clk, rst, target_angle, x_res, y_res);

  input clk, rst;
  input signed [19:0] target_angle;

  output reg signed [19:0] x_res;
  output reg signed [19:0] y_res;

  reg signed [19:0] x [9:1];
  reg signed [19:0] y [9:1];
  reg signed [19:0] z [8:1];
  reg d [8:1];

  reg signed [19:0] x4;
  reg signed [19:0] y4;
  reg signed [19:0] z4;
  reg d4;

  wire signed [19:0] look_up [8:1];

  assign look_up[1] = 20'b00000000001000110010;
  assign look_up[2] = 20'b00000000000100000101;
  assign look_up[3] = 20'b00000000000010000000;
  assign look_up[4] = 20'b00000000000001000000;
  assign look_up[5] = 20'b00000000000000100000;
  assign look_up[6] = 20'b00000000000000010000;
  assign look_up[7] = 20'b00000000000000001000;
  assign look_up[8] = 20'b00000000000000000100;

  always @(posedge clk or negedge rst)
  begin
    if (rst == 0) begin
      x_res <= 20'b0;
      y_res <= 20'b0;
    end else begin
      x_res <= x[9];
      y_res <= y[9];
    end
  end

  [MASKED]

endmodule