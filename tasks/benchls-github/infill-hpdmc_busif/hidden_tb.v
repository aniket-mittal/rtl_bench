// Hidden tests: 5000 cycles of seeded random inputs (seed 1026602223); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [0:0] i_0;
  reg [22:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  hpdmc_busif dut (
    .sys_clk(clk),
    .sdram_rst(i_0),
    .fml_adr(i_1),
    .fml_stb(i_2),
    .fml_we(i_3),
    .mgmt_ack(i_4),
    .data_ack(i_5),
    .fml_ack(out_dut[24:24]),
    .mgmt_stb(out_dut[23:23]),
    .mgmt_we(out_dut[22:22]),
    .mgmt_address(out_dut[21:0])
  );
  hpdmc_busif__ref ref_i (
    .sys_clk(clk),
    .sdram_rst(i_0),
    .fml_adr(i_1),
    .fml_stb(i_2),
    .fml_we(i_3),
    .mgmt_ack(i_4),
    .data_ack(i_5),
    .fml_ack(out_ref[24:24]),
    .mgmt_stb(out_ref[23:23]),
    .mgmt_we(out_ref[22:22]),
    .mgmt_address(out_ref[21:0])
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
    seed = 1026602223;
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
