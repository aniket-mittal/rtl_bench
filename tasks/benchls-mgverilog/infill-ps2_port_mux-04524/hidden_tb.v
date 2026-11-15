// Hidden tests: 5000 cycles of seeded random inputs (seed 1252632785); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 12;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04524 dut (
    .ps2_clk_tx_1(i_0),
    .ps2_clk_tx_2(i_1),
    .ps2_d_tx_1(i_2),
    .ps2_d_tx_2(i_3),
    .ps2_mouse_clk_I(i_4),
    .ps2_mouse_data_I(i_5),
    .ps2_keyb_clk_I(i_6),
    .ps2_keyb_data_I(i_7),
    .ps2_clk_rx_1(out_dut[11:11]),
    .ps2_clk_rx_2(out_dut[10:10]),
    .ps2_d_rx_1(out_dut[9:9]),
    .ps2_d_rx_2(out_dut[8:8]),
    .ps2_mouse_clk_O(out_dut[7:7]),
    .ps2_mouse_clk_T(out_dut[6:6]),
    .ps2_mouse_data_O(out_dut[5:5]),
    .ps2_mouse_data_T(out_dut[4:4]),
    .ps2_keyb_clk_O(out_dut[3:3]),
    .ps2_keyb_clk_T(out_dut[2:2]),
    .ps2_keyb_data_O(out_dut[1:1]),
    .ps2_keyb_data_T(out_dut[0:0])
  );
  mg_04524__ref ref_i (
    .ps2_clk_tx_1(i_0),
    .ps2_clk_tx_2(i_1),
    .ps2_d_tx_1(i_2),
    .ps2_d_tx_2(i_3),
    .ps2_mouse_clk_I(i_4),
    .ps2_mouse_data_I(i_5),
    .ps2_keyb_clk_I(i_6),
    .ps2_keyb_data_I(i_7),
    .ps2_clk_rx_1(out_ref[11:11]),
    .ps2_clk_rx_2(out_ref[10:10]),
    .ps2_d_rx_1(out_ref[9:9]),
    .ps2_d_rx_2(out_ref[8:8]),
    .ps2_mouse_clk_O(out_ref[7:7]),
    .ps2_mouse_clk_T(out_ref[6:6]),
    .ps2_mouse_data_O(out_ref[5:5]),
    .ps2_mouse_data_T(out_ref[4:4]),
    .ps2_keyb_clk_O(out_ref[3:3]),
    .ps2_keyb_clk_T(out_ref[2:2]),
    .ps2_keyb_data_O(out_ref[1:1]),
    .ps2_keyb_data_T(out_ref[0:0])
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
    seed = 1252632785;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
