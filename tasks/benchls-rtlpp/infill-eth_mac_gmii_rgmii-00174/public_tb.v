// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00174 dut (
    .gtx_clk(clk),
    .refclk(in_vec[109:109]),
    .glbl_rstn(in_vec[108:108]),
    .rx_axi_rstn(in_vec[107:107]),
    .tx_axi_rstn(in_vec[106:106]),
    .tx_ifg_delay(in_vec[105:98]),
    .tx_axis_mac_tdata(in_vec[97:90]),
    .tx_axis_mac_tvalid(in_vec[89:89]),
    .tx_axis_mac_tlast(in_vec[88:88]),
    .tx_axis_mac_tuser(in_vec[87:87]),
    .pause_req(in_vec[86:86]),
    .pause_val(in_vec[85:70]),
    .rgmii_rxd(in_vec[69:66]),
    .rgmii_rx_ctl(in_vec[65:65]),
    .rgmii_rxc(in_vec[64:64]),
    .mdio_i(in_vec[63:63]),
    .s_axi_aclk(in_vec[62:62]),
    .s_axi_resetn(in_vec[61:61]),
    .s_axi_awaddr(in_vec[60:49]),
    .s_axi_awvalid(in_vec[48:48]),
    .s_axi_wdata(in_vec[47:16]),
    .s_axi_wvalid(in_vec[15:15]),
    .s_axi_bready(in_vec[14:14]),
    .s_axi_araddr(in_vec[13:2]),
    .s_axi_arvalid(in_vec[1:1]),
    .s_axi_rready(in_vec[0:0]),
    .gtx_clk_out(out_vec[143:143]),
    .gtx_clk90_out(out_vec[142:142]),
    .rx_enable(out_vec[141:141]),
    .rx_statistics_vector(out_vec[140:113]),
    .rx_statistics_valid(out_vec[112:112]),
    .rx_mac_aclk(out_vec[111:111]),
    .rx_reset(out_vec[110:110]),
    .rx_axis_mac_tdata(out_vec[109:102]),
    .rx_axis_mac_tvalid(out_vec[101:101]),
    .rx_axis_mac_tlast(out_vec[100:100]),
    .rx_axis_mac_tuser(out_vec[99:99]),
    .rx_axis_filter_tuser(out_vec[98:94]),
    .tx_enable(out_vec[93:93]),
    .tx_statistics_vector(out_vec[92:61]),
    .tx_statistics_valid(out_vec[60:60]),
    .tx_mac_aclk(out_vec[59:59]),
    .tx_reset(out_vec[58:58]),
    .tx_axis_mac_tready(out_vec[57:57]),
    .speedis100(out_vec[56:56]),
    .speedis10100(out_vec[55:55]),
    .rgmii_txd(out_vec[54:51]),
    .rgmii_tx_ctl(out_vec[50:50]),
    .rgmii_txc(out_vec[49:49]),
    .inband_link_status(out_vec[48:48]),
    .inband_clock_speed(out_vec[47:46]),
    .inband_duplex_status(out_vec[45:45]),
    .mdio_o(out_vec[44:44]),
    .mdio_t(out_vec[43:43]),
    .mdc(out_vec[42:42]),
    .s_axi_awready(out_vec[41:41]),
    .s_axi_wready(out_vec[40:40]),
    .s_axi_bresp(out_vec[39:38]),
    .s_axi_bvalid(out_vec[37:37]),
    .s_axi_arready(out_vec[36:36]),
    .s_axi_rdata(out_vec[35:4]),
    .s_axi_rresp(out_vec[3:2]),
    .s_axi_rvalid(out_vec[1:1]),
    .mac_irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h274de54b4403be1fd4a442c080c4;
    stim[1] = 110'h2fdbb9eb3ee18fa2ab20915feaa3;
    stim[2] = 110'h1f83dc306e344e5dd14e86d5ce2b;
    stim[3] = 110'h10518d7da9247c5ba4eef6e44fc6;
    stim[4] = 110'h3f44ce88f6af9bd6368e9665675e;
    stim[5] = 110'h317d628382139d0ba41c39cae8e1;
    stim[6] = 110'h353cf04fdf8d4caa619d47b1fa59;
    stim[7] = 110'h11f174bd00da51fc624bfc770e25;
    stim[8] = 110'h139ce9612a476f69eaeca22fbc14;
    stim[9] = 110'h029db718cdff7633bdc3e0197575;
    stim[10] = 110'h3c1986958a4afb0ee50c1c8ddb70;
    stim[11] = 110'h1bdb9546a52c81d9761eb5ea1053;
    stim[12] = 110'h1fd86409d8f93b25389fe7cf0395;
    stim[13] = 110'h164c09b3dd4fd1f9d9daf72abaf7;
    stim[14] = 110'h31af86c1079b2a0b8befaf296ef6;
    stim[15] = 110'h3e5e2379a6ce4276f6a4ec111c11;
    stim[16] = 110'h31e31886816ab0a6e64be16a576c;
    stim[17] = 110'h125c66239fba28868ca311001998;
    stim[18] = 110'h3291dd0e3714eaa184c9c9e886dc;
    stim[19] = 110'h3c81b605c5f234c9f4defc77db01;
    stim[20] = 110'h3bb3b5520280fc01190ed15762c0;
    stim[21] = 110'h16aa75cd94b2ae3c1ae91a094c92;
    stim[22] = 110'h3851bc637d68df1a3756c49604c3;
    stim[23] = 110'h1fb4b91dc64d30fb66d5de952184;
    stim[24] = 110'h393a0ad51e30d3dd4b849ff81c91;
    stim[25] = 110'h3c6c47d3d71d726dab7d519dddb5;
    stim[26] = 110'h195cb5ea8957ca5757bb8a8246f6;
    stim[27] = 110'h3ae7d429d0971634d01ae50c26d8;
    stim[28] = 110'h3d6bfa81ccbbdb477ab9a3f24ead;
    stim[29] = 110'h1b04b694854e691b015a1898b1bc;
    stim[30] = 110'h36378de49b83b0350f936923b2b4;
    stim[31] = 110'h3cc0a622286241fca2e379e3ee86;
    stim[32] = 110'h12f6dda028c7257a7019fb2eac52;
    stim[33] = 110'h3db8683d3c0fe1a1220068493851;
    stim[34] = 110'h1d45bc26d30188373408e50c799f;
    stim[35] = 110'h16357f9687ba4d4cf830e9cfc213;
    stim[36] = 110'h3745331f84d0519548576e561794;
    stim[37] = 110'h34884cf9ea432bbfcc1bf5602693;
    stim[38] = 110'h165e27e95fd1bc3a2bdb725aa981;
    stim[39] = 110'h3733e4bbfbe6eff9f760b232d7df;
    stim[40] = 110'h1647239549c5d21738070670634a;
    stim[41] = 110'h1e8572ea1186afc2984971df9a91;
    stim[42] = 110'h137423472ecdf7c85732495534f0;
    stim[43] = 110'h31cd87dab4dc617ca17f50fbe380;
    stim[44] = 110'h1f82c3f7975bc754c356f0e0e5a9;
    stim[45] = 110'h3e5492ddd95d1c503e41e9b207b9;
    stim[46] = 110'h3a977f2a8dc0acd97134d90900c8;
    stim[47] = 110'h17bbf36b05ba421e6da5bc89cbce;
    stim[48] = 110'h19aa246758695765f002e14b2074;
    stim[49] = 110'h33a7f3b454bb7eb5c6c7bc17daec;
    stim[50] = 110'h320fce440c029fd8c20b0d5d12ea;
    stim[51] = 110'h36ba1d79ca74727ba90c233707b7;
    stim[52] = 110'h3c1875f8b2cc85dfcfb3f3ef1ff0;
    stim[53] = 110'h180d44e1a11146a1ae845defc474;
    stim[54] = 110'h3b79154ee94d7095c80adf81a514;
    stim[55] = 110'h19e80e76be680c9f9d564b749458;
    stim[56] = 110'h186b805f5755cb2b921a1462f2ff;
    stim[57] = 110'h18a45f8d10a8ffd194929b18b2d0;
    stim[58] = 110'h3ee72a57072a6c5c1d217c8c685f;
    stim[59] = 110'h184210b371c00bb886c6714bad2a;
    stim[60] = 110'h1fc6a8bb8f439df64f643f45981a;
    stim[61] = 110'h1170be30b09798c887896b241b5e;
    stim[62] = 110'h1312e16f246356cd9f752b3d5172;
    stim[63] = 110'h105da6b19924ec806384c21803d0;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 144'h000000000000000000d30000000000000000;
      expv[1] = 144'h000000000000000000f60000000000000000;
      expv[2] = 144'h000000000000000000e00000000000000000;
      expv[3] = 144'h000000000000000000140000000000000000;
      expv[4] = 144'h000000000000000000d10000000000000000;
      expv[5] = 144'h0000000000000000005f0000000000000000;
      expv[6] = 144'h0000000000000000004f0000000000000000;
      expv[7] = 144'h0000000000000000007c0000000000000000;
      expv[8] = 144'h000000000000000000e70000000000000000;
      expv[9] = 144'h000000000000000000a70000000000000000;
      expv[10] = 144'h000000000000000000060000000000000000;
      expv[11] = 144'h000000000000000000f60000000000000000;
      expv[12] = 144'h000000000000000000f60000000000000000;
      expv[13] = 144'h000000000000000000930000000000000000;
      expv[14] = 144'h0000000000000000006b0000000000000000;
      expv[15] = 144'h000000000000000000970000000000000000;
      expv[16] = 144'h000000000000000000780000000000000000;
      expv[17] = 144'h000000000000000000970000000000000000;
      expv[18] = 144'h000000000000000000a40000000000000000;
      expv[19] = 144'h000000000000000000200000000000000000;
      expv[20] = 144'h000000000000000000ec0000000000000000;
      expv[21] = 144'h000000000000000000aa0000000000000000;
      expv[22] = 144'h000000000000000000140000000000000000;
      expv[23] = 144'h000000000000000000ed0000000000000000;
      expv[24] = 144'h0000000000000000004e0000000000000000;
      expv[25] = 144'h0000000000000000001b0000000000000000;
      expv[26] = 144'h000000000000000000570000000000000000;
      expv[27] = 144'h000000000000000000b90000000000000000;
      expv[28] = 144'h0000000000000000005a0000000000000000;
      expv[29] = 144'h000000000000000000c10000000000000000;
      expv[30] = 144'h0000000000000000008d0000000000000000;
      expv[31] = 144'h000000000000000000300000000000000000;
      expv[32] = 144'h000000000000000000bd0000000000000000;
      expv[33] = 144'h0000000000000000006e0000000000000000;
      expv[34] = 144'h000000000000000000510000000000000000;
      expv[35] = 144'h0000000000000000008d0000000000000000;
      expv[36] = 144'h000000000000000000d10000000000000000;
      expv[37] = 144'h000000000000000000220000000000000000;
      expv[38] = 144'h000000000000000000970000000000000000;
      expv[39] = 144'h000000000000000000cc0000000000000000;
      expv[40] = 144'h000000000000000000910000000000000000;
      expv[41] = 144'h000000000000000000a10000000000000000;
      expv[42] = 144'h000000000000000000dd0000000000000000;
      expv[43] = 144'h000000000000000000730000000000000000;
      expv[44] = 144'h000000000000000000e00000000000000000;
      expv[45] = 144'h000000000000000000950000000000000000;
      expv[46] = 144'h000000000000000000a50000000000000000;
      expv[47] = 144'h000000000000000000ee0000000000000000;
      expv[48] = 144'h0000000000000000006a0000000000000000;
      expv[49] = 144'h000000000000000000e90000000000000000;
      expv[50] = 144'h000000000000000000830000000000000000;
      expv[51] = 144'h000000000000000000ae0000000000000000;
      expv[52] = 144'h000000000000000000060000000000000000;
      expv[53] = 144'h000000000000000000030000000000000000;
      expv[54] = 144'h000000000000000000de0000000000000000;
      expv[55] = 144'h0000000000000000007a0000000000000000;
      expv[56] = 144'h0000000000000000001a0000000000000000;
      expv[57] = 144'h000000000000000000290000000000000000;
      expv[58] = 144'h000000000000000000b90000000000000000;
      expv[59] = 144'h000000000000000000100000000000000000;
      expv[60] = 144'h000000000000000000f10000000000000000;
      expv[61] = 144'h0000000000000000005c0000000000000000;
      expv[62] = 144'h000000000000000000c40000000000000000;
      expv[63] = 144'h000000000000000000170000000000000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
