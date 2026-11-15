// Hidden tests: 5000 cycles of seeded random inputs (seed 3780357430); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 65;
  reg clk;
  reg [0:0] i_0;
  reg [5:0] i_1;
  reg [3:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_007845 dut (
    .clk_i(clk),
    .rst_i(i_0),
    .adr_i(i_1),
    .sel_i(i_2),
    .dat_i(i_3),
    .we_i(i_4),
    .stb_i(i_5),
    .cyc_i(i_6),
    .run_rx(i_7),
    .run_tx(i_8),
    .dat_o(out_dut[64:33]),
    .ack_o(out_dut[32:32]),
    .ctrl_lines(out_dut[31:0])
  );
  autovcoder_007845__ref ref_i (
    .clk_i(clk),
    .rst_i(i_0),
    .adr_i(i_1),
    .sel_i(i_2),
    .dat_i(i_3),
    .we_i(i_4),
    .stb_i(i_5),
    .cyc_i(i_6),
    .run_rx(i_7),
    .run_tx(i_8),
    .dat_o(out_ref[64:33]),
    .ack_o(out_ref[32:32]),
    .ctrl_lines(out_ref[31:0])
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
    seed = 3780357430;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
