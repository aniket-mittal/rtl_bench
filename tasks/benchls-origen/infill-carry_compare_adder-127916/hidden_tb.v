// Hidden tests: 5000 cycles of seeded random inputs (seed 1225711139); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 23;
  reg clk;
  reg [4:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_127916 dut (
    .v1_reg_0(i_0),
    .wr_rst_busy(i_1),
    .out(i_2),
    .wr_en(i_3),
    .comp1(i_4),
    .ram_full_fb_i_reg(out_dut[22:22]),
    .carrynet_0(out_dut[21:21]),
    .carrynet_1(out_dut[20:20]),
    .carrynet_2(out_dut[19:19]),
    .carrynet_3(out_dut[18:18]),
    .comp2(out_dut[17:17]),
    .NLW_gmux_gm_0_gm1_m1_CARRY4_O_UNCONNECTED(out_dut[16:13]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_CO_UNCONNECTED(out_dut[12:10]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_DI_UNCONNECTED(out_dut[9:7]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_O_UNCONNECTED(out_dut[6:3]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_S_UNCONNECTED(out_dut[2:0])
  );
  origen_127916__ref ref_i (
    .v1_reg_0(i_0),
    .wr_rst_busy(i_1),
    .out(i_2),
    .wr_en(i_3),
    .comp1(i_4),
    .ram_full_fb_i_reg(out_ref[22:22]),
    .carrynet_0(out_ref[21:21]),
    .carrynet_1(out_ref[20:20]),
    .carrynet_2(out_ref[19:19]),
    .carrynet_3(out_ref[18:18]),
    .comp2(out_ref[17:17]),
    .NLW_gmux_gm_0_gm1_m1_CARRY4_O_UNCONNECTED(out_ref[16:13]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_CO_UNCONNECTED(out_ref[12:10]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_DI_UNCONNECTED(out_ref[9:7]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_O_UNCONNECTED(out_ref[6:3]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_S_UNCONNECTED(out_ref[2:0])
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
    seed = 1225711139;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
