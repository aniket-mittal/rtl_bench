// Hidden tests: 5000 cycles of seeded random inputs (seed 161583399); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_09826 dut (
    .clk(clk),
    .Wr_Strobe(i_0),
    .Rd_Strobe(i_1),
    .AddrIn(i_2),
    .DataIn(i_3),
    .MotCtl(i_4),
    .MapVal(i_5),
    .reset(i_6),
    .BotConfig(i_7),
    .DataOut(out_dut[72:65]),
    .LocX(out_dut[64:57]),
    .LocY(out_dut[56:49]),
    .BotInfo(out_dut[48:41]),
    .Sensors(out_dut[40:33]),
    .LMDist(out_dut[32:25]),
    .RMDist(out_dut[24:17]),
    .MapX(out_dut[16:9]),
    .MapY(out_dut[8:1]),
    .upd_sysregs(out_dut[0:0])
  );
  rtlpp_09826__ref ref_i (
    .clk(clk),
    .Wr_Strobe(i_0),
    .Rd_Strobe(i_1),
    .AddrIn(i_2),
    .DataIn(i_3),
    .MotCtl(i_4),
    .MapVal(i_5),
    .reset(i_6),
    .BotConfig(i_7),
    .DataOut(out_ref[72:65]),
    .LocX(out_ref[64:57]),
    .LocY(out_ref[56:49]),
    .BotInfo(out_ref[48:41]),
    .Sensors(out_ref[40:33]),
    .LMDist(out_ref[32:25]),
    .RMDist(out_ref[24:17]),
    .MapX(out_ref[16:9]),
    .MapY(out_ref[8:1]),
    .upd_sysregs(out_ref[0:0])
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
    seed = 161583399;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_7 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
