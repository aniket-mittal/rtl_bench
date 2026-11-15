// Hidden tests: 5000 cycles of seeded random inputs (seed 4009654405); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 29;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_09110 dut (
    .clk(clk),
    .reset(i_0),
    .IR(i_1),
    .N(i_2),
    .Z(i_3),
    .C(i_4),
    .W_Adr(out_dut[28:26]),
    .R_Adr(out_dut[25:23]),
    .S_Adr(out_dut[22:20]),
    .adr_sel(out_dut[19:19]),
    .s_sel(out_dut[18:18]),
    .pc_ld(out_dut[17:17]),
    .pc_inc(out_dut[16:16]),
    .pc_sel(out_dut[15:15]),
    .ir_ld(out_dut[14:14]),
    .mw_en(out_dut[13:13]),
    .rw_en(out_dut[12:12]),
    .alu_op(out_dut[11:8]),
    .status(out_dut[7:0])
  );
  rtlpp_09110__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .IR(i_1),
    .N(i_2),
    .Z(i_3),
    .C(i_4),
    .W_Adr(out_ref[28:26]),
    .R_Adr(out_ref[25:23]),
    .S_Adr(out_ref[22:20]),
    .adr_sel(out_ref[19:19]),
    .s_sel(out_ref[18:18]),
    .pc_ld(out_ref[17:17]),
    .pc_inc(out_ref[16:16]),
    .pc_sel(out_ref[15:15]),
    .ir_ld(out_ref[14:14]),
    .mw_en(out_ref[13:13]),
    .rw_en(out_ref[12:12]),
    .alu_op(out_ref[11:8]),
    .status(out_ref[7:0])
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
    seed = 4009654405;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
