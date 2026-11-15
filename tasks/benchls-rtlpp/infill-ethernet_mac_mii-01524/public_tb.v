// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 117;
  localparam OW = 143;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01524 dut (
    .gtx_clk(in_vec[116:116]),
    .refclk(in_vec[115:115]),
    .glbl_rstn(in_vec[114:114]),
    .rx_axi_rstn(in_vec[113:113]),
    .tx_axi_rstn(in_vec[112:112]),
    .tx_ifg_delay(in_vec[111:104]),
    .tx_axis_mac_tdata(in_vec[103:96]),
    .tx_axis_mac_tvalid(in_vec[95:95]),
    .tx_axis_mac_tlast(in_vec[94:94]),
    .tx_axis_mac_tuser(in_vec[93:93]),
    .pause_req(in_vec[92:92]),
    .pause_val(in_vec[91:76]),
    .gmii_rxd(in_vec[75:68]),
    .gmii_rx_dv(in_vec[67:67]),
    .gmii_rx_er(in_vec[66:66]),
    .gmii_rx_clk(in_vec[65:65]),
    .mii_tx_clk(in_vec[64:64]),
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
    .rx_enable(out_vec[142:142]),
    .rx_statistics_vector(out_vec[141:114]),
    .rx_statistics_valid(out_vec[113:113]),
    .rx_mac_aclk(out_vec[112:112]),
    .rx_reset(out_vec[111:111]),
    .rx_axis_mac_tdata(out_vec[110:103]),
    .rx_axis_mac_tvalid(out_vec[102:102]),
    .rx_axis_mac_tlast(out_vec[101:101]),
    .rx_axis_mac_tuser(out_vec[100:100]),
    .rx_axis_filter_tuser(out_vec[99:95]),
    .tx_enable(out_vec[94:94]),
    .tx_statistics_vector(out_vec[93:62]),
    .tx_statistics_valid(out_vec[61:61]),
    .tx_mac_aclk(out_vec[60:60]),
    .tx_reset(out_vec[59:59]),
    .tx_axis_mac_tready(out_vec[58:58]),
    .speedis100(out_vec[57:57]),
    .speedis10100(out_vec[56:56]),
    .gmii_txd(out_vec[55:48]),
    .gmii_tx_en(out_vec[47:47]),
    .gmii_tx_er(out_vec[46:46]),
    .gmii_tx_clk(out_vec[45:45]),
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
    stim[0] = 117'h0875e2cc6894fc07222e7c8e700a35;
    stim[1] = 117'h18f1d5bb9bfc5ee57c77b12db09978;
    stim[2] = 117'h0f03d1ef1019717457121d514f4a4b;
    stim[3] = 117'h1450d90a7b4b4225eb3c6dd1e366c0;
    stim[4] = 117'h1e9ddd643bef0f306c561bc3546801;
    stim[5] = 117'h1d6574aba2058782fc6fac14d32cdc;
    stim[6] = 117'h1dd00e7d1b15e3a2986e5e1ba25a81;
    stim[7] = 117'h076e99c668291ad520f10fe0a43065;
    stim[8] = 117'h16a7b23b2cc3b3e80f358b0900cbbd;
    stim[9] = 117'h07698039bc6887e4ab1f5d67d1be6c;
    stim[10] = 117'h1742d9508d8f736f0a3329fcb6ff57;
    stim[11] = 117'h0d7046be6734461d27d892d5415c37;
    stim[12] = 117'h04d1cd05bdb45f83b8d537245c549f;
    stim[13] = 117'h1f1ccaaa685db4205c7baf6e190e1c;
    stim[14] = 117'h1758c15e268c03e2a0a91ce2a5d79f;
    stim[15] = 117'h044249d53b0fb141a328d41680edb7;
    stim[16] = 117'h0c8ea8b089e539ecd4e323d56386db;
    stim[17] = 117'h1c9bf798be62086de0f68fbc525a16;
    stim[18] = 117'h0ca9e84c6401461983b493045ac5aa;
    stim[19] = 117'h0f12751ec725d9cbd0dcc7dbba9b3b;
    stim[20] = 117'h042c97cc6990f816ef2b1578cb4a52;
    stim[21] = 117'h04d635ce036d5ac73f20a00fa1371f;
    stim[22] = 117'h14fe6d49afdb79a3762b3cd778989f;
    stim[23] = 117'h01b8efc432fab0b2cc192847942335;
    stim[24] = 117'h0698e5aa8425280b47377c200b1412;
    stim[25] = 117'h17ec017bcec56cd821e440a02d2a4f;
    stim[26] = 117'h0e26f739173011db5b98febe56c2f5;
    stim[27] = 117'h0627649828cb8178529d3929456efe;
    stim[28] = 117'h074bffdb7a56bccdff2e30ab7a33a9;
    stim[29] = 117'h0c15b1d5a1493f396795590bfd1814;
    stim[30] = 117'h162c24bd3b9bbd673e68788e5e16b2;
    stim[31] = 117'h0dd1bc6c37618ef456e24d18c3bd55;
    stim[32] = 117'h0cd9a2548b55e1a9f03a4eeaf2181a;
    stim[33] = 117'h0ed446ca45065cf11ae52e2be8bf03;
    stim[34] = 117'h17f6bd7e28287de4cbc36c8dc1fa6a;
    stim[35] = 117'h15d647368f21c5aea15357db96a8f8;
    stim[36] = 117'h05ee3400f371bcdb4d1d1594624a9b;
    stim[37] = 117'h1cbe9dbdd900d8f0a774200d4b177f;
    stim[38] = 117'h0dc369db4f9a51a46e718fc256b150;
    stim[39] = 117'h0438943e2f2010140336f90c199d7a;
    stim[40] = 117'h05007bfaa5f995a335e5256c661401;
    stim[41] = 117'h1589a662623ad9f0008aeddc3c952a;
    stim[42] = 117'h0c81d784c9810b1d3111fb2fd93c3a;
    stim[43] = 117'h1ea149a85911845093afb1425fdd08;
    stim[44] = 117'h0e88bd018a33df08c2fccc0ffbcfca;
    stim[45] = 117'h1f513e2e7d121dcf083b9c4e9541d5;
    stim[46] = 117'h0d1d26d087db673c97a8caea12d094;
    stim[47] = 117'h0ff3783c33aae2a0fedfc3f26618e0;
    stim[48] = 117'h057747e4b22887d0ad8c438902bef4;
    stim[49] = 117'h1f0e6a416373dc16e55fc03a006145;
    stim[50] = 117'h1500c3e66d880a311fa5451ecc74da;
    stim[51] = 117'h04a8e6d7d753dba8a6fc867b41ea49;
    stim[52] = 117'h0dd0012df86679ab1d1a32b991a949;
    stim[53] = 117'h17e6e22bf3cdbcb365455633592c0c;
    stim[54] = 117'h1679522f580c545d3478bcf0484f85;
    stim[55] = 117'h0eaa2a6415005535c7dc1c8941bbf6;
    stim[56] = 117'h04946bbb770b6e80968ff53237f767;
    stim[57] = 117'h07fff37f4c59d4dd40bf6c98fc4c10;
    stim[58] = 117'h123c3ef679b1321aab0a15bf17ee1a;
    stim[59] = 117'h1652419f244298aa427c4538b9a53d;
    stim[60] = 117'h17b2788f0eea121d9ef639ddd9160b;
    stim[61] = 117'h14f1227d9151db73c816e98dbd9317;
    stim[62] = 117'h0787d03862b4472e6469f95aa2e052;
    stim[63] = 117'h1611828d267139aab3919cb97568e9;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 143'h400000008000400000000c00033000000002;
      expv[1] = 143'h400000018000400000001c00233000000002;
      expv[2] = 143'h400000000000400000000400033000000002;
      expv[3] = 143'h400000018000400000001c00233000000002;
      expv[4] = 143'h400000010000400000001c00233000000002;
      expv[5] = 143'h400000018000400000001400233000000002;
      expv[6] = 143'h400000018000400000001400233000000002;
      expv[7] = 143'h400000000000400000000400033000000002;
      expv[8] = 143'h400000010000400000001c00233000000002;
      expv[9] = 143'h400000000000400000000400033000000002;
      expv[10] = 143'h400000010000400000001400233000000002;
      expv[11] = 143'h400000008000400000000400033000000002;
      expv[12] = 143'h400000008000400000000c00033000000002;
      expv[13] = 143'h400000010000400000001400233000000002;
      expv[14] = 143'h400000010000400000001400233000000002;
      expv[15] = 143'h400000008000400000000c00033000000002;
      expv[16] = 143'h400000008000400000000c00033000000002;
      expv[17] = 143'h400000018000400000001c00233000000002;
      expv[18] = 143'h400000008000400000000c00033000000002;
      expv[19] = 143'h400000000000400000000400033000000002;
      expv[20] = 143'h400000008000400000000c00033000000002;
      expv[21] = 143'h400000008000400000000c00033000000002;
      expv[22] = 143'h400000018000400000001c00233000000002;
      expv[23] = 143'h400000008000400000000400033000000002;
      expv[24] = 143'h400000000000400000000c00033000000002;
      expv[25] = 143'h400000010000400000001400233000000002;
      expv[26] = 143'h400000000000400000000c00033000000002;
      expv[27] = 143'h400000000000400000000c00033000000002;
      expv[28] = 143'h400000000000400000000400033000000002;
      expv[29] = 143'h400000008000400000000c00033000000002;
      expv[30] = 143'h400000010000400000001c00233000000002;
      expv[31] = 143'h400000008000400000000400033000000002;
      expv[32] = 143'h400000008000400000000c00033000000002;
      expv[33] = 143'h400000000000400000000c00033000000002;
      expv[34] = 143'h400000010000400000001400233000000002;
      expv[35] = 143'h400000018000400000001400233000000002;
      expv[36] = 143'h400000008000400000000400033000000002;
      expv[37] = 143'h400000018000400000001c00233000000002;
      expv[38] = 143'h400000008000400000000400033000000002;
      expv[39] = 143'h400000008000400000000c00033000000002;
      expv[40] = 143'h400000008000400000000400033000000002;
      expv[41] = 143'h400000018000400000001400233000000002;
      expv[42] = 143'h400000008000400000000c00033000000002;
      expv[43] = 143'h400000010000400000001c00233000000002;
      expv[44] = 143'h400000000000400000000c00033000000002;
      expv[45] = 143'h400000010000400000001400233000000002;
      expv[46] = 143'h400000008000400000000400033000000002;
      expv[47] = 143'h400000000000400000000400033000000002;
      expv[48] = 143'h400000008000400000000400033000000002;
      expv[49] = 143'h400000010000400000001400233000000002;
      expv[50] = 143'h400000018000400000001400233000000002;
      expv[51] = 143'h400000008000400000000c00033000000002;
      expv[52] = 143'h400000008000400000000400033000000002;
      expv[53] = 143'h400000010000400000001400233000000002;
      expv[54] = 143'h400000010000400000001c00233000000002;
      expv[55] = 143'h400000000000400000000c00033000000002;
      expv[56] = 143'h400000008000400000000c00033000000002;
      expv[57] = 143'h400000000000400000000400033000000002;
      expv[58] = 143'h400000010000400000001c00233000000002;
      expv[59] = 143'h400000010000400000001c00233000000002;
      expv[60] = 143'h400000010000400000001400233000000002;
      expv[61] = 143'h400000018000400000001c00233000000002;
      expv[62] = 143'h400000000000400000000400033000000002;
      expv[63] = 143'h400000010000400000001c00233000000002;
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
