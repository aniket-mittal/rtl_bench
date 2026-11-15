// Hidden tests: 5000 cycles of seeded random inputs (seed 3669957287); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 70;
  reg clk;
  reg [1:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04020 dut (
    .avs_s1_clk(clk),
    .avs_s1_address(i_0),
    .avs_s1_read(i_1),
    .avs_s1_writedata(i_2),
    .avs_s1_write(i_3),
    .avs_s1_reset(i_4),
    .avs_s1_export_readdata(i_5),
    .avs_s1_readdata(out_dut[69:38]),
    .avs_s1_export_clk(out_dut[37:37]),
    .avs_s1_export_address(out_dut[36:35]),
    .avs_s1_export_read(out_dut[34:34]),
    .avs_s1_export_writedata(out_dut[33:2]),
    .avs_s1_export_write(out_dut[1:1]),
    .avs_s1_export_reset(out_dut[0:0])
  );
  mg_04020__ref ref_i (
    .avs_s1_clk(clk),
    .avs_s1_address(i_0),
    .avs_s1_read(i_1),
    .avs_s1_writedata(i_2),
    .avs_s1_write(i_3),
    .avs_s1_reset(i_4),
    .avs_s1_export_readdata(i_5),
    .avs_s1_readdata(out_ref[69:38]),
    .avs_s1_export_clk(out_ref[37:37]),
    .avs_s1_export_address(out_ref[36:35]),
    .avs_s1_export_read(out_ref[34:34]),
    .avs_s1_export_writedata(out_ref[33:2]),
    .avs_s1_export_write(out_ref[1:1]),
    .avs_s1_export_reset(out_ref[0:0])
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
    seed = 3669957287;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_5 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
