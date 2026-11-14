// Hidden tests: 5000 cycles of seeded random inputs (seed 1035071076); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 18;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  reg [7:0] i_9;
  reg [7:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_145910 dut (
    .clk(clk),
    .reset(i_0),
    .start_ch0(i_1),
    .stop_ch0(i_2),
    .src_addr_ch0(i_3),
    .dest_addr_ch0(i_4),
    .data_in_ch0(i_5),
    .start_ch1(i_6),
    .stop_ch1(i_7),
    .src_addr_ch1(i_8),
    .dest_addr_ch1(i_9),
    .data_in_ch1(i_10),
    .data_out_ch0(out_dut[17:10]),
    .busy_ch0(out_dut[9:9]),
    .data_out_ch1(out_dut[8:1]),
    .busy_ch1(out_dut[0:0])
  );
  autovcoder_145910__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .start_ch0(i_1),
    .stop_ch0(i_2),
    .src_addr_ch0(i_3),
    .dest_addr_ch0(i_4),
    .data_in_ch0(i_5),
    .start_ch1(i_6),
    .stop_ch1(i_7),
    .src_addr_ch1(i_8),
    .dest_addr_ch1(i_9),
    .data_in_ch1(i_10),
    .data_out_ch0(out_ref[17:10]),
    .busy_ch0(out_ref[9:9]),
    .data_out_ch1(out_ref[8:1]),
    .busy_ch1(out_ref[0:0])
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
    seed = 1035071076;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
