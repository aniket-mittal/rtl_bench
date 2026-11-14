module dut
(
  input d,
  input done_counting,
  input ack,
  input [9:0] state,
  output B3_next,
  output S_next,
  output S1_next,
  output Count_next,
  output Wait_next,
  output done,
  output counting,
  output shift_ena
);

  parameter S = 0;
  parameter S1 = 1;
  parameter S11 = 2;
  parameter S110 = 3;
  parameter B0 = 4;
  parameter B1 = 5;
  parameter B2 = 6;
  parameter B3 = 7;
  parameter Count = 8;
  parameter Wait = 9;
  assign B3_next = state[B2];
  assign S_next = state[S] & ~d | state[S1] & ~d | state[S110] & ~d | state[Wait] & ack;
  assign S1_next = state[S] & d;
  assign Count_next = state[B3] | state[Count] & ~done_counting;
  assign Wait_next = state[Count] & done_counting | state[Wait] & ~ack;
  assign done = state[Count];
  assign counting = state[Count];
  assign shift_ena = |state[B3:B0];

endmodule
