// Hidden tests: 5000 cycles of seeded random inputs (seed 4186584439); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [5:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_020595 dut (
    .opcode(i_0),
    .czero(i_1),
    .aluOp(out_dut[10:9]),
    .regDst(out_dut[8:8]),
    .aluSrc(out_dut[7:7]),
    .memToReg(out_dut[6:6]),
    .regWrite(out_dut[5:5]),
    .memRead(out_dut[4:4]),
    .memWrite(out_dut[3:3]),
    .pccontrol(out_dut[2:0])
  );
  origen_020595__ref ref_i (
    .opcode(i_0),
    .czero(i_1),
    .aluOp(out_ref[10:9]),
    .regDst(out_ref[8:8]),
    .aluSrc(out_ref[7:7]),
    .memToReg(out_ref[6:6]),
    .regWrite(out_ref[5:5]),
    .memRead(out_ref[4:4]),
    .memWrite(out_ref[3:3]),
    .pccontrol(out_ref[2:0])
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
    seed = 4186584439;
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
