// Hidden tests: 5000 cycles of seeded random inputs (seed 1488706305); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 29;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [5:0] i_3;
  reg [5:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [5:0] i_9;
  reg [5:0] i_10;
  reg [7:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  serv_rf_ram_if dut (
    .i_clk(clk),
    .i_rst(i_0),
    .i_wreq(i_1),
    .i_rreq(i_2),
    .i_wreg0(i_3),
    .i_wreg1(i_4),
    .i_wen0(i_5),
    .i_wen1(i_6),
    .i_wdata0(i_7),
    .i_wdata1(i_8),
    .i_rreg0(i_9),
    .i_rreg1(i_10),
    .i_rdata(i_11),
    .o_ready(out_dut[28:28]),
    .o_rdata0(out_dut[27:27]),
    .o_rdata1(out_dut[26:26]),
    .o_waddr(out_dut[25:18]),
    .o_wdata(out_dut[17:10]),
    .o_wen(out_dut[9:9]),
    .o_raddr(out_dut[8:1]),
    .o_ren(out_dut[0:0])
  );
  serv_rf_ram_if__ref ref_i (
    .i_clk(clk),
    .i_rst(i_0),
    .i_wreq(i_1),
    .i_rreq(i_2),
    .i_wreg0(i_3),
    .i_wreg1(i_4),
    .i_wen0(i_5),
    .i_wen1(i_6),
    .i_wdata0(i_7),
    .i_wdata1(i_8),
    .i_rreg0(i_9),
    .i_rreg1(i_10),
    .i_rdata(i_11),
    .o_ready(out_ref[28:28]),
    .o_rdata0(out_ref[27:27]),
    .o_rdata1(out_ref[26:26]),
    .o_waddr(out_ref[25:18]),
    .o_wdata(out_ref[17:10]),
    .o_wen(out_ref[9:9]),
    .o_raddr(out_ref[8:1]),
    .o_ren(out_ref[0:0])
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
    seed = 1488706305;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
