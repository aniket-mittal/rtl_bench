// Hidden tests: 5000 cycles of seeded random inputs (seed 2079994262); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 119;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [1:0] i_2;
  reg [1:0] i_3;
  reg [3:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_209255 dut (
    .clk_i(clk),
    .rst_i(i_0),
    .halt_i(i_1),
    .WB_i(i_2),
    .M_i(i_3),
    .EX_i(i_4),
    .data1_i(i_5),
    .data2_i(i_6),
    .signextend_i(i_7),
    .rs_i(i_8),
    .rt_i(i_9),
    .rd_i(i_10),
    .WB_o(out_dut[118:117]),
    .M_o(out_dut[116:115]),
    .EX_o(out_dut[114:111]),
    .data1_o(out_dut[110:79]),
    .data2_o(out_dut[78:47]),
    .signextend_o(out_dut[46:15]),
    .rs_o(out_dut[14:10]),
    .rt_o(out_dut[9:5]),
    .rd_o(out_dut[4:0])
  );
  origen_209255__ref ref_i (
    .clk_i(clk),
    .rst_i(i_0),
    .halt_i(i_1),
    .WB_i(i_2),
    .M_i(i_3),
    .EX_i(i_4),
    .data1_i(i_5),
    .data2_i(i_6),
    .signextend_i(i_7),
    .rs_i(i_8),
    .rt_i(i_9),
    .rd_i(i_10),
    .WB_o(out_ref[118:117]),
    .M_o(out_ref[116:115]),
    .EX_o(out_ref[114:111]),
    .data1_o(out_ref[110:79]),
    .data2_o(out_ref[78:47]),
    .signextend_o(out_ref[46:15]),
    .rs_o(out_ref[14:10]),
    .rt_o(out_ref[9:5]),
    .rd_o(out_ref[4:0])
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
    seed = 2079994262;
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
