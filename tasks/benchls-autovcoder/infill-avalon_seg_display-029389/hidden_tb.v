// Hidden tests: 5000 cycles of seeded random inputs (seed 809229904); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [31:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_029389 dut (
    .csi_clk(clk),
    .rsi_reset_n(i_0),
    .avs_s0_write(i_1),
    .avs_s0_read(i_2),
    .avs_s0_address(i_3),
    .avs_s0_writedata(i_4),
    .avs_s0_readdata(out_dut[72:41]),
    .number1(out_dut[40:35]),
    .number2(out_dut[34:29]),
    .number3(out_dut[28:23]),
    .number4(out_dut[22:17]),
    .dot1(out_dut[16:16]),
    .dot2(out_dut[15:15]),
    .dot3(out_dut[14:14]),
    .dot4(out_dut[13:13]),
    .light1(out_dut[12:10]),
    .light2(out_dut[9:7]),
    .light3(out_dut[6:4]),
    .light4(out_dut[3:1]),
    .ena(out_dut[0:0])
  );
  autovcoder_029389__ref ref_i (
    .csi_clk(clk),
    .rsi_reset_n(i_0),
    .avs_s0_write(i_1),
    .avs_s0_read(i_2),
    .avs_s0_address(i_3),
    .avs_s0_writedata(i_4),
    .avs_s0_readdata(out_ref[72:41]),
    .number1(out_ref[40:35]),
    .number2(out_ref[34:29]),
    .number3(out_ref[28:23]),
    .number4(out_ref[22:17]),
    .dot1(out_ref[16:16]),
    .dot2(out_ref[15:15]),
    .dot3(out_ref[14:14]),
    .dot4(out_ref[13:13]),
    .light1(out_ref[12:10]),
    .light2(out_ref[9:7]),
    .light3(out_ref[6:4]),
    .light4(out_ref[3:1]),
    .ena(out_ref[0:0])
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
    seed = 809229904;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
