// Hidden tests: 5000 cycles of seeded random inputs (seed 1748549139); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 170;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [63:0] i_6;
  reg [63:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_069231 dut (
    .clk(clk),
    .rst(i_0),
    .priv(i_1),
    .int_req(i_2),
    .nop_if(i_3),
    .if_hold(i_4),
    .pip_flush(i_5),
    .new_pc(i_6),
    .ins_in(i_7),
    .ins_acc_fault_biu(i_8),
    .ins_page_fault_biu(i_9),
    .cache_ready(i_10),
    .addr(out_dut[169:106]),
    .rd(out_dut[105:105]),
    .if_priv(out_dut[104:101]),
    .ins_out(out_dut[100:69]),
    .ins_pc(out_dut[68:5]),
    .ins_acc_fault(out_dut[4:4]),
    .ins_addr_mis(out_dut[3:3]),
    .ins_page_fault(out_dut[2:2]),
    .int_acc(out_dut[1:1]),
    .valid(out_dut[0:0])
  );
  autovcoder_069231__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .priv(i_1),
    .int_req(i_2),
    .nop_if(i_3),
    .if_hold(i_4),
    .pip_flush(i_5),
    .new_pc(i_6),
    .ins_in(i_7),
    .ins_acc_fault_biu(i_8),
    .ins_page_fault_biu(i_9),
    .cache_ready(i_10),
    .addr(out_ref[169:106]),
    .rd(out_ref[105:105]),
    .if_priv(out_ref[104:101]),
    .ins_out(out_ref[100:69]),
    .ins_pc(out_ref[68:5]),
    .ins_acc_fault(out_ref[4:4]),
    .ins_addr_mis(out_ref[3:3]),
    .ins_page_fault(out_ref[2:2]),
    .int_acc(out_ref[1:1]),
    .valid(out_ref[0:0])
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
    seed = 1748549139;
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
