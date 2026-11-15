// Hidden tests: 5000 cycles of seeded random inputs (seed 1458527535); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 18;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_050139 dut (
    .instr(i_0),
    .RegWrite(out_dut[17:17]),
    .Mem_to_Reg(out_dut[16:15]),
    .MemWrite(out_dut[14:14]),
    .ALUctr(out_dut[13:11]),
    .ALUsrc(out_dut[10:10]),
    .if_j(out_dut[9:9]),
    .if_jal(out_dut[8:8]),
    .if_jr(out_dut[7:7]),
    .RegDst(out_dut[6:5]),
    .Ext_op(out_dut[4:3]),
    .Branch_on_equal(out_dut[2:2]),
    .res(out_dut[1:0])
  );
  origen_050139__ref ref_i (
    .instr(i_0),
    .RegWrite(out_ref[17:17]),
    .Mem_to_Reg(out_ref[16:15]),
    .MemWrite(out_ref[14:14]),
    .ALUctr(out_ref[13:11]),
    .ALUsrc(out_ref[10:10]),
    .if_j(out_ref[9:9]),
    .if_jal(out_ref[8:8]),
    .if_jr(out_ref[7:7]),
    .RegDst(out_ref[6:5]),
    .Ext_op(out_ref[4:3]),
    .Branch_on_equal(out_ref[2:2]),
    .res(out_ref[1:0])
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
    seed = 1458527535;
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
