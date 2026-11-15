// Hidden tests: 5000 cycles of seeded random inputs (seed 2836074170); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02362 dut (
    .ck1(i_0),
    .ck2(i_1),
    .ck3(i_2),
    .ck4(i_3),
    .stb1(i_4),
    .stb2(i_5),
    .stb3(i_6),
    .doSkip(i_7),
    .opr1(i_8),
    .opr2(i_9),
    .opr3(i_10),
    .oprCLA(i_11),
    .oprMQA(i_12),
    .oprMQL(i_13),
    .oprSCA(i_14),
    .ac_ck(out_dut[9:9]),
    .cla(out_dut[8:8]),
    .done(out_dut[7:7]),
    .link_ck(out_dut[6:6]),
    .mq_ck(out_dut[5:5]),
    .mq2orbus(out_dut[4:4]),
    .pc_ck(out_dut[3:3]),
    .rot2ac(out_dut[2:2]),
    .mq_tmpLatch(out_dut[1:1]),
    .mq_tmpOE(out_dut[0:0])
  );
  rtlpp_02362__ref ref_i (
    .ck1(i_0),
    .ck2(i_1),
    .ck3(i_2),
    .ck4(i_3),
    .stb1(i_4),
    .stb2(i_5),
    .stb3(i_6),
    .doSkip(i_7),
    .opr1(i_8),
    .opr2(i_9),
    .opr3(i_10),
    .oprCLA(i_11),
    .oprMQA(i_12),
    .oprMQL(i_13),
    .oprSCA(i_14),
    .ac_ck(out_ref[9:9]),
    .cla(out_ref[8:8]),
    .done(out_ref[7:7]),
    .link_ck(out_ref[6:6]),
    .mq_ck(out_ref[5:5]),
    .mq2orbus(out_ref[4:4]),
    .pc_ck(out_ref[3:3]),
    .rot2ac(out_ref[2:2]),
    .mq_tmpLatch(out_ref[1:1]),
    .mq_tmpOE(out_ref[0:0])
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
    seed = 2836074170;
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
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
