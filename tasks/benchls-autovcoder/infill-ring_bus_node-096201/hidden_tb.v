// Hidden tests: 5000 cycles of seeded random inputs (seed 2164015748); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 134;
  reg clk;
  reg [0:0] i_0;
  reg [68:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [3:0] i_5;
  reg [23:0] i_6;
  reg [31:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_096201 dut (
    .clk(clk),
    .rst(i_0),
    .rcn_in(i_1),
    .cs(i_2),
    .seq(i_3),
    .wr(i_4),
    .mask(i_5),
    .addr(i_6),
    .wdata(i_7),
    .rcn_out(out_dut[133:65]),
    .busy(out_dut[64:64]),
    .rdone(out_dut[63:63]),
    .wdone(out_dut[62:62]),
    .rsp_seq(out_dut[61:60]),
    .rsp_mask(out_dut[59:56]),
    .rsp_addr(out_dut[55:32]),
    .rsp_data(out_dut[31:0])
  );
  autovcoder_096201__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .rcn_in(i_1),
    .cs(i_2),
    .seq(i_3),
    .wr(i_4),
    .mask(i_5),
    .addr(i_6),
    .wdata(i_7),
    .rcn_out(out_ref[133:65]),
    .busy(out_ref[64:64]),
    .rdone(out_ref[63:63]),
    .wdone(out_ref[62:62]),
    .rsp_seq(out_ref[61:60]),
    .rsp_mask(out_ref[59:56]),
    .rsp_addr(out_ref[55:32]),
    .rsp_data(out_ref[31:0])
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
    seed = 2164015748;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
