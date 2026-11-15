// Hidden tests: 5000 cycles of seeded random inputs (seed 2982012056); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 29;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [3:0] i_2;
  reg [8:0] i_3;
  reg [7:0] i_4;
  reg [15:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_07816 dut (
    .clk(clk),
    .clk7_en(i_0),
    .audio_dmal(i_1),
    .audio_dmas(i_2),
    .hpos(i_3),
    .reg_address_in(i_4),
    .data_in(i_5),
    .dma(out_dut[28:28]),
    .reg_address_out(out_dut[27:20]),
    .address_out(out_dut[19:0])
  );
  mg_07816__ref ref_i (
    .clk(clk),
    .clk7_en(i_0),
    .audio_dmal(i_1),
    .audio_dmas(i_2),
    .hpos(i_3),
    .reg_address_in(i_4),
    .data_in(i_5),
    .dma(out_ref[28:28]),
    .reg_address_out(out_ref[27:20]),
    .address_out(out_ref[19:0])
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
    seed = 2982012056;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
