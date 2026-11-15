// Hidden tests: 5000 cycles of seeded random inputs (seed 2078755078); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 41;
  reg clk;
  reg [7:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [7:0] i_3;
  reg [5:0] i_4;
  reg [31:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_103489 dut (
    .i_clk(clk),
    .i_waddr(i_0),
    .i_wdata(i_1),
    .i_wen(i_2),
    .i_raddr(i_3),
    .i_wb_adr(i_4),
    .i_wb_dat(i_5),
    .i_wb_sel(i_6),
    .i_wb_we(i_7),
    .i_wb_stb(i_8),
    .o_rdata(out_dut[40:33]),
    .o_wb_rdt(out_dut[32:1]),
    .o_wb_ack(out_dut[0:0])
  );
  autovcoder_103489__ref ref_i (
    .i_clk(clk),
    .i_waddr(i_0),
    .i_wdata(i_1),
    .i_wen(i_2),
    .i_raddr(i_3),
    .i_wb_adr(i_4),
    .i_wb_dat(i_5),
    .i_wb_sel(i_6),
    .i_wb_we(i_7),
    .i_wb_stb(i_8),
    .o_rdata(out_ref[40:33]),
    .o_wb_rdt(out_ref[32:1]),
    .o_wb_ack(out_ref[0:0])
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
    seed = 2078755078;
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
