// Hidden tests: 5000 cycles of seeded random inputs (seed 226804070); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 84;
  reg clk;
  reg [21:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05320 dut (
    .clk(clk),
    .addr(i_0),
    .datain(i_1),
    .req(i_2),
    .write(i_3),
    .vram_data_in(i_4),
    .vram_done(i_5),
    .vram_ready(i_6),
    .reset(i_7),
    .dataout(out_dut[83:52]),
    .ack(out_dut[51:51]),
    .decode(out_dut[50:50]),
    .interrupt(out_dut[49:49]),
    .vram_addr(out_dut[48:34]),
    .vram_data_out(out_dut[33:2]),
    .vram_req(out_dut[1:1]),
    .vram_write(out_dut[0:0])
  );
  rtlpp_05320__ref ref_i (
    .clk(clk),
    .addr(i_0),
    .datain(i_1),
    .req(i_2),
    .write(i_3),
    .vram_data_in(i_4),
    .vram_done(i_5),
    .vram_ready(i_6),
    .reset(i_7),
    .dataout(out_ref[83:52]),
    .ack(out_ref[51:51]),
    .decode(out_ref[50:50]),
    .interrupt(out_ref[49:49]),
    .vram_addr(out_ref[48:34]),
    .vram_data_out(out_ref[33:2]),
    .vram_req(out_ref[1:1]),
    .vram_write(out_ref[0:0])
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
    seed = 226804070;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
