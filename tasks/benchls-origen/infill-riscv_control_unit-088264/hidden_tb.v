// Hidden tests: 5000 cycles of seeded random inputs (seed 2446192145); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 12;
  reg clk;
  reg [4:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_088264 dut (
    .opcode(i_0),
    .branch(out_dut[11:11]),
    .memread(out_dut[10:10]),
    .memtoreg(out_dut[9:9]),
    .aluop(out_dut[8:7]),
    .memwrite(out_dut[6:6]),
    .alusrc(out_dut[5:5]),
    .regwrite(out_dut[4:4]),
    .i_type(out_dut[3:3]),
    .AJ_control(out_dut[2:1]),
    .lui_flag(out_dut[0:0])
  );
  origen_088264__ref ref_i (
    .opcode(i_0),
    .branch(out_ref[11:11]),
    .memread(out_ref[10:10]),
    .memtoreg(out_ref[9:9]),
    .aluop(out_ref[8:7]),
    .memwrite(out_ref[6:6]),
    .alusrc(out_ref[5:5]),
    .regwrite(out_ref[4:4]),
    .i_type(out_ref[3:3]),
    .AJ_control(out_ref[2:1]),
    .lui_flag(out_ref[0:0])
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
    seed = 2446192145;
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
