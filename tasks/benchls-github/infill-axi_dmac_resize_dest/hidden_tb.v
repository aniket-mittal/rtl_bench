// Hidden tests: 5000 cycles of seeded random inputs (seed 1372115954); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 75;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [63:0] i_2;
  reg [0:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  axi_dmac_resize_dest dut (
    .clk(clk),
    .reset(i_0),
    .mem_data_valid(i_1),
    .mem_data(i_2),
    .mem_data_last(i_3),
    .mem_data_strb(i_4),
    .dest_data_ready(i_5),
    .mem_data_ready(out_dut[74:74]),
    .dest_data_valid(out_dut[73:73]),
    .dest_data(out_dut[72:9]),
    .dest_data_last(out_dut[8:8]),
    .dest_data_strb(out_dut[7:0])
  );
  axi_dmac_resize_dest__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .mem_data_valid(i_1),
    .mem_data(i_2),
    .mem_data_last(i_3),
    .mem_data_strb(i_4),
    .dest_data_ready(i_5),
    .mem_data_ready(out_ref[74:74]),
    .dest_data_valid(out_ref[73:73]),
    .dest_data(out_ref[72:9]),
    .dest_data_last(out_ref[8:8]),
    .dest_data_strb(out_ref[7:0])
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
    seed = 1372115954;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
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
