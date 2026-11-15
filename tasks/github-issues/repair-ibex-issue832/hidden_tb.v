// Hidden tests: 5000 cycles of seeded random inputs (seed 71013586); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 144;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [1:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_load_store_unit dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .data_gnt_i(i_1),
    .data_rvalid_i(i_2),
    .data_err_i(i_3),
    .data_pmp_err_i(i_4),
    .data_rdata_i(i_5),
    .lsu_we_i(i_6),
    .lsu_type_i(i_7),
    .lsu_wdata_i(i_8),
    .lsu_sign_ext_i(i_9),
    .lsu_req_i(i_10),
    .adder_result_ex_i(i_11),
    .illegal_insn_id_i(i_12),
    .instr_valid_id_i(i_13),
    .data_req_o(out_dut[143:143]),
    .data_addr_o(out_dut[142:111]),
    .data_we_o(out_dut[110:110]),
    .data_be_o(out_dut[109:106]),
    .data_wdata_o(out_dut[105:74]),
    .lsu_rdata_o(out_dut[73:42]),
    .lsu_rdata_valid_o(out_dut[41:41]),
    .addr_incr_req_o(out_dut[40:40]),
    .addr_last_o(out_dut[39:8]),
    .lsu_req_done_o(out_dut[7:7]),
    .lsu_resp_valid_o(out_dut[6:6]),
    .load_err_o(out_dut[5:5]),
    .store_err_o(out_dut[4:4]),
    .load_o(out_dut[3:3]),
    .busy_o(out_dut[2:2]),
    .perf_load_o(out_dut[1:1]),
    .perf_store_o(out_dut[0:0])
  );
  ibex_load_store_unit__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .data_gnt_i(i_1),
    .data_rvalid_i(i_2),
    .data_err_i(i_3),
    .data_pmp_err_i(i_4),
    .data_rdata_i(i_5),
    .lsu_we_i(i_6),
    .lsu_type_i(i_7),
    .lsu_wdata_i(i_8),
    .lsu_sign_ext_i(i_9),
    .lsu_req_i(i_10),
    .adder_result_ex_i(i_11),
    .illegal_insn_id_i(i_12),
    .instr_valid_id_i(i_13),
    .data_req_o(out_ref[143:143]),
    .data_addr_o(out_ref[142:111]),
    .data_we_o(out_ref[110:110]),
    .data_be_o(out_ref[109:106]),
    .data_wdata_o(out_ref[105:74]),
    .lsu_rdata_o(out_ref[73:42]),
    .lsu_rdata_valid_o(out_ref[41:41]),
    .addr_incr_req_o(out_ref[40:40]),
    .addr_last_o(out_ref[39:8]),
    .lsu_req_done_o(out_ref[7:7]),
    .lsu_resp_valid_o(out_ref[6:6]),
    .load_err_o(out_ref[5:5]),
    .store_err_o(out_ref[4:4]),
    .load_o(out_ref[3:3]),
    .busy_o(out_ref[2:2]),
    .perf_load_o(out_ref[1:1]),
    .perf_store_o(out_ref[0:0])
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
    seed = 71013586;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
