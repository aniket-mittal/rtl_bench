// Hidden tests: 5000 cycles of seeded random inputs (seed 3630279364); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [48:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05324 dut (
    .clk(clk),
    .state_alu(i_0),
    .state_fetch(i_1),
    .state_write(i_2),
    .funct(i_3),
    .ir(i_4),
    .destspc(i_5),
    .dn(i_6),
    .dp(i_7),
    .dr(i_8),
    .irdisp(i_9),
    .irjump(i_10),
    .jcond(i_11),
    .nop11(i_12),
    .srcspc(i_13),
    .srcspcpop(i_14),
    .trap(i_15),
    .reset(i_16),
    .iwrited(out_dut[13:13]),
    .n(out_dut[12:12]),
    .nop(out_dut[11:11]),
    .nopa(out_dut[10:10]),
    .pcs0(out_dut[9:9]),
    .pcs1(out_dut[8:8]),
    .spcdrive(out_dut[7:7]),
    .spcenb(out_dut[6:6]),
    .spcnt(out_dut[5:5]),
    .spop(out_dut[4:4]),
    .spush(out_dut[3:3]),
    .srcspcpopreal(out_dut[2:2]),
    .srp(out_dut[1:1]),
    .swp(out_dut[0:0])
  );
  rtlpp_05324__ref ref_i (
    .clk(clk),
    .state_alu(i_0),
    .state_fetch(i_1),
    .state_write(i_2),
    .funct(i_3),
    .ir(i_4),
    .destspc(i_5),
    .dn(i_6),
    .dp(i_7),
    .dr(i_8),
    .irdisp(i_9),
    .irjump(i_10),
    .jcond(i_11),
    .nop11(i_12),
    .srcspc(i_13),
    .srcspcpop(i_14),
    .trap(i_15),
    .reset(i_16),
    .iwrited(out_ref[13:13]),
    .n(out_ref[12:12]),
    .nop(out_ref[11:11]),
    .nopa(out_ref[10:10]),
    .pcs0(out_ref[9:9]),
    .pcs1(out_ref[8:8]),
    .spcdrive(out_ref[7:7]),
    .spcenb(out_ref[6:6]),
    .spcnt(out_ref[5:5]),
    .spop(out_ref[4:4]),
    .spush(out_ref[3:3]),
    .srcspcpopreal(out_ref[2:2]),
    .srp(out_ref[1:1]),
    .swp(out_ref[0:0])
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
    seed = 3630279364;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed)};
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
      i_15 = {$random(seed)};
      i_16 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
