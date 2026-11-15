// Hidden tests: 5000 cycles of seeded random inputs (seed 966192754); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 51;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [15:0] i_8;
  reg [2:0] i_9;
  reg [2:0] i_10;
  reg [2:0] i_11;
  reg [3:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_10644 dut (
    .clk(clk),
    .reset(i_0),
    .pc_ld(i_1),
    .pc_sel(i_2),
    .pc_inc(i_3),
    .ir_ld(i_4),
    .adr_sel(i_5),
    .W_En(i_6),
    .S_Sel(i_7),
    .D_in(i_8),
    .W_Adr(i_9),
    .R_Adr(i_10),
    .S_Adr(i_11),
    .Alu_Op(i_12),
    .C(out_dut[50:50]),
    .N(out_dut[49:49]),
    .Z(out_dut[48:48]),
    .D_out(out_dut[47:32]),
    .ir_out(out_dut[31:16]),
    .address(out_dut[15:0])
  );
  rtlpp_10644__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .pc_ld(i_1),
    .pc_sel(i_2),
    .pc_inc(i_3),
    .ir_ld(i_4),
    .adr_sel(i_5),
    .W_En(i_6),
    .S_Sel(i_7),
    .D_in(i_8),
    .W_Adr(i_9),
    .R_Adr(i_10),
    .S_Adr(i_11),
    .Alu_Op(i_12),
    .C(out_ref[50:50]),
    .N(out_ref[49:49]),
    .Z(out_ref[48:48]),
    .D_out(out_ref[47:32]),
    .ir_out(out_ref[31:16]),
    .address(out_ref[15:0])
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
    seed = 966192754;
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
