// Hidden tests: 5000 cycles of seeded random inputs (seed 216584774); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 139;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [3:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03715 dut (
    .clk(clk),
    .rst(i_0),
    .i_m0_we(i_1),
    .i_m0_cyc(i_2),
    .i_m0_stb(i_3),
    .i_m0_sel(i_4),
    .i_m0_dat(i_5),
    .i_m0_adr(i_6),
    .i_m1_we(i_7),
    .i_m1_cyc(i_8),
    .i_m1_stb(i_9),
    .i_m1_sel(i_10),
    .i_m1_dat(i_11),
    .i_m1_adr(i_12),
    .i_s_dat(i_13),
    .i_s_ack(i_14),
    .i_s_int(i_15),
    .o_m0_ack(out_dut[138:138]),
    .o_m0_dat(out_dut[137:106]),
    .o_m0_int(out_dut[105:105]),
    .o_m1_ack(out_dut[104:104]),
    .o_m1_dat(out_dut[103:72]),
    .o_m1_int(out_dut[71:71]),
    .o_s_we(out_dut[70:70]),
    .o_s_stb(out_dut[69:69]),
    .o_s_cyc(out_dut[68:68]),
    .o_s_sel(out_dut[67:64]),
    .o_s_adr(out_dut[63:32]),
    .o_s_dat(out_dut[31:0])
  );
  rtlpp_03715__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .i_m0_we(i_1),
    .i_m0_cyc(i_2),
    .i_m0_stb(i_3),
    .i_m0_sel(i_4),
    .i_m0_dat(i_5),
    .i_m0_adr(i_6),
    .i_m1_we(i_7),
    .i_m1_cyc(i_8),
    .i_m1_stb(i_9),
    .i_m1_sel(i_10),
    .i_m1_dat(i_11),
    .i_m1_adr(i_12),
    .i_s_dat(i_13),
    .i_s_ack(i_14),
    .i_s_int(i_15),
    .o_m0_ack(out_ref[138:138]),
    .o_m0_dat(out_ref[137:106]),
    .o_m0_int(out_ref[105:105]),
    .o_m1_ack(out_ref[104:104]),
    .o_m1_dat(out_ref[103:72]),
    .o_m1_int(out_ref[71:71]),
    .o_s_we(out_ref[70:70]),
    .o_s_stb(out_ref[69:69]),
    .o_s_cyc(out_ref[68:68]),
    .o_s_sel(out_ref[67:64]),
    .o_s_adr(out_ref[63:32]),
    .o_s_dat(out_ref[31:0])
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
    seed = 216584774;
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
      i_15 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
