// Hidden tests: 5000 cycles of seeded random inputs (seed 1100977783); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
  reg clk;
  reg [5:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00292 dut (
    .op(i_0),
    .memtoreg(out_dut[8:8]),
    .memwrite(out_dut[7:7]),
    .branch(out_dut[6:6]),
    .alusrc(out_dut[5:5]),
    .regdst(out_dut[4:4]),
    .regwrite(out_dut[3:3]),
    .jump(out_dut[2:2]),
    .aluop(out_dut[1:0])
  );
  mg_00292__ref ref_i (
    .op(i_0),
    .memtoreg(out_ref[8:8]),
    .memwrite(out_ref[7:7]),
    .branch(out_ref[6:6]),
    .alusrc(out_ref[5:5]),
    .regdst(out_ref[4:4]),
    .regwrite(out_ref[3:3]),
    .jump(out_ref[2:2]),
    .aluop(out_ref[1:0])
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
    seed = 1100977783;
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
