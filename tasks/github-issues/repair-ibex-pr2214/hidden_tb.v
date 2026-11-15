// Hidden tests: 5000 cycles of seeded random inputs (seed 94765729); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 431;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [43:0] i_13;
  reg [127:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [14:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [3:0] i_22;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_core dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .hart_id_i(i_1),
    .boot_addr_i(i_2),
    .instr_gnt_i(i_3),
    .instr_rvalid_i(i_4),
    .instr_rdata_i(i_5),
    .instr_err_i(i_6),
    .data_gnt_i(i_7),
    .data_rvalid_i(i_8),
    .data_rdata_i(i_9),
    .data_err_i(i_10),
    .rf_rdata_a_ecc_i(i_11),
    .rf_rdata_b_ecc_i(i_12),
    .ic_tag_rdata_i(i_13),
    .ic_data_rdata_i(i_14),
    .ic_scr_key_valid_i(i_15),
    .irq_software_i(i_16),
    .irq_timer_i(i_17),
    .irq_external_i(i_18),
    .irq_fast_i(i_19),
    .irq_nm_i(i_20),
    .debug_req_i(i_21),
    .fetch_enable_i(i_22),
    .instr_req_o(out_dut[430:430]),
    .instr_addr_o(out_dut[429:398]),
    .data_req_o(out_dut[397:397]),
    .data_we_o(out_dut[396:396]),
    .data_be_o(out_dut[395:392]),
    .data_addr_o(out_dut[391:360]),
    .data_wdata_o(out_dut[359:328]),
    .dummy_instr_id_o(out_dut[327:327]),
    .dummy_instr_wb_o(out_dut[326:326]),
    .rf_raddr_a_o(out_dut[325:321]),
    .rf_raddr_b_o(out_dut[320:316]),
    .rf_waddr_wb_o(out_dut[315:311]),
    .rf_we_wb_o(out_dut[310:310]),
    .rf_wdata_wb_ecc_o(out_dut[309:278]),
    .ic_tag_req_o(out_dut[277:276]),
    .ic_tag_write_o(out_dut[275:275]),
    .ic_tag_addr_o(out_dut[274:267]),
    .ic_tag_wdata_o(out_dut[266:245]),
    .ic_data_req_o(out_dut[244:243]),
    .ic_data_write_o(out_dut[242:242]),
    .ic_data_addr_o(out_dut[241:234]),
    .ic_data_wdata_o(out_dut[233:170]),
    .ic_scr_key_req_o(out_dut[169:169]),
    .irq_pending_o(out_dut[168:168]),
    .crash_dump_o(out_dut[167:8]),
    .double_fault_seen_o(out_dut[7:7]),
    .alert_minor_o(out_dut[6:6]),
    .alert_major_internal_o(out_dut[5:5]),
    .alert_major_bus_o(out_dut[4:4]),
    .core_busy_o(out_dut[3:0])
  );
  ibex_core__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .hart_id_i(i_1),
    .boot_addr_i(i_2),
    .instr_gnt_i(i_3),
    .instr_rvalid_i(i_4),
    .instr_rdata_i(i_5),
    .instr_err_i(i_6),
    .data_gnt_i(i_7),
    .data_rvalid_i(i_8),
    .data_rdata_i(i_9),
    .data_err_i(i_10),
    .rf_rdata_a_ecc_i(i_11),
    .rf_rdata_b_ecc_i(i_12),
    .ic_tag_rdata_i(i_13),
    .ic_data_rdata_i(i_14),
    .ic_scr_key_valid_i(i_15),
    .irq_software_i(i_16),
    .irq_timer_i(i_17),
    .irq_external_i(i_18),
    .irq_fast_i(i_19),
    .irq_nm_i(i_20),
    .debug_req_i(i_21),
    .fetch_enable_i(i_22),
    .instr_req_o(out_ref[430:430]),
    .instr_addr_o(out_ref[429:398]),
    .data_req_o(out_ref[397:397]),
    .data_we_o(out_ref[396:396]),
    .data_be_o(out_ref[395:392]),
    .data_addr_o(out_ref[391:360]),
    .data_wdata_o(out_ref[359:328]),
    .dummy_instr_id_o(out_ref[327:327]),
    .dummy_instr_wb_o(out_ref[326:326]),
    .rf_raddr_a_o(out_ref[325:321]),
    .rf_raddr_b_o(out_ref[320:316]),
    .rf_waddr_wb_o(out_ref[315:311]),
    .rf_we_wb_o(out_ref[310:310]),
    .rf_wdata_wb_ecc_o(out_ref[309:278]),
    .ic_tag_req_o(out_ref[277:276]),
    .ic_tag_write_o(out_ref[275:275]),
    .ic_tag_addr_o(out_ref[274:267]),
    .ic_tag_wdata_o(out_ref[266:245]),
    .ic_data_req_o(out_ref[244:243]),
    .ic_data_write_o(out_ref[242:242]),
    .ic_data_addr_o(out_ref[241:234]),
    .ic_data_wdata_o(out_ref[233:170]),
    .ic_scr_key_req_o(out_ref[169:169]),
    .irq_pending_o(out_ref[168:168]),
    .crash_dump_o(out_ref[167:8]),
    .double_fault_seen_o(out_ref[7:7]),
    .alert_minor_o(out_ref[6:6]),
    .alert_major_internal_o(out_ref[5:5]),
    .alert_major_bus_o(out_ref[4:4]),
    .core_busy_o(out_ref[3:0])
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
    seed = 94765729;
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
      i_13 = {$random(seed), $random(seed)};
      i_14 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
