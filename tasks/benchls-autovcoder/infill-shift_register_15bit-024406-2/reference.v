module autovcoder_024406( // @[:example.TestHarness.GemminiSocTest1RocketConfig.fir@117757.2]
    input         clock,  // @[:example.TestHarness.GemminiSocTest1RocketConfig.fir@117758.4]
    input  [14:0] io_d,   // @[:example.TestHarness.GemminiSocTest1RocketConfig.fir@117760.4]
    output [14:0] io_q    // @[:example.TestHarness.GemminiSocTest1RocketConfig.fir@117760.4]
);
  reg [14:0] sync_0; // @[ShiftReg.scala 114:16:example.TestHarness.GemminiSocTest1RocketConfig.fir@117765.4]
  reg [31:0] _RAND_0;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:example.TestHarness.GemminiSocTest1RocketConfig.fir@117767.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
  `define RANDOMIZE
`endif
`ifndef RANDOM
  `define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
  initial begin
`ifdef RANDOMIZE
`ifdef INIT_RANDOM
    `INIT_RANDOM
`endif
`ifndef VERILATOR
`ifdef RANDOMIZE_DELAY
    #`RANDOMIZE_DELAY begin
    end
`else
    #0.002 begin
    end
`endif
`endif
`ifdef RANDOMIZE_REG_INIT
    _RAND_0 = {1{`RANDOM}};
    sync_0  = _RAND_0[14:0];
`endif  // RANDOMIZE_REG_INIT
`endif  // RANDOMIZE
  end
  always @(posedge clock) begin
    sync_0 <= io_d;
  end
endmodule

