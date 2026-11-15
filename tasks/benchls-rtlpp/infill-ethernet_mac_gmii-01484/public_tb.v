// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 132;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01484 dut (
    .gtx_clk(clk),
    .glbl_rstn(in_vec[111:111]),
    .rx_axi_rstn(in_vec[110:110]),
    .tx_axi_rstn(in_vec[109:109]),
    .tx_ifg_delay(in_vec[108:101]),
    .tx_axis_mac_tdata(in_vec[100:93]),
    .tx_axis_mac_tvalid(in_vec[92:92]),
    .tx_axis_mac_tlast(in_vec[91:91]),
    .tx_axis_mac_tuser(in_vec[90:90]),
    .pause_req(in_vec[89:89]),
    .pause_val(in_vec[88:73]),
    .gmii_rxd(in_vec[72:65]),
    .gmii_rx_dv(in_vec[64:64]),
    .gmii_rx_er(in_vec[63:63]),
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
    .rx_statistics_vector(out_vec[131:104]),
    .rx_statistics_valid(out_vec[103:103]),
    .rx_mac_aclk(out_vec[102:102]),
    .rx_reset(out_vec[101:101]),
    .rx_axis_mac_tdata(out_vec[100:93]),
    .rx_axis_mac_tvalid(out_vec[92:92]),
    .rx_axis_mac_tlast(out_vec[91:91]),
    .rx_axis_mac_tuser(out_vec[90:90]),
    .tx_statistics_vector(out_vec[89:58]),
    .tx_statistics_valid(out_vec[57:57]),
    .tx_mac_aclk(out_vec[56:56]),
    .tx_reset(out_vec[55:55]),
    .tx_axis_mac_tready(out_vec[54:54]),
    .speedis100(out_vec[53:53]),
    .speedis10100(out_vec[52:52]),
    .gmii_txd(out_vec[51:44]),
    .gmii_tx_en(out_vec[43:43]),
    .gmii_tx_er(out_vec[42:42]),
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
    stim[0] = 112'h2c21d625be9fac583d5e2f6cbe60;
    stim[1] = 112'h6aadb4731df0097e7dbb131d3bc8;
    stim[2] = 112'hc9f12ffac5f91a40d3fe7e6b47da;
    stim[3] = 112'head53fe1541f77f1965bf3166fda;
    stim[4] = 112'h99eb3be524cc6a6fba61a23d7668;
    stim[5] = 112'hbd3795d7381eb1d5875dccbc77c2;
    stim[6] = 112'habee77e9540771d8f37a4f14e2aa;
    stim[7] = 112'hc6e7dd5c30981766cbe83febff8e;
    stim[8] = 112'hd430ab614f767ec2067f7eee8613;
    stim[9] = 112'hac1fee04e178001c7b139d891215;
    stim[10] = 112'hdb572b7f442eb645f98c0b0dc518;
    stim[11] = 112'hadf31a8b8f07c5bc4ced6265227e;
    stim[12] = 112'hafcd93c4882a7963c072add4f8dc;
    stim[13] = 112'hffb8511af6667dfeff39d691d32e;
    stim[14] = 112'hfb85f320399dc04d82479db8f20c;
    stim[15] = 112'h8a98bd8cadb123efae485fc82880;
    stim[16] = 112'hbe8684513e43b7791b1ed5a9a545;
    stim[17] = 112'hcd53ce1f672a6ad68132257a36be;
    stim[18] = 112'h957229e5f68c4f8a3a0e7c55483f;
    stim[19] = 112'h9b36eb2f98ba233fd30e537bf03c;
    stim[20] = 112'hc0f6aec94fe5911363f6386c2910;
    stim[21] = 112'hcd1959d5c4184f15fdee7e762c5b;
    stim[22] = 112'he204ab1d2c648f8da3f12ed2b28d;
    stim[23] = 112'h0f37a5ae69a5811cacf754328ece;
    stim[24] = 112'h95013a83cf570b04af0ecf1fe6d0;
    stim[25] = 112'h94b1725d8a1a46e811238bf0b69a;
    stim[26] = 112'hffca5976ea3d818b33bb6c5744d0;
    stim[27] = 112'h8abd723084f5d04c976d63c1e8bb;
    stim[28] = 112'hfdd7a09c0fefa518a82b28ea5070;
    stim[29] = 112'h9c4840cbb0c108658750e8814523;
    stim[30] = 112'hbcdf785a05a27c36af631e0ed519;
    stim[31] = 112'hbdcf761582f0d70f0c7a085e6f94;
    stim[32] = 112'hd879f0012ab59d605962ca68720b;
    stim[33] = 112'h8042abec0094ab5e8f1d0af62476;
    stim[34] = 112'hc9f0172f1bcbe9b7bac78a488e7b;
    stim[35] = 112'hd781818ee2cddc5d545f47a25985;
    stim[36] = 112'hc10f1d02933b6c97abd50f99043e;
    stim[37] = 112'hca481db6ecc02014f461cc946fec;
    stim[38] = 112'hd9f27f4ab26c786139e2b083b112;
    stim[39] = 112'hd52c6578681653898c03c197ae13;
    stim[40] = 112'h9102e53209752b732d071485b6c8;
    stim[41] = 112'h837d06545e4f725a02d7dac3ee00;
    stim[42] = 112'heade989dc67a3a59aec13491bb7b;
    stim[43] = 112'hcce0cab9f04d35f2765de979b3eb;
    stim[44] = 112'h9de3320483ff1a4cabdea1aab27e;
    stim[45] = 112'hf1e3be439da47e69e88a2844b191;
    stim[46] = 112'he5d3abdb40f9a0b0393590660bd8;
    stim[47] = 112'hd9f7c51748bfac4ba6ce7e94f9d3;
    stim[48] = 112'h855c0818a55ee0d0e85dc42d8efb;
    stim[49] = 112'ha4d2998584c6f6a82c1d33ce355f;
    stim[50] = 112'hbc7ec067d09f3433233b0e4667cd;
    stim[51] = 112'hf8a0d338fb46181568ad8a3fb713;
    stim[52] = 112'hff3d2fcdd3244be884aed3729393;
    stim[53] = 112'hcf7ccf69e74d798a4a232766ecc0;
    stim[54] = 112'hfe87e1aea068becb2bca1928ef86;
    stim[55] = 112'hce5e194b09137055eb19d9fc2081;
    stim[56] = 112'hae14110f94db9a822135e52d444b;
    stim[57] = 112'hc96a89b39c8be26bd616021fda45;
    stim[58] = 112'hc3f319277cbdff9747c7ac9e2759;
    stim[59] = 112'ha991c182058f19b59e8bd53cb397;
    stim[60] = 112'hb4eaeb2b7fdb2b3dec60577b13ee;
    stim[61] = 112'hb50b411103ab72ed5237289e46e9;
    stim[62] = 112'hdc96e60c785e62c885c317ecdbfb;
    stim[63] = 112'h88a5d70b64ee01cb3b49871fd114;
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
      expv[0] = 132'h000000020000000000080000000000000;
      expv[1] = 132'h000000020000000000080000000000000;
      expv[2] = 132'h000000020000000000080000000000000;
      expv[3] = 132'h000000060000000000180000000000000;
      expv[4] = 132'h000000020000000000080000000000000;
      expv[5] = 132'h000000060000000000180000000000000;
      expv[6] = 132'h000000020000000000080000000000000;
      expv[7] = 132'h000000060000000000180000000000000;
      expv[8] = 132'h000000020000000000080000000000000;
      expv[9] = 132'h000000060000000000180000000000000;
      expv[10] = 132'h000000020000000000080000000000000;
      expv[11] = 132'h000000060000000000180000000000000;
      expv[12] = 132'h000000020000000000080000000000000;
      expv[13] = 132'h000000060000000000180000000000000;
      expv[14] = 132'h000000020000000000080000000000000;
      expv[15] = 132'h000000060000000000180000000000000;
      expv[16] = 132'h000000020000000000080000000000000;
      expv[17] = 132'h000000060000000000180000000000000;
      expv[18] = 132'h000000020000000000080000000000000;
      expv[19] = 132'h000000060000000000180000000000000;
      expv[20] = 132'h000000020000000000080000000000000;
      expv[21] = 132'h000000060000000000180000000000000;
      expv[22] = 132'h000000020000000000080000000000000;
      expv[23] = 132'h000000020000000000080000000000000;
      expv[24] = 132'h000000020000000000080000000000000;
      expv[25] = 132'h000000060000000000180000000000000;
      expv[26] = 132'h000000020000000000080000000000000;
      expv[27] = 132'h000000060000000000180000000000000;
      expv[28] = 132'h000000020000000000080000000000000;
      expv[29] = 132'h000000060000000000180000000000000;
      expv[30] = 132'h000000020000000000080000000000000;
      expv[31] = 132'h000000060000000000180000000000000;
      expv[32] = 132'h000000020000000000080000000000000;
      expv[33] = 132'h000000060000000000180000000000000;
      expv[34] = 132'h000000020000000000080000000000000;
      expv[35] = 132'h000000060000000000180000000000000;
      expv[36] = 132'h000000020000000000080000000000000;
      expv[37] = 132'h000000060000000000180000000000000;
      expv[38] = 132'h000000020000000000080000000000000;
      expv[39] = 132'h000000060000000000180000000000000;
      expv[40] = 132'h000000020000000000080000000000000;
      expv[41] = 132'h000000060000000000180000000000000;
      expv[42] = 132'h000000020000000000080000000000000;
      expv[43] = 132'h000000060000000000180000000000000;
      expv[44] = 132'h000000020000000000080000000000000;
      expv[45] = 132'h000000060000000000180000000000000;
      expv[46] = 132'h000000020000000000080000000000000;
      expv[47] = 132'h000000060000000000180000000000000;
      expv[48] = 132'h000000020000000000080000000000000;
      expv[49] = 132'h000000060000000000180000000000000;
      expv[50] = 132'h000000020000000000080000000000000;
      expv[51] = 132'h000000060000000000180000000000000;
      expv[52] = 132'h000000020000000000080000000000000;
      expv[53] = 132'h000000060000000000180000000000000;
      expv[54] = 132'h000000020000000000080000000000000;
      expv[55] = 132'h000000060000000000180000000000000;
      expv[56] = 132'h000000020000000000080000000000000;
      expv[57] = 132'h000000060000000000180000000000000;
      expv[58] = 132'h000000020000000000080000000000000;
      expv[59] = 132'h000000060000000000180000000000000;
      expv[60] = 132'h000000020000000000080000000000000;
      expv[61] = 132'h000000060000000000180000000000000;
      expv[62] = 132'h000000020000000000080000000000000;
      expv[63] = 132'h000000060000000000180000000000000;
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
