// Hidden tests: 5000 cycles of seeded random inputs (seed 2805887951); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 13;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_065503 dut (
    .clk(clk),
    .rst_n(i_0),
    .r_sr_hip_en(i_1),
    .r_sr_parity_en(i_2),
    .r_sr_reserbits_in_en(i_3),
    .avmm_hrdrst_fabric_osc_transfer_en_sync(i_4),
    .sr_sm_testbus(out_dut[12:1]),
    .sr_loadout(out_dut[0:0])
  );
  autovcoder_065503__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .r_sr_hip_en(i_1),
    .r_sr_parity_en(i_2),
    .r_sr_reserbits_in_en(i_3),
    .avmm_hrdrst_fabric_osc_transfer_en_sync(i_4),
    .sr_sm_testbus(out_ref[12:1]),
    .sr_loadout(out_ref[0:0])
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
    seed = 2805887951;
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
