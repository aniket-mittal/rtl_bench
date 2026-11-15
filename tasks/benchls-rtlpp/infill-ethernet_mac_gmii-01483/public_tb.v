// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 115;
  localparam OW = 135;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01483 dut (
    .gtx_clk(in_vec[114:114]),
    .glbl_rstn(in_vec[113:113]),
    .rx_axi_rstn(in_vec[112:112]),
    .tx_axi_rstn(in_vec[111:111]),
    .tx_ifg_delay(in_vec[110:103]),
    .tx_axis_mac_tdata(in_vec[102:95]),
    .tx_axis_mac_tvalid(in_vec[94:94]),
    .tx_axis_mac_tlast(in_vec[93:93]),
    .tx_axis_mac_tuser(in_vec[92:92]),
    .pause_req(in_vec[91:91]),
    .pause_val(in_vec[90:75]),
    .clk_enable(in_vec[74:74]),
    .gmii_rxd(in_vec[73:66]),
    .gmii_rx_dv(in_vec[65:65]),
    .gmii_rx_er(in_vec[64:64]),
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
    .rx_statistics_vector(out_vec[134:107]),
    .rx_statistics_valid(out_vec[106:106]),
    .rx_mac_aclk(out_vec[105:105]),
    .rx_reset(out_vec[104:104]),
    .rx_axis_mac_tdata(out_vec[103:96]),
    .rx_axis_mac_tvalid(out_vec[95:95]),
    .rx_axis_mac_tlast(out_vec[94:94]),
    .rx_axis_mac_tuser(out_vec[93:93]),
    .tx_statistics_vector(out_vec[92:61]),
    .tx_statistics_valid(out_vec[60:60]),
    .tx_mac_aclk(out_vec[59:59]),
    .tx_reset(out_vec[58:58]),
    .tx_axis_mac_tready(out_vec[57:57]),
    .speedis100(out_vec[56:56]),
    .speedis10100(out_vec[55:55]),
    .gmii_txd(out_vec[54:47]),
    .gmii_tx_en(out_vec[46:46]),
    .gmii_tx_er(out_vec[45:45]),
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
    stim[0] = 115'h5f907d25eba937bfb2baa017b6fdf;
    stim[1] = 115'h552135a2a5888849bf5f72a5f9395;
    stim[2] = 115'h3dfe75a6b8ff381de93f3cd0395cd;
    stim[3] = 115'h319b880192c61ebd67d9587fcb5bc;
    stim[4] = 115'h357ceac6d7564bd52f0546eed6840;
    stim[5] = 115'h66a2f58c9b42da9abb6971a8ce358;
    stim[6] = 115'h3958ba2450d44c8c47713c24f2f5f;
    stim[7] = 115'h22a1cdb1a92c8b665977ee577d32c;
    stim[8] = 115'h64e075324499d3439d0483965c890;
    stim[9] = 115'h3e28a9dc76b7c4aeacf5c24aa88cc;
    stim[10] = 115'h6735de529bbc6dd8139ac5a736244;
    stim[11] = 115'h3cf6225f581a6cd0d6794b912d394;
    stim[12] = 115'h77c0b5d09acbb40cae8b9c8de6a04;
    stim[13] = 115'h7cb22affbeceb875ee38b74b53e6e;
    stim[14] = 115'h783297e6273cde56e4812a70927df;
    stim[15] = 115'h6185355c0320989babe2695225d49;
    stim[16] = 115'h3a6046614eb409ae445a1ebf33ee3;
    stim[17] = 115'h77a7fb1882dc549ec6bd5431ab10f;
    stim[18] = 115'h69e30fa9b202d677f5ea65ed2be50;
    stim[19] = 115'h758f31ceca3cb23788c03a6265373;
    stim[20] = 115'h3ba23175034bfaf1f618feb7085e7;
    stim[21] = 115'h67d8aa53e7e10c7ac0b36cc7a7d3a;
    stim[22] = 115'h2f43bf950d78e5ac1f6720e26cb7e;
    stim[23] = 115'h7b444ae27c614bdf229a0f1cba2be;
    stim[24] = 115'h7b8384b2a8097cdf3e1e26258e7a2;
    stim[25] = 115'h3667b958f113f4334545425721308;
    stim[26] = 115'h6c74f1994e03f2dd5b442effbf7a1;
    stim[27] = 115'h3bc86b9cef000a15b5ccba9673b35;
    stim[28] = 115'h65cc5ed9fc969e25bb8f2bed6feed;
    stim[29] = 115'h63ff9dc2b5ad18b6a96badceee4d7;
    stim[30] = 115'h2853b5c73a9d292831adc04e1f9bc;
    stim[31] = 115'h2270dc968b7cadaf0f25818ee9199;
    stim[32] = 115'h3507edd473ba292225685ba35d623;
    stim[33] = 115'h793b19e59d5b5dfb76472788b7977;
    stim[34] = 115'h7da42a0cf39408bb4f1e8cedf0744;
    stim[35] = 115'h27fef34ca3fb17c87570ebe9cca4f;
    stim[36] = 115'h295e789085341d02cdfbd16e22379;
    stim[37] = 115'h32f8a6976b91b0bdc690b132a985d;
    stim[38] = 115'h34a8c054a3f6aac490ef9b1025bd6;
    stim[39] = 115'h21bf3a7db308c0f6241c1e17894ac;
    stim[40] = 115'h69efa92c30d56bba7481c35caa235;
    stim[41] = 115'h61cbf4d48ab46f943b50cd9845ad5;
    stim[42] = 115'h703dd0d18a8e954e32da3739effa7;
    stim[43] = 115'h741dcc764d3975e89ccb13ebae252;
    stim[44] = 115'h2fc27f0e1431bb494411ebfec4845;
    stim[45] = 115'h6d674f18c3964db636a8b5713b132;
    stim[46] = 115'h2f7e3a61ce345d66514eefebd2247;
    stim[47] = 115'h6ce0900677fac80064fb968f2ff06;
    stim[48] = 115'h7c99fb365f5f8e57a7801200aa94e;
    stim[49] = 115'h2729cc4a751e1d5dc49e0f3e834bf;
    stim[50] = 115'h346249538f14012dc4a43fdd71eeb;
    stim[51] = 115'h2a1c645a16ac574876820697afd63;
    stim[52] = 115'h320cb4bf647ac4ba26e454f61cc59;
    stim[53] = 115'h3be6668e209a76105935970767d8a;
    stim[54] = 115'h6e9e6286d6aef87ee5489e030dd55;
    stim[55] = 115'h36b5e072e4d3fe379838833789cca;
    stim[56] = 115'h64920bf679f97c8f347a5c40b0de5;
    stim[57] = 115'h352af311c6e6236d6bb6e4b6a3ee8;
    stim[58] = 115'h36a77e40fc93148cca9c9a369e68a;
    stim[59] = 115'h2314aadf28d84eb751ca0fe98c38c;
    stim[60] = 115'h7c224f15b0bed35c6bb6211f871b4;
    stim[61] = 115'h750498501add956633318ff470478;
    stim[62] = 115'h2e06e4eb41261692ebc451270daf1;
    stim[63] = 115'h68fe20b42004427494a3559a04096;
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
      expv[0] = 135'h0000000200000000000a00000000000000;
      expv[1] = 135'h0000000200000000000e00000000000000;
      expv[2] = 135'h0000000000000000000200000000000000;
      expv[3] = 135'h0000000000000000000600000000000000;
      expv[4] = 135'h0000000000000000000600000000000000;
      expv[5] = 135'h0000000300000000000e00000000000000;
      expv[6] = 135'h0000000000000000000200000000000000;
      expv[7] = 135'h0000000100000000000600000000000000;
      expv[8] = 135'h0000000300000000000e00000000000000;
      expv[9] = 135'h0000000000000000000200000000000000;
      expv[10] = 135'h0000000300000000000e00000000000000;
      expv[11] = 135'h0000000000000000000200000000000000;
      expv[12] = 135'h0000000200000000000e00000000000000;
      expv[13] = 135'h0000000200000000000a00000000000000;
      expv[14] = 135'h0000000200000000000a00000000000000;
      expv[15] = 135'h0000000300000000000e00000000000000;
      expv[16] = 135'h0000000000000000000200000000000000;
      expv[17] = 135'h0000000200000000000e00000000000000;
      expv[18] = 135'h0000000300000000000a00000000000000;
      expv[19] = 135'h0000000200000000000e00000000000000;
      expv[20] = 135'h0000000000000000000200000000000000;
      expv[21] = 135'h0000000300000000000e00000000000000;
      expv[22] = 135'h0000000100000000000200000000000000;
      expv[23] = 135'h0000000200000000000a00000000000000;
      expv[24] = 135'h0000000200000000000a00000000000000;
      expv[25] = 135'h0000000000000000000600000000000000;
      expv[26] = 135'h0000000300000000000a00000000000000;
      expv[27] = 135'h0000000000000000000200000000000000;
      expv[28] = 135'h0000000300000000000e00000000000000;
      expv[29] = 135'h0000000300000000000e00000000000000;
      expv[30] = 135'h0000000100000000000200000000000000;
      expv[31] = 135'h0000000100000000000600000000000000;
      expv[32] = 135'h0000000000000000000600000000000000;
      expv[33] = 135'h0000000200000000000a00000000000000;
      expv[34] = 135'h0000000200000000000a00000000000000;
      expv[35] = 135'h0000000100000000000600000000000000;
      expv[36] = 135'h0000000100000000000200000000000000;
      expv[37] = 135'h0000000000000000000600000000000000;
      expv[38] = 135'h0000000000000000000600000000000000;
      expv[39] = 135'h0000000100000000000600000000000000;
      expv[40] = 135'h0000000300000000000a00000000000000;
      expv[41] = 135'h0000000300000000000e00000000000000;
      expv[42] = 135'h0000000200000000000e00000000000000;
      expv[43] = 135'h0000000200000000000e00000000000000;
      expv[44] = 135'h0000000100000000000200000000000000;
      expv[45] = 135'h0000000300000000000a00000000000000;
      expv[46] = 135'h0000000100000000000200000000000000;
      expv[47] = 135'h0000000300000000000a00000000000000;
      expv[48] = 135'h0000000200000000000a00000000000000;
      expv[49] = 135'h0000000100000000000600000000000000;
      expv[50] = 135'h0000000000000000000600000000000000;
      expv[51] = 135'h0000000100000000000200000000000000;
      expv[52] = 135'h0000000000000000000600000000000000;
      expv[53] = 135'h0000000000000000000200000000000000;
      expv[54] = 135'h0000000300000000000a00000000000000;
      expv[55] = 135'h0000000000000000000600000000000000;
      expv[56] = 135'h0000000300000000000e00000000000000;
      expv[57] = 135'h0000000000000000000600000000000000;
      expv[58] = 135'h0000000000000000000600000000000000;
      expv[59] = 135'h0000000100000000000600000000000000;
      expv[60] = 135'h0000000200000000000a00000000000000;
      expv[61] = 135'h0000000200000000000e00000000000000;
      expv[62] = 135'h0000000100000000000200000000000000;
      expv[63] = 135'h0000000300000000000a00000000000000;
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
