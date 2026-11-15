// Hidden tests: 5000 cycles of seeded random inputs (seed 1106854407); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 62;
  reg clk;
  reg [17:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_056401 dut (
    .ir(i_0),
    .rs1(out_dut[61:57]),
    .rs2(out_dut[56:52]),
    .rd(out_dut[51:47]),
    .imm(out_dut[46:29]),
    .imm_s1(out_dut[28:28]),
    .imm_s2(out_dut[27:27]),
    .do_alu(out_dut[26:26]),
    .do_shift(out_dut[25:25]),
    .do_write(out_dut[24:24]),
    .do_readkbd(out_dut[23:23]),
    .do_stb(out_dut[22:22]),
    .do_jump(out_dut[21:21]),
    .alu_op(out_dut[20:17]),
    .shift_op(out_dut[16:15]),
    .jump_offset(out_dut[14:3]),
    .cond(out_dut[2:0])
  );
  origen_056401__ref ref_i (
    .ir(i_0),
    .rs1(out_ref[61:57]),
    .rs2(out_ref[56:52]),
    .rd(out_ref[51:47]),
    .imm(out_ref[46:29]),
    .imm_s1(out_ref[28:28]),
    .imm_s2(out_ref[27:27]),
    .do_alu(out_ref[26:26]),
    .do_shift(out_ref[25:25]),
    .do_write(out_ref[24:24]),
    .do_readkbd(out_ref[23:23]),
    .do_stb(out_ref[22:22]),
    .do_jump(out_ref[21:21]),
    .alu_op(out_ref[20:17]),
    .shift_op(out_ref[16:15]),
    .jump_offset(out_ref[14:3]),
    .cond(out_ref[2:0])
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
    seed = 1106854407;
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
