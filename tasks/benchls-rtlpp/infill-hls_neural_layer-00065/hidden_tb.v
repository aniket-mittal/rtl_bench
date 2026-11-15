// Hidden tests: 5000 cycles of seeded random inputs (seed 3885474646); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 19;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [287:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00065 dut (
    .ap_clk(clk),
    .ap_rst_n(i_0),
    .in0_V_TVALID(i_1),
    .in0_V_TDATA(i_2),
    .weights_V_TVALID(i_3),
    .weights_V_TDATA(i_4),
    .out_V_TREADY(i_5),
    .in0_V_TREADY(out_dut[18:18]),
    .weights_V_TREADY(out_dut[17:17]),
    .out_V_TVALID(out_dut[16:16]),
    .out_V_TDATA(out_dut[15:0])
  );
  rtlpp_00065__ref ref_i (
    .ap_clk(clk),
    .ap_rst_n(i_0),
    .in0_V_TVALID(i_1),
    .in0_V_TDATA(i_2),
    .weights_V_TVALID(i_3),
    .weights_V_TDATA(i_4),
    .out_V_TREADY(i_5),
    .in0_V_TREADY(out_ref[18:18]),
    .weights_V_TREADY(out_ref[17:17]),
    .out_V_TVALID(out_ref[16:16]),
    .out_V_TDATA(out_ref[15:0])
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
    seed = 3885474646;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
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
