// Hidden tests: 5000 cycles of seeded random inputs (seed 2142398943); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 104;
  reg clk;
  reg [1:0] i_0;
  reg [2:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [4:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_134729 dut (
    .clk(clk),
    .ctlwb_out(i_0),
    .ctlm_out(i_1),
    .adder_out(i_2),
    .aluzero(i_3),
    .aluout(i_4),
    .readdat2(i_5),
    .muxout(i_6),
    .wb_ctlout(out_dut[103:103]),
    .m_ctlout(out_dut[102:102]),
    .add_result(out_dut[101:70]),
    .zero(out_dut[69:69]),
    .alu_result(out_dut[68:37]),
    .rdata2out(out_dut[36:5]),
    .five_bit_muxout(out_dut[4:0])
  );
  origen_134729__ref ref_i (
    .clk(clk),
    .ctlwb_out(i_0),
    .ctlm_out(i_1),
    .adder_out(i_2),
    .aluzero(i_3),
    .aluout(i_4),
    .readdat2(i_5),
    .muxout(i_6),
    .wb_ctlout(out_ref[103:103]),
    .m_ctlout(out_ref[102:102]),
    .add_result(out_ref[101:70]),
    .zero(out_ref[69:69]),
    .alu_result(out_ref[68:37]),
    .rdata2out(out_ref[36:5]),
    .five_bit_muxout(out_ref[4:0])
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
    seed = 2142398943;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
