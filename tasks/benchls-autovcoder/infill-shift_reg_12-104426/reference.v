module autovcoder_104426( // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@193779.2]
    input clock,  // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@193780.4]
    input  [11:0] io_d, // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@193782.4]
    output [11:0] io_q // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@193782.4]
);
  reg [11:0] sync_0; // @[ShiftReg.scala 114:16:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@193787.4]
  reg [31:0] _RAND_0;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@193789.4]
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
    _RAND_0 = {1{`RANDOM}};
    sync_0  = _RAND_0[11:0];
`endif  // RANDOMIZE_REG_INIT
  end
`endif  // RANDOMIZE
  always @(posedge clock) begin
    sync_0 <= io_d;
  end
endmodule

