// Hidden tests: 5000 cycles of seeded random inputs (seed 71881719); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 231;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [31:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  reg [4:0] i_17;
  reg [31:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  cv32e40p_core dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .pulp_clock_en_i(i_1),
    .scan_cg_en_i(i_2),
    .boot_addr_i(i_3),
    .mtvec_addr_i(i_4),
    .dm_halt_addr_i(i_5),
    .hart_id_i(i_6),
    .dm_exception_addr_i(i_7),
    .instr_gnt_i(i_8),
    .instr_rvalid_i(i_9),
    .instr_rdata_i(i_10),
    .data_gnt_i(i_11),
    .data_rvalid_i(i_12),
    .data_rdata_i(i_13),
    .apu_gnt_i(i_14),
    .apu_rvalid_i(i_15),
    .apu_result_i(i_16),
    .apu_flags_i(i_17),
    .irq_i(i_18),
    .debug_req_i(i_19),
    .fetch_enable_i(i_20),
    .instr_req_o(out_dut[230:230]),
    .instr_addr_o(out_dut[229:198]),
    .data_req_o(out_dut[197:197]),
    .data_we_o(out_dut[196:196]),
    .data_be_o(out_dut[195:192]),
    .data_addr_o(out_dut[191:160]),
    .data_wdata_o(out_dut[159:128]),
    .apu_req_o(out_dut[127:127]),
    .apu_operands_o(out_dut[126:31]),
    .apu_op_o(out_dut[30:25]),
    .apu_flags_o(out_dut[24:10]),
    .irq_ack_o(out_dut[9:9]),
    .irq_id_o(out_dut[8:4]),
    .debug_havereset_o(out_dut[3:3]),
    .debug_running_o(out_dut[2:2]),
    .debug_halted_o(out_dut[1:1]),
    .core_sleep_o(out_dut[0:0])
  );
  cv32e40p_core__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .pulp_clock_en_i(i_1),
    .scan_cg_en_i(i_2),
    .boot_addr_i(i_3),
    .mtvec_addr_i(i_4),
    .dm_halt_addr_i(i_5),
    .hart_id_i(i_6),
    .dm_exception_addr_i(i_7),
    .instr_gnt_i(i_8),
    .instr_rvalid_i(i_9),
    .instr_rdata_i(i_10),
    .data_gnt_i(i_11),
    .data_rvalid_i(i_12),
    .data_rdata_i(i_13),
    .apu_gnt_i(i_14),
    .apu_rvalid_i(i_15),
    .apu_result_i(i_16),
    .apu_flags_i(i_17),
    .irq_i(i_18),
    .debug_req_i(i_19),
    .fetch_enable_i(i_20),
    .instr_req_o(out_ref[230:230]),
    .instr_addr_o(out_ref[229:198]),
    .data_req_o(out_ref[197:197]),
    .data_we_o(out_ref[196:196]),
    .data_be_o(out_ref[195:192]),
    .data_addr_o(out_ref[191:160]),
    .data_wdata_o(out_ref[159:128]),
    .apu_req_o(out_ref[127:127]),
    .apu_operands_o(out_ref[126:31]),
    .apu_op_o(out_ref[30:25]),
    .apu_flags_o(out_ref[24:10]),
    .irq_ack_o(out_ref[9:9]),
    .irq_id_o(out_ref[8:4]),
    .debug_havereset_o(out_ref[3:3]),
    .debug_running_o(out_ref[2:2]),
    .debug_halted_o(out_ref[1:1]),
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
    seed = 71881719;
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
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
