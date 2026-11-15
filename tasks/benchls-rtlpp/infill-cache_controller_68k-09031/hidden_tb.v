// Hidden tests: 5000 cycles of seeded random inputs (seed 1438843177); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 110;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [15:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_09031 dut (
    .Clock(clk),
    .Reset_L(i_0),
    .CacheHit_H(i_1),
    .ValidBitIn_H(i_2),
    .DramSelect68k_H(i_3),
    .AddressBusInFrom68k(i_4),
    .DataBusInFrom68k(i_5),
    .UDS_L(i_6),
    .LDS_L(i_7),
    .WE_L(i_8),
    .AS_L(i_9),
    .DtackFromDram_L(i_10),
    .CAS_Dram_L(i_11),
    .RAS_Dram_L(i_12),
    .DataBusInFromDram(i_13),
    .DataBusInFromCache(i_14),
    .DataBusOutTo68k(out_dut[109:94]),
    .DataBusOutToDramController(out_dut[93:78]),
    .UDS_DramController_L(out_dut[77:77]),
    .LDS_DramController_L(out_dut[76:76]),
    .DramSelectFromCache_L(out_dut[75:75]),
    .WE_DramController_L(out_dut[74:74]),
    .AS_DramController_L(out_dut[73:73]),
    .DtackTo68k_L(out_dut[72:72]),
    .TagCache_WE_L(out_dut[71:71]),
    .DataCache_WE_L(out_dut[70:70]),
    .ValidBit_WE_L(out_dut[69:69]),
    .AddressBusOutToDramController(out_dut[68:37]),
    .TagDataOut(out_dut[36:14]),
    .WordAddress(out_dut[13:11]),
    .ValidBitOut_H(out_dut[10:10]),
    .Index(out_dut[9:5]),
    .CacheState(out_dut[4:0])
  );
  rtlpp_09031__ref ref_i (
    .Clock(clk),
    .Reset_L(i_0),
    .CacheHit_H(i_1),
    .ValidBitIn_H(i_2),
    .DramSelect68k_H(i_3),
    .AddressBusInFrom68k(i_4),
    .DataBusInFrom68k(i_5),
    .UDS_L(i_6),
    .LDS_L(i_7),
    .WE_L(i_8),
    .AS_L(i_9),
    .DtackFromDram_L(i_10),
    .CAS_Dram_L(i_11),
    .RAS_Dram_L(i_12),
    .DataBusInFromDram(i_13),
    .DataBusInFromCache(i_14),
    .DataBusOutTo68k(out_ref[109:94]),
    .DataBusOutToDramController(out_ref[93:78]),
    .UDS_DramController_L(out_ref[77:77]),
    .LDS_DramController_L(out_ref[76:76]),
    .DramSelectFromCache_L(out_ref[75:75]),
    .WE_DramController_L(out_ref[74:74]),
    .AS_DramController_L(out_ref[73:73]),
    .DtackTo68k_L(out_ref[72:72]),
    .TagCache_WE_L(out_ref[71:71]),
    .DataCache_WE_L(out_ref[70:70]),
    .ValidBit_WE_L(out_ref[69:69]),
    .AddressBusOutToDramController(out_ref[68:37]),
    .TagDataOut(out_ref[36:14]),
    .WordAddress(out_ref[13:11]),
    .ValidBitOut_H(out_ref[10:10]),
    .Index(out_ref[9:5]),
    .CacheState(out_ref[4:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 1438843177;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
