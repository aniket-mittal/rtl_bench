// Hidden tests: 5000 cycles of seeded random inputs (seed 903961809); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 13;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_157539 dut (
    .OP(i_0),
    .FUNCT(i_1),
    .jrctrl(out_dut[12:12]),
    .Jctrl(out_dut[11:11]),
    .beq(out_dut[10:10]),
    .bne(out_dut[9:9]),
    .jl(out_dut[8:8]),
    .Rctrl(out_dut[7:7]),
    .Wren(out_dut[6:6]),
    .ALUctrl(out_dut[5:3]),
    .Ictrl(out_dut[2:2]),
    .MemWren(out_dut[1:1]),
    .MemtoReg(out_dut[0:0])
  );
  origen_157539__ref ref_i (
    .OP(i_0),
    .FUNCT(i_1),
    .jrctrl(out_ref[12:12]),
    .Jctrl(out_ref[11:11]),
    .beq(out_ref[10:10]),
    .bne(out_ref[9:9]),
    .jl(out_ref[8:8]),
    .Rctrl(out_ref[7:7]),
    .Wren(out_ref[6:6]),
    .ALUctrl(out_ref[5:3]),
    .Ictrl(out_ref[2:2]),
    .MemWren(out_ref[1:1]),
    .MemtoReg(out_ref[0:0])
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
    seed = 903961809;
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
