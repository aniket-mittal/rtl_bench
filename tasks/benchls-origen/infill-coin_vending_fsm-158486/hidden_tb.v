// Hidden tests: 5000 cycles of seeded random inputs (seed 1234514685); the submission must match reference.v
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
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_158486 dut (
    .clk(clk),
    .reset_n(i_0),
    .c5(i_1),
    .c10(i_2),
    .c25(i_3),
    .item_taken(i_4),
    .dispense(out_dut[13:13]),
    .r5(out_dut[12:12]),
    .r10(out_dut[11:11]),
    .r20(out_dut[10:10]),
    .state0(out_dut[9:9]),
    .state1(out_dut[8:8]),
    .state2(out_dut[7:7]),
    .state3(out_dut[6:6]),
    .state4(out_dut[5:5]),
    .state5(out_dut[4:4]),
    .state6(out_dut[3:3]),
    .state7(out_dut[2:2]),
    .state8(out_dut[1:1]),
    .state9(out_dut[0:0])
  );
  origen_158486__ref ref_i (
    .clk(clk),
    .reset_n(i_0),
    .c5(i_1),
    .c10(i_2),
    .c25(i_3),
    .item_taken(i_4),
    .dispense(out_ref[13:13]),
    .r5(out_ref[12:12]),
    .r10(out_ref[11:11]),
    .r20(out_ref[10:10]),
    .state0(out_ref[9:9]),
    .state1(out_ref[8:8]),
    .state2(out_ref[7:7]),
    .state3(out_ref[6:6]),
    .state4(out_ref[5:5]),
    .state5(out_ref[4:4]),
    .state6(out_ref[3:3]),
    .state7(out_ref[2:2]),
    .state8(out_ref[1:1]),
    .state9(out_ref[0:0])
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
    seed = 1234514685;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
