// Hidden tests: 5000 cycles of seeded random inputs (seed 2442658981); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 40;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_174342 dut (
    .inst(i_0),
    .ALU_OP(out_dut[39:37]),
    .rs(out_dut[36:32]),
    .rt(out_dut[31:27]),
    .rd(out_dut[26:22]),
    .Write_Reg(out_dut[21:21]),
    .imm(out_dut[20:5]),
    .rd_rt_s(out_dut[4:4]),
    .imm_s(out_dut[3:3]),
    .rt_imm_s(out_dut[2:2]),
    .Mem_Write(out_dut[1:1]),
    .alu_mem_s(out_dut[0:0])
  );
  origen_174342__ref ref_i (
    .inst(i_0),
    .ALU_OP(out_ref[39:37]),
    .rs(out_ref[36:32]),
    .rt(out_ref[31:27]),
    .rd(out_ref[26:22]),
    .Write_Reg(out_ref[21:21]),
    .imm(out_ref[20:5]),
    .rd_rt_s(out_ref[4:4]),
    .imm_s(out_ref[3:3]),
    .rt_imm_s(out_ref[2:2]),
    .Mem_Write(out_ref[1:1]),
    .alu_mem_s(out_ref[0:0])
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
    seed = 2442658981;
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
