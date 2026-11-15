// Hidden tests: 5000 cycles of seeded random inputs (seed 1058138496); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [0:0] i_0;
  reg [5:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_016149 dut (
    .reset(i_0),
    .opcode(i_1),
    .reg_dst(out_dut[9:9]),
    .mem_to_reg(out_dut[8:8]),
    .mem_read(out_dut[7:7]),
    .mem_write(out_dut[6:6]),
    .alu_src(out_dut[5:5]),
    .reg_write(out_dut[4:4]),
    .branch(out_dut[3:3]),
    .jump(out_dut[2:2]),
    .alu_op(out_dut[1:0])
  );
  origen_016149__ref ref_i (
    .reset(i_0),
    .opcode(i_1),
    .reg_dst(out_ref[9:9]),
    .mem_to_reg(out_ref[8:8]),
    .mem_read(out_ref[7:7]),
    .mem_write(out_ref[6:6]),
    .alu_src(out_ref[5:5]),
    .reg_write(out_ref[4:4]),
    .branch(out_ref[3:3]),
    .jump(out_ref[2:2]),
    .alu_op(out_ref[1:0])
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
    seed = 1058138496;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
