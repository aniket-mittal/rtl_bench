module autovcoder_062063( // @[:freechips.rocketchip.system.LitexFullConfig64Mem128.fir@53434.2]
    input         clock,  // @[:freechips.rocketchip.system.LitexFullConfig64Mem128.fir@53435.4]
    input  [54:0] io_d,   // @[:freechips.rocketchip.system.LitexFullConfig64Mem128.fir@53437.4]
    output [54:0] io_q    // @[:freechips.rocketchip.system.LitexFullConfig64Mem128.fir@53437.4]
);
  reg [54:0] sync_0; // @[ShiftReg.scala 114:16:freechips.rocketchip.system.LitexFullConfig64Mem128.fir@53442.4]
  reg [63:0] _RAND_0;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:freechips.rocketchip.system.LitexFullConfig64Mem128.fir@53444.4]
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
    sync_0  = _RAND_0[54:0];
`endif  // RANDOMIZE_REG_INIT
`endif  // RANDOMIZE
  end
  always @(posedge clock) begin
    sync_0 <= io_d;
  end
endmodule

