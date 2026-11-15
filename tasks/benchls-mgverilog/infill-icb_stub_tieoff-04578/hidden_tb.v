// Hidden tests: 5000 cycles of seeded random inputs (seed 3239500206); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 68;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04578 dut (
    .clk(clk),
    .rst_n(i_0),
    .i_icb_cmd_valid(i_1),
    .i_icb_cmd_addr(i_2),
    .i_icb_cmd_read(i_3),
    .i_icb_cmd_wdata(i_4),
    .i_icb_rsp_ready(i_5),
    .f_icb_cmd_valid(i_6),
    .f_icb_cmd_addr(i_7),
    .f_icb_cmd_read(i_8),
    .f_icb_cmd_wdata(i_9),
    .f_icb_rsp_ready(i_10),
    .i_icb_cmd_ready(out_dut[67:67]),
    .i_icb_rsp_valid(out_dut[66:66]),
    .i_icb_rsp_rdata(out_dut[65:34]),
    .f_icb_cmd_ready(out_dut[33:33]),
    .f_icb_rsp_valid(out_dut[32:32]),
    .f_icb_rsp_rdata(out_dut[31:0])
  );
  mg_04578__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .i_icb_cmd_valid(i_1),
    .i_icb_cmd_addr(i_2),
    .i_icb_cmd_read(i_3),
    .i_icb_cmd_wdata(i_4),
    .i_icb_rsp_ready(i_5),
    .f_icb_cmd_valid(i_6),
    .f_icb_cmd_addr(i_7),
    .f_icb_cmd_read(i_8),
    .f_icb_cmd_wdata(i_9),
    .f_icb_rsp_ready(i_10),
    .i_icb_cmd_ready(out_ref[67:67]),
    .i_icb_rsp_valid(out_ref[66:66]),
    .i_icb_rsp_rdata(out_ref[65:34]),
    .f_icb_cmd_ready(out_ref[33:33]),
    .f_icb_rsp_valid(out_ref[32:32]),
    .f_icb_rsp_rdata(out_ref[31:0])
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
    seed = 3239500206;
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
      i_6 = {$random(seed)};
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
