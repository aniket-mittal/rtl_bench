// Hidden tests: 5000 cycles of seeded random inputs (seed 1431896111); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 272;
  reg clk;
  reg [3:0] i_0;
  reg [3:0] i_1;
  reg [3:0] i_2;
  reg [3:0] i_3;
  reg [63:0] i_4;
  reg [63:0] i_5;
  reg [63:0] i_6;
  reg [63:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_035368 dut (
    .clk(clk),
    .d_icode(i_0),
    .d_ifun(i_1),
    .d_rA(i_2),
    .d_rB(i_3),
    .d_valC(i_4),
    .d_valP(i_5),
    .d_valA(i_6),
    .d_valB(i_7),
    .e_icode(out_dut[271:268]),
    .e_ifun(out_dut[267:264]),
    .e_rA(out_dut[263:260]),
    .e_rB(out_dut[259:256]),
    .e_valC(out_dut[255:192]),
    .e_valP(out_dut[191:128]),
    .e_valA(out_dut[127:64]),
    .e_valB(out_dut[63:0])
  );
  autovcoder_035368__ref ref_i (
    .clk(clk),
    .d_icode(i_0),
    .d_ifun(i_1),
    .d_rA(i_2),
    .d_rB(i_3),
    .d_valC(i_4),
    .d_valP(i_5),
    .d_valA(i_6),
    .d_valB(i_7),
    .e_icode(out_ref[271:268]),
    .e_ifun(out_ref[267:264]),
    .e_rA(out_ref[263:260]),
    .e_rB(out_ref[259:256]),
    .e_valC(out_ref[255:192]),
    .e_valP(out_ref[191:128]),
    .e_valA(out_ref[127:64]),
    .e_valB(out_ref[63:0])
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
    seed = 1431896111;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
