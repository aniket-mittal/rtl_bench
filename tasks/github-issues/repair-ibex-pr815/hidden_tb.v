// Hidden tests: 5000 cycles of seeded random inputs (seed 2140292297); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 104;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [14:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_core dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .test_en_i(i_1),
    .hart_id_i(i_2),
    .boot_addr_i(i_3),
    .instr_gnt_i(i_4),
    .instr_rvalid_i(i_5),
    .instr_rdata_i(i_6),
    .instr_err_i(i_7),
    .data_gnt_i(i_8),
    .data_rvalid_i(i_9),
    .data_rdata_i(i_10),
    .data_err_i(i_11),
    .irq_software_i(i_12),
    .irq_timer_i(i_13),
    .irq_external_i(i_14),
    .irq_fast_i(i_15),
    .irq_nm_i(i_16),
    .debug_req_i(i_17),
    .fetch_enable_i(i_18),
    .instr_req_o(out_dut[103:103]),
    .instr_addr_o(out_dut[102:71]),
    .data_req_o(out_dut[70:70]),
    .data_we_o(out_dut[69:69]),
    .data_be_o(out_dut[68:65]),
    .data_addr_o(out_dut[64:33]),
    .data_wdata_o(out_dut[32:1]),
    .core_sleep_o(out_dut[0:0])
  );
  ibex_core__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .test_en_i(i_1),
    .hart_id_i(i_2),
    .boot_addr_i(i_3),
    .instr_gnt_i(i_4),
    .instr_rvalid_i(i_5),
    .instr_rdata_i(i_6),
    .instr_err_i(i_7),
    .data_gnt_i(i_8),
    .data_rvalid_i(i_9),
    .data_rdata_i(i_10),
    .data_err_i(i_11),
    .irq_software_i(i_12),
    .irq_timer_i(i_13),
    .irq_external_i(i_14),
    .irq_fast_i(i_15),
    .irq_nm_i(i_16),
    .debug_req_i(i_17),
    .fetch_enable_i(i_18),
    .instr_req_o(out_ref[103:103]),
    .instr_addr_o(out_ref[102:71]),
    .data_req_o(out_ref[70:70]),
    .data_we_o(out_ref[69:69]),
    .data_be_o(out_ref[68:65]),
    .data_addr_o(out_ref[64:33]),
    .data_wdata_o(out_ref[32:1]),
    .core_sleep_o(out_ref[0:0])
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
    seed = 2140292297;
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
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
