// Hidden tests: 5000 cycles of seeded random inputs (seed 758003783); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 119;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [3:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [3:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [26:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_036007 dut (
    .clk_i(clk),
    .wb_clk_i(i_0),
    .wb_rst_i(i_1),
    .wb_ack_i(i_2),
    .wb_rty_i(i_3),
    .wb_err_i(i_4),
    .wb_sel_i(i_5),
    .wb_dat_i(i_6),
    .write_i(i_7),
    .bes_i(i_8),
    .data_i(i_9),
    .miss_i(i_10),
    .addr_i(i_11),
    .wb_cyc_o(out_dut[118:118]),
    .wb_stb_o(out_dut[117:117]),
    .wb_we_o(out_dut[116:116]),
    .wb_cti_o(out_dut[115:113]),
    .wb_bte_o(out_dut[112:111]),
    .wb_adr_o(out_dut[110:84]),
    .wb_sel_o(out_dut[83:80]),
    .wb_dat_o(out_dut[79:48]),
    .wack_o(out_dut[47:47]),
    .wack_ao(out_dut[46:46]),
    .ack_o(out_dut[45:45]),
    .ready_o(out_dut[44:44]),
    .done_o(out_dut[43:43]),
    .busy_o(out_dut[42:42]),
    .u_write_o(out_dut[41:41]),
    .u_vld_o(out_dut[40:40]),
    .u_addr_o(out_dut[39:32]),
    .u_data_o(out_dut[31:0])
  );
  autovcoder_036007__ref ref_i (
    .clk_i(clk),
    .wb_clk_i(i_0),
    .wb_rst_i(i_1),
    .wb_ack_i(i_2),
    .wb_rty_i(i_3),
    .wb_err_i(i_4),
    .wb_sel_i(i_5),
    .wb_dat_i(i_6),
    .write_i(i_7),
    .bes_i(i_8),
    .data_i(i_9),
    .miss_i(i_10),
    .addr_i(i_11),
    .wb_cyc_o(out_ref[118:118]),
    .wb_stb_o(out_ref[117:117]),
    .wb_we_o(out_ref[116:116]),
    .wb_cti_o(out_ref[115:113]),
    .wb_bte_o(out_ref[112:111]),
    .wb_adr_o(out_ref[110:84]),
    .wb_sel_o(out_ref[83:80]),
    .wb_dat_o(out_ref[79:48]),
    .wack_o(out_ref[47:47]),
    .wack_ao(out_ref[46:46]),
    .ack_o(out_ref[45:45]),
    .ready_o(out_ref[44:44]),
    .done_o(out_ref[43:43]),
    .busy_o(out_ref[42:42]),
    .u_write_o(out_ref[41:41]),
    .u_vld_o(out_ref[40:40]),
    .u_addr_o(out_ref[39:32]),
    .u_data_o(out_ref[31:0])
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
    seed = 758003783;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
