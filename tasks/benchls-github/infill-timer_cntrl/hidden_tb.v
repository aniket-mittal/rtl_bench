// Hidden tests: 5000 cycles of seeded random inputs (seed 547533660); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 13;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  timer_cntrl dut (
    .clk_i(clk),
    .rstn_i(i_0),
    .cfg_start_i(i_1),
    .cfg_stop_i(i_2),
    .cfg_rst_i(i_3),
    .cfg_update_i(i_4),
    .cfg_arm_i(i_5),
    .cnt_update_i(i_6),
    .ctrl_cnt_upd_o(out_dut[12:12]),
    .ctrl_all_upd_o(out_dut[11:11]),
    .ctrl_active_o(out_dut[10:10]),
    .ctrl_rst_o(out_dut[9:9]),
    .ctrl_arm_o(out_dut[8:8]),
    .status_o(out_dut[7:0])
  );
  timer_cntrl__ref ref_i (
    .clk_i(clk),
    .rstn_i(i_0),
    .cfg_start_i(i_1),
    .cfg_stop_i(i_2),
    .cfg_rst_i(i_3),
    .cfg_update_i(i_4),
    .cfg_arm_i(i_5),
    .cnt_update_i(i_6),
    .ctrl_cnt_upd_o(out_ref[12:12]),
    .ctrl_all_upd_o(out_ref[11:11]),
    .ctrl_active_o(out_ref[10:10]),
    .ctrl_rst_o(out_ref[9:9]),
    .ctrl_arm_o(out_ref[8:8]),
    .status_o(out_ref[7:0])
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
    seed = 547533660;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
