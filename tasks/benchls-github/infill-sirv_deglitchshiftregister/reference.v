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
  always @(posedge clock) begin// sync reg do not need reset, and the external reset is tied to 1, do not use it
    T_8 <= io_d;
    T_9 <= T_8;
    sync <= T_9;
    last <= sync;
  end
endmodule