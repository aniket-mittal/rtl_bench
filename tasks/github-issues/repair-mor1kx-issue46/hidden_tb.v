// Hidden tests: 5000 cycles of seeded random inputs (seed 2291829273); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 33;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [15:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mor1kx_pcu dut (
    .clk(clk),
    .rst(i_0),
    .spr_access_i(i_1),
    .spr_we_i(i_2),
    .spr_re_i(i_3),
    .spr_addr_i(i_4),
    .spr_dat_i(i_5),
    .spr_sys_mode_i(i_6),
    .pcu_event_load_i(i_7),
    .pcu_event_store_i(i_8),
    .pcu_event_ifetch_i(i_9),
    .pcu_event_dcache_miss_i(i_10),
    .pcu_event_icache_miss_i(i_11),
    .pcu_event_ifetch_stall_i(i_12),
    .pcu_event_lsu_stall_i(i_13),
    .pcu_event_brn_stall_i(i_14),
    .pcu_event_dtlb_miss_i(i_15),
    .pcu_event_itlb_miss_i(i_16),
    .pcu_event_datadep_stall_i(i_17),
    .spr_bus_ack(out_dut[32:32]),
    .spr_dat_o(out_dut[31:0])
  );
  mor1kx_pcu__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .spr_access_i(i_1),
    .spr_we_i(i_2),
    .spr_re_i(i_3),
    .spr_addr_i(i_4),
    .spr_dat_i(i_5),
    .spr_sys_mode_i(i_6),
    .pcu_event_load_i(i_7),
    .pcu_event_store_i(i_8),
    .pcu_event_ifetch_i(i_9),
    .pcu_event_dcache_miss_i(i_10),
    .pcu_event_icache_miss_i(i_11),
    .pcu_event_ifetch_stall_i(i_12),
    .pcu_event_lsu_stall_i(i_13),
    .pcu_event_brn_stall_i(i_14),
    .pcu_event_dtlb_miss_i(i_15),
    .pcu_event_itlb_miss_i(i_16),
    .pcu_event_datadep_stall_i(i_17),
    .spr_bus_ack(out_ref[32:32]),
    .spr_dat_o(out_ref[31:0])
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
    seed = 2291829273;
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
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
