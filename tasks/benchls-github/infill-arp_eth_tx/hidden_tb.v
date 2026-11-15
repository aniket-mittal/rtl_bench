// Hidden tests: 5000 cycles of seeded random inputs (seed 1395274220); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 127;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [47:0] i_2;
  reg [47:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [47:0] i_8;
  reg [31:0] i_9;
  reg [47:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  arp_eth_tx dut (
    .clk(clk),
    .rst(i_0),
    .s_frame_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_arp_htype(i_5),
    .s_arp_ptype(i_6),
    .s_arp_oper(i_7),
    .s_arp_sha(i_8),
    .s_arp_spa(i_9),
    .s_arp_tha(i_10),
    .s_arp_tpa(i_11),
    .m_eth_hdr_ready(i_12),
    .m_eth_payload_axis_tready(i_13),
    .s_frame_ready(out_dut[126:126]),
    .m_eth_hdr_valid(out_dut[125:125]),
    .m_eth_dest_mac(out_dut[124:77]),
    .m_eth_src_mac(out_dut[76:29]),
    .m_eth_type(out_dut[28:13]),
    .m_eth_payload_axis_tdata(out_dut[12:5]),
    .m_eth_payload_axis_tkeep(out_dut[4:4]),
    .m_eth_payload_axis_tvalid(out_dut[3:3]),
    .m_eth_payload_axis_tlast(out_dut[2:2]),
    .m_eth_payload_axis_tuser(out_dut[1:1]),
    .busy(out_dut[0:0])
  );
  arp_eth_tx__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .s_frame_valid(i_1),
    .s_eth_dest_mac(i_2),
    .s_eth_src_mac(i_3),
    .s_eth_type(i_4),
    .s_arp_htype(i_5),
    .s_arp_ptype(i_6),
    .s_arp_oper(i_7),
    .s_arp_sha(i_8),
    .s_arp_spa(i_9),
    .s_arp_tha(i_10),
    .s_arp_tpa(i_11),
    .m_eth_hdr_ready(i_12),
    .m_eth_payload_axis_tready(i_13),
    .s_frame_ready(out_ref[126:126]),
    .m_eth_hdr_valid(out_ref[125:125]),
    .m_eth_dest_mac(out_ref[124:77]),
    .m_eth_src_mac(out_ref[76:29]),
    .m_eth_type(out_ref[28:13]),
    .m_eth_payload_axis_tdata(out_ref[12:5]),
    .m_eth_payload_axis_tkeep(out_ref[4:4]),
    .m_eth_payload_axis_tvalid(out_ref[3:3]),
    .m_eth_payload_axis_tlast(out_ref[2:2]),
    .m_eth_payload_axis_tuser(out_ref[1:1]),
    .busy(out_ref[0:0])
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
    seed = 1395274220;
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
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed), $random(seed)};
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
