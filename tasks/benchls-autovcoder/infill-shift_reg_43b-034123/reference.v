module autovcoder_034123( // @[:example.TestHarness.GemminiSocTest1RocketConfig864.fir@91783.2]
    input         clock,  // @[:example.TestHarness.GemminiSocTest1RocketConfig864.fir@91784.4]
    input  [42:0] io_d,   // @[:example.TestHarness.GemminiSocTest1RocketConfig864.fir@91786.4]
    output [42:0] io_q    // @[:example.TestHarness.GemminiSocTest1RocketConfig864.fir@91786.4]
);
  reg [42:0] sync_0; // @[ShiftReg.scala 114:16:example.TestHarness.GemminiSocTest1RocketConfig864.fir@91791.4]
  reg [63:0] _RAND_0;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:example.TestHarness.GemminiSocTest1RocketConfig864.fir@91793.4]
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
    _RAND_0 = {2{`RANDOM}};
    sync_0  = _RAND_0[42:0];
`endif  // RANDOMIZE_REG_INIT
`endif  // RANDOMIZE
  end
  always @(posedge clock) begin
    sync_0 <= io_d;
  end
endmodule

