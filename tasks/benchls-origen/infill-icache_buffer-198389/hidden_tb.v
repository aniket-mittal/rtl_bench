// Hidden tests: 5000 cycles of seeded random inputs (seed 393921468); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 128;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [12:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [1:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_198389 dut (
    .clk_i(clk),
    .tval2_i(i_0),
    .tval1_i(i_1),
    .data_bi(i_2),
    .icconf_i(i_3),
    .addr_bi(i_4),
    .ins_i(i_5),
    .we_bi(i_6),
    .en_i(i_7),
    .rst_i(i_8),
    .ictmr_i(i_9),
    .data_bo(out_dut[127:96]),
    .icov_o(out_dut[95:64]),
    .icbne_o(out_dut[63:32]),
    .icconf_o(out_dut[31:0])
  );
  origen_198389__ref ref_i (
    .clk_i(clk),
    .tval2_i(i_0),
    .tval1_i(i_1),
    .data_bi(i_2),
    .icconf_i(i_3),
    .addr_bi(i_4),
    .ins_i(i_5),
    .we_bi(i_6),
    .en_i(i_7),
    .rst_i(i_8),
    .ictmr_i(i_9),
    .data_bo(out_ref[127:96]),
    .icov_o(out_ref[95:64]),
    .icbne_o(out_ref[63:32]),
    .icconf_o(out_ref[31:0])
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
    seed = 393921468;
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
      i_8 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
