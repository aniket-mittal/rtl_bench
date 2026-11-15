// Hidden tests: 5000 cycles of seeded random inputs (seed 2496598780); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 105;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [35:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_097332 dut (
    .i_clk(clk),
    .i_cmd_reset(i_0),
    .i_cmd_valid(i_1),
    .i_cmd_data(i_2),
    .i_wb_ack(i_3),
    .i_wb_err(i_4),
    .i_wb_stall(i_5),
    .i_wb_data(i_6),
    .o_cmd_ready(out_dut[104:104]),
    .o_resp_valid(out_dut[103:103]),
    .o_resp_data(out_dut[102:67]),
    .o_wb_cyc(out_dut[66:66]),
    .o_wb_stb(out_dut[65:65]),
    .o_wb_we(out_dut[64:64]),
    .o_wb_addr(out_dut[63:32]),
    .o_wb_data(out_dut[31:0])
  );
  origen_097332__ref ref_i (
    .i_clk(clk),
    .i_cmd_reset(i_0),
    .i_cmd_valid(i_1),
    .i_cmd_data(i_2),
    .i_wb_ack(i_3),
    .i_wb_err(i_4),
    .i_wb_stall(i_5),
    .i_wb_data(i_6),
    .o_cmd_ready(out_ref[104:104]),
    .o_resp_valid(out_ref[103:103]),
    .o_resp_data(out_ref[102:67]),
    .o_wb_cyc(out_ref[66:66]),
    .o_wb_stb(out_ref[65:65]),
    .o_wb_we(out_ref[64:64]),
    .o_wb_addr(out_ref[63:32]),
    .o_wb_data(out_ref[31:0])
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
    seed = 2496598780;
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
      i_6 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
