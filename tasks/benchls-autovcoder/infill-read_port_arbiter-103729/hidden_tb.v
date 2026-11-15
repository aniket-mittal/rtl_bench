// Hidden tests: 5000 cycles of seeded random inputs (seed 3992620302); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 137;
  reg clk;
  reg [0:0] i_0;
  reg [8:0] i_1;
  reg [0:0] i_2;
  reg [8:0] i_3;
  reg [0:0] i_4;
  reg [8:0] i_5;
  reg [127:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_103729 dut (
    .port0_rd_en(i_0),
    .port0_rd_addr(i_1),
    .port1_rd_en(i_2),
    .port1_rd_addr(i_3),
    .port2_rd_en(i_4),
    .port2_rd_addr(i_5),
    .rd_data(i_6),
    .port_rd_data(out_dut[136:9]),
    .rd_addr(out_dut[8:0])
  );
  autovcoder_103729__ref ref_i (
    .port0_rd_en(i_0),
    .port0_rd_addr(i_1),
    .port1_rd_en(i_2),
    .port1_rd_addr(i_3),
    .port2_rd_en(i_4),
    .port2_rd_addr(i_5),
    .rd_data(i_6),
    .port_rd_data(out_ref[136:9]),
    .rd_addr(out_ref[8:0])
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
    seed = 3992620302;
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
      i_6 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
