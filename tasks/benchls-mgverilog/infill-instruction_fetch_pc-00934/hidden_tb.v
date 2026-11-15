// Hidden tests: 5000 cycles of seeded random inputs (seed 200882582); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 93;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [29:0] i_3;
  reg [31:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00934 dut (
    .clk_i(clk),
    .rst_i(i_0),
    .stall_i(i_1),
    .take_branch_i(i_2),
    .branch_pc_i(i_3),
    .rmemdata_i(i_4),
    .ir_o(out_dut[92:61]),
    .nextpc_o(out_dut[60:31]),
    .re_o(out_dut[30:30]),
    .rmemaddr_o(out_dut[29:0])
  );
  mg_00934__ref ref_i (
    .clk_i(clk),
    .rst_i(i_0),
    .stall_i(i_1),
    .take_branch_i(i_2),
    .branch_pc_i(i_3),
    .rmemdata_i(i_4),
    .ir_o(out_ref[92:61]),
    .nextpc_o(out_ref[60:31]),
    .re_o(out_ref[30:30]),
    .rmemaddr_o(out_ref[29:0])
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
    seed = 200882582;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
