module autovcoder_104435( // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@233373.2]
    input clock,  // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@233374.4]
    input  [79:0] io_d, // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@233376.4]
    output [79:0] io_q // @[:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@233376.4]
);
  reg [79:0] sync_0; // @[ShiftReg.scala 114:16:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@233381.4]
  reg [95:0] _RAND_0;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.fir@233383.4]
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
    _RAND_0 = {3{`RANDOM}};
    sync_0  = _RAND_0[79:0];
`endif  // RANDOMIZE_REG_INIT
  end
`endif  // RANDOMIZE
  always @(posedge clock) begin
    sync_0 <= io_d;
  end
endmodule

