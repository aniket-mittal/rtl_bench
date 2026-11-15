// Hidden tests: 5000 cycles of seeded random inputs (seed 1262344725); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 68;
  reg clk;
  reg [63:0] i_0;
  reg [63:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [57:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_053154 dut (
    .clk(clk),
    .data_in_rx_uns(i_0),
    .data_in(i_1),
    .enable(i_2),
    .sync_info(i_3),
    .rst(i_4),
    .blocksync_out(i_5),
    .valid_frame(i_6),
    .ber_poly(i_7),
    .data_out(out_dut[67:2]),
    .ber_sync(out_dut[1:1]),
    .sync_init(out_dut[0:0])
  );
  origen_053154__ref ref_i (
    .clk(clk),
    .data_in_rx_uns(i_0),
    .data_in(i_1),
    .enable(i_2),
    .sync_info(i_3),
    .rst(i_4),
    .blocksync_out(i_5),
    .valid_frame(i_6),
    .ber_poly(i_7),
    .data_out(out_ref[67:2]),
    .ber_sync(out_ref[1:1]),
    .sync_init(out_ref[0:0])
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
    seed = 1262344725;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
