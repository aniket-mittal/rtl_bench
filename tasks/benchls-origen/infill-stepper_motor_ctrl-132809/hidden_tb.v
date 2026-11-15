// Hidden tests: 5000 cycles of seeded random inputs (seed 2169754562); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 39;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [3:0] i_2;
  reg [2:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_132809 dut (
    .csi_MCLK_clk(clk),
    .rsi_MRST_reset(i_0),
    .avs_ctrl_writedata(i_1),
    .avs_ctrl_byteenable(i_2),
    .avs_ctrl_address(i_3),
    .avs_ctrl_write(i_4),
    .avs_ctrl_read(i_5),
    .avs_ctrl_readdata(out_dut[38:7]),
    .avs_ctrl_waitrequest(out_dut[6:6]),
    .AX(out_dut[5:5]),
    .AY(out_dut[4:4]),
    .BX(out_dut[3:3]),
    .BY(out_dut[2:2]),
    .AE(out_dut[1:1]),
    .BE(out_dut[0:0])
  );
  origen_132809__ref ref_i (
    .csi_MCLK_clk(clk),
    .rsi_MRST_reset(i_0),
    .avs_ctrl_writedata(i_1),
    .avs_ctrl_byteenable(i_2),
    .avs_ctrl_address(i_3),
    .avs_ctrl_write(i_4),
    .avs_ctrl_read(i_5),
    .avs_ctrl_readdata(out_ref[38:7]),
    .avs_ctrl_waitrequest(out_ref[6:6]),
    .AX(out_ref[5:5]),
    .AY(out_ref[4:4]),
    .BX(out_ref[3:3]),
    .BY(out_ref[2:2]),
    .AE(out_ref[1:1]),
    .BE(out_ref[0:0])
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
    seed = 2169754562;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
