// Hidden tests: 5000 cycles of seeded random inputs (seed 4290266940); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 97;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [6:0] i_10;
  reg [35:0] i_11;
  reg [6:0] i_12;
  reg [35:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03888 dut (
    .clk(clk),
    .reset(i_0),
    .m_iob_poweron(i_1),
    .m_iob_reset(i_2),
    .m_datao_clear(i_3),
    .m_datao_set(i_4),
    .m_cono_clear(i_5),
    .m_cono_set(i_6),
    .m_iob_fm_datai(i_7),
    .m_iob_fm_status(i_8),
    .m_rdi_pulse(i_9),
    .m_ios(i_10),
    .m_iob_write(i_11),
    .s0_pi_req(i_12),
    .s0_iob_read(i_13),
    .s0_dr_split(i_14),
    .s0_rdi_data(i_15),
    .m_pi_req(out_dut[96:90]),
    .m_iob_read(out_dut[89:54]),
    .m_dr_split(out_dut[53:53]),
    .m_rdi_data(out_dut[52:52]),
    .s0_iob_poweron(out_dut[51:51]),
    .s0_iob_reset(out_dut[50:50]),
    .s0_datao_clear(out_dut[49:49]),
    .s0_datao_set(out_dut[48:48]),
    .s0_cono_clear(out_dut[47:47]),
    .s0_cono_set(out_dut[46:46]),
    .s0_iob_fm_datai(out_dut[45:45]),
    .s0_iob_fm_status(out_dut[44:44]),
    .s0_rdi_pulse(out_dut[43:43]),
    .s0_ios(out_dut[42:36]),
    .s0_iob_write(out_dut[35:0])
  );
  mg_03888__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .m_iob_poweron(i_1),
    .m_iob_reset(i_2),
    .m_datao_clear(i_3),
    .m_datao_set(i_4),
    .m_cono_clear(i_5),
    .m_cono_set(i_6),
    .m_iob_fm_datai(i_7),
    .m_iob_fm_status(i_8),
    .m_rdi_pulse(i_9),
    .m_ios(i_10),
    .m_iob_write(i_11),
    .s0_pi_req(i_12),
    .s0_iob_read(i_13),
    .s0_dr_split(i_14),
    .s0_rdi_data(i_15),
    .m_pi_req(out_ref[96:90]),
    .m_iob_read(out_ref[89:54]),
    .m_dr_split(out_ref[53:53]),
    .m_rdi_data(out_ref[52:52]),
    .s0_iob_poweron(out_ref[51:51]),
    .s0_iob_reset(out_ref[50:50]),
    .s0_datao_clear(out_ref[49:49]),
    .s0_datao_set(out_ref[48:48]),
    .s0_cono_clear(out_ref[47:47]),
    .s0_cono_set(out_ref[46:46]),
    .s0_iob_fm_datai(out_ref[45:45]),
    .s0_iob_fm_status(out_ref[44:44]),
    .s0_rdi_pulse(out_ref[43:43]),
    .s0_ios(out_ref[42:36]),
    .s0_iob_write(out_ref[35:0])
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
    seed = 4290266940;
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
      i_11 = {$random(seed), $random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed), $random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
