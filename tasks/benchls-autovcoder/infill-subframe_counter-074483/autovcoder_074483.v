module autovcoder_074483 #(
    parameter DELAY        = 1,
    parameter WIDTH        = 32,
    parameter SUBFRAME_LSB = 11,
    parameter SUBFRAME_MSB = 19
) (
    input              clk,
    input              reset,
    output [WIDTH-1:0] counter
);

  localparam S_COUNT = 3'b001;
  localparam S_WAIT1 = 3'b010;
  localparam S_WAIT2 = 3'b100;

  localparam fb = WIDTH - SUBFRAME_MSB - 1;
  localparam sb = SUBFRAME_MSB - SUBFRAME_LSB + 1;
  localparam cb = SUBFRAME_MSB + 1;

  localparam fh = WIDTH - 1;
  localparam fl = SUBFRAME_MSB + 1;
  localparam sh = SUBFRAME_MSB;
  localparam sl = SUBFRAME_LSB;

  // Wrap counter one subframe early.
  // Compare counter to {subframe, other} == {11...10, 11...1}.
  localparam skip_subframe = {cb{1'b1}} & ~(1 << sl);

  reg [fh:fl] frame_r;
  reg [ sh:0] counter_r;
  reg [  2:0] state;

  assign counter = {frame_r, counter_r};

  [MASKED]

endmodule

