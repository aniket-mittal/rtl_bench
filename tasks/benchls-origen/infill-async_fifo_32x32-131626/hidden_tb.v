// Hidden tests: 5000 cycles of seeded random inputs (seed 3438435851); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 86;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_131626 dut (
    .wr_clk(clk),
    .ram_full_i(i_0),
    .rst_full_ff_i(i_1),
    .RD_PNTR_WR(i_2),
    .wr_en(i_3),
    .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] (i_4),
    .din(i_5),
    .rd_clk(i_6),
    .rd_en(i_7),
    .full(out_dut[85:85]),
    .ram_full_fb_i_reg(out_dut[84:84]),
    .Q(out_dut[83:52]),
    .WEBWE(out_dut[51:48]),
    .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (out_dut[47:16]),
    .\gic0.gc0.count_d2_reg[7] (out_dut[15:8]),
    .wr_data_count(out_dut[7:0])
  );
  origen_131626__ref ref_i (
    .wr_clk(clk),
    .ram_full_i(i_0),
    .rst_full_ff_i(i_1),
    .RD_PNTR_WR(i_2),
    .wr_en(i_3),
    .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] (i_4),
    .din(i_5),
    .rd_clk(i_6),
    .rd_en(i_7),
    .full(out_ref[85:85]),
    .ram_full_fb_i_reg(out_ref[84:84]),
    .Q(out_ref[83:52]),
    .WEBWE(out_ref[51:48]),
    .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (out_ref[47:16]),
    .\gic0.gc0.count_d2_reg[7] (out_ref[15:8]),
    .wr_data_count(out_ref[7:0])
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
    seed = 3438435851;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
