// Hidden tests: 5000 cycles of seeded random inputs (seed 33142389); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 137;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [3:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  reg [31:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06838 dut (
    .sys_clk(clk),
    .resetcpu(i_0),
    .h_cyc(i_1),
    .h_stb(i_2),
    .h_we(i_3),
    .h_sel(i_4),
    .h_adr(i_5),
    .h_dat_o(i_6),
    .l_cyc(i_7),
    .l_stb(i_8),
    .l_we(i_9),
    .l_sel(i_10),
    .l_adr(i_11),
    .l_dat_o(i_12),
    .m_ack(i_13),
    .m_dat_i(i_14),
    .h_ack(out_dut[136:136]),
    .h_dat_i(out_dut[135:104]),
    .l_ack(out_dut[103:103]),
    .l_dat_i(out_dut[102:71]),
    .m_cyc(out_dut[70:70]),
    .m_stb(out_dut[69:69]),
    .m_we(out_dut[68:68]),
    .m_sel(out_dut[67:64]),
    .m_adr(out_dut[63:32]),
    .m_dat_o(out_dut[31:0])
  );
  mg_06838__ref ref_i (
    .sys_clk(clk),
    .resetcpu(i_0),
    .h_cyc(i_1),
    .h_stb(i_2),
    .h_we(i_3),
    .h_sel(i_4),
    .h_adr(i_5),
    .h_dat_o(i_6),
    .l_cyc(i_7),
    .l_stb(i_8),
    .l_we(i_9),
    .l_sel(i_10),
    .l_adr(i_11),
    .l_dat_o(i_12),
    .m_ack(i_13),
    .m_dat_i(i_14),
    .h_ack(out_ref[136:136]),
    .h_dat_i(out_ref[135:104]),
    .l_ack(out_ref[103:103]),
    .l_dat_i(out_ref[102:71]),
    .m_cyc(out_ref[70:70]),
    .m_stb(out_ref[69:69]),
    .m_we(out_ref[68:68]),
    .m_sel(out_ref[67:64]),
    .m_adr(out_ref[63:32]),
    .m_dat_o(out_ref[31:0])
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
    seed = 33142389;
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
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
