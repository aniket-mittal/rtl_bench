// Hidden tests: 5000 cycles of seeded random inputs (seed 2873568839); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 144;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04137 dut (
    .clk(clk),
    .writerege(i_0),
    .writerege2(i_1),
    .aluoute(i_2),
    .aluoute2(i_3),
    .writedatae(i_4),
    .writedatae2(i_5),
    .memwritee(i_6),
    .memwritee2(i_7),
    .regwritee(i_8),
    .regwritee2(i_9),
    .memtorege(i_10),
    .memtorege2(i_11),
    .stallm(i_12),
    .stallm2(i_13),
    .regwritem(out_dut[143:143]),
    .regwritem2(out_dut[142:142]),
    .memtoregm(out_dut[141:141]),
    .memtoregm2(out_dut[140:140]),
    .memwritem(out_dut[139:139]),
    .memwritem2(out_dut[138:138]),
    .writeregm(out_dut[137:133]),
    .writeregm2(out_dut[132:128]),
    .aluoutm(out_dut[127:96]),
    .aluoutm2(out_dut[95:64]),
    .writedatam(out_dut[63:32]),
    .writedatam2(out_dut[31:0])
  );
  mg_04137__ref ref_i (
    .clk(clk),
    .writerege(i_0),
    .writerege2(i_1),
    .aluoute(i_2),
    .aluoute2(i_3),
    .writedatae(i_4),
    .writedatae2(i_5),
    .memwritee(i_6),
    .memwritee2(i_7),
    .regwritee(i_8),
    .regwritee2(i_9),
    .memtorege(i_10),
    .memtorege2(i_11),
    .stallm(i_12),
    .stallm2(i_13),
    .regwritem(out_ref[143:143]),
    .regwritem2(out_ref[142:142]),
    .memtoregm(out_ref[141:141]),
    .memtoregm2(out_ref[140:140]),
    .memwritem(out_ref[139:139]),
    .memwritem2(out_ref[138:138]),
    .writeregm(out_ref[137:133]),
    .writeregm2(out_ref[132:128]),
    .aluoutm(out_ref[127:96]),
    .aluoutm2(out_ref[95:64]),
    .writedatam(out_ref[63:32]),
    .writedatam2(out_ref[31:0])
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
    seed = 2873568839;
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
