module autovcoder_065420 (
    // Input
    input wire in_pos,
    input wire in_neg,
    input wire in_valid,

    // Output
    output wire out_data,
    output reg  out_valid,

    // Common
    input wire clk,
    input wire rst
);

  // Signals
  wire violation;
  reg [3:0] data;
  reg pstate;  // Pulse state

  // Output
  assign out_data = data[3];

  always @(posedge clk) out_valid <= in_valid;

  // Main logic
  assign violation = (in_pos & pstate) | (in_neg & ~pstate);

  [MASKED]

endmodule

