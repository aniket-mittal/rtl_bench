// Hidden tests: 5000 cycles of seeded random inputs (seed 1886855195); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 454;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [47:0] i_2;
  reg [47:0] i_3;
  reg [15:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [47:0] i_14;
  reg [0:0] i_15;
  reg [5:0] i_16;
  reg [1:0] i_17;
  reg [15:0] i_18;
  reg [7:0] i_19;
  reg [7:0] i_20;
  reg [31:0] i_21;
  reg [31:0] i_22;
  reg [7:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [47:0] i_29;
  reg [31:0] i_30;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01071 dut (
    .clk(clk),
    .rst(i_0),
    .s_eth_hdr_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_eth_payload_axis_tdata(i_5),
    .s_eth_payload_axis_tvalid(i_6),
    .s_eth_payload_axis_tlast(i_7),
    .s_eth_payload_axis_tuser(i_8),
    .m_eth_hdr_ready(i_9),
    .m_eth_payload_axis_tready(i_10),
    .arp_request_ready(i_11),
    .arp_response_valid(i_12),
    .arp_response_error(i_13),
    .arp_response_mac(i_14),
    .s_ip_hdr_valid(i_15),
    .s_ip_dscp(i_16),
    .s_ip_ecn(i_17),
    .s_ip_length(i_18),
    .s_ip_ttl(i_19),
    .s_ip_protocol(i_20),
    .s_ip_source_ip(i_21),
    .s_ip_dest_ip(i_22),
    .s_ip_payload_axis_tdata(i_23),
    .s_ip_payload_axis_tvalid(i_24),
    .s_ip_payload_axis_tlast(i_25),
    .s_ip_payload_axis_tuser(i_26),
    .m_ip_hdr_ready(i_27),
    .m_ip_payload_axis_tready(i_28),
    .local_mac(i_29),
    .local_ip(i_30),
    .s_eth_hdr_ready(out_dut[453:453]),
    .s_eth_payload_axis_tready(out_dut[452:452]),
    .m_eth_hdr_valid(out_dut[451:451]),
    .m_eth_dest_mac(out_dut[450:403]),
    .m_eth_src_mac(out_dut[402:355]),
    .m_eth_type(out_dut[354:339]),
    .m_eth_payload_axis_tdata(out_dut[338:331]),
    .m_eth_payload_axis_tvalid(out_dut[330:330]),
    .m_eth_payload_axis_tlast(out_dut[329:329]),
    .m_eth_payload_axis_tuser(out_dut[328:328]),
    .arp_request_valid(out_dut[327:327]),
    .arp_request_ip(out_dut[326:295]),
    .arp_response_ready(out_dut[294:294]),
    .s_ip_hdr_ready(out_dut[293:293]),
    .s_ip_payload_axis_tready(out_dut[292:292]),
    .m_ip_hdr_valid(out_dut[291:291]),
    .m_ip_eth_dest_mac(out_dut[290:243]),
    .m_ip_eth_src_mac(out_dut[242:195]),
    .m_ip_eth_type(out_dut[194:179]),
    .m_ip_version(out_dut[178:175]),
    .m_ip_ihl(out_dut[174:171]),
    .m_ip_dscp(out_dut[170:165]),
    .m_ip_ecn(out_dut[164:163]),
    .m_ip_length(out_dut[162:147]),
    .m_ip_identification(out_dut[146:131]),
    .m_ip_flags(out_dut[130:128]),
    .m_ip_fragment_offset(out_dut[127:115]),
    .m_ip_ttl(out_dut[114:107]),
    .m_ip_protocol(out_dut[106:99]),
    .m_ip_header_checksum(out_dut[98:83]),
    .m_ip_source_ip(out_dut[82:51]),
    .m_ip_dest_ip(out_dut[50:19]),
    .m_ip_payload_axis_tdata(out_dut[18:11]),
    .m_ip_payload_axis_tvalid(out_dut[10:10]),
    .m_ip_payload_axis_tlast(out_dut[9:9]),
    .m_ip_payload_axis_tuser(out_dut[8:8]),
    .rx_busy(out_dut[7:7]),
    .tx_busy(out_dut[6:6]),
    .rx_error_header_early_termination(out_dut[5:5]),
    .rx_error_payload_early_termination(out_dut[4:4]),
    .rx_error_invalid_header(out_dut[3:3]),
    .rx_error_invalid_checksum(out_dut[2:2]),
    .tx_error_payload_early_termination(out_dut[1:1]),
    .tx_error_arp_failed(out_dut[0:0])
  );
  rtlpp_01071__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .s_eth_hdr_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_eth_payload_axis_tdata(i_5),
    .s_eth_payload_axis_tvalid(i_6),
    .s_eth_payload_axis_tlast(i_7),
    .s_eth_payload_axis_tuser(i_8),
    .m_eth_hdr_ready(i_9),
    .m_eth_payload_axis_tready(i_10),
    .arp_request_ready(i_11),
    .arp_response_valid(i_12),
    .arp_response_error(i_13),
    .arp_response_mac(i_14),
    .s_ip_hdr_valid(i_15),
    .s_ip_dscp(i_16),
    .s_ip_ecn(i_17),
    .s_ip_length(i_18),
    .s_ip_ttl(i_19),
    .s_ip_protocol(i_20),
    .s_ip_source_ip(i_21),
    .s_ip_dest_ip(i_22),
    .s_ip_payload_axis_tdata(i_23),
    .s_ip_payload_axis_tvalid(i_24),
    .s_ip_payload_axis_tlast(i_25),
    .s_ip_payload_axis_tuser(i_26),
    .m_ip_hdr_ready(i_27),
    .m_ip_payload_axis_tready(i_28),
    .local_mac(i_29),
    .local_ip(i_30),
    .s_eth_hdr_ready(out_ref[453:453]),
    .s_eth_payload_axis_tready(out_ref[452:452]),
    .m_eth_hdr_valid(out_ref[451:451]),
    .m_eth_dest_mac(out_ref[450:403]),
    .m_eth_src_mac(out_ref[402:355]),
    .m_eth_type(out_ref[354:339]),
    .m_eth_payload_axis_tdata(out_ref[338:331]),
    .m_eth_payload_axis_tvalid(out_ref[330:330]),
    .m_eth_payload_axis_tlast(out_ref[329:329]),
    .m_eth_payload_axis_tuser(out_ref[328:328]),
    .arp_request_valid(out_ref[327:327]),
    .arp_request_ip(out_ref[326:295]),
    .arp_response_ready(out_ref[294:294]),
    .s_ip_hdr_ready(out_ref[293:293]),
    .s_ip_payload_axis_tready(out_ref[292:292]),
    .m_ip_hdr_valid(out_ref[291:291]),
    .m_ip_eth_dest_mac(out_ref[290:243]),
    .m_ip_eth_src_mac(out_ref[242:195]),
    .m_ip_eth_type(out_ref[194:179]),
    .m_ip_version(out_ref[178:175]),
    .m_ip_ihl(out_ref[174:171]),
    .m_ip_dscp(out_ref[170:165]),
    .m_ip_ecn(out_ref[164:163]),
    .m_ip_length(out_ref[162:147]),
    .m_ip_identification(out_ref[146:131]),
    .m_ip_flags(out_ref[130:128]),
    .m_ip_fragment_offset(out_ref[127:115]),
    .m_ip_ttl(out_ref[114:107]),
    .m_ip_protocol(out_ref[106:99]),
    .m_ip_header_checksum(out_ref[98:83]),
    .m_ip_source_ip(out_ref[82:51]),
    .m_ip_dest_ip(out_ref[50:19]),
    .m_ip_payload_axis_tdata(out_ref[18:11]),
    .m_ip_payload_axis_tvalid(out_ref[10:10]),
    .m_ip_payload_axis_tlast(out_ref[9:9]),
    .m_ip_payload_axis_tuser(out_ref[8:8]),
    .rx_busy(out_ref[7:7]),
    .tx_busy(out_ref[6:6]),
    .rx_error_header_early_termination(out_ref[5:5]),
    .rx_error_payload_early_termination(out_ref[4:4]),
    .rx_error_invalid_header(out_ref[3:3]),
    .rx_error_invalid_checksum(out_ref[2:2]),
    .tx_error_payload_early_termination(out_ref[1:1]),
    .tx_error_arp_failed(out_ref[0:0])
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
    seed = 1886855195;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
      i_3 = {$random(seed), $random(seed)};
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
      i_14 = {$random(seed), $random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed), $random(seed)};
      i_30 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
