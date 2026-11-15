// Hidden tests: 5000 cycles of seeded random inputs (seed 3280186351); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 54;
  reg clk;

  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_198224 dut (
    .clk(clk),
    .cnt(out_dut[53:29]),
    .sec1(out_dut[28:28]),
    .sec2(out_dut[27:27]),
    .sec4(out_dut[26:26]),
    .sec8(out_dut[25:25]),
    .wss1(out_dut[24:24]),
    .wss2(out_dut[23:23]),
    .wss4(out_dut[22:22]),
    .wss8(out_dut[21:21]),
    .ws1(out_dut[20:20]),
    .ws2(out_dut[19:19]),
    .ws4(out_dut[18:18]),
    .ws8(out_dut[17:17]),
    .ps1(out_dut[16:16]),
    .ps2(out_dut[15:15]),
    .ps4(out_dut[14:14]),
    .ps8(out_dut[13:13]),
    .pr1(out_dut[12:12]),
    .pr2(out_dut[11:11]),
    .pr4(out_dut[10:10]),
    .pr8(out_dut[9:9]),
    .sub_cnt(out_dut[8:5]),
    .sub_cnt_m(out_dut[4:1]),
    .clk_d10(out_dut[0:0])
  );
  origen_198224__ref ref_i (
    .clk(clk),
    .cnt(out_ref[53:29]),
    .sec1(out_ref[28:28]),
    .sec2(out_ref[27:27]),
    .sec4(out_ref[26:26]),
    .sec8(out_ref[25:25]),
    .wss1(out_ref[24:24]),
    .wss2(out_ref[23:23]),
    .wss4(out_ref[22:22]),
    .wss8(out_ref[21:21]),
    .ws1(out_ref[20:20]),
    .ws2(out_ref[19:19]),
    .ws4(out_ref[18:18]),
    .ws8(out_ref[17:17]),
    .ps1(out_ref[16:16]),
    .ps2(out_ref[15:15]),
    .ps4(out_ref[14:14]),
    .ps8(out_ref[13:13]),
    .pr1(out_ref[12:12]),
    .pr2(out_ref[11:11]),
    .pr4(out_ref[10:10]),
    .pr8(out_ref[9:9]),
    .sub_cnt(out_ref[8:5]),
    .sub_cnt_m(out_ref[4:1]),
    .clk_d10(out_ref[0:0])
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
    seed = 3280186351;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      ;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
