module autovcoder_114946 #(
    parameter STEPS_PER_REVOLUTION = 64 * 2 * 64,
    parameter [0:0] SIDE = 1'b1
) (
    input CLK,
    input RST_N,
    input char_vld,
    input [7:0] char,
    output enb,
    output reg dir,
    input stepped
);

  reg [31:0] count;

  assign enb = count > 0;

  [MASKED]

endmodule

