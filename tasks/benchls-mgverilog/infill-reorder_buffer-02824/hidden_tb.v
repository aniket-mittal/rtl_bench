// Hidden tests: 5000 cycles of seeded random inputs (seed 2364095320); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 75;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [5:0] i_4;
  reg [5:0] i_5;
  reg [4:0] i_6;
  reg [0:0] i_7;
  reg [3:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02824 dut (
    .clk(clk),
    .rst(i_0),
    .isDispatch(i_1),
    .isSW(i_2),
    .RegDest(i_3),
    .PR_old_DP(i_4),
    .PR_new_DP(i_5),
    .rd_DP(i_6),
    .complete(i_7),
    .rob_number(i_8),
    .jb_addr(i_9),
    .changeFlow(i_10),
    .hazard_stall(i_11),
    .rob_num_dp(out_dut[74:71]),
    .PR_old_RT(out_dut[70:65]),
    .RegDest_retire(out_dut[64:64]),
    .retire_reg(out_dut[63:63]),
    .retire_ST(out_dut[62:62]),
    .retire_rob(out_dut[61:58]),
    .full(out_dut[57:57]),
    .empty(out_dut[56:56]),
    .RegDest_out(out_dut[55:55]),
    .PR_old_flush(out_dut[54:49]),
    .PR_new_flush(out_dut[48:43]),
    .rd_flush(out_dut[42:38]),
    .out_rob_num(out_dut[37:34]),
    .changeFlow_out(out_dut[33:33]),
    .changeFlow_addr(out_dut[32:1]),
    .recover(out_dut[0:0])
  );
  mg_02824__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .isDispatch(i_1),
    .isSW(i_2),
    .RegDest(i_3),
    .PR_old_DP(i_4),
    .PR_new_DP(i_5),
    .rd_DP(i_6),
    .complete(i_7),
    .rob_number(i_8),
    .jb_addr(i_9),
    .changeFlow(i_10),
    .hazard_stall(i_11),
    .rob_num_dp(out_ref[74:71]),
    .PR_old_RT(out_ref[70:65]),
    .RegDest_retire(out_ref[64:64]),
    .retire_reg(out_ref[63:63]),
    .retire_ST(out_ref[62:62]),
    .retire_rob(out_ref[61:58]),
    .full(out_ref[57:57]),
    .empty(out_ref[56:56]),
    .RegDest_out(out_ref[55:55]),
    .PR_old_flush(out_ref[54:49]),
    .PR_new_flush(out_ref[48:43]),
    .rd_flush(out_ref[42:38]),
    .out_rob_num(out_ref[37:34]),
    .changeFlow_out(out_ref[33:33]),
    .changeFlow_addr(out_ref[32:1]),
    .recover(out_ref[0:0])
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
    seed = 2364095320;
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
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
