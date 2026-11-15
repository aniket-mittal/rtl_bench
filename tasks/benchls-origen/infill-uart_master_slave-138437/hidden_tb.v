// Hidden tests: 5000 cycles of seeded random inputs (seed 944283840); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 34;
  reg clk;
  reg [7:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [7:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_138437 dut (
    .clk_master(clk),
    .in1(i_0),
    .in2(i_1),
    .in3(i_2),
    .data_in_master(i_3),
    .rst_master(i_4),
    .cs_master(i_5),
    .data_in_slave(i_6),
    .clk_slave(i_7),
    .rst_slave(i_8),
    .cs_slave(i_9),
    .req_slave(i_10),
    .data_out_master(out_dut[33:26]),
    .ready_master(out_dut[25:25]),
    .out1(out_dut[24:17]),
    .out2(out_dut[16:9]),
    .out3(out_dut[8:1]),
    .ack_slave(out_dut[0:0])
  );
  origen_138437__ref ref_i (
    .clk_master(clk),
    .in1(i_0),
    .in2(i_1),
    .in3(i_2),
    .data_in_master(i_3),
    .rst_master(i_4),
    .cs_master(i_5),
    .data_in_slave(i_6),
    .clk_slave(i_7),
    .rst_slave(i_8),
    .cs_slave(i_9),
    .req_slave(i_10),
    .data_out_master(out_ref[33:26]),
    .ready_master(out_ref[25:25]),
    .out1(out_ref[24:17]),
    .out2(out_ref[16:9]),
    .out3(out_ref[8:1]),
    .ack_slave(out_ref[0:0])
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
    seed = 944283840;
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
      i_7 = {$random(seed)};
      i_8 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
