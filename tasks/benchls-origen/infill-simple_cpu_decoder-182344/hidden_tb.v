// Hidden tests: 5000 cycles of seeded random inputs (seed 4134074119); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [3:0] i_0;
  reg [3:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_182344 dut (
    .op_code(i_0),
    .func_in(i_1),
    .func_out(out_dut[13:10]),
    .reg_x_reg(out_dut[9:9]),
    .reg_x_imm(out_dut[8:8]),
    .beqz(out_dut[7:7]),
    .bnez(out_dut[6:6]),
    .lw(out_dut[5:5]),
    .sw(out_dut[4:4]),
    .reg_write(out_dut[3:3]),
    .jump(out_dut[2:2]),
    .jal(out_dut[1:1]),
    .jr(out_dut[0:0])
  );
  origen_182344__ref ref_i (
    .op_code(i_0),
    .func_in(i_1),
    .func_out(out_ref[13:10]),
    .reg_x_reg(out_ref[9:9]),
    .reg_x_imm(out_ref[8:8]),
    .beqz(out_ref[7:7]),
    .bnez(out_ref[6:6]),
    .lw(out_ref[5:5]),
    .sw(out_ref[4:4]),
    .reg_write(out_ref[3:3]),
    .jump(out_ref[2:2]),
    .jal(out_ref[1:1]),
    .jr(out_ref[0:0])
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
    seed = 4134074119;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
