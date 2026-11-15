module autovcoder_063196 (  // @[:galois.system.P2TVFPGAConfig.fir@94055.2]
    input         clock,  // @[:galois.system.P2TVFPGAConfig.fir@94056.4]
    input  [54:0] io_d,   // @[:galois.system.P2TVFPGAConfig.fir@94058.4]
    output [54:0] io_q    // @[:galois.system.P2TVFPGAConfig.fir@94058.4]
);
  reg [54:0] sync_0;  // @[ShiftReg.scala 114:16:galois.system.P2TVFPGAConfig.fir@94063.4]
  reg [63:0] _RAND_0;
  assign io_q = sync_0;  // @[ShiftReg.scala 123:8:galois.system.P2TVFPGAConfig.fir@94065.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
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
    sync_0  = _RAND_0[54:0];
`endif  // RANDOMIZE_REG_INIT
  end
`endif  // RANDOMIZE
  always @(posedge clock) begin
    sync_0 <= io_d;
  end
endmodule

