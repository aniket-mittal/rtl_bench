// Hidden tests: 5000 cycles of seeded random inputs (seed 2329258972); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 18;
  reg clk;
  reg [7:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01029 dut (
    .opcode(i_0),
    .instr_len(out_dut[17:15]),
    .opa(out_dut[14:12]),
    .opb(out_dut[11:9]),
    .alu_op(out_dut[8:6]),
    .destination(out_dut[5:3]),
    .update_carry(out_dut[2:2]),
    .update_zero(out_dut[1:1]),
    .update_overflow(out_dut[0:0])
  );
  mg_01029__ref ref_i (
    .opcode(i_0),
    .instr_len(out_ref[17:15]),
    .opa(out_ref[14:12]),
    .opb(out_ref[11:9]),
    .alu_op(out_ref[8:6]),
    .destination(out_ref[5:3]),
    .update_carry(out_ref[2:2]),
    .update_zero(out_ref[1:1]),
    .update_overflow(out_ref[0:0])
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
    seed = 2329258972;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
