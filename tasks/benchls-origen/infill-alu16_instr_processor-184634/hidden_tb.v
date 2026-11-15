// Hidden tests: 5000 cycles of seeded random inputs (seed 1819881643); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 29;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_184634 dut (
    .instr(i_0),
    .inreg1(i_1),
    .inreg2(i_2),
    .carrystatus(i_3),
    .exec1(i_4),
    .aluout(out_dut[28:13]),
    .regM(out_dut[12:11]),
    .sel_mux_mem_alu(out_dut[10:10]),
    .sel_mux_inp(out_dut[9:9]),
    .output_en(out_dut[8:8]),
    .carryout(out_dut[7:7]),
    .carryen(out_dut[6:6]),
    .wenout(out_dut[5:5]),
    .RegN(out_dut[4:3]),
    .RegD(out_dut[2:1]),
    .sel_mux_regD(out_dut[0:0])
  );
  origen_184634__ref ref_i (
    .instr(i_0),
    .inreg1(i_1),
    .inreg2(i_2),
    .carrystatus(i_3),
    .exec1(i_4),
    .aluout(out_ref[28:13]),
    .regM(out_ref[12:11]),
    .sel_mux_mem_alu(out_ref[10:10]),
    .sel_mux_inp(out_ref[9:9]),
    .output_en(out_ref[8:8]),
    .carryout(out_ref[7:7]),
    .carryen(out_ref[6:6]),
    .wenout(out_ref[5:5]),
    .RegN(out_ref[4:3]),
    .RegD(out_ref[2:1]),
    .sel_mux_regD(out_ref[0:0])
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
    seed = 1819881643;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
