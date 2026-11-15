// Hidden tests: 5000 cycles of seeded random inputs (seed 2751764672); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 47;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [6:0] i_3;
  reg [11:0] i_4;
  reg [11:0] i_5;
  reg [11:0] i_6;
  reg [7:0] i_7;
  reg [11:0] i_8;
  reg [11:0] i_9;
  reg [0:0] i_10;
  reg [11:0] i_11;
  reg [11:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [3:0] i_16;
  reg [6:0] i_17;
  reg [3:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  usb_fs_nb_in_pe dut (
    .clk_48mhz_i(clk),
    .rst_ni(i_0),
    .link_reset_i(i_1),
    .link_active_i(i_2),
    .dev_addr_i(i_3),
    .in_ep_enabled_i(i_4),
    .in_ep_stall_i(i_5),
    .in_ep_has_data_i(i_6),
    .in_ep_data_i(i_7),
    .in_ep_data_done_i(i_8),
    .in_ep_iso_i(i_9),
    .in_datatog_we_i(i_10),
    .in_datatog_status_i(i_11),
    .in_datatog_mask_i(i_12),
    .rx_pkt_start_i(i_13),
    .rx_pkt_end_i(i_14),
    .rx_pkt_valid_i(i_15),
    .rx_pid_i(i_16),
    .rx_addr_i(i_17),
    .rx_endp_i(i_18),
    .tx_pkt_end_i(i_19),
    .tx_data_get_i(i_20),
    .in_xact_starting_o(out_dut[46:46]),
    .in_xact_start_ep_o(out_dut[45:42]),
    .in_ep_current_o(out_dut[41:38]),
    .in_ep_rollback_o(out_dut[37:37]),
    .in_ep_xact_end_o(out_dut[36:36]),
    .in_ep_get_addr_o(out_dut[35:31]),
    .in_ep_data_get_o(out_dut[30:30]),
    .in_ep_newpkt_o(out_dut[29:29]),
    .in_data_toggle_o(out_dut[28:17]),
    .tx_pkt_start_o(out_dut[16:16]),
    .tx_pid_o(out_dut[15:12]),
    .tx_data_avail_o(out_dut[11:11]),
    .tx_data_o(out_dut[10:3]),
    .event_timeout_in_o(out_dut[2:2]),
    .event_nak_in_o(out_dut[1:1]),
    .event_nodata_in_o(out_dut[0:0])
  );
  usb_fs_nb_in_pe__ref ref_i (
    .clk_48mhz_i(clk),
    .rst_ni(i_0),
    .link_reset_i(i_1),
    .link_active_i(i_2),
    .dev_addr_i(i_3),
    .in_ep_enabled_i(i_4),
    .in_ep_stall_i(i_5),
    .in_ep_has_data_i(i_6),
    .in_ep_data_i(i_7),
    .in_ep_data_done_i(i_8),
    .in_ep_iso_i(i_9),
    .in_datatog_we_i(i_10),
    .in_datatog_status_i(i_11),
    .in_datatog_mask_i(i_12),
    .rx_pkt_start_i(i_13),
    .rx_pkt_end_i(i_14),
    .rx_pkt_valid_i(i_15),
    .rx_pid_i(i_16),
    .rx_addr_i(i_17),
    .rx_endp_i(i_18),
    .tx_pkt_end_i(i_19),
    .tx_data_get_i(i_20),
    .in_xact_starting_o(out_ref[46:46]),
    .in_xact_start_ep_o(out_ref[45:42]),
    .in_ep_current_o(out_ref[41:38]),
    .in_ep_rollback_o(out_ref[37:37]),
    .in_ep_xact_end_o(out_ref[36:36]),
    .in_ep_get_addr_o(out_ref[35:31]),
    .in_ep_data_get_o(out_ref[30:30]),
    .in_ep_newpkt_o(out_ref[29:29]),
    .in_data_toggle_o(out_ref[28:17]),
    .tx_pkt_start_o(out_ref[16:16]),
    .tx_pid_o(out_ref[15:12]),
    .tx_data_avail_o(out_ref[11:11]),
    .tx_data_o(out_ref[10:3]),
    .event_timeout_in_o(out_ref[2:2]),
    .event_nak_in_o(out_ref[1:1]),
    .event_nodata_in_o(out_ref[0:0])
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
    seed = 2751764672;
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
