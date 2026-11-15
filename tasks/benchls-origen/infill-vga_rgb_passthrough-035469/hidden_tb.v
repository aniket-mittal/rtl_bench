// Hidden tests: 5000 cycles of seeded random inputs (seed 174632337); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [15:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_035469 dut (
    .clk(clk),
    .rst(i_0),
    .pclk(i_1),
    .vga_clk(i_2),
    .HREF(i_3),
    .VS(i_4),
    .rx(i_5),
    .VSYNC(out_dut[13:13]),
    .HSYNC(out_dut[12:12]),
    .R(out_dut[11:8]),
    .G(out_dut[7:4]),
    .B(out_dut[3:0])
  );
  origen_035469__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .pclk(i_1),
    .vga_clk(i_2),
    .HREF(i_3),
    .VS(i_4),
    .rx(i_5),
    .VSYNC(out_ref[13:13]),
    .HSYNC(out_ref[12:12]),
    .R(out_ref[11:8]),
    .G(out_ref[7:4]),
    .B(out_ref[3:0])
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
    seed = 174632337;
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
