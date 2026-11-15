// Hidden tests: 5000 cycles of seeded random inputs (seed 302501181); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 46;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [13:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [13:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  axi_selmap_regmap dut (
    .up_clk(clk),
    .device_ready(i_0),
    .done(i_1),
    .up_rstn(i_2),
    .up_wreq(i_3),
    .up_waddr(i_4),
    .up_wdata(i_5),
    .up_rreq(i_6),
    .up_raddr(i_7),
    .reset(out_dut[45:45]),
    .data(out_dut[44:37]),
    .data_written(out_dut[36:36]),
    .csi_b(out_dut[35:35]),
    .program_b(out_dut[34:34]),
    .up_wack(out_dut[33:33]),
    .up_rdata(out_dut[32:1]),
    .up_rack(out_dut[0:0])
  );
  axi_selmap_regmap__ref ref_i (
    .up_clk(clk),
    .device_ready(i_0),
    .done(i_1),
    .up_rstn(i_2),
    .up_wreq(i_3),
    .up_waddr(i_4),
    .up_wdata(i_5),
    .up_rreq(i_6),
    .up_raddr(i_7),
    .reset(out_ref[45:45]),
    .data(out_ref[44:37]),
    .data_written(out_ref[36:36]),
    .csi_b(out_ref[35:35]),
    .program_b(out_ref[34:34]),
    .up_wack(out_ref[33:33]),
    .up_rdata(out_ref[32:1]),
    .up_rack(out_ref[0:0])
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
    seed = 302501181;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
