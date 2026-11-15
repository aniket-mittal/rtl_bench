// Hidden tests: 5000 cycles of seeded random inputs (seed 2834722220); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 275;
  reg clk;
  reg [2:0] i_0;
  reg [3:0] i_1;
  reg [3:0] i_2;
  reg [63:0] i_3;
  reg [63:0] i_4;
  reg [63:0] i_5;
  reg [63:0] i_6;
  reg [3:0] i_7;
  reg [3:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_034340 dut (
    .clk(clk),
    .D_stat(i_0),
    .D_icode(i_1),
    .D_ifun(i_2),
    .D_valP(i_3),
    .D_valC(i_4),
    .d_valA(i_5),
    .d_valB(i_6),
    .d_rA(i_7),
    .d_rB(i_8),
    .E_stat(out_dut[274:272]),
    .E_icode(out_dut[271:268]),
    .E_ifun(out_dut[267:264]),
    .E_valC(out_dut[263:200]),
    .E_valA(out_dut[199:136]),
    .E_valB(out_dut[135:72]),
    .E_rA(out_dut[71:68]),
    .E_rB(out_dut[67:64]),
    .E_valP(out_dut[63:0])
  );
  autovcoder_034340__ref ref_i (
    .clk(clk),
    .D_stat(i_0),
    .D_icode(i_1),
    .D_ifun(i_2),
    .D_valP(i_3),
    .D_valC(i_4),
    .d_valA(i_5),
    .d_valB(i_6),
    .d_rA(i_7),
    .d_rB(i_8),
    .E_stat(out_ref[274:272]),
    .E_icode(out_ref[271:268]),
    .E_ifun(out_ref[267:264]),
    .E_valC(out_ref[263:200]),
    .E_valA(out_ref[199:136]),
    .E_valB(out_ref[135:72]),
    .E_rA(out_ref[71:68]),
    .E_rB(out_ref[67:64]),
    .E_valP(out_ref[63:0])
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
    seed = 2834722220;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed), $random(seed)};
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
