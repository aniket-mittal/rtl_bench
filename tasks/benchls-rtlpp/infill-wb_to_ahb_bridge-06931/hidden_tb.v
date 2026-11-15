// Hidden tests: 5000 cycles of seeded random inputs (seed 249740372); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 113;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [3:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [2:0] i_7;
  reg [1:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06931 dut (
    .clk_i(clk),
    .rst_n_i(i_0),
    .from_m_wb_adr_o(i_1),
    .from_m_wb_sel_o(i_2),
    .from_m_wb_we_o(i_3),
    .from_m_wb_dat_o(i_4),
    .from_m_wb_cyc_o(i_5),
    .from_m_wb_stb_o(i_6),
    .from_m_wb_cti_o(i_7),
    .from_m_wb_bte_o(i_8),
    .mHRDATA(i_9),
    .mHRESP(i_10),
    .mHREADY(i_11),
    .to_m_wb_ack_i(out_dut[112:112]),
    .to_m_wb_err_i(out_dut[111:111]),
    .to_m_wb_dat_i(out_dut[110:79]),
    .mHSEL(out_dut[78:78]),
    .mHSIZE(out_dut[77:75]),
    .mHREADYOUT(out_dut[74:74]),
    .mHWRITE(out_dut[73:73]),
    .mHBURST(out_dut[72:70]),
    .mHADDR(out_dut[69:38]),
    .mHTRANS(out_dut[37:36]),
    .mHWDATA(out_dut[35:4]),
    .mHPROT(out_dut[3:0])
  );
  rtlpp_06931__ref ref_i (
    .clk_i(clk),
    .rst_n_i(i_0),
    .from_m_wb_adr_o(i_1),
    .from_m_wb_sel_o(i_2),
    .from_m_wb_we_o(i_3),
    .from_m_wb_dat_o(i_4),
    .from_m_wb_cyc_o(i_5),
    .from_m_wb_stb_o(i_6),
    .from_m_wb_cti_o(i_7),
    .from_m_wb_bte_o(i_8),
    .mHRDATA(i_9),
    .mHRESP(i_10),
    .mHREADY(i_11),
    .to_m_wb_ack_i(out_ref[112:112]),
    .to_m_wb_err_i(out_ref[111:111]),
    .to_m_wb_dat_i(out_ref[110:79]),
    .mHSEL(out_ref[78:78]),
    .mHSIZE(out_ref[77:75]),
    .mHREADYOUT(out_ref[74:74]),
    .mHWRITE(out_ref[73:73]),
    .mHBURST(out_ref[72:70]),
    .mHADDR(out_ref[69:38]),
    .mHTRANS(out_ref[37:36]),
    .mHWDATA(out_ref[35:4]),
    .mHPROT(out_ref[3:0])
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
    seed = 249740372;
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
