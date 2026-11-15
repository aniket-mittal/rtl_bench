// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 166;
  localparam OW = 196;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00362 dut (
    .clk(clk),
    .rst(in_vec[165:165]),
    .rcn_in(in_vec[164:96]),
    .cs(in_vec[95:95]),
    .seq(in_vec[94:93]),
    .wr(in_vec[92:92]),
    .mask(in_vec[91:88]),
    .addr(in_vec[87:64]),
    .wdata(in_vec[63:32]),
    .slave_rdata(in_vec[31:0]),
    .rcn_out(out_vec[195:127]),
    .busy(out_vec[126:126]),
    .rdone(out_vec[125:125]),
    .wdone(out_vec[124:124]),
    .rsp_seq(out_vec[123:122]),
    .rsp_mask(out_vec[121:118]),
    .rsp_addr(out_vec[117:94]),
    .rsp_data(out_vec[93:62]),
    .slave_cs(out_vec[61:61]),
    .slave_wr(out_vec[60:60]),
    .slave_mask(out_vec[59:56]),
    .slave_addr(out_vec[55:32]),
    .slave_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 166'h3d16a8def0dea801fce5ff406e3908f8b17315d513;
    stim[1] = 166'h317bf68432784768b0e45125fc825a00801a5b93bf;
    stim[2] = 166'h1ea698b69fcdb07daecbdf433184eebdcf65891dcd;
    stim[3] = 166'h0cf3cf0c2102c077d1757aea5a05890a848df33d26;
    stim[4] = 166'h1a6205322be3ce1ca86aec8972170d1b7d05e57e2f;
    stim[5] = 166'h1fe649b96976a41589e49613484464649b8181fdc9;
    stim[6] = 166'h0c475007cb7313441dda441945f12cecc560453321;
    stim[7] = 166'h134690bead8f53aa9d219cdb28129658362c69e7d3;
    stim[8] = 166'h0d6993f7e7052fe9772bd57e9d5b9a04b2afe85570;
    stim[9] = 166'h3fa73be760d991f1ba79418df02a1147d5a5d1a02d;
    stim[10] = 166'h12bad42ca09c3cc91c292e9f4808c5d56b4c74a3ff;
    stim[11] = 166'h0ec2ffdbd209c0dc21d59b2e9f0b5bc0eb2a8218b4;
    stim[12] = 166'h0117c0aac02bd28ed4f9a14a731d93c5d5e4dfee5a;
    stim[13] = 166'h156924b3bbd77c020f5c13c6be696875333290782b;
    stim[14] = 166'h1b55b07690a9b6da01cd3daedd39b536baad380489;
    stim[15] = 166'h10ef279e6d41103ab153153715c95bf2799e7b3f23;
    stim[16] = 166'h1248c29988f7e6dd7e56f4894481f823394de693bf;
    stim[17] = 166'h1f1dfe03456ec0aec18dfa9a690f2bf6146fd90be2;
    stim[18] = 166'h02cf954e1bd3a895bc1e660da3501fd964b3c01666;
    stim[19] = 166'h1cd5036ee8185dae703b59aefc07ab85b1f84b74ee;
    stim[20] = 166'h1113a1485e74dafd7c90e9c3e84c815a5dea249040;
    stim[21] = 166'h065eb3a2f94f66afd3a12b636f3257f27e97d08b49;
    stim[22] = 166'h13e516ba7392700af9b5984ea3b91101bc90fc94dc;
    stim[23] = 166'h1dac7128cea7b243378e1abb524eb131d4de0bee4e;
    stim[24] = 166'h018dd2113146ae33f102031aa0bf612ee111f04ef3;
    stim[25] = 166'h1326270aa49f0b42a496125a1bf21671a4a8d407dd;
    stim[26] = 166'h1fd35f0e552b9416eda238e63d6ad7aec895ca7aac;
    stim[27] = 166'h07f9a1dcf963ed00f0a66803909a60ea26b088232b;
    stim[28] = 166'h1bc2be36d5410223840b950892b6e0d71da1e52d0f;
    stim[29] = 166'h29d41236ada3e6526e6907a271b734f68d37137428;
    stim[30] = 166'h032a2536b7972d606e349f6a962af2ced84f1710d9;
    stim[31] = 166'h07faa672d82ac38a4c2876fb98499bd3db181ac664;
    stim[32] = 166'h0f10733ed27272370071794d171c6bd246fe111260;
    stim[33] = 166'h1dd7ee5365aacc66b82ea0c665de287b475eb0ad1a;
    stim[34] = 166'h0f00bca9a2d16f179c32c8bccd03ab1387e7aaa148;
    stim[35] = 166'h0a749939dd6495c8e9095eb287ccfe7e91ab2f597f;
    stim[36] = 166'h13942f49f744efd9e70622072bc72c640abcbde74d;
    stim[37] = 166'h096d1792d2500f7cd0ef585ce760c5700eeeaeeb4d;
    stim[38] = 166'h135a312be865875214f4220104454a5e6c89790f33;
    stim[39] = 166'h18f58647bd99517610d76736422526e7a6d8589f61;
    stim[40] = 166'h0d0c891a006fc65cf7603ff8057571a77705608664;
    stim[41] = 166'h1241d68530305bde69a5b3621555adf341f85aab8a;
    stim[42] = 166'h02118e5d71ec64e94f119ca5c77ac96fe7441b293d;
    stim[43] = 166'h18839a1ffc7319d3948772459cf2118c144f536cd3;
    stim[44] = 166'h02e87365578c9b8c43ed22c183cffb13030dc15483;
    stim[45] = 166'h0bdb295bc740093d5ad02e0de2f31c2f9ab0b0616f;
    stim[46] = 166'h0c0175eb5b567e507bbadba53e878d29448305a33c;
    stim[47] = 166'h1f66ce11629ebc342229ac343654e0b55856fa840d;
    stim[48] = 166'h0ed48fd621a5da312ff5c8b254d27f8f398f34436d;
    stim[49] = 166'h13e772d1d0b4597d0b57e838260323b6921883ede6;
    stim[50] = 166'h081eea57a66d15ad9445511972853463ede240afb5;
    stim[51] = 166'h1dec0aed7a3656a22442454b25d9864038131c4bf4;
    stim[52] = 166'h09018da00833f850fe01b32aa663bb0bb92d85bc16;
    stim[53] = 166'h013caff560f28cc9891924dcda593f2c39a9014e71;
    stim[54] = 166'h01098d2bc407eb06dd30fc89d48c8adb01c398408b;
    stim[55] = 166'h167adacfbdaa3cea9a5a389ba7e68a6a6d83e22057;
    stim[56] = 166'h143b0a9ae4c767059b4abe34e58c0319cdbd113b32;
    stim[57] = 166'h0ed428d3ab58c622a19c98183397347b7d5116d226;
    stim[58] = 166'h13f08672b2077b55cd01676e6bd07c44f0416b00cd;
    stim[59] = 166'h032813b20203f32e1aac425b55814e414b31bf93a9;
    stim[60] = 166'h0bc76462cee65acf9b4ab6edd70d5b5c46788f2675;
    stim[61] = 166'h1c319ccbe402d897734b10cfa79252790ab276f032;
    stim[62] = 166'h0bbfbe0fdf89ed392bb5a498f36c3104fa871a9ead;
    stim[63] = 166'h03977e0179d638337a6209fbeed8056df8bbaca6ef;
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
      expv[0] = 196'h0000000000000000000000000000000000000000000000000;
      expv[1] = 196'h0000000000000000000000000000000000000000000000000;
      expv[2] = 196'h0000000000000000000000000000000000000000000000000;
      expv[3] = 196'hc05efa19942775ee780000000000000003698b69ccdb07dae;
      expv[4] = 196'h000000000000000004da62da7336c1f6b93cf0c2002c077d1;
      expv[5] = 196'hb534c5b4f82f2bf1784f3c30800b01df462053228e3ce1ca8;
      expv[6] = 196'hc024b09a5a232324dcc814c8a38f3872a3649b96876a41589;
      expv[7] = 196'h931029915b0229990c5926e5a1da90562575007c87313441d;
      expv[8] = 196'hbf324dcb49634f3e98dd401f21cc4d1074690beac8f53aa9d;
      expv[9] = 196'h0000000000000000000000000000000000000000000000000;
      expv[10] = 196'h0000000000000000000000000000000000000000000000000;
      expv[11] = 196'h0000000000000000000000000000000000ad42ca09c3cc91c;
      expv[12] = 196'he02cd974f05ade075c2b50b28270f324712ffdbd009c0dc21;
      expv[13] = 196'h95d6a16504e1e648e08bff6f40270370847c0aac02bd28ed4;
      expv[14] = 196'h7617fede904e06e1081f02ab00af4a3b51924b3b8d77c020f;
      expv[15] = 196'hc069ed76f1cda9b5d4e492cee35df0083e5b07690a9b6da01;
      expv[16] = 196'hab49259ddebbe0107c16c1da42a6db6804f279e6c41103ab1;
      expv[17] = 196'h9aad83b4826f349dfc7c9e79b10440eac48c29988f7e6dd7e;
      expv[18] = 196'h87793cf36a0881d58c230a6623df9b75fbdfe03446ec0aec1;
      expv[19] = 196'h924614cc47bf36ebf477f80d11bb02bb04f954e18d3a895bc;
      expv[20] = 196'hb8eff01a2fc25ba770fe5538634ea256f35036ee8185dae70;
      expv[21] = 196'he0074e1f42640ad2ec140dbba06176b9c03a1485c74dafd7c;
      expv[22] = 196'ha6a81b7744be845a4c8e852171d36bf5f1eb3a2f84f66afd3;
      expv[23] = 196'h889d0a42f3a6d7ebe07ace8be13d9abf4c516ba7092700af9;
      expv[24] = 196'hc070d5da8275898ea4d45ae9c249c02be7c7128cca7b24337;
      expv[25] = 196'h9f28b5d39c938057ccb1c4a3329ec90cdcdd2113046ae33f1;
      expv[26] = 196'had6389467546a03ee8774844c11ab8cfc46270aa49f0b42a4;
      expv[27] = 196'hc011c731eb56bd7644189c2a927c2d0a9335f0e542b9416ed;
      expv[28] = 196'h9931385524f85a15244d7c3950ae505bb59a1dcf863ed00f0;
      expv[29] = 196'h0000000000000000000000000000000000000000000000000;
      expv[30] = 196'h0000000000000000000000000000000000000000000000000;
      expv[31] = 196'h0000000000000000000000000000000000a2536b4972d606e;
      expv[32] = 196'h000000000000000000e894dad25cb581b9aa672d82ac38a4c;
      expv[33] = 196'h195129b5bcb96b03702a99cb60ab0e29310733ed072723700;
      expv[34] = 196'h3fd53396c1561c526081ccfb41c9c8dc037ee5364aacc66b8;
      expv[35] = 196'h788399f6939391b8045fb94d92ab319ae10bca9a0d16f179c;
      expv[36] = 196'haebf729b2d597acbf882f2a68345bc5e7049939dc6495c8e9;
      expv[37] = 196'h7805e54d168b78bce05264e771925723a442f49f444efd9e7;
      expv[38] = 196'hc07ac2e73b062b8074d0bd27d113bf679cd1792d0500f7cd0;
      expv[39] = 196'h9ca17a4fba277ecf38b45e4b41403df340a312be865875214;
      expv[40] = 196'he03b39b21129373d3428c4afa1961d485258647bc99517610;
      expv[41] = 196'h9ad1895f432c3a90a456191ef26545d841c891a006fc65cf7;
      expv[42] = 196'h87ac323defc2d55c5032246801bf1973dc1d68530305bde69;
      expv[43] = 196'h686448d0037e32e7bc075a14c0c16f79a418e5d70ec64e94f;
      expv[44] = 196'h920eb4298182def348463975c3b193a53e39a1ffc7319d394;
      expv[45] = 196'hc069160c1e7fd8981c0e687ff1cc674e5087365548c9b8c43;
      expv[46] = 196'h841cd0ffe585830b78e1cd9552326e310cb295bc440093d5a;
      expv[47] = 196'he056dd29ec3c694a20eca56f110024f569175eb58567e507b;
      expv[48] = 196'h5ed94ade3a0049ead0c5d7ad6159f941ef6ce11609ebc3422;
      expv[49] = 196'he02e4592be93fc79cc9b3845827af0d08948fd620a5da312f;
      expv[50] = 196'hbb36708b10c41f6f30523f58829768c4bc772d1d0b4597d0b;
      expv[51] = 196'h76a47eb10d2ed1897c1dcb4742d165f42ceea57a46d15ad94;
      expv[52] = 196'h9f3b968e85a2cbe858bba95e91b456b653c0aed783656a224;
      expv[53] = 196'h40f752bd3368ad6ca4b02bb5e0d95a889018da00833f850fe;
      expv[54] = 196'haf60576bd5480a738806368020cfe143f8caff560f28cc989;
      expv[55] = 196'h480c6d00419fc287f032bfd583ca33262498d2bc407eb06dd;
      expv[56] = 196'h09e57fab0794664c482634af101fac1b75adacfbcaa3cea9a;
      expv[57] = 196'h084c695e203f5836ec6b6b3ef2a8f3aa69b0a9ae4c767059b;
      expv[58] = 196'hb3d6d67ded51e754d42c2a6b931d9c166d428d3a858c622a1;
      expv[59] = 196'ha1d854d7263b382cd8d0a34ea163188a8408672b0077b55cd;
      expv[60] = 196'hc06212daac0a720a5c8219cac01ded5734813b20003f32e1a;
      expv[61] = 196'h9f843395903bdaae68a04ec8000fccb86876462cce65acf9b;
      expv[62] = 196'h19409d90101f9970d09d918b33996b3e6f19ccbe402d89773;
      expv[63] = 196'he02d24c78b618827d406732f900b625dccfbe0fdc89ed392b;
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
