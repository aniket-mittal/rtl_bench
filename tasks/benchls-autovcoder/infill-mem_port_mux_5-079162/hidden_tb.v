// Hidden tests: 5000 cycles of seeded random inputs (seed 383997024); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 111;
  reg clk;
  reg [13:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [13:0] i_3;
  reg [0:0] i_4;
  reg [15:0] i_5;
  reg [13:0] i_6;
  reg [0:0] i_7;
  reg [15:0] i_8;
  reg [13:0] i_9;
  reg [0:0] i_10;
  reg [15:0] i_11;
  reg [13:0] i_12;
  reg [0:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [2:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_079162 dut (
    .addr_i_0(i_0),
    .we_i_0(i_1),
    .data_i_0(i_2),
    .addr_i_1(i_3),
    .we_i_1(i_4),
    .data_i_1(i_5),
    .addr_i_2(i_6),
    .we_i_2(i_7),
    .data_i_2(i_8),
    .addr_i_3(i_9),
    .we_i_3(i_10),
    .data_i_3(i_11),
    .addr_i_4(i_12),
    .we_i_4(i_13),
    .data_i_4(i_14),
    .data_o_mem(i_15),
    .sel(i_16),
    .data_o_0(out_dut[110:95]),
    .data_o_1(out_dut[94:79]),
    .data_o_2(out_dut[78:63]),
    .data_o_3(out_dut[62:47]),
    .data_o_4(out_dut[46:31]),
    .addr_mem(out_dut[30:17]),
    .we_mem(out_dut[16:16]),
    .data_i_mem(out_dut[15:0])
  );
  autovcoder_079162__ref ref_i (
    .addr_i_0(i_0),
    .we_i_0(i_1),
    .data_i_0(i_2),
    .addr_i_1(i_3),
    .we_i_1(i_4),
    .data_i_1(i_5),
    .addr_i_2(i_6),
    .we_i_2(i_7),
    .data_i_2(i_8),
    .addr_i_3(i_9),
    .we_i_3(i_10),
    .data_i_3(i_11),
    .addr_i_4(i_12),
    .we_i_4(i_13),
    .data_i_4(i_14),
    .data_o_mem(i_15),
    .sel(i_16),
    .data_o_0(out_ref[110:95]),
    .data_o_1(out_ref[94:79]),
    .data_o_2(out_ref[78:63]),
    .data_o_3(out_ref[62:47]),
    .data_o_4(out_ref[46:31]),
    .addr_mem(out_ref[30:17]),
    .we_mem(out_ref[16:16]),
    .data_i_mem(out_ref[15:0])
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
    seed = 383997024;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
