module autovcoder_115174 (  // @[:@3.2]
    input         clock,      // @[:@4.4]
    input  [ 9:0] io_input,   // @[:@6.4]
    output [19:0] io_output,  // @[:@6.4]
    input  [ 9:0] io_taps_0,  // @[:@6.4]
    input  [ 9:0] io_taps_1,  // @[:@6.4]
    input  [ 9:0] io_taps_2   // @[:@6.4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif  // RANDOMIZE_REG_INIT
  wire [19:0] products_1 = $signed(
      io_input
  ) * $signed(
      io_taps_1
  );  // @[SIntTypeClass.scala 44:41:@12.4]
  wire [19:0] products_2 = $signed(
      io_input
  ) * $signed(
      io_taps_0
  );  // @[SIntTypeClass.scala 44:41:@13.4]
  reg [19:0] last;  // @[TransposedStreamingFIR.scala 62:17:@14.4]
  reg [19:0] _T_14;  // @[TransposedStreamingFIR.scala 64:18:@15.4]
  reg [19:0] _T_19;  // @[TransposedStreamingFIR.scala 64:18:@20.4]
  assign io_output = last;
  always @(posedge clock) begin
    last  <= $signed(_T_19) + $signed(products_2);  // @[SIntTypeClass.scala 18:40:@24.4]
    _T_14 <= $signed(io_input) * $signed(io_taps_2);  // @[SIntTypeClass.scala 44:41:@11.4]
    _T_19 <= $signed(_T_14) + $signed(products_1);  // @[SIntTypeClass.scala 18:40:@19.4]
  end
  // Register and memory initialization
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
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
  `FIRRTL_BEFORE_INITIAL
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
    last = _RAND_0[19:0];
    _RAND_1 = {1{`RANDOM}};
    _T_14 = _RAND_1[19:0];
    _RAND_2 = {1{`RANDOM}};
    _T_19 = _RAND_2[19:0];
`endif  // RANDOMIZE_REG_INIT
`endif  // RANDOMIZE
  end  // initial
`ifdef FIRRTL_AFTER_INITIAL
  `FIRRTL_AFTER_INITIAL
`endif
`endif  // SYNTHESIS
endmodule

