// Hidden tests: 5000 cycles of seeded random inputs (seed 1736121516); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 33;
  reg clk;
  reg [19:0] i_0;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_018910 dut (
    .io_x_ppn(i_0),
    .io_x_u(i_1),
    .io_x_ae(i_2),
    .io_x_sw(i_3),
    .io_x_sx(i_4),
    .io_x_sr(i_5),
    .io_x_pw(i_6),
    .io_x_px(i_7),
    .io_x_pr(i_8),
    .io_x_ppp(i_9),
    .io_x_pal(i_10),
    .io_x_paa(i_11),
    .io_x_eff(i_12),
    .io_x_c(i_13),
    .io_y_ppn(out_dut[32:13]),
    .io_y_u(out_dut[12:12]),
    .io_y_ae(out_dut[11:11]),
    .io_y_sw(out_dut[10:10]),
    .io_y_sx(out_dut[9:9]),
    .io_y_sr(out_dut[8:8]),
    .io_y_pw(out_dut[7:7]),
    .io_y_px(out_dut[6:6]),
    .io_y_pr(out_dut[5:5]),
    .io_y_ppp(out_dut[4:4]),
    .io_y_pal(out_dut[3:3]),
    .io_y_paa(out_dut[2:2]),
    .io_y_eff(out_dut[1:1]),
    .io_y_c(out_dut[0:0])
  );
  autovcoder_018910__ref ref_i (
    .io_x_ppn(i_0),
    .io_x_u(i_1),
    .io_x_ae(i_2),
    .io_x_sw(i_3),
    .io_x_sx(i_4),
    .io_x_sr(i_5),
    .io_x_pw(i_6),
    .io_x_px(i_7),
    .io_x_pr(i_8),
    .io_x_ppp(i_9),
    .io_x_pal(i_10),
    .io_x_paa(i_11),
    .io_x_eff(i_12),
    .io_x_c(i_13),
    .io_y_ppn(out_ref[32:13]),
    .io_y_u(out_ref[12:12]),
    .io_y_ae(out_ref[11:11]),
    .io_y_sw(out_ref[10:10]),
    .io_y_sx(out_ref[9:9]),
    .io_y_sr(out_ref[8:8]),
    .io_y_pw(out_ref[7:7]),
    .io_y_px(out_ref[6:6]),
    .io_y_pr(out_ref[5:5]),
    .io_y_ppp(out_ref[4:4]),
    .io_y_pal(out_ref[3:3]),
    .io_y_paa(out_ref[2:2]),
    .io_y_eff(out_ref[1:1]),
    .io_y_c(out_ref[0:0])
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
    seed = 1736121516;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
