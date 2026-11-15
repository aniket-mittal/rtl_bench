// Hidden tests: 5000 cycles of seeded random inputs (seed 2366651250); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 254;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [9:0] i_2;
  reg [0:0] i_3;
  reg [191:0] i_4;
  reg [9:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [15:0] i_9;
  reg [7:0] i_10;
  reg [19:0] i_11;
  reg [3:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08055 dut (
    .clk(clk),
    .reset(i_0),
    .io_in_valid(i_1),
    .io_in_bits_addr(i_2),
    .io_in_bits_rw(i_3),
    .io_in_bits_wData(i_4),
    .io_in_tag(i_5),
    .io_out_ready(i_6),
    .io_pcIn_valid(i_7),
    .io_pcIn_bits_request(i_8),
    .io_pcIn_bits_moduleId(i_9),
    .io_pcIn_bits_portId(i_10),
    .io_pcIn_bits_pcValue(i_11),
    .io_pcIn_bits_pcType(i_12),
    .io_in_ready(out_dut[253:253]),
    .io_out_valid(out_dut[252:252]),
    .io_out_bits_rData(out_dut[251:60]),
    .io_out_tag(out_dut[59:50]),
    .io_pcOut_valid(out_dut[49:49]),
    .io_pcOut_bits_request(out_dut[48:48]),
    .io_pcOut_bits_moduleId(out_dut[47:32]),
    .io_pcOut_bits_portId(out_dut[31:24]),
    .io_pcOut_bits_pcValue(out_dut[23:4]),
    .io_pcOut_bits_pcType(out_dut[3:0])
  );
  mg_08055__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .io_in_valid(i_1),
    .io_in_bits_addr(i_2),
    .io_in_bits_rw(i_3),
    .io_in_bits_wData(i_4),
    .io_in_tag(i_5),
    .io_out_ready(i_6),
    .io_pcIn_valid(i_7),
    .io_pcIn_bits_request(i_8),
    .io_pcIn_bits_moduleId(i_9),
    .io_pcIn_bits_portId(i_10),
    .io_pcIn_bits_pcValue(i_11),
    .io_pcIn_bits_pcType(i_12),
    .io_in_ready(out_ref[253:253]),
    .io_out_valid(out_ref[252:252]),
    .io_out_bits_rData(out_ref[251:60]),
    .io_out_tag(out_ref[59:50]),
    .io_pcOut_valid(out_ref[49:49]),
    .io_pcOut_bits_request(out_ref[48:48]),
    .io_pcOut_bits_moduleId(out_ref[47:32]),
    .io_pcOut_bits_portId(out_ref[31:24]),
    .io_pcOut_bits_pcValue(out_ref[23:4]),
    .io_pcOut_bits_pcType(out_ref[3:0])
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
    seed = 2366651250;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
