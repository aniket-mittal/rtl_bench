// Hidden tests: 5000 cycles of seeded random inputs (seed 1820180624); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 89;
  reg clk;
  reg [0:0] i_0;
  reg [9:0] i_1;
  reg [9:0] i_2;
  reg [9:0] i_3;
  reg [8:0] i_4;
  reg [8:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_025826 dut (
    .ReadClockIn(clk),
    .WriteClockIn(i_0),
    .ReadAddressIn(i_1),
    .WriteAddressIn(i_2),
    .WriteAddressIn_TLC(i_3),
    .WriteDataIn(i_4),
    .WriteDataIn_TLC(i_5),
    .ReadSelectIn(i_6),
    .WriteSelectIn(i_7),
    .WriteSelectIn_TLC(i_8),
    .SMBusyIn(i_9),
    .ReadDataOut(out_dut[88:71]),
    .ReadAddressOut(out_dut[70:61]),
    .WriteAddressOut(out_dut[60:51]),
    .WriteDataOut(out_dut[50:42]),
    .ReadSelectOut(out_dut[41:41]),
    .WriteSelectOut(out_dut[40:40]),
    .ReadSelect_RAM0(out_dut[39:39]),
    .ReadSelect_RAM1(out_dut[38:38]),
    .WriteSelect_RAM0(out_dut[37:37]),
    .WriteSelect_RAM1(out_dut[36:36]),
    .ReadDataOut_SRAM(out_dut[35:18]),
    .ReadDataOut_SRAM_1(out_dut[17:0])
  );
  origen_025826__ref ref_i (
    .ReadClockIn(clk),
    .WriteClockIn(i_0),
    .ReadAddressIn(i_1),
    .WriteAddressIn(i_2),
    .WriteAddressIn_TLC(i_3),
    .WriteDataIn(i_4),
    .WriteDataIn_TLC(i_5),
    .ReadSelectIn(i_6),
    .WriteSelectIn(i_7),
    .WriteSelectIn_TLC(i_8),
    .SMBusyIn(i_9),
    .ReadDataOut(out_ref[88:71]),
    .ReadAddressOut(out_ref[70:61]),
    .WriteAddressOut(out_ref[60:51]),
    .WriteDataOut(out_ref[50:42]),
    .ReadSelectOut(out_ref[41:41]),
    .WriteSelectOut(out_ref[40:40]),
    .ReadSelect_RAM0(out_ref[39:39]),
    .ReadSelect_RAM1(out_ref[38:38]),
    .WriteSelect_RAM0(out_ref[37:37]),
    .WriteSelect_RAM1(out_ref[36:36]),
    .ReadDataOut_SRAM(out_ref[35:18]),
    .ReadDataOut_SRAM_1(out_ref[17:0])
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
    seed = 1820180624;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
