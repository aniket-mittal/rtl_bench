module dut
(
  input in,
  input [3:0] state,
  output reg [3:0] next_state,
  output out
);

  parameter A = 0;parameter B = 1;parameter C = 2;parameter D = 3;
  assign next_state[A] = (state[A] | state[C]) & ~in;
  assign next_state[B] = (state[A] | state[B] | state[D]) & in;
  assign next_state[C] = (state[B] | state[D]) & ~in;
  assign next_state[D] = state[C] & in;
  assign out = state[D];

endmodule
