// Hidden tests: 5000 cycles of seeded random inputs (seed 324221334); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 90;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [2:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [63:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [15:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_055212 dut (
    .hclk(clk),
    .hreset_n(i_0),
    .hsel(i_1),
    .hsize(i_2),
    .htrans(i_3),
    .hwrite(i_4),
    .haddr(i_5),
    .hwdata(i_6),
    .rdy_n(i_7),
    .error_n(i_8),
    .irq_n(i_9),
    .AD_in(i_10),
    .hrdata(out_dut[89:26]),
    .hresp(out_dut[25:24]),
    .hready(out_dut[23:23]),
    .clk(out_dut[22:22]),
    .rst_n(out_dut[21:21]),
    .aen(out_dut[20:20]),
    .size(out_dut[19:18]),
    .wr_n(out_dut[17:17]),
    .AD_out(out_dut[16:1]),
    .FSB_irq(out_dut[0:0])
  );
  origen_055212__ref ref_i (
    .hclk(clk),
    .hreset_n(i_0),
    .hsel(i_1),
    .hsize(i_2),
    .htrans(i_3),
    .hwrite(i_4),
    .haddr(i_5),
    .hwdata(i_6),
    .rdy_n(i_7),
    .error_n(i_8),
    .irq_n(i_9),
    .AD_in(i_10),
    .hrdata(out_ref[89:26]),
    .hresp(out_ref[25:24]),
    .hready(out_ref[23:23]),
    .clk(out_ref[22:22]),
    .rst_n(out_ref[21:21]),
    .aen(out_ref[20:20]),
    .size(out_ref[19:18]),
    .wr_n(out_ref[17:17]),
    .AD_out(out_ref[16:1]),
    .FSB_irq(out_ref[0:0])
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
    seed = 324221334;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
