// Hidden tests: 5000 cycles of seeded random inputs (seed 3735420231); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 33;
  reg clk;
  reg [15:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_182340 dut (
    .ins(i_0),
    .is_ban(i_1),
    .stop(out_dut[32:32]),
    .change_pc(out_dut[31:20]),
    .type_pc(out_dut[19:18]),
    .acc_we(out_dut[17:17]),
    .ram_add(out_dut[16:5]),
    .ram_we(out_dut[4:4]),
    .op(out_dut[3:0])
  );
  origen_182340__ref ref_i (
    .ins(i_0),
    .is_ban(i_1),
    .stop(out_ref[32:32]),
    .change_pc(out_ref[31:20]),
    .type_pc(out_ref[19:18]),
    .acc_we(out_ref[17:17]),
    .ram_add(out_ref[16:5]),
    .ram_we(out_ref[4:4]),
    .op(out_ref[3:0])
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
    seed = 3735420231;
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
