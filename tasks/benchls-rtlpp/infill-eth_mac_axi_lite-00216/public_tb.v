// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 115;
  localparam OW = 140;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00216 dut (
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
    .rx_statistics_vector(out_vec[139:112]),
    .rx_statistics_valid(out_vec[111:111]),
    .rx_mac_aclk(out_vec[110:110]),
    .rx_reset(out_vec[109:109]),
    .rx_axis_mac_tdata(out_vec[108:101]),
    .rx_axis_mac_tvalid(out_vec[100:100]),
    .rx_axis_mac_tlast(out_vec[99:99]),
    .rx_axis_mac_tuser(out_vec[98:98]),
    .rx_axis_filter_tuser(out_vec[97:93]),
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
    stim[0] = 115'h1456306b6c6e46d2a7ff2abaf6514;
    stim[1] = 115'h0bd72614f4741d9fecce86a41c8e2;
    stim[2] = 115'h63a9a89faa899889a10645a34cb48;
    stim[3] = 115'h6b5515d45d2175e16df8429909b1e;
    stim[4] = 115'h62e76ba49deb89a706fd1b48b7806;
    stim[5] = 115'h2a529f08c5c65b7d32f87c20acbfb;
    stim[6] = 115'h37a1e3a27bb15150347c25b3c2d9c;
    stim[7] = 115'h2b943b0fed2759a673b3541a6f112;
    stim[8] = 115'h22709fd6fc51e159ee94b5723896f;
    stim[9] = 115'h67b9ef7c9ab76caaa4f332c4518fb;
    stim[10] = 115'h3729c7f45e31e1ea2f362dd83a8c4;
    stim[11] = 115'h62c9a212899a762672a14a7d9814d;
    stim[12] = 115'h7cd35180672a08c53ff56a66b5015;
    stim[13] = 115'h689076cdb36a853a7b7cee0a5452b;
    stim[14] = 115'h73a4ab3878bbb5348c2bd3f45d2ff;
    stim[15] = 115'h3547e50731c60f8c42ddaceb6151c;
    stim[16] = 115'h5dedd30d869d03e9ace9bb8f8d5d3;
    stim[17] = 115'h2f133be2425a9062f0490ee2cf79b;
    stim[18] = 115'h343fbf148ade16db402aec02834d9;
    stim[19] = 115'h6237cced53dac6bdf4a88e4f1a2e2;
    stim[20] = 115'h3199784acdbad0751ed1b4a7ff81a;
    stim[21] = 115'h3e9d03e55cb7cf3b13dce2c3e4562;
    stim[22] = 115'h7bcb9220505d9a5efcc2826d85b02;
    stim[23] = 115'h6795330bb51746880ced1dfb0d32f;
    stim[24] = 115'h3e5d0b8d1bfb0ea3dd44d0b60c949;
    stim[25] = 115'h3f9b76de57d26adacdd88e850303d;
    stim[26] = 115'h6d21f5475f71a299ba084c6b57977;
    stim[27] = 115'h20bdc1f950c63c097cfdb4cfd6c9c;
    stim[28] = 115'h6759903f0b3807a21a5ee2295d787;
    stim[29] = 115'h262ef92e1a62de3c6a65d80ecb53d;
    stim[30] = 115'h319cc140ab6c058444f93d0fe4f44;
    stim[31] = 115'h2a0280304f9adb420941439eae704;
    stim[32] = 115'h6c07dd73116d675f95ed568995ebf;
    stim[33] = 115'h7dcb4a3c1fc6981406b9fc1fb42f8;
    stim[34] = 115'h2657a67a0f9a8f39a6afbe624452f;
    stim[35] = 115'h7b93f949941461e4e4f1e3b0cc32d;
    stim[36] = 115'h23f43714f2d624d7da34e2d612a87;
    stim[37] = 115'h24f3bc54d4dcfbdeca2d2f7d75397;
    stim[38] = 115'h7e75bf2ca9c7f0716e21ac2a7478e;
    stim[39] = 115'h6a7ce65eccef8d037b28b3c478425;
    stim[40] = 115'h684624703ba52e56e9bf0bbc9d417;
    stim[41] = 115'h346ee179cf95a1e4c35adb02ec046;
    stim[42] = 115'h6296c59dbb67a6041a9035a985bae;
    stim[43] = 115'h7d9936f50bc5f75d52a4342352f5d;
    stim[44] = 115'h29d9bedf02e6e23cdb45b88dacb7c;
    stim[45] = 115'h367bc6681c29ad66412a413d34d47;
    stim[46] = 115'h7c5849654b326c782000998388b5c;
    stim[47] = 115'h28648557824bcc5b31b8d1f38418d;
    stim[48] = 115'h2d2c7df674509b2c44c2b9420aaac;
    stim[49] = 115'h652863d1699a1555231ed8df80044;
    stim[50] = 115'h351dd0112b40690d8c9e44270dce7;
    stim[51] = 115'h6959e03afcf0b77c5f15136453423;
    stim[52] = 115'h2191f872b6ec33ce50935cde94697;
    stim[53] = 115'h36979684662306846278b4202b74d;
    stim[54] = 115'h6aa6d3839fbb87c37061447e9e9da;
    stim[55] = 115'h381523962746ef1774094e7011eaa;
    stim[56] = 115'h7c6b0202c5f4e0eca3015bbb3454f;
    stim[57] = 115'h2dd5ecf5fac7fb3cdafed15c890a5;
    stim[58] = 115'h34d58f766477dfbece5ea1983a76b;
    stim[59] = 115'h2fc1fdf39f79fdd00eef49022008b;
    stim[60] = 115'h6c3efe6f84275629af7e481585451;
    stim[61] = 115'h692a7f267c577de1a32f92e5a049f;
    stim[62] = 115'h29cc62c3a281edd387dade507c516;
    stim[63] = 115'h301dfc79ed96a989a82ebfbb2fb58;
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
      expv[0] = 140'h00000000000000000000000000000000000;
      expv[1] = 140'h00000000000000000000000000000000000;
      expv[2] = 140'h00000000000000000000000000000000000;
      expv[3] = 140'h00000000000000000000000000000000000;
      expv[4] = 140'h00000000000000000000000000000000000;
      expv[5] = 140'h00000000000000000000000000000000000;
      expv[6] = 140'h00000000000000000000000000000000000;
      expv[7] = 140'h00000000000000000000000000000000000;
      expv[8] = 140'h00000000000000000000000000000000000;
      expv[9] = 140'h00000000000000000000000000000000000;
      expv[10] = 140'h00000000000000000000000000000000000;
      expv[11] = 140'h00000000000000000000000000000000000;
      expv[12] = 140'h00000000000000000000000000000000000;
      expv[13] = 140'h00000000000000000000000000000000000;
      expv[14] = 140'h00000000000000000000000000000000000;
      expv[15] = 140'h00000000000000000000000000000000000;
      expv[16] = 140'h00000000000000000000000000000000000;
      expv[17] = 140'h00000000000000000000000000000000000;
      expv[18] = 140'h00000000000000000000000000000000000;
      expv[19] = 140'h00000000000000000000000000000000000;
      expv[20] = 140'h00000000000000000000000000000000000;
      expv[21] = 140'h00000000000000000000000000000000000;
      expv[22] = 140'h00000000000000000000000000000000000;
      expv[23] = 140'h00000000000000000000000000000000000;
      expv[24] = 140'h00000000000000000000000000000000000;
      expv[25] = 140'h00000000000000000000000000000000000;
      expv[26] = 140'h00000000000000000000000000000000000;
      expv[27] = 140'h00000000000000000000000000000000000;
      expv[28] = 140'h00000000000000000000000000000000000;
      expv[29] = 140'h00000000000000000000000000000000000;
      expv[30] = 140'h00000000000000000000000000000000000;
      expv[31] = 140'h00000000000000000000000000000000000;
      expv[32] = 140'h00000000000000000000000000000000000;
      expv[33] = 140'h00000000000000000000000000000000000;
      expv[34] = 140'h00000000000000000000000000000000000;
      expv[35] = 140'h00000000000000000000000000000000000;
      expv[36] = 140'h00000000000000000000000000000000000;
      expv[37] = 140'h00000000000000000000000000000000000;
      expv[38] = 140'h00000000000000000000000000000000000;
      expv[39] = 140'h00000000000000000000000000000000000;
      expv[40] = 140'h00000000000000000000000000000000000;
      expv[41] = 140'h00000000000000000000000000000000000;
      expv[42] = 140'h00000000000000000000000000000000000;
      expv[43] = 140'h00000000000000000000000000000000000;
      expv[44] = 140'h00000000000000000000000000000000000;
      expv[45] = 140'h00000000000000000000000000000000000;
      expv[46] = 140'h00000000000000000000000000000000000;
      expv[47] = 140'h00000000000000000000000000000000000;
      expv[48] = 140'h00000000000000000000000000000000000;
      expv[49] = 140'h00000000000000000000000000000000000;
      expv[50] = 140'h00000000000000000000000000000000000;
      expv[51] = 140'h00000000000000000000000000000000000;
      expv[52] = 140'h00000000000000000000000000000000000;
      expv[53] = 140'h00000000000000000000000000000000000;
      expv[54] = 140'h00000000000000000000000000000000000;
      expv[55] = 140'h00000000000000000000000000000000000;
      expv[56] = 140'h00000000000000000000000000000000000;
      expv[57] = 140'h00000000000000000000000000000000000;
      expv[58] = 140'h00000000000000000000000000000000000;
      expv[59] = 140'h00000000000000000000000000000000000;
      expv[60] = 140'h00000000000000000000000000000000000;
      expv[61] = 140'h00000000000000000000000000000000000;
      expv[62] = 140'h00000000000000000000000000000000000;
      expv[63] = 140'h00000000000000000000000000000000000;
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
