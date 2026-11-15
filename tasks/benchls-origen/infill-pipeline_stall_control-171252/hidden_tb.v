// Hidden tests: 5000 cycles of seeded random inputs (seed 3621135517); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
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
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_171252 dut (
    .V_ex(i_0),
    .eip_change(i_1),
    .AF_needed(i_2),
    .DF_needed(i_3),
    .CF_needed(i_4),
    .v_wb_ld_flag_AF(i_5),
    .v_wb_ld_flag_DF(i_6),
    .v_wb_ld_flag_CF(i_7),
    .wb_mem_stall(i_8),
    .ld_reg1(i_9),
    .ld_reg2(i_10),
    .ld_reg3(i_11),
    .ld_flag_ZF(i_12),
    .ld_seg(i_13),
    .ld_mm(i_14),
    .ld_mem(i_15),
    .v_ro_ld_reg1(out_dut[10:10]),
    .v_ro_ld_reg2(out_dut[9:9]),
    .v_ro_ld_reg3(out_dut[8:8]),
    .v_ro_ld_flag_ZF(out_dut[7:7]),
    .v_ro_ld_seg(out_dut[6:6]),
    .v_ro_ld_mm(out_dut[5:5]),
    .v_ro_ld_mem(out_dut[4:4]),
    .dep_stall(out_dut[3:3]),
    .br_stall(out_dut[2:2]),
    .V_wb(out_dut[1:1]),
    .ld_wb(out_dut[0:0])
  );
  origen_171252__ref ref_i (
    .V_ex(i_0),
    .eip_change(i_1),
    .AF_needed(i_2),
    .DF_needed(i_3),
    .CF_needed(i_4),
    .v_wb_ld_flag_AF(i_5),
    .v_wb_ld_flag_DF(i_6),
    .v_wb_ld_flag_CF(i_7),
    .wb_mem_stall(i_8),
    .ld_reg1(i_9),
    .ld_reg2(i_10),
    .ld_reg3(i_11),
    .ld_flag_ZF(i_12),
    .ld_seg(i_13),
    .ld_mm(i_14),
    .ld_mem(i_15),
    .v_ro_ld_reg1(out_ref[10:10]),
    .v_ro_ld_reg2(out_ref[9:9]),
    .v_ro_ld_reg3(out_ref[8:8]),
    .v_ro_ld_flag_ZF(out_ref[7:7]),
    .v_ro_ld_seg(out_ref[6:6]),
    .v_ro_ld_mm(out_ref[5:5]),
    .v_ro_ld_mem(out_ref[4:4]),
    .dep_stall(out_ref[3:3]),
    .br_stall(out_ref[2:2]),
    .V_wb(out_ref[1:1]),
    .ld_wb(out_ref[0:0])
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
    seed = 3621135517;
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
      i_15 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
