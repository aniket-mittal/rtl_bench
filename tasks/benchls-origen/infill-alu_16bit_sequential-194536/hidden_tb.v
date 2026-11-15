// Hidden tests: 5000 cycles of seeded random inputs (seed 1171166474); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [3:0] i_4;
  reg [6:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [5:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_194536 dut (
    .clk(clk),
    .reset(i_0),
    .rd_d_in(i_1),
    .rs1_d(i_2),
    .rs2_d(i_3),
    .ALU_Sel(i_4),
    .count(i_5),
    .reg_write(i_6),
    .q0_var(i_7),
    .q1_var(i_8),
    .LENGTH(i_9),
    .OpStart(out_dut[16:16]),
    .rd_d_out(out_dut[15:0])
  );
  origen_194536__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .rd_d_in(i_1),
    .rs1_d(i_2),
    .rs2_d(i_3),
    .ALU_Sel(i_4),
    .count(i_5),
    .reg_write(i_6),
    .q0_var(i_7),
    .q1_var(i_8),
    .LENGTH(i_9),
    .OpStart(out_ref[16:16]),
    .rd_d_out(out_ref[15:0])
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
    seed = 1171166474;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
