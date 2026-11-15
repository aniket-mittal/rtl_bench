module autovcoder_063864 (
    input clk,
    input rst,
    input enable,
    input wire [31:0] glitch_delay,
    input wire [31:0] glitch_width,
    input wire [31:0] glitch_count,
    input wire [31:0] glitch_gap,
    input wire [31:0] glitch_max,
    input wire [31:0] reset_target,
    output reg glitched = 1'b0,
    input wire vstart,
    output reg vout = 1'b1,
    output wire finished,
    output wire reset_out
);

  parameter DELAY = 3'b000;
  parameter GLITCH = 3'b001;
  parameter GAP = 3'b010;

  reg [31:0] width_cnt = 32'd0;
  reg [31:0] cnt = 32'd0;
  reg [31:0] cycles = 32'd0;
  reg [31:0] reset_cnt = 32'd0;

  reg [ 2:0] state = DELAY;

  assign finished = (glitch_max && cycles == glitch_max);
  assign reset_out = !enable || !reset_target || state != DELAY || (enable && reset_target && state == DELAY && reset_cnt == reset_target);

  [MASKED]
endmodule

