// Hidden tests: 5000 cycles of seeded random inputs (seed 3513120715); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  SDP_X_X_mul_core_cfg_mul_op_rsc_triosy_obj_cfg_mul_op_rsc_triosy_wait_ctrl dut (
    .cfg_mul_op_rsc_triosy_obj_oswt(i_0),
    .core_wen(i_1),
    .core_wten(i_2),
    .cfg_mul_op_rsc_triosy_obj_iswt0(i_3),
    .cfg_mul_op_rsc_triosy_obj_biwt(out_dut[1:1]),
    .cfg_mul_op_rsc_triosy_obj_bdwt(out_dut[0:0])
  );
  SDP_X_X_mul_core_cfg_mul_op_rsc_triosy_obj_cfg_mul_op_rsc_triosy_wait_ctrl__ref ref_i (
    .cfg_mul_op_rsc_triosy_obj_oswt(i_0),
    .core_wen(i_1),
    .core_wten(i_2),
    .cfg_mul_op_rsc_triosy_obj_iswt0(i_3),
    .cfg_mul_op_rsc_triosy_obj_biwt(out_ref[1:1]),
    .cfg_mul_op_rsc_triosy_obj_bdwt(out_ref[0:0])
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
    seed = 3513120715;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
