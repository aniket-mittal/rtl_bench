// Hidden tests: 5000 cycles of seeded random inputs (seed 3116657689); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 75;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [3:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [3:0] i_9;
  reg [3:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_141007 dut (
    .sw_clk(clk),
    .rstn(i_0),
    .qos1(i_1),
    .qos2(i_2),
    .prt_dv1(i_3),
    .prt_dv2(i_4),
    .prt_data1(i_5),
    .prt_data2(i_6),
    .prt_addr1(i_7),
    .prt_addr2(i_8),
    .prt_bytes1(i_9),
    .prt_bytes2(i_10),
    .prt_ack1(out_dut[74:74]),
    .prt_ack2(out_dut[73:73]),
    .prt_req(out_dut[72:72]),
    .prt_data(out_dut[71:40]),
    .prt_addr(out_dut[39:8]),
    .prt_bytes(out_dut[7:4]),
    .prt_qos(out_dut[3:0])
  );
  origen_141007__ref ref_i (
    .sw_clk(clk),
    .rstn(i_0),
    .qos1(i_1),
    .qos2(i_2),
    .prt_dv1(i_3),
    .prt_dv2(i_4),
    .prt_data1(i_5),
    .prt_data2(i_6),
    .prt_addr1(i_7),
    .prt_addr2(i_8),
    .prt_bytes1(i_9),
    .prt_bytes2(i_10),
    .prt_ack1(out_ref[74:74]),
    .prt_ack2(out_ref[73:73]),
    .prt_req(out_ref[72:72]),
    .prt_data(out_ref[71:40]),
    .prt_addr(out_ref[39:8]),
    .prt_bytes(out_ref[7:4]),
    .prt_qos(out_ref[3:0])
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
    seed = 3116657689;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
