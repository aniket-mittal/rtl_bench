// Hidden tests: 5000 cycles of seeded random inputs (seed 3746259080); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 67;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [255:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_160839 dut (
    .clk(clk),
    .rstn(i_0),
    .enable(i_1),
    .finish(i_2),
    .md_data_i(i_3),
    .data(out_dut[66:35]),
    .control(out_dut[34:34]),
    .addr(out_dut[33:30]),
    .cnt(out_dut[29:24]),
    .blockcnt(out_dut[23:17]),
    .md_ren_o(out_dut[16:16]),
    .md_sel_o(out_dut[15:15]),
    .md_size_o(out_dut[14:13]),
    .md_4x4_x_o(out_dut[12:9]),
    .md_4x4_y_o(out_dut[8:5]),
    .md_idx_o(out_dut[4:0])
  );
  origen_160839__ref ref_i (
    .clk(clk),
    .rstn(i_0),
    .enable(i_1),
    .finish(i_2),
    .md_data_i(i_3),
    .data(out_ref[66:35]),
    .control(out_ref[34:34]),
    .addr(out_ref[33:30]),
    .cnt(out_ref[29:24]),
    .blockcnt(out_ref[23:17]),
    .md_ren_o(out_ref[16:16]),
    .md_sel_o(out_ref[15:15]),
    .md_size_o(out_ref[14:13]),
    .md_4x4_x_o(out_ref[12:9]),
    .md_4x4_y_o(out_ref[8:5]),
    .md_idx_o(out_ref[4:0])
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
    seed = 3746259080;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
