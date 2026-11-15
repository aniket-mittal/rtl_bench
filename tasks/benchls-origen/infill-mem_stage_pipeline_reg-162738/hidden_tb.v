// Hidden tests: 5000 cycles of seeded random inputs (seed 3158576601); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_162738 dut (
    .clock(clk),
    .reset(i_0),
    .mem_m0_oper(i_1),
    .mem_m0_readmem(i_2),
    .mem_m0_writemem(i_3),
    .mem_m0_rega(i_4),
    .mem_m0_imedext(i_5),
    .mem_m0_regb(i_6),
    .mem_m0_regdest(i_7),
    .mem_m0_writereg(i_8),
    .m0_m1_oper(out_dut[72:72]),
    .m0_m1_readmem(out_dut[71:71]),
    .m0_m1_writemem(out_dut[70:70]),
    .m0_m1_data_addr(out_dut[69:38]),
    .m0_m1_regb(out_dut[37:6]),
    .m0_m1_regdest(out_dut[5:1]),
    .m0_m1_writereg(out_dut[0:0])
  );
  origen_162738__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .mem_m0_oper(i_1),
    .mem_m0_readmem(i_2),
    .mem_m0_writemem(i_3),
    .mem_m0_rega(i_4),
    .mem_m0_imedext(i_5),
    .mem_m0_regb(i_6),
    .mem_m0_regdest(i_7),
    .mem_m0_writereg(i_8),
    .m0_m1_oper(out_ref[72:72]),
    .m0_m1_readmem(out_ref[71:71]),
    .m0_m1_writemem(out_ref[70:70]),
    .m0_m1_data_addr(out_ref[69:38]),
    .m0_m1_regb(out_ref[37:6]),
    .m0_m1_regdest(out_ref[5:1]),
    .m0_m1_writereg(out_ref[0:0])
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
    seed = 3158576601;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
