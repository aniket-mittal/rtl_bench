module autovcoder_096049 #(
    parameter RATIO_GRADE = 3
) (  /*AUTOARG*/
    // Outputs
    ratio_clk_o,
    // Inputs
    clk_i,
    arst_n_i,
    en_i,
    ratio_i
);

  /* local parameters */
  localparam RATIO_WIDTH = 2 ** RATIO_GRADE;

  /* local defines */
`ifndef _L_SUB_SIZE_
  `define _L_SUB_SIZE_(x, y) x-y
`endif

  /* ports */
  input clk_i;
  input arst_n_i;
  input en_i;
  input [RATIO_GRADE-1:0] ratio_i;
  output reg ratio_clk_o;

  wire [RATIO_WIDTH-1:0] ratio_limit = ({{(
  `_L_SUB_SIZE_(RATIO_WIDTH, 1)
  ) {1'b0}}, 1'b1} << ratio_i) - ({{(
  `_L_SUB_SIZE_(RATIO_WIDTH, 1)
  ) {1'b0}}, 1'b1});
  reg [RATIO_WIDTH-1:0] counter;

  [MASKED]

endmodule

