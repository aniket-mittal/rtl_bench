// Hidden tests: 5000 cycles of seeded random inputs (seed 1323464311); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_131378 dut (
    .clk(clk),
    .clk_ena(i_0),
    .in_stream(i_1),
    .reset(i_2),
    .pipeline_reg_0(out_dut[16:16]),
    .pipeline_reg_1(out_dut[15:15]),
    .pipeline_reg_2(out_dut[14:14]),
    .pipeline_reg_3(out_dut[13:13]),
    .pipeline_reg_4(out_dut[12:12]),
    .pipeline_reg_5(out_dut[11:11]),
    .pipeline_reg_6(out_dut[10:10]),
    .pipeline_reg_7(out_dut[9:9]),
    .pipeline_reg_8(out_dut[8:8]),
    .pipeline_reg_9(out_dut[7:7]),
    .pipeline_reg_10(out_dut[6:6]),
    .pipeline_reg_11(out_dut[5:5]),
    .pipeline_reg_12(out_dut[4:4]),
    .pipeline_reg_13(out_dut[3:3]),
    .pipeline_reg_14(out_dut[2:2]),
    .pipeline_reg_15(out_dut[1:1]),
    .pipeline_reg_16(out_dut[0:0])
  );
  origen_131378__ref ref_i (
    .clk(clk),
    .clk_ena(i_0),
    .in_stream(i_1),
    .reset(i_2),
    .pipeline_reg_0(out_ref[16:16]),
    .pipeline_reg_1(out_ref[15:15]),
    .pipeline_reg_2(out_ref[14:14]),
    .pipeline_reg_3(out_ref[13:13]),
    .pipeline_reg_4(out_ref[12:12]),
    .pipeline_reg_5(out_ref[11:11]),
    .pipeline_reg_6(out_ref[10:10]),
    .pipeline_reg_7(out_ref[9:9]),
    .pipeline_reg_8(out_ref[8:8]),
    .pipeline_reg_9(out_ref[7:7]),
    .pipeline_reg_10(out_ref[6:6]),
    .pipeline_reg_11(out_ref[5:5]),
    .pipeline_reg_12(out_ref[4:4]),
    .pipeline_reg_13(out_ref[3:3]),
    .pipeline_reg_14(out_ref[2:2]),
    .pipeline_reg_15(out_ref[1:1]),
    .pipeline_reg_16(out_ref[0:0])
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
    seed = 1323464311;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
