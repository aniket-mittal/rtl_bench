// Hidden tests: 5000 cycles of seeded random inputs (seed 3660313033); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 96;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_143098 dut (
    .clk(clk),
    .clk_ena(i_0),
    .reset(i_1),
    .in_stream(i_2),
    .pipeline_reg_0(out_dut[95:88]),
    .pipeline_reg_1(out_dut[87:80]),
    .pipeline_reg_2(out_dut[79:72]),
    .pipeline_reg_3(out_dut[71:64]),
    .pipeline_reg_4(out_dut[63:56]),
    .pipeline_reg_5(out_dut[55:48]),
    .pipeline_reg_6(out_dut[47:40]),
    .pipeline_reg_7(out_dut[39:32]),
    .pipeline_reg_8(out_dut[31:24]),
    .pipeline_reg_9(out_dut[23:16]),
    .pipeline_reg_10(out_dut[15:8]),
    .pipeline_reg_11(out_dut[7:0])
  );
  origen_143098__ref ref_i (
    .clk(clk),
    .clk_ena(i_0),
    .reset(i_1),
    .in_stream(i_2),
    .pipeline_reg_0(out_ref[95:88]),
    .pipeline_reg_1(out_ref[87:80]),
    .pipeline_reg_2(out_ref[79:72]),
    .pipeline_reg_3(out_ref[71:64]),
    .pipeline_reg_4(out_ref[63:56]),
    .pipeline_reg_5(out_ref[55:48]),
    .pipeline_reg_6(out_ref[47:40]),
    .pipeline_reg_7(out_ref[39:32]),
    .pipeline_reg_8(out_ref[31:24]),
    .pipeline_reg_9(out_ref[23:16]),
    .pipeline_reg_10(out_ref[15:8]),
    .pipeline_reg_11(out_ref[7:0])
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
    seed = 3660313033;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
