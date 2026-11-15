// Hidden tests: 5000 cycles of seeded random inputs (seed 617711488); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 264;
  reg clk;
  reg [63:0] i_0;
  reg [63:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [63:0] i_7;
  reg [63:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [1:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [63:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08044 dut (
    .clk_i(clk),
    .idat_i(i_0),
    .iadr_i(i_1),
    .iwe_i(i_2),
    .icyc_i(i_3),
    .istb_i(i_4),
    .isiz_i(i_5),
    .isigned_i(i_6),
    .ddat_i(i_7),
    .dadr_i(i_8),
    .dwe_i(i_9),
    .dcyc_i(i_10),
    .dstb_i(i_11),
    .dsiz_i(i_12),
    .dsigned_i(i_13),
    .xack_i(i_14),
    .xdat_i(i_15),
    .reset_i(i_16),
    .iack_o(out_dut[263:263]),
    .idat_o(out_dut[262:199]),
    .dack_o(out_dut[198:198]),
    .ddat_o(out_dut[197:134]),
    .xdat_o(out_dut[133:70]),
    .xadr_o(out_dut[69:6]),
    .xwe_o(out_dut[5:5]),
    .xcyc_o(out_dut[4:4]),
    .xstb_o(out_dut[3:3]),
    .xsiz_o(out_dut[2:1]),
    .xsigned_o(out_dut[0:0])
  );
  mg_08044__ref ref_i (
    .clk_i(clk),
    .idat_i(i_0),
    .iadr_i(i_1),
    .iwe_i(i_2),
    .icyc_i(i_3),
    .istb_i(i_4),
    .isiz_i(i_5),
    .isigned_i(i_6),
    .ddat_i(i_7),
    .dadr_i(i_8),
    .dwe_i(i_9),
    .dcyc_i(i_10),
    .dstb_i(i_11),
    .dsiz_i(i_12),
    .dsigned_i(i_13),
    .xack_i(i_14),
    .xdat_i(i_15),
    .reset_i(i_16),
    .iack_o(out_ref[263:263]),
    .idat_o(out_ref[262:199]),
    .dack_o(out_ref[198:198]),
    .ddat_o(out_ref[197:134]),
    .xdat_o(out_ref[133:70]),
    .xadr_o(out_ref[69:6]),
    .xwe_o(out_ref[5:5]),
    .xcyc_o(out_ref[4:4]),
    .xstb_o(out_ref[3:3]),
    .xsiz_o(out_ref[2:1]),
    .xsigned_o(out_ref[0:0])
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
    seed = 617711488;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed), $random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed), $random(seed)};
      i_16 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
