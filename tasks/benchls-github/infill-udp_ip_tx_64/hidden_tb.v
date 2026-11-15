// Hidden tests: 5000 cycles of seeded random inputs (seed 3479385303); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 352;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [47:0] i_2;
  reg [47:0] i_3;
  reg [15:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [5:0] i_7;
  reg [1:0] i_8;
  reg [15:0] i_9;
  reg [2:0] i_10;
  reg [12:0] i_11;
  reg [7:0] i_12;
  reg [7:0] i_13;
  reg [15:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [15:0] i_17;
  reg [15:0] i_18;
  reg [15:0] i_19;
  reg [15:0] i_20;
  reg [63:0] i_21;
  reg [7:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  udp_ip_tx_64 dut (
    .clk(clk),
    .rst(i_0),
    .s_udp_hdr_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_ip_version(i_5),
    .s_ip_ihl(i_6),
    .s_ip_dscp(i_7),
    .s_ip_ecn(i_8),
    .s_ip_identification(i_9),
    .s_ip_flags(i_10),
    .s_ip_fragment_offset(i_11),
    .s_ip_ttl(i_12),
    .s_ip_protocol(i_13),
    .s_ip_header_checksum(i_14),
    .s_ip_source_ip(i_15),
    .s_ip_dest_ip(i_16),
    .s_udp_source_port(i_17),
    .s_udp_dest_port(i_18),
    .s_udp_length(i_19),
    .s_udp_checksum(i_20),
    .s_udp_payload_axis_tdata(i_21),
    .s_udp_payload_axis_tkeep(i_22),
    .s_udp_payload_axis_tvalid(i_23),
    .s_udp_payload_axis_tlast(i_24),
    .s_udp_payload_axis_tuser(i_25),
    .m_ip_hdr_ready(i_26),
    .m_ip_payload_axis_tready(i_27),
    .s_udp_hdr_ready(out_dut[351:351]),
    .s_udp_payload_axis_tready(out_dut[350:350]),
    .m_ip_hdr_valid(out_dut[349:349]),
    .m_eth_dest_mac(out_dut[348:301]),
    .m_eth_src_mac(out_dut[300:253]),
    .m_eth_type(out_dut[252:237]),
    .m_ip_version(out_dut[236:233]),
    .m_ip_ihl(out_dut[232:229]),
    .m_ip_dscp(out_dut[228:223]),
    .m_ip_ecn(out_dut[222:221]),
    .m_ip_length(out_dut[220:205]),
    .m_ip_identification(out_dut[204:189]),
    .m_ip_flags(out_dut[188:186]),
    .m_ip_fragment_offset(out_dut[185:173]),
    .m_ip_ttl(out_dut[172:165]),
    .m_ip_protocol(out_dut[164:157]),
    .m_ip_header_checksum(out_dut[156:141]),
    .m_ip_source_ip(out_dut[140:109]),
    .m_ip_dest_ip(out_dut[108:77]),
    .m_ip_payload_axis_tdata(out_dut[76:13]),
    .m_ip_payload_axis_tkeep(out_dut[12:5]),
    .m_ip_payload_axis_tvalid(out_dut[4:4]),
    .m_ip_payload_axis_tlast(out_dut[3:3]),
    .m_ip_payload_axis_tuser(out_dut[2:2]),
    .busy(out_dut[1:1]),
    .error_payload_early_termination(out_dut[0:0])
  );
  udp_ip_tx_64__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .s_udp_hdr_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_ip_version(i_5),
    .s_ip_ihl(i_6),
    .s_ip_dscp(i_7),
    .s_ip_ecn(i_8),
    .s_ip_identification(i_9),
    .s_ip_flags(i_10),
    .s_ip_fragment_offset(i_11),
    .s_ip_ttl(i_12),
    .s_ip_protocol(i_13),
    .s_ip_header_checksum(i_14),
    .s_ip_source_ip(i_15),
    .s_ip_dest_ip(i_16),
    .s_udp_source_port(i_17),
    .s_udp_dest_port(i_18),
    .s_udp_length(i_19),
    .s_udp_checksum(i_20),
    .s_udp_payload_axis_tdata(i_21),
    .s_udp_payload_axis_tkeep(i_22),
    .s_udp_payload_axis_tvalid(i_23),
    .s_udp_payload_axis_tlast(i_24),
    .s_udp_payload_axis_tuser(i_25),
    .m_ip_hdr_ready(i_26),
    .m_ip_payload_axis_tready(i_27),
    .s_udp_hdr_ready(out_ref[351:351]),
    .s_udp_payload_axis_tready(out_ref[350:350]),
    .m_ip_hdr_valid(out_ref[349:349]),
    .m_eth_dest_mac(out_ref[348:301]),
    .m_eth_src_mac(out_ref[300:253]),
    .m_eth_type(out_ref[252:237]),
    .m_ip_version(out_ref[236:233]),
    .m_ip_ihl(out_ref[232:229]),
    .m_ip_dscp(out_ref[228:223]),
    .m_ip_ecn(out_ref[222:221]),
    .m_ip_length(out_ref[220:205]),
    .m_ip_identification(out_ref[204:189]),
    .m_ip_flags(out_ref[188:186]),
    .m_ip_fragment_offset(out_ref[185:173]),
    .m_ip_ttl(out_ref[172:165]),
    .m_ip_protocol(out_ref[164:157]),
    .m_ip_header_checksum(out_ref[156:141]),
    .m_ip_source_ip(out_ref[140:109]),
    .m_ip_dest_ip(out_ref[108:77]),
    .m_ip_payload_axis_tdata(out_ref[76:13]),
    .m_ip_payload_axis_tkeep(out_ref[12:5]),
    .m_ip_payload_axis_tvalid(out_ref[4:4]),
    .m_ip_payload_axis_tlast(out_ref[3:3]),
    .m_ip_payload_axis_tuser(out_ref[2:2]),
    .busy(out_ref[1:1]),
    .error_payload_early_termination(out_ref[0:0])
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
    seed = 3479385303;
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
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed), $random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
