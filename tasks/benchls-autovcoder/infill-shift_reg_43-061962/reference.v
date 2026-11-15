module autovcoder_061962( // @[:freechips.rocketchip.system.LitexConfig64Mem64.fir@25736.2]
    input         clock,  // @[:freechips.rocketchip.system.LitexConfig64Mem64.fir@25737.4]
    input  [42:0] io_d,   // @[:freechips.rocketchip.system.LitexConfig64Mem64.fir@25739.4]
    output [42:0] io_q    // @[:freechips.rocketchip.system.LitexConfig64Mem64.fir@25739.4]
);
  reg [42:0] sync_0; // @[ShiftReg.scala 114:16:freechips.rocketchip.system.LitexConfig64Mem64.fir@25744.4]
  reg [63:0] _RAND_0;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:freechips.rocketchip.system.LitexConfig64Mem64.fir@25746.4]
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

