// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 418;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_086405 dut (
    .aclk(clk),
    .s_axis_tdata(in_vec[417:162]),
    .s_axis_tstrb(in_vec[161:130]),
    .s_axis_tuser(in_vec[129:2]),
    .s_axis_tvalid(in_vec[1:1]),
    .s_axis_tlast(in_vec[0:0]),
    .s_axis_tready(out_vec[9:9]),
    .counter(out_vec[8:1]),
    .activity_rec(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 418'h059071a52456feb354490f8ec2fa694c2e0a44f58c18d40df050904a806edf59d65169c9d931f4bc5eac1575ebbea2c5555362abc;
    stim[1] = 418'h0d4cae050ea7b9c1de97249254ac29ba1ffd5f1f0d5a2f7923c2a489226b86ae66104eab1b68c13d1f265c7ca76bd33002bbaaf75;
    stim[2] = 418'h02f84b00315ce646ad116a1fcc8410381d932827798d273307bcd48305470411083838c53901ad5c78f0b249948062b2300fba2b4;
    stim[3] = 418'h26035018a5e0804114cddbdca21510305c3b98306269c61794226ee2e45d944aeb36647bfd95a0a332e8531f94a177e6589ef5037;
    stim[4] = 418'h2cd84f1bb030b0ae0ee73c3f6f4e4cbcbd72db07bf64f22ae25b9f408b96f9cbef2c4248d05a2867489c950a4a5594560eec48f54;
    stim[5] = 418'h228a739678ddfcf728278b3ba5c0ed8173c162f955c0f71209e9a53cb4dbd843d69877a1a9ca58945c31484be900eb425d87d7290;
    stim[6] = 418'h3f5d1f3c0dac999a8dc68841bbeda9a798fd864ecf093dccb1a7251c3d5c9f3f6ff8139fdb2d9162af71f13e473afa732ab4eb360;
    stim[7] = 418'h36449ce6ecef79576cfdb662c823766af3c9b4a23e2af035f188b33a563ca4159c70dbfed2a48ca7f1570e85b6f0fe6594f1f6315;
    stim[8] = 418'h385f52f061757397e7a9f8e3bace1ab7b5bae0b290bca9244e1085cc88a5d71308562ecd8adb42d05f6610ddef7a938ba00464076;
    stim[9] = 418'h011e0aa6b649728df635cd9177cdc504752cb0f000545e422617c3cfa4653d3ef93ea074e134356766f9dda9d78ced8304c042bd7;
    stim[10] = 418'h158995d1f569b154c1b0de6ab11f42b3b4019809854b953dc9939ab660ef40e4fc367595904d79df0b0b2eca1efb94c7d4240b0f7;
    stim[11] = 418'h2ad8ead8db6e3dde92e359e462a1ad9a9e10a275ba1f57a3320593591cf78eb0f1ad9043535ff0fa0ae284a4f8a2a076e9d64d4e3;
    stim[12] = 418'h073e237536156db977e102266d4c41884db5b2bd65b1759d23efcdfd9a452a7739acdcf815b0239ca74b3fbbb3412e1424b03c843;
    stim[13] = 418'h25fd3999da418d46fd9bd325697e3914f2f4c93bb26a0fc5ba7f6d36ef17cf48e5c99658e4229821219fa2c3a115c0e407a7b7ffa;
    stim[14] = 418'h10596585178994c745fee99b359aff7368dcd91f43fcbbf6830d3bd0a4c42748c20db40c527f969243622e448ae397b027bc1e04e;
    stim[15] = 418'h1391f13e3f19fcf18e16d3fc72e1fcba1b64b98e3286711a9174d0c84f7c00145bfc199d072e6aac66c820e639c7af9dabab85d9e;
    stim[16] = 418'h09a08b84b7b9affc54ac7c2cf5efb708aadbc3c6f4a1dd8235b9d808d4423877c9c67b342972733017c617376cd4f498cc0cbfcdb;
    stim[17] = 418'h3d3bd9e527ecee4dd2b822fcb2be1f334d4061ab9f7ff4c647bb76287de3a2f1fa1340312d84067d4bf48d101ea41eb9ebea38497;
    stim[18] = 418'h29d9d23098b9e2d7d23a1c1f803a2ecb9c3d1c09e045d8d65f129f6611227e5b080c85b5eefb1b5758f75d7e2eba6c386771db91d;
    stim[19] = 418'h2eb1db4685d588cba40bf80d145d96028141afba975592c5cf6e23d3b9a5f7e152b8521989573314290769f77f93f8ad5d1527173;
    stim[20] = 418'h397b14fe31cb0e90cc4e025a7f09c34a81f624cff58ed1f66da952d1f626ff22795e5576b1db87f324efe24d35c3b6173c0dcc3c8;
    stim[21] = 418'h292460589bd9f4339b1386d10d949a5d1afb5aae36ab5f5938d0b2f927c3d750809c1385683c522ea4f1b68b4103484527d9d2b8a;
    stim[22] = 418'h14e09f79cd606a127c491c1b146e9d0446962a5b7172a2ba29e2dea1153e8ae3dc07cda2033b2df2feb4871ebdf711d0f16c2e680;
    stim[23] = 418'h2424354d5c796f3aa4213fe49309a210bf39b14b5efd3b1329837c2a85a0f477ed677a993fbfb41080e23d34e74a0c810a45a3c20;
    stim[24] = 418'h189890575679c3a4b1261cd69a7e4457f2319bdc819fdbe9da624edecec4ce8730c17183c00434291e9ec7f76afb630ec48f3904a;
    stim[25] = 418'h2a01697a7671ee660b9b17b788ff13bab6aa4d1b1c27df8a6c1fa7a3caf6af9e09647a8b67e05d50b13dee447654a5c2a086d1cff;
    stim[26] = 418'h3dce7574c5031bb7d761131ec5662acd34ef6d0ffdc3f937b60deafcab57ea6805261548d67a9a7f22c17218390ff7dca05f41c75;
    stim[27] = 418'h04a6b78fce9d5e8a5db9c300338668ce7d0e3718e8a8a961e67d1477adeb8a8de2a767e12d029c9385a77d7cddc9c74c4eade1586;
    stim[28] = 418'h0a74c61be41f58f979447098a55e2feb1935255a2183a3ba298c23fc142fc9138914be3aa414fff7e6ef7a551142236d49116c3bb;
    stim[29] = 418'h3a6f81ae86670499344231eb54f2f91e003113700e09beb4daec4bfc28ac9b99c813631d1873b694ceefeb660670aa69ced7d9666;
    stim[30] = 418'h21b288f28ea3acb4e8de540087239d1cc34c1c5e7a0a1cfc988ef8373c2e733a7f5800fbd4832b004d720aee80f35f96114cd6f0e;
    stim[31] = 418'h228a35efc13f7ac087a1149906f6e4a3bd239ae13d67a1373482f9276c074b11c0f8a8660f6225e88ab861fa9a6453bd5860b73de;
    stim[32] = 418'h309c470bca8170a7fb32d884d3317dca7fc16ccebc7a2deba6ac6d1084502aaab0ac38e71ec97e1bd8c4f0594a1e5bcc86a2f0659;
    stim[33] = 418'h01a13a3c46502a284f45d1277eb0a2d16209fdf5e21eaedb37e5775bc55a0cb2dca524edbb5cbd8f38a2031d7ebe36ad88a65d308;
    stim[34] = 418'h3b480ffad562e7f5de06b9e1dc3c81945389450746e83a314542b7c3641f1103e9338589a45e32b99d1c64489bf29be7dd1d57355;
    stim[35] = 418'h35cd6f2700da79eed133e109dfda557e224be423d0cd0b324088d3872d439203173f37c4e6eb3a5791da565184cfd67f1f92fda6e;
    stim[36] = 418'h24af79c66355e8232e23c4bf4bffa9b75588106922b6ce3bd951d9911edf96b56a4fd33012c2447336abfee8489bedd6caf58e18c;
    stim[37] = 418'h2ae1c7a4aa5f6f94b31afa9c822b5c08287e8032315398871d5485ff59a68ac3593ed41c8deecfa760f08757e9041cc95496de2b3;
    stim[38] = 418'h27a881db2e54683c1a42719ffaaa1355a13012ad040be20921f6a4d30bf95d96f77939c549a34d27632b34487139e457d18fd204b;
    stim[39] = 418'h0dadbbea360595588ecade875a8c3c298e0c7380e6f088e41468c298de6a17b1e452b50f22543fabde5255c105021dc2167af3e51;
    stim[40] = 418'h3c86db15843722167f0399ab8a0a7a5755449952c46ef01839b6859f3b20f9e0988766cd4808fb465162f89cfdd44d6161a9f8868;
    stim[41] = 418'h2908f023b2bbd0b726475980828959eac29faefcf31f8ea219b9c7ee2fbfbe81da14ebc330a4dd6f2bd5b9de5dbf47c933b4dab74;
    stim[42] = 418'h3ea83602faab4df7a013a075c9ed376fdf75b94292a01cb2f96a55c5697636362a151d92061793b341baabafc75d33e846564a3d5;
    stim[43] = 418'h0df6ac21f15f36bb38ac978fee5b40d6afe0a870294ac506210a38b72e1bfe5be14d366fdf611a7b798227deb33bcd5b2501bc709;
    stim[44] = 418'h2d27268d313efd86303dbcaf6e42b5fcfd8100bc011bc0c05f9ff5e313095b7f4319695a33b166033b1661fb1a904b8b30d9d1b45;
    stim[45] = 418'h30c63f6ed8fad79a0c4ca43f0027f4c51036252c551681d6081bcb50a11fec537ccf5ea8cb5ba58bbab61531881c27a315db2641b;
    stim[46] = 418'h2d7b03eebb89517662b92a1d3cc4299946ed13df7076f2bab594d9703ff38d3a05bbcc1b26247a85ec2d3a38533a4da79f01701e5;
    stim[47] = 418'h074ddebd92b462193c9c2108fd335b7a0ce7ea41284626e909f1da68cebd8fc28626dcf87c551ac021a265fd70f32cc7851e8ba1b;
    stim[48] = 418'h095f145f46b177b9610601c0a5633f272f2c3685384dc028d66ecd66dc3d27b3b51385478d0a6d23e28d62d01c306915240ff2ebc;
    stim[49] = 418'h12c97686ecafc5707609f6027e60dc3915c61c6ebf4a2d100778d31725080ea8331e02e7f2109a9d554ec19df7019ed09032d4202;
    stim[50] = 418'h039f76b5245664594e39562c3abd833c70b733b000ab5338565e9bf92b786b654d5c5caecc23982ddac1193dff12c7a42605e1b24;
    stim[51] = 418'h06c61c7c8d179a1b1df1fba02d5897f9f3144a623cf874aa1210417f2dcf6aae3ba31d31089fdfbdca20fb8b1f64ba5f06775c6b7;
    stim[52] = 418'h22b421542f917375e134d2c4d9affbde23a668ed00b10295881842db0493e0dfdc6210cf1fe6c7d8b028d99c4cc989916fc397103;
    stim[53] = 418'h1ba04711ac70651c824f5646421f2f9224886db3832b470dcba7f6e4dfaf31edad75ef974f1b10e2c29cef7a16c22ed1695f9ca78;
    stim[54] = 418'h378d57b4972eda14c1a50a60a37435b3d447cae1083002f36202947696f7310f4b4ace5fa71023e144d461ff89439df6be3339cb4;
    stim[55] = 418'h360592a69ff23ce3d9c86dd75682a0e104f3db9cae1aaab50147a5506961443424a21e2dbac50d8d81291b228a87fda9a95a8f9b5;
    stim[56] = 418'h13466c207df185e80b17a6f80c40e469979ff181917d68b490b761b4ce755d1f4626f377ae404e75ac8ea2c00c326b856393d59fc;
    stim[57] = 418'h11ec1ca1fd854151bd54a05b594f1fe3096a9a2378cd39816d370cac74b36445ab4f066d1ae9c8bebbd5bde5a0ebf568894fc8684;
    stim[58] = 418'h397d593678d150e255c8816c4eb85ca9f097807696e0bd224a8dbf8682547fadac44a5794610b3bddc355d205dce06a3c7f484620;
    stim[59] = 418'h214ed7342b2fd6e58463f208f0aba548ab7a0d306bcd7d35c45024a4db3b4f9a7294f1573446861c1c10d6255f9ed758445468a0a;
    stim[60] = 418'h0887edadc97cb2a9cb11f1f14c1a0716b67e8f60fa90d0f64c107fbbce8cd73823c627910f26d7c524ae9a8be4d31707b77b2c85a;
    stim[61] = 418'h1b0ba21c0026003adb9cd453c3a2c2b4e3e1f529ae7705621a996dbe4738ecda1f091621d06d5454531d900205681a477492127b4;
    stim[62] = 418'h3c98b1d3b5ce31697c9a1fbee9e7b35876c22c3588675dc99141a6c0d220ae35ecdef791d29166c3383126d239085b684f2f24d1f;
    stim[63] = 418'h145cc39cf5c020ec8d285a74c0f129ce1b1dd61a8a05a1f8a525683930a637e34f45b1027c519720efd572d228b8b92c721a2682e;
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
      expv[0] = 10'h20x;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h203;
      expv[5] = 10'h202;
      expv[6] = 10'h202;
      expv[7] = 10'h202;
      expv[8] = 10'h202;
      expv[9] = 10'h203;
      expv[10] = 10'h205;
      expv[11] = 10'h207;
      expv[12] = 10'h209;
      expv[13] = 10'h20b;
      expv[14] = 10'h20b;
      expv[15] = 10'h20b;
      expv[16] = 10'h20b;
      expv[17] = 10'h20d;
      expv[18] = 10'h20f;
      expv[19] = 10'h20e;
      expv[20] = 10'h211;
      expv[21] = 10'h210;
      expv[22] = 10'h211;
      expv[23] = 10'h210;
      expv[24] = 10'h210;
      expv[25] = 10'h211;
      expv[26] = 10'h213;
      expv[27] = 10'h212;
      expv[28] = 10'h213;
      expv[29] = 10'h215;
      expv[30] = 10'h215;
      expv[31] = 10'h215;
      expv[32] = 10'h215;
      expv[33] = 10'h214;
      expv[34] = 10'h214;
      expv[35] = 10'h214;
      expv[36] = 10'h215;
      expv[37] = 10'h214;
      expv[38] = 10'h217;
      expv[39] = 10'h219;
      expv[40] = 10'h218;
      expv[41] = 10'h218;
      expv[42] = 10'h218;
      expv[43] = 10'h218;
      expv[44] = 10'h218;
      expv[45] = 10'h218;
      expv[46] = 10'h21b;
      expv[47] = 10'h21a;
      expv[48] = 10'h21d;
      expv[49] = 10'h21c;
      expv[50] = 10'h21d;
      expv[51] = 10'h21c;
      expv[52] = 10'h21f;
      expv[53] = 10'h221;
      expv[54] = 10'h220;
      expv[55] = 10'h220;
      expv[56] = 10'h220;
      expv[57] = 10'h220;
      expv[58] = 10'h220;
      expv[59] = 10'h220;
      expv[60] = 10'h221;
      expv[61] = 10'h221;
      expv[62] = 10'h220;
      expv[63] = 10'h223;
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
