// Starter skeleton: implement TopModule as described in spec.md.
module TopModule (
  input clk,
  input areset,
  input predict_valid,
  input [6:0] predict_pc,
  input train_valid,
  input train_taken,
  input train_mispredicted,
  input [6:0] train_history,
  input [6:0] train_pc,
  output predict_taken,
  output [6:0] predict_history
);

endmodule
