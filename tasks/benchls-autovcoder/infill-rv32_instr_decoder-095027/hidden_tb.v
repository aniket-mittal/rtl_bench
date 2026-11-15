// Hidden tests: 5000 cycles of seeded random inputs (seed 1594570057); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 65;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_095027 dut (
    .ifu_qed_instruction(i_0),
    .shamt(out_dut[64:60]),
    .IS_SW(out_dut[59:59]),
    .imm12(out_dut[58:47]),
    .IS_R(out_dut[46:46]),
    .rd(out_dut[45:41]),
    .funct3(out_dut[40:38]),
    .opcode(out_dut[37:31]),
    .rs2(out_dut[30:26]),
    .funct7(out_dut[25:19]),
    .IS_I(out_dut[18:18]),
    .IS_LW(out_dut[17:17]),
    .imm5(out_dut[16:12]),
    .rs1(out_dut[11:7]),
    .imm7(out_dut[6:0])
  );
  autovcoder_095027__ref ref_i (
    .ifu_qed_instruction(i_0),
    .shamt(out_ref[64:60]),
    .IS_SW(out_ref[59:59]),
    .imm12(out_ref[58:47]),
    .IS_R(out_ref[46:46]),
    .rd(out_ref[45:41]),
    .funct3(out_ref[40:38]),
    .opcode(out_ref[37:31]),
    .rs2(out_ref[30:26]),
    .funct7(out_ref[25:19]),
    .IS_I(out_ref[18:18]),
    .IS_LW(out_ref[17:17]),
    .imm5(out_ref[16:12]),
    .rs1(out_ref[11:7]),
    .imm7(out_ref[6:0])
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
    seed = 1594570057;
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
