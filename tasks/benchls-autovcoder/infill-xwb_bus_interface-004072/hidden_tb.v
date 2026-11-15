// Hidden tests: 5000 cycles of seeded random inputs (seed 685625442); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 74;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [5:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_004072 dut (
    .gclk(clk),
    .xwb_dat_i(i_0),
    .xwb_ack_i(i_1),
    .imm_of(i_2),
    .opc_of(i_3),
    .opa_of(i_4),
    .grst(i_5),
    .dena(i_6),
    .gpha(i_7),
    .xwb_adr_o(out_dut[73:73]),
    .xwb_dat_o(out_dut[72:41]),
    .xwb_sel_o(out_dut[40:37]),
    .xwb_tag_o(out_dut[36:36]),
    .xwb_stb_o(out_dut[35:35]),
    .xwb_cyc_o(out_dut[34:34]),
    .xwb_wre_o(out_dut[33:33]),
    .xwb_fb(out_dut[32:32]),
    .xwb_mx(out_dut[31:0])
  );
  autovcoder_004072__ref ref_i (
    .gclk(clk),
    .xwb_dat_i(i_0),
    .xwb_ack_i(i_1),
    .imm_of(i_2),
    .opc_of(i_3),
    .opa_of(i_4),
    .grst(i_5),
    .dena(i_6),
    .gpha(i_7),
    .xwb_adr_o(out_ref[73:73]),
    .xwb_dat_o(out_ref[72:41]),
    .xwb_sel_o(out_ref[40:37]),
    .xwb_tag_o(out_ref[36:36]),
    .xwb_stb_o(out_ref[35:35]),
    .xwb_cyc_o(out_ref[34:34]),
    .xwb_wre_o(out_ref[33:33]),
    .xwb_fb(out_ref[32:32]),
    .xwb_mx(out_ref[31:0])
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
    seed = 685625442;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
