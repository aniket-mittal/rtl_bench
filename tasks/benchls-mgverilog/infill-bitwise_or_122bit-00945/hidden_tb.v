// Hidden tests: 5000 cycles of seeded random inputs (seed 1183203275); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 366;
  reg clk;
  reg [121:0] i_0;
  reg [121:0] i_1;
  reg [121:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00945 dut (
    .extend_temp1_V_read(i_0),
    .extend_temp2_V_read(i_1),
    .extend_temp1_V_write(i_2),
    .ap_return_0(out_dut[365:244]),
    .ap_return_1(out_dut[243:122]),
    .ap_return_2(out_dut[121:0])
  );
  mg_00945__ref ref_i (
    .extend_temp1_V_read(i_0),
    .extend_temp2_V_read(i_1),
    .extend_temp1_V_write(i_2),
    .ap_return_0(out_ref[365:244]),
    .ap_return_1(out_ref[243:122]),
    .ap_return_2(out_ref[121:0])
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
    seed = 1183203275;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
