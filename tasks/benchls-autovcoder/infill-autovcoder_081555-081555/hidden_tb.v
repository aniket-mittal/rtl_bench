// Hidden tests: 5000 cycles of seeded random inputs (seed 1187438470); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 37;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_081555 dut (
    .clk(clk),
    .rst(i_0),
    .clk_div(i_1),
    .wr(i_2),
    .wr_len(i_3),
    .wrdata(i_4),
    .sdi(i_5),
    .wr_done(out_dut[36:36]),
    .rddata(out_dut[35:4]),
    .sck(out_dut[3:3]),
    .sdo(out_dut[2:2]),
    .ss(out_dut[1:1]),
    .ready(out_dut[0:0])
  );
  autovcoder_081555__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .clk_div(i_1),
    .wr(i_2),
    .wr_len(i_3),
    .wrdata(i_4),
    .sdi(i_5),
    .wr_done(out_ref[36:36]),
    .rddata(out_ref[35:4]),
    .sck(out_ref[3:3]),
    .sdo(out_ref[2:2]),
    .ss(out_ref[1:1]),
    .ready(out_ref[0:0])
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
    seed = 1187438470;
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
