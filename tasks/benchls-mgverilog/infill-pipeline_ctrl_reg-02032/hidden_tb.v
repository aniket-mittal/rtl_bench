// Hidden tests: 5000 cycles of seeded random inputs (seed 4130755390); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 19;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [2:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [2:0] i_9;
  reg [2:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02032 dut (
    .CLK(clk),
    .input_IN(i_0),
    .wren_IN(i_1),
    .writeAd_IN(i_2),
    .ADR_MUX_IN(i_3),
    .write_IN(i_4),
    .PC_load_IN(i_5),
    .SPR_w_IN(i_6),
    .SPR_i_IN(i_7),
    .SPR_d_IN(i_8),
    .cond_IN(i_9),
    .op2_IN(i_10),
    .SW_IN(i_11),
    .MAD_MUX_IN(i_12),
    .input_OUT(out_dut[18:18]),
    .wren_OUT(out_dut[17:17]),
    .writeAd_OUT(out_dut[16:14]),
    .ADR_MUX_OUT(out_dut[13:13]),
    .write_OUT(out_dut[12:12]),
    .PC_load_OUT(out_dut[11:11]),
    .SPR_w_OUT(out_dut[10:10]),
    .SPR_i_OUT(out_dut[9:9]),
    .SPR_d_OUT(out_dut[8:8]),
    .cond_OUT(out_dut[7:5]),
    .op2_OUT(out_dut[4:2]),
    .SW_OUT(out_dut[1:1]),
    .MAD_MUX_OUT(out_dut[0:0])
  );
  mg_02032__ref ref_i (
    .CLK(clk),
    .input_IN(i_0),
    .wren_IN(i_1),
    .writeAd_IN(i_2),
    .ADR_MUX_IN(i_3),
    .write_IN(i_4),
    .PC_load_IN(i_5),
    .SPR_w_IN(i_6),
    .SPR_i_IN(i_7),
    .SPR_d_IN(i_8),
    .cond_IN(i_9),
    .op2_IN(i_10),
    .SW_IN(i_11),
    .MAD_MUX_IN(i_12),
    .input_OUT(out_ref[18:18]),
    .wren_OUT(out_ref[17:17]),
    .writeAd_OUT(out_ref[16:14]),
    .ADR_MUX_OUT(out_ref[13:13]),
    .write_OUT(out_ref[12:12]),
    .PC_load_OUT(out_ref[11:11]),
    .SPR_w_OUT(out_ref[10:10]),
    .SPR_i_OUT(out_ref[9:9]),
    .SPR_d_OUT(out_ref[8:8]),
    .cond_OUT(out_ref[7:5]),
    .op2_OUT(out_ref[4:2]),
    .SW_OUT(out_ref[1:1]),
    .MAD_MUX_OUT(out_ref[0:0])
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
    seed = 4130755390;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
