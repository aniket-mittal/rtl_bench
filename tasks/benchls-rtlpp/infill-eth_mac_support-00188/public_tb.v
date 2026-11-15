// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 207;
  localparam OW = 94;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00188 dut (
    .gtx_clk(in_vec[206:206]),
    .refclk(in_vec[205:205]),
    .glbl_rstn(in_vec[204:204]),
    .rx_axi_rstn(in_vec[203:203]),
    .tx_axi_rstn(in_vec[202:202]),
    .tx_ifg_delay(in_vec[201:194]),
    .tx_axis_mac_tdata(in_vec[193:186]),
    .tx_axis_mac_tvalid(in_vec[185:185]),
    .tx_axis_mac_tlast(in_vec[184:184]),
    .tx_axis_mac_tuser(in_vec[183:183]),
    .pause_req(in_vec[182:182]),
    .pause_val(in_vec[181:166]),
    .rgmii_rxd(in_vec[165:162]),
    .rgmii_rx_ctl(in_vec[161:161]),
    .rgmii_rxc(in_vec[160:160]),
    .rx_configuration_vector(in_vec[159:80]),
    .tx_configuration_vector(in_vec[79:0]),
    .gtx_clk_out(out_vec[93:93]),
    .gtx_clk90_out(out_vec[92:92]),
    .rx_enable(out_vec[91:91]),
    .rx_statistics_vector(out_vec[90:63]),
    .rx_statistics_valid(out_vec[62:62]),
    .rx_mac_aclk(out_vec[61:61]),
    .rx_reset(out_vec[60:60]),
    .rx_axis_mac_tdata(out_vec[59:52]),
    .rx_axis_mac_tvalid(out_vec[51:51]),
    .rx_axis_mac_tlast(out_vec[50:50]),
    .rx_axis_mac_tuser(out_vec[49:49]),
    .tx_enable(out_vec[48:48]),
    .tx_statistics_vector(out_vec[47:16]),
    .tx_statistics_valid(out_vec[15:15]),
    .tx_mac_aclk(out_vec[14:14]),
    .tx_reset(out_vec[13:13]),
    .tx_axis_mac_tready(out_vec[12:12]),
    .speedis100(out_vec[11:11]),
    .speedis10100(out_vec[10:10]),
    .rgmii_txd(out_vec[9:6]),
    .rgmii_tx_ctl(out_vec[5:5]),
    .rgmii_txc(out_vec[4:4]),
    .inband_link_status(out_vec[3:3]),
    .inband_clock_speed(out_vec[2:1]),
    .inband_duplex_status(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 207'h20da7d89e537b9e02a6879566c73bc3cef00da83e01f8b2c112b;
    stim[1] = 207'h68637478e6422d5dbf3b914bbdbe129de02bd0e49d8190545dcc;
    stim[2] = 207'h3b126646d035e00ce8f51b8d6fc50139696d37656cfd844ac3a3;
    stim[3] = 207'h716d35ed8f82c2a0dd8983be711d06421883ce865520d2c7f0b4;
    stim[4] = 207'h590c06381eb944051da3fe776064c09690430254ab87255a24a6;
    stim[5] = 207'h1ea87f9a77cc00cb00160296a156bde0a4d2049a7735d330156f;
    stim[6] = 207'h3e6468c882c5a9e15592046f8d26e53d3af7c1aeb53b0c4fbf33;
    stim[7] = 207'h155f6706f95d850b3a107ca116f0c09ad2002c61e43f817a3d83;
    stim[8] = 207'h3c76253a1ba28f3b7a47dfe0764d725acf0ff534bd85ac46f8e0;
    stim[9] = 207'h73b38bcdd662045684655ca84f1368fdc111a4dcab8215dacc93;
    stim[10] = 207'h3770cfdc63bec9610cea18a16d4eb3016a82f22978d95b77a3ad;
    stim[11] = 207'h5d5a79ce82aa58b631f59976501629ea34e84562de03d48d299c;
    stim[12] = 207'h1a78507162b8018e34a218b533c32148d202adc837243b065207;
    stim[13] = 207'h33b2fa5dd10c954798de0c62e50c51ed5b784cf5d3cd798ef696;
    stim[14] = 207'h1f5c109e9ddcac69b14320b2f57b99aa581366b8f6719d3ae45f;
    stim[15] = 207'h5562c74b4866c0e5a1f644a197b6119db041260cf6966ce7675d;
    stim[16] = 207'h1a815f415460a8d2a0012c418df3d9444f4caeec8adad4b2fc1d;
    stim[17] = 207'h34927983e1cbcf376f1881939edfdc8b6e82dff5bc80d8e1c083;
    stim[18] = 207'h59559077cc3ba74431f472454d381f46ea22a826328c29c29b9a;
    stim[19] = 207'h3b9aa447ca05c89963b411255f488c8c5131dfc81eb9ea2c8d1c;
    stim[20] = 207'h38dbc4dc92c5726e7accca6b79289c69757bc078967f86afe39a;
    stim[21] = 207'h3c0e5dc0ba8ee5b600a81262cb6a3d85f00d7b2cd304ceb05fcf;
    stim[22] = 207'h138abf8597d3d1806f423135411d415572a850f03aa1b72adb00;
    stim[23] = 207'h3391bf08e7b4f240f21a1becb6465702b93f40a552e4b80c6bf4;
    stim[24] = 207'h36170ebea877bddf719708eabb7b81bc5f63b831a97e606f95e4;
    stim[25] = 207'h3042ddb960627eb69fa2147b640a84bb1dad64d758817292bad3;
    stim[26] = 207'h3634d2e23d96ff3fc521f19ebf436263f03c5c4017c9c0dfb432;
    stim[27] = 207'h1ac1546e61ab8e1484ee4a5f67516937fc8a47bd34a56a39fa8f;
    stim[28] = 207'h7ce660d679eab9cc970c7b6251b9e29fe5fe08f2a1fec2fbed42;
    stim[29] = 207'h139ae1326354dee179610a466d28993da5e7a9214fe1a56b3d15;
    stim[30] = 207'h5ba3636fc5cb08380c32559c88819e0ca207fd31a638151172eb;
    stim[31] = 207'h38fe3c4d2e3099fd80b6423301eca5547b88dc4d970063851f85;
    stim[32] = 207'h7cf0edf47e7c1791ff9151c31b88681acfef906e38953b4b6c8c;
    stim[33] = 207'h15bbb9edf48f6150434d0afeedc0a212d32dc22b02eeb82c8507;
    stim[34] = 207'h35770e4312ae11cbc2b0e7e3b20106965009b521233312da9b94;
    stim[35] = 207'h364938b6255bb2e31c308553cdad22eebce3586e1741bc70c435;
    stim[36] = 207'h1c7862be5c8808b084c34860004f91998a8ead9637a136a41b0c;
    stim[37] = 207'h5f4f1fb52dfa14f1fb33d9b2ff90dccb88830024773ce9a5c853;
    stim[38] = 207'h106ae857d53111835c29ab3bf0253446dbc09339d5061f3fc811;
    stim[39] = 207'h3cfcf4e4eaaace90a63f1db3c7ce154ae86868e488ee40a3f279;
    stim[40] = 207'h735cf55059c85a8dd1d96e59a9680eb21d7762fbe5c18d0b4100;
    stim[41] = 207'h545822d31bc6a3308a6ab208b76b049e9a0237b3486935ef061d;
    stim[42] = 207'h3ebf04568c0467ba068e336cff6bb94abb4956fd03ee66ecc521;
    stim[43] = 207'h144d56b0d7ca57e09f4f833f4ec2c54e69538b62a149056e5e8a;
    stim[44] = 207'h31005c206c50ed3b891b81f000607623fcadb81f951e559ce203;
    stim[45] = 207'h7b8b23476f69f6a798cc9e3b9fd9fd33737de5dcb62f119c4c52;
    stim[46] = 207'h3ca06591e5e37cf933da2e1af2f2ef4643fc76ec18b422be1675;
    stim[47] = 207'h38cde477dd0dc52fde2279d06ebc011e5730fd9cdd3678498a97;
    stim[48] = 207'h11bcfc3ef66709f17db8be88910c6f80994027516584fc41e85b;
    stim[49] = 207'h19a392d5168ce6d1e0e6263ac92ca010725e572a7bf41202292b;
    stim[50] = 207'h535a70fe1c92918c09e1741e606c5d481e55eb373a335397bd40;
    stim[51] = 207'h39e46c748f02e11c0f8ccbeda6e03a8b755d582e80689caf7e7a;
    stim[52] = 207'h35b9dd5739da1f923e5e048c1fc1fba7c52b16248581016f6405;
    stim[53] = 207'h7cebe4bd9156987d96ee44b0949b84301020764a725b6ddd4008;
    stim[54] = 207'h5cbb29c6ae3ba60a9d363e06fde549b879f8854095bd38594dcc;
    stim[55] = 207'h78dc6154391c331c46f2c4b1bbe652b9cdcc208ea33f6322aa35;
    stim[56] = 207'h74187911222640ecfb63a1160c16b34e069d26e730c64a078624;
    stim[57] = 207'h7e9b156f6a0479eeb4e29260d1433fbfe79ec0ec51f8a780cfc6;
    stim[58] = 207'h3930cb1813ba11c347bcbc8151887003bebb64083e193477ae0a;
    stim[59] = 207'h59decb0677a18f5bd570fbda707863437264f726141cf65503b9;
    stim[60] = 207'h7a3d93be60baaa6e8be3f8b46fed94098e40e7dc448bcf3afb94;
    stim[61] = 207'h74d484a2516beb957cae682974bb712cf724903ad0f7a071c327;
    stim[62] = 207'h5e64bf000cb85986cbc60c4d7f51c82846791c66c0377de07786;
    stim[63] = 207'h1f9b8fc5fc04a489f234dde57f7dd206821a06604d1739856579;
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
      expv[0] = 94'h080000001001000000002000;
      expv[1] = 94'h380000002001000000006000;
      expv[2] = 94'h000000000000000000002000;
      expv[3] = 94'h300000003000000000006000;
      expv[4] = 94'h300000002000000000006000;
      expv[5] = 94'h000000000000000000000000;
      expv[6] = 94'h000000000000000000000000;
      expv[7] = 94'h000000001000000000000000;
      expv[8] = 94'h000000000000000000000000;
      expv[9] = 94'h300000003000000000006000;
      expv[10] = 94'h000000001000000000000000;
      expv[11] = 94'h300000002000000000004000;
      expv[12] = 94'h000000000000000000002000;
      expv[13] = 94'h000000001000000000002000;
      expv[14] = 94'h000000000000000000000000;
      expv[15] = 94'h300000003000000000004000;
      expv[16] = 94'h000000000000000000002000;
      expv[17] = 94'h000000001000000000000000;
      expv[18] = 94'h300000002000000000006000;
      expv[19] = 94'h000000000000000000002000;
      expv[20] = 94'h000000000000000000002000;
      expv[21] = 94'h000000000000000000000000;
      expv[22] = 94'h000000001000000000002000;
      expv[23] = 94'h000000001000000000002000;
      expv[24] = 94'h000000001000000000000000;
      expv[25] = 94'h000000001000000000002000;
      expv[26] = 94'h000000001000000000000000;
      expv[27] = 94'h000000000000000000002000;
      expv[28] = 94'h300000002000000000004000;
      expv[29] = 94'h000000001000000000002000;
      expv[30] = 94'h300000002000000000006000;
      expv[31] = 94'h000000000000000000002000;
      expv[32] = 94'h300000002000000000004000;
      expv[33] = 94'h000000001000000000000000;
      expv[34] = 94'h000000001000000000000000;
      expv[35] = 94'h000000001000000000000000;
      expv[36] = 94'h000000000000000000000000;
      expv[37] = 94'h300000002000000000004000;
      expv[38] = 94'h000000001000000000002000;
      expv[39] = 94'h000000000000000000000000;
      expv[40] = 94'h300000003000000000006000;
      expv[41] = 94'h300000003000000000004000;
      expv[42] = 94'h000000000000000000000000;
      expv[43] = 94'h000000001000000000000000;
      expv[44] = 94'h000000001000000000002000;
      expv[45] = 94'h300000002000000000006000;
      expv[46] = 94'h000000000000000000000000;
      expv[47] = 94'h000000000000000000002000;
      expv[48] = 94'h000000001000000000002000;
      expv[49] = 94'h000000000000000000002000;
      expv[50] = 94'h300000003000000000006000;
      expv[51] = 94'h000000000000000000002000;
      expv[52] = 94'h000000001000000000000000;
      expv[53] = 94'h300000002000000000004000;
      expv[54] = 94'h300000002000000000004000;
      expv[55] = 94'h300000002000000000006000;
      expv[56] = 94'h300000003000000000004000;
      expv[57] = 94'h300000002000000000004000;
      expv[58] = 94'h000000000000000000002000;
      expv[59] = 94'h300000002000000000006000;
      expv[60] = 94'h300000002000000000006000;
      expv[61] = 94'h300000003000000000004000;
      expv[62] = 94'h300000002000000000004000;
      expv[63] = 94'h000000000000000000000000;
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
