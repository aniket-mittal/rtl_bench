// Hidden tests: 5000 cycles of seeded random inputs (seed 1888939703); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 43;
  reg clk;
  reg [9:0] i_0;
  reg [3:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_085606 dut (
    .clk_sys(clk),
    .alarm_clk(i_0),
    .set_acce(i_1),
    .sign_alarm(out_dut[42:42]),
    .h_ten(out_dut[41:35]),
    .h_one(out_dut[34:28]),
    .min_ten(out_dut[27:21]),
    .min_one(out_dut[20:14]),
    .s_ten(out_dut[13:7]),
    .s_one(out_dut[6:0])
  );
  autovcoder_085606__ref ref_i (
    .clk_sys(clk),
    .alarm_clk(i_0),
    .set_acce(i_1),
    .sign_alarm(out_ref[42:42]),
    .h_ten(out_ref[41:35]),
    .h_one(out_ref[34:28]),
    .min_ten(out_ref[27:21]),
    .min_one(out_ref[20:14]),
    .s_ten(out_ref[13:7]),
    .s_one(out_ref[6:0])
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
    seed = 1888939703;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
