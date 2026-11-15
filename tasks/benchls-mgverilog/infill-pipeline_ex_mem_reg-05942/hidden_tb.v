// Hidden tests: 5000 cycles of seeded random inputs (seed 1133770232); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 136;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_05942 dut (
    .clk(clk),
    .rst(i_0),
    .stall(i_1),
    .ex_aluresult(i_2),
    .ex_td(i_3),
    .ex_d2(i_4),
    .ex_WREG(i_5),
    .ex_WMEM(i_6),
    .ex_LW(i_7),
    .ex_instr(i_8),
    .ex_pc(i_9),
    .me_aluresult(out_dut[135:104]),
    .me_td(out_dut[103:99]),
    .me_d2(out_dut[98:67]),
    .me_WREG(out_dut[66:66]),
    .me_WMEM(out_dut[65:65]),
    .me_LW(out_dut[64:64]),
    .me_instr(out_dut[63:32]),
    .me_pc(out_dut[31:0])
  );
  mg_05942__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .stall(i_1),
    .ex_aluresult(i_2),
    .ex_td(i_3),
    .ex_d2(i_4),
    .ex_WREG(i_5),
    .ex_WMEM(i_6),
    .ex_LW(i_7),
    .ex_instr(i_8),
    .ex_pc(i_9),
    .me_aluresult(out_ref[135:104]),
    .me_td(out_ref[103:99]),
    .me_d2(out_ref[98:67]),
    .me_WREG(out_ref[66:66]),
    .me_WMEM(out_ref[65:65]),
    .me_LW(out_ref[64:64]),
    .me_instr(out_ref[63:32]),
    .me_pc(out_ref[31:0])
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
    seed = 1133770232;
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
