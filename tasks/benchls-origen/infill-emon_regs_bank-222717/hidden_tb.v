// Hidden tests: 5000 cycles of seeded random inputs (seed 220227395); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 38;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [19:0] i_3;
  reg [31:0] i_4;
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
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_222717 dut (
    .clk(clk),
    .reset(i_0),
    .mi_access(i_1),
    .mi_write(i_2),
    .mi_addr(i_3),
    .mi_data_in(i_4),
    .erx_rdfifo_access(i_5),
    .erx_rdfifo_wait(i_6),
    .erx_wrfifo_access(i_7),
    .erx_wrfifo_wait(i_8),
    .erx_wbfifo_access(i_9),
    .erx_wbfifo_wait(i_10),
    .etx_rdfifo_access(i_11),
    .etx_rdfifo_wait(i_12),
    .etx_wrfifo_access(i_13),
    .etx_wrfifo_wait(i_14),
    .etx_wbfifo_access(i_15),
    .etx_wbfifo_wait(i_16),
    .mi_data_out(out_dut[37:6]),
    .emon_zero_flag(out_dut[5:0])
  );
  origen_222717__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .mi_access(i_1),
    .mi_write(i_2),
    .mi_addr(i_3),
    .mi_data_in(i_4),
    .erx_rdfifo_access(i_5),
    .erx_rdfifo_wait(i_6),
    .erx_wrfifo_access(i_7),
    .erx_wrfifo_wait(i_8),
    .erx_wbfifo_access(i_9),
    .erx_wbfifo_wait(i_10),
    .etx_rdfifo_access(i_11),
    .etx_rdfifo_wait(i_12),
    .etx_wrfifo_access(i_13),
    .etx_wrfifo_wait(i_14),
    .etx_wbfifo_access(i_15),
    .etx_wbfifo_wait(i_16),
    .mi_data_out(out_ref[37:6]),
    .emon_zero_flag(out_ref[5:0])
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
    seed = 220227395;
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
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
