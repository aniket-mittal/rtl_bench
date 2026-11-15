// Hidden tests: 5000 cycles of seeded random inputs (seed 566382286); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 112;
  reg clk;
  reg [0:0] i_0;
  reg [103:0] i_1;
  reg [3:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  jtag_io_mm_interconnect_0_cmd_mux dut (
    .clk(clk),
    .sink0_valid(i_0),
    .sink0_data(i_1),
    .sink0_channel(i_2),
    .sink0_startofpacket(i_3),
    .sink0_endofpacket(i_4),
    .src_ready(i_5),
    .reset(i_6),
    .sink0_ready(out_dut[111:111]),
    .src_valid(out_dut[110:110]),
    .src_data(out_dut[109:6]),
    .src_channel(out_dut[5:2]),
    .src_startofpacket(out_dut[1:1]),
    .src_endofpacket(out_dut[0:0])
  );
  jtag_io_mm_interconnect_0_cmd_mux__ref ref_i (
    .clk(clk),
    .sink0_valid(i_0),
    .sink0_data(i_1),
    .sink0_channel(i_2),
    .sink0_startofpacket(i_3),
    .sink0_endofpacket(i_4),
    .src_ready(i_5),
    .reset(i_6),
    .sink0_ready(out_ref[111:111]),
    .src_valid(out_ref[110:110]),
    .src_data(out_ref[109:6]),
    .src_channel(out_ref[5:2]),
    .src_startofpacket(out_ref[1:1]),
    .src_endofpacket(out_ref[0:0])
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
    seed = 566382286;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
