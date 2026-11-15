// Hidden tests: 5000 cycles of seeded random inputs (seed 267151931); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 193;
  reg clk;
  reg [0:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [63:0] i_5;
  reg [0:0] i_6;
  reg [1:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_052480 dut (
    .clk(clk),
    .rst_n(i_0),
    .RSaddr_i(i_1),
    .RTaddr_i(i_2),
    .RDaddr_i(i_3),
    .RDdata_i(i_4),
    .RDdata_D_i(i_5),
    .Fcond_i(i_6),
    .RegWrite_i(i_7),
    .FPcondWrite(i_8),
    .RSdata_o(out_dut[192:161]),
    .RTdata_o(out_dut[160:129]),
    .RSdata_D_o(out_dut[128:65]),
    .RTdata_D_o(out_dut[64:1]),
    .Fcond_o(out_dut[0:0])
  );
  origen_052480__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .RSaddr_i(i_1),
    .RTaddr_i(i_2),
    .RDaddr_i(i_3),
    .RDdata_i(i_4),
    .RDdata_D_i(i_5),
    .Fcond_i(i_6),
    .RegWrite_i(i_7),
    .FPcondWrite(i_8),
    .RSdata_o(out_ref[192:161]),
    .RTdata_o(out_ref[160:129]),
    .RSdata_D_o(out_ref[128:65]),
    .RTdata_D_o(out_ref[64:1]),
    .Fcond_o(out_ref[0:0])
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
    seed = 267151931;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
