// Hidden tests: 5000 cycles of seeded random inputs (seed 135427034); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 200;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_138494 dut (
    .clk(clk),
    .reset(i_0),
    .current_a(i_1),
    .current_b(i_2),
    .current_c(i_3),
    .position(i_4),
    .speed_ref(i_5),
    .clark_x(out_dut[199:184]),
    .clark_y(out_dut[183:168]),
    .park_x(out_dut[167:152]),
    .park_y(out_dut[151:136]),
    .error_d(out_dut[135:120]),
    .error_q(out_dut[119:104]),
    .v_a(out_dut[103:88]),
    .v_b(out_dut[87:72]),
    .v_c(out_dut[71:56]),
    .pwm_a(out_dut[55:48]),
    .pwm_b(out_dut[47:40]),
    .pwm_c(out_dut[39:32]),
    .integrator_d(out_dut[31:16]),
    .integrator_q(out_dut[15:0])
  );
  origen_138494__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .current_a(i_1),
    .current_b(i_2),
    .current_c(i_3),
    .position(i_4),
    .speed_ref(i_5),
    .clark_x(out_ref[199:184]),
    .clark_y(out_ref[183:168]),
    .park_x(out_ref[167:152]),
    .park_y(out_ref[151:136]),
    .error_d(out_ref[135:120]),
    .error_q(out_ref[119:104]),
    .v_a(out_ref[103:88]),
    .v_b(out_ref[87:72]),
    .v_c(out_ref[71:56]),
    .pwm_a(out_ref[55:48]),
    .pwm_b(out_ref[47:40]),
    .pwm_c(out_ref[39:32]),
    .integrator_d(out_ref[31:16]),
    .integrator_q(out_ref[15:0])
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
    seed = 135427034;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
