// Hidden tests: 5000 cycles of seeded random inputs (seed 4160095410); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 218;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [15:0] i_5;
  reg [63:0] i_6;
  reg [63:0] i_7;
  reg [63:0] i_8;
  reg [4:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02698 dut (
    .clk(clk),
    .reset(i_0),
    .io_out_ready(i_1),
    .io_in_0_valid(i_2),
    .io_in_0_bits_centeroidsFinished(i_3),
    .io_in_0_bits_pointsFinished(i_4),
    .io_in_0_bits_centeroidIndex(i_5),
    .io_in_0_bits_point_x(i_6),
    .io_in_0_bits_point_y(i_7),
    .io_in_0_bits_point_z(i_8),
    .io_in_0_tag(i_9),
    .io_out_valid(out_dut[217:217]),
    .io_out_bits_centeroidsFinished(out_dut[216:216]),
    .io_out_bits_pointsFinished(out_dut[215:215]),
    .io_out_bits_centeroidIndex(out_dut[214:199]),
    .io_out_bits_point_x(out_dut[198:135]),
    .io_out_bits_point_y(out_dut[134:71]),
    .io_out_bits_point_z(out_dut[70:7]),
    .io_out_tag(out_dut[6:2]),
    .io_in_0_ready(out_dut[1:1]),
    .io_chosen(out_dut[0:0])
  );
  mg_02698__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .io_out_ready(i_1),
    .io_in_0_valid(i_2),
    .io_in_0_bits_centeroidsFinished(i_3),
    .io_in_0_bits_pointsFinished(i_4),
    .io_in_0_bits_centeroidIndex(i_5),
    .io_in_0_bits_point_x(i_6),
    .io_in_0_bits_point_y(i_7),
    .io_in_0_bits_point_z(i_8),
    .io_in_0_tag(i_9),
    .io_out_valid(out_ref[217:217]),
    .io_out_bits_centeroidsFinished(out_ref[216:216]),
    .io_out_bits_pointsFinished(out_ref[215:215]),
    .io_out_bits_centeroidIndex(out_ref[214:199]),
    .io_out_bits_point_x(out_ref[198:135]),
    .io_out_bits_point_y(out_ref[134:71]),
    .io_out_bits_point_z(out_ref[70:7]),
    .io_out_tag(out_ref[6:2]),
    .io_in_0_ready(out_ref[1:1]),
    .io_chosen(out_ref[0:0])
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
    seed = 4160095410;
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
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed), $random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
