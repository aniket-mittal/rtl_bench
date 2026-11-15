// Hidden tests: 5000 cycles of seeded random inputs (seed 2922543885); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 13;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_175867 dut (
    .Opcode(i_0),
    .Funct(i_1),
    .rst_n(i_2),
    .RegDst(out_dut[12:12]),
    .ALUSrc(out_dut[11:11]),
    .MemWrite(out_dut[10:10]),
    .RegWrite(out_dut[9:9]),
    .MemtoReg(out_dut[8:8]),
    .Branch_gtz(out_dut[7:7]),
    .Branch_ne(out_dut[6:6]),
    .Branch_eq(out_dut[5:5]),
    .Branch_gez(out_dut[4:4]),
    .Branch_lez(out_dut[3:3]),
    .Branch_ltz(out_dut[2:2]),
    .jump(out_dut[1:0])
  );
  origen_175867__ref ref_i (
    .Opcode(i_0),
    .Funct(i_1),
    .rst_n(i_2),
    .RegDst(out_ref[12:12]),
    .ALUSrc(out_ref[11:11]),
    .MemWrite(out_ref[10:10]),
    .RegWrite(out_ref[9:9]),
    .MemtoReg(out_ref[8:8]),
    .Branch_gtz(out_ref[7:7]),
    .Branch_ne(out_ref[6:6]),
    .Branch_eq(out_ref[5:5]),
    .Branch_gez(out_ref[4:4]),
    .Branch_lez(out_ref[3:3]),
    .Branch_ltz(out_ref[2:2]),
    .jump(out_ref[1:0])
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
    seed = 2922543885;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
