module autovcoder_023296 #(
    parameter CNTR_WIDTH = 8
) (
    // Inputs
    input clk,
    input rst,
    input clken,
    input sig_in,
    // Outputs
    output overflow_out,
    output [CNTR_WIDTH-1:0] count_out
);

  // Local Parameter Declarations
  localparam MAXCOUNT = 2 ** CNTR_WIDTH - 1;

  // Variable Declarations
  reg sig_in_ff;
  reg [CNTR_WIDTH-1:0] counter_reg;
  reg overflow_ff;
  wire sig_in_posedge;

  // Continuous Assignments
  assign sig_in_posedge = sig_in & (~sig_in_ff);  // Peak detection
  assign overflow_out = overflow_ff;
  assign count_out = counter_reg;

  // Signal register instance (for peak detection)
  always @(posedge clk) begin
    if (rst) sig_in_ff <= 1'b0;
    else if (clken) sig_in_ff <= sig_in;
  end

  // Counter Sequential Block
  [MASKED]


endmodule

