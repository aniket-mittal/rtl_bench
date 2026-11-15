// Hidden tests: 5000 cycles of seeded random inputs (seed 2747741377); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 42;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_002070 dut (
    .Sclk(clk),
    .Dclk(i_0),
    .Frame(i_1),
    .S2P_status(i_2),
    .sleep_status(i_3),
    .Reset_n(i_4),
    .col(i_5),
    .rj_status(out_dut[41:41]),
    .coeff_status(out_dut[40:40]),
    .in_status(out_dut[39:39]),
    .alu_status(out_dut[38:38]),
    .address_rj(out_dut[37:30]),
    .address_coeff(out_dut[29:22]),
    .address_in(out_dut[21:14]),
    .cont_address(out_dut[13:4]),
    .InReady(out_dut[3:3]),
    .Start(out_dut[2:2]),
    .clear(out_dut[1:1]),
    .set(out_dut[0:0])
  );
  origen_002070__ref ref_i (
    .Sclk(clk),
    .Dclk(i_0),
    .Frame(i_1),
    .S2P_status(i_2),
    .sleep_status(i_3),
    .Reset_n(i_4),
    .col(i_5),
    .rj_status(out_ref[41:41]),
    .coeff_status(out_ref[40:40]),
    .in_status(out_ref[39:39]),
    .alu_status(out_ref[38:38]),
    .address_rj(out_ref[37:30]),
    .address_coeff(out_ref[29:22]),
    .address_in(out_ref[21:14]),
    .cont_address(out_ref[13:4]),
    .InReady(out_ref[3:3]),
    .Start(out_ref[2:2]),
    .clear(out_ref[1:1]),
    .set(out_ref[0:0])
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
    seed = 2747741377;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
