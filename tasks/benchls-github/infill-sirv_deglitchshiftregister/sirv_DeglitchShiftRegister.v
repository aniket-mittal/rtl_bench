module sirv_DeglitchShiftRegister(
  input   clock,
  input   reset,
  input   io_d,
  output  io_q
);
  reg  T_8;
  reg [31:0] GEN_0;
  reg  T_9;
  reg [31:0] GEN_1;
  reg  sync;
  reg [31:0] GEN_2;
  reg  last;
  reg [31:0] GEN_3;
  wire  T_12;
  assign io_q = T_12;
  assign T_12 = sync & last;
  [MASKED]
endmodule