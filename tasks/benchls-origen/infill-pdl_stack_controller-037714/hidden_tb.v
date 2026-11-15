// Hidden tests: 5000 cycles of seeded random inputs (seed 1996261683); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
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
  reg [4:0] i_12;
  reg [4:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_037714 dut (
    .clk(clk),
    .reset(i_0),
    .ir(i_1),
    .state_alu(i_2),
    .state_fetch(i_3),
    .state_mmu(i_4),
    .state_read(i_5),
    .state_write(i_6),
    .destpdltop(i_7),
    .destpdl_x(i_8),
    .destpdl_p(i_9),
    .srcpdlpop(i_10),
    .srcpdltop(i_11),
    .pdlptr(i_12),
    .pdlidx(i_13),
    .pdla(out_dut[10:6]),
    .pdlwrite(out_dut[5:5]),
    .pwp(out_dut[4:4]),
    .pdlenb(out_dut[3:3]),
    .prp(out_dut[2:2]),
    .pdldrive(out_dut[1:1]),
    .pdlcnt(out_dut[0:0])
  );
  origen_037714__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .ir(i_1),
    .state_alu(i_2),
    .state_fetch(i_3),
    .state_mmu(i_4),
    .state_read(i_5),
    .state_write(i_6),
    .destpdltop(i_7),
    .destpdl_x(i_8),
    .destpdl_p(i_9),
    .srcpdlpop(i_10),
    .srcpdltop(i_11),
    .pdlptr(i_12),
    .pdlidx(i_13),
    .pdla(out_ref[10:6]),
    .pdlwrite(out_ref[5:5]),
    .pwp(out_ref[4:4]),
    .pdlenb(out_ref[3:3]),
    .prp(out_ref[2:2]),
    .pdldrive(out_ref[1:1]),
    .pdlcnt(out_ref[0:0])
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
    seed = 1996261683;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
