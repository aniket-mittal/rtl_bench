// Hidden tests: 5000 cycles of seeded random inputs (seed 2720990005); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_008552 dut (
    .Instr(i_0),
    .RegDst(out_dut[20:20]),
    .AluSrc(out_dut[19:19]),
    .RegWrite(out_dut[18:18]),
    .MemWrite(out_dut[17:17]),
    .MemToReg(out_dut[16:16]),
    .Jump(out_dut[15:15]),
    .Link(out_dut[14:14]),
    .LinkReg(out_dut[13:13]),
    .Return(out_dut[12:12]),
    .Byte(out_dut[11:11]),
    .Half(out_dut[10:10]),
    .Sign(out_dut[9:9]),
    .ExtCtrl(out_dut[8:7]),
    .Branch(out_dut[6:4]),
    .AluCtrl(out_dut[3:0])
  );
  origen_008552__ref ref_i (
    .Instr(i_0),
    .RegDst(out_ref[20:20]),
    .AluSrc(out_ref[19:19]),
    .RegWrite(out_ref[18:18]),
    .MemWrite(out_ref[17:17]),
    .MemToReg(out_ref[16:16]),
    .Jump(out_ref[15:15]),
    .Link(out_ref[14:14]),
    .LinkReg(out_ref[13:13]),
    .Return(out_ref[12:12]),
    .Byte(out_ref[11:11]),
    .Half(out_ref[10:10]),
    .Sign(out_ref[9:9]),
    .ExtCtrl(out_ref[8:7]),
    .Branch(out_ref[6:4]),
    .AluCtrl(out_ref[3:0])
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
    seed = 2720990005;
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
