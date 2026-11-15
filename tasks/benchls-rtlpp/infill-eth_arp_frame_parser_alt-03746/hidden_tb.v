// Hidden tests: 5000 cycles of seeded random inputs (seed 1029768134); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 342;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [47:0] i_2;
  reg [47:0] i_3;
  reg [15:0] i_4;
  reg [63:0] i_5;
  reg [7:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03746 dut (
    .clk(clk),
    .rst(i_0),
    .s_eth_hdr_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_eth_payload_axis_tdata(i_5),
    .s_eth_payload_axis_tkeep(i_6),
    .s_eth_payload_axis_tvalid(i_7),
    .s_eth_payload_axis_tlast(i_8),
    .s_eth_payload_axis_tuser(i_9),
    .m_frame_ready(i_10),
    .s_eth_hdr_ready(out_dut[341:341]),
    .s_eth_payload_axis_tready(out_dut[340:340]),
    .m_frame_valid(out_dut[339:339]),
    .m_eth_dest_mac(out_dut[338:291]),
    .m_eth_src_mac(out_dut[290:243]),
    .m_eth_type(out_dut[242:227]),
    .m_arp_htype(out_dut[226:211]),
    .m_arp_ptype(out_dut[210:195]),
    .m_arp_hlen(out_dut[194:187]),
    .m_arp_plen(out_dut[186:179]),
    .m_arp_oper(out_dut[178:163]),
    .m_arp_sha(out_dut[162:115]),
    .m_arp_spa(out_dut[114:83]),
    .m_arp_tha(out_dut[82:35]),
    .m_arp_tpa(out_dut[34:3]),
    .busy(out_dut[2:2]),
    .error_header_early_termination(out_dut[1:1]),
    .error_invalid_header(out_dut[0:0])
  );
  rtlpp_03746__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .s_eth_hdr_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_eth_payload_axis_tdata(i_5),
    .s_eth_payload_axis_tkeep(i_6),
    .s_eth_payload_axis_tvalid(i_7),
    .s_eth_payload_axis_tlast(i_8),
    .s_eth_payload_axis_tuser(i_9),
    .m_frame_ready(i_10),
    .s_eth_hdr_ready(out_ref[341:341]),
    .s_eth_payload_axis_tready(out_ref[340:340]),
    .m_frame_valid(out_ref[339:339]),
    .m_eth_dest_mac(out_ref[338:291]),
    .m_eth_src_mac(out_ref[290:243]),
    .m_eth_type(out_ref[242:227]),
    .m_arp_htype(out_ref[226:211]),
    .m_arp_ptype(out_ref[210:195]),
    .m_arp_hlen(out_ref[194:187]),
    .m_arp_plen(out_ref[186:179]),
    .m_arp_oper(out_ref[178:163]),
    .m_arp_sha(out_ref[162:115]),
    .m_arp_spa(out_ref[114:83]),
    .m_arp_tha(out_ref[82:35]),
    .m_arp_tpa(out_ref[34:3]),
    .busy(out_ref[2:2]),
    .error_header_early_termination(out_ref[1:1]),
    .error_invalid_header(out_ref[0:0])
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
    seed = 1029768134;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
