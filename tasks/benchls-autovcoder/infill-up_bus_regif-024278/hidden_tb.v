// Hidden tests: 5000 cycles of seeded random inputs (seed 3568833735); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 103;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_024278 dut (
    .up_clk(clk),
    .up_cs(i_0),
    .up_wr(i_1),
    .up_rd(i_2),
    .up_addr(i_3),
    .up_data_wr(i_4),
    .ctrl_up_data_rd_stat(i_5),
    .ctrl_up_data_rd_data(i_6),
    .ctrl_up_data_rd_ctrl(i_7),
    .up_data_rd(out_dut[102:71]),
    .up_busy(out_dut[70:70]),
    .ctrl_up_clk(out_dut[69:69]),
    .ctrl_up_cs_stat(out_dut[68:68]),
    .ctrl_up_cs_data(out_dut[67:67]),
    .ctrl_up_cs_ctrl(out_dut[66:66]),
    .ctrl_up_wr(out_dut[65:65]),
    .ctrl_up_rd(out_dut[64:64]),
    .ctrl_up_addr(out_dut[63:32]),
    .ctrl_up_data_wr(out_dut[31:0])
  );
  autovcoder_024278__ref ref_i (
    .up_clk(clk),
    .up_cs(i_0),
    .up_wr(i_1),
    .up_rd(i_2),
    .up_addr(i_3),
    .up_data_wr(i_4),
    .ctrl_up_data_rd_stat(i_5),
    .ctrl_up_data_rd_data(i_6),
    .ctrl_up_data_rd_ctrl(i_7),
    .up_data_rd(out_ref[102:71]),
    .up_busy(out_ref[70:70]),
    .ctrl_up_clk(out_ref[69:69]),
    .ctrl_up_cs_stat(out_ref[68:68]),
    .ctrl_up_cs_data(out_ref[67:67]),
    .ctrl_up_cs_ctrl(out_ref[66:66]),
    .ctrl_up_wr(out_ref[65:65]),
    .ctrl_up_rd(out_ref[64:64]),
    .ctrl_up_addr(out_ref[63:32]),
    .ctrl_up_data_wr(out_ref[31:0])
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
    seed = 3568833735;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
