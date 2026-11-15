// Hidden tests: 5000 cycles of seeded random inputs (seed 2468182045); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 40;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  reg [31:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_074868 dut (
    .op(i_0),
    .low6(i_1),
    .instr(i_2),
    .aluCtrl(out_dut[39:35]),
    .ifWrGrf(out_dut[34:34]),
    .grfWa(out_dut[33:29]),
    .grfRa1(out_dut[28:24]),
    .grfRa2(out_dut[23:19]),
    .ifReDm(out_dut[18:18]),
    .ifWrDm(out_dut[17:17]),
    .ifBeq(out_dut[16:16]),
    .ifJal(out_dut[15:15]),
    .ifJr(out_dut[14:14]),
    .ifJ(out_dut[13:13]),
    .ifImmExt(out_dut[12:12]),
    .tUseRs(out_dut[11:10]),
    .tUseRt(out_dut[9:8]),
    .tNew(out_dut[7:6]),
    .ifAddu(out_dut[5:5]),
    .ifSubu(out_dut[4:4]),
    .ifOri(out_dut[3:3]),
    .ifLui(out_dut[2:2]),
    .ifLw(out_dut[1:1]),
    .ifSw(out_dut[0:0])
  );
  origen_074868__ref ref_i (
    .op(i_0),
    .low6(i_1),
    .instr(i_2),
    .aluCtrl(out_ref[39:35]),
    .ifWrGrf(out_ref[34:34]),
    .grfWa(out_ref[33:29]),
    .grfRa1(out_ref[28:24]),
    .grfRa2(out_ref[23:19]),
    .ifReDm(out_ref[18:18]),
    .ifWrDm(out_ref[17:17]),
    .ifBeq(out_ref[16:16]),
    .ifJal(out_ref[15:15]),
    .ifJr(out_ref[14:14]),
    .ifJ(out_ref[13:13]),
    .ifImmExt(out_ref[12:12]),
    .tUseRs(out_ref[11:10]),
    .tUseRt(out_ref[9:8]),
    .tNew(out_ref[7:6]),
    .ifAddu(out_ref[5:5]),
    .ifSubu(out_ref[4:4]),
    .ifOri(out_ref[3:3]),
    .ifLui(out_ref[2:2]),
    .ifLw(out_ref[1:1]),
    .ifSw(out_ref[0:0])
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
    seed = 2468182045;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
