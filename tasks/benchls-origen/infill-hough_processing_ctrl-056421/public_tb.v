// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 297;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056421 dut (
    .clk160M(clk),
    .rst0(in_vec[296:296]),
    .hsync(in_vec[295:295]),
    .vsync(in_vec[294:294]),
    .cnt_r(in_vec[293:284]),
    .p_sum0(in_vec[283:252]),
    .p_sum1(in_vec[251:220]),
    .x_sum0(in_vec[219:188]),
    .x_sum1(in_vec[187:156]),
    .y_sum0(in_vec[155:124]),
    .y_sum1(in_vec[123:92]),
    .xmin0(in_vec[91:81]),
    .xmin1(in_vec[80:70]),
    .ymin0(in_vec[69:59]),
    .ymin1(in_vec[58:48]),
    .xmax0(in_vec[47:37]),
    .xmax1(in_vec[36:26]),
    .ymax0(in_vec[25:15]),
    .ymax1(in_vec[14:4]),
    .en0(in_vec[3:3]),
    .en1(in_vec[2:2]),
    .done0(in_vec[1:1]),
    .done1(in_vec[0:0]),
    .ap_start0(out_vec[144:144]),
    .ap_start1(out_vec[143:143]),
    .ap_rst_n0(out_vec[142:142]),
    .ap_rst_n1(out_vec[141:141]),
    .p_sum(out_vec[140:109]),
    .x_sum(out_vec[108:77]),
    .y_sum(out_vec[76:45]),
    .xmin(out_vec[44:34]),
    .ymin(out_vec[33:23]),
    .xmax(out_vec[22:12]),
    .ymax(out_vec[11:1]),
    .en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 297'h15f5f2dc8bf25098f050563f7d6ed61233dc6d5bb77d3f085280925036ea73512c73c4a06e1;
    stim[1] = 297'h1b142c2cc77fca7d8013092ed75bc0113526b03a06750c730e35fc07e669689912abe0d5364;
    stim[2] = 297'h025ead76e0c41cd1c5649ee69389afd0400ddda262b710cebc23575522259984d12e2eac5dc;
    stim[3] = 297'h0282d6e9519ae5d71f765571f202d78accaa5ad2d0c89cde093cc63f53e8088d298ba733c34;
    stim[4] = 297'h00cea8dce7b476189d9c2767f0f42ee961e4b92fe698f54d28d07bf38a7e4b6e1d3fba55c6c;
    stim[5] = 297'h0a3b5c4c912d9ed6a53b7c8ebe225c517d15065f76a8bf4610de229016d463c657009ca0c53;
    stim[6] = 297'h0f825a4b5b7db1505c551916ad776b8f6fac4886bc96547180741c2964fc5abf4225683bf04;
    stim[7] = 297'h02c04033bb8d39c1d1a3d24465b1eaf9a302c8a52965d5ce7656fc7c1ca8983ede7c6aafd56;
    stim[8] = 297'h00742582fe8aebe5a1902b3dca5d09fcf0cbdcd46a75d5d092a6d6c6b06aec2491a23bb9b4f;
    stim[9] = 297'h08cc5a9b1fa9cd434ba3e803ac7d4dc9454424a751c2eb78764cac961eb56f502c71ee522a8;
    stim[10] = 297'h0d6922c2c3873f41ee7960d73a4f57dd3ae6bae2f57530fee2147a0660240b5c269f808f155;
    stim[11] = 297'h09a34d37c5b8632dbe83764c66c756d3c8b88a8f71cb399af1d9c1966a0d5386aa6a6224fe7;
    stim[12] = 297'h0a9d874d50135a593146391695e0f5b250a5a23fe2ecf81a50bf15b0a4811c33b7403bdb7e5;
    stim[13] = 297'h0762edd1f8cd062282fda0d9d87b8e1a70bbf574b8c183ad3fbee4548d2a0fe3404c87449f5;
    stim[14] = 297'h0d6786658e7aa84efc063f364a687795b9dd353f7ce4b95839906a44cc9b5cec3fc55530410;
    stim[15] = 297'h0186862f8ffa7af56acc5bf5d6aa33fcec56fb8d0994e1b6af859a6111d269ed59f996b5b2d;
    stim[16] = 297'h053e49c93725a4c006399630c148260bb653e3c5345c2f7eda27872fde1935e21f2764dbebb;
    stim[17] = 297'h0c28dc8c1f6294b7473b891f0f34f5f66e20284c33e90f56430b0a6be9d2281294f30fffc1a;
    stim[18] = 297'h00cade8ab069b2fcc6c5a66d975eb8171dfb13a3136077d96e4e8e7e1ef393b3fedbdc84c5b;
    stim[19] = 297'h044a9001283a6b685c1219332b6c9d910bc6b935486fc15358b99a61b5b27905b5d932829de;
    stim[20] = 297'h04cf7bd9f99ac77d1024c2f6888221fb3f0165e2358ecfcca0cb02107bd3a0d3136cce14771;
    stim[21] = 297'h0af7666dac11557492841cf078c0d97866980282bbf3dbd7ebaf339daa54357f67c182d86b4;
    stim[22] = 297'h09b4cd6f8c566626cfbd7153ce03df0eeb7b57cdecf9f05ebe7b60c33a5ae7df77d3182d8c9;
    stim[23] = 297'h0c14c7fb0e8a6372d4811cf588c7fa2bad2c5235e2a5e3497af966dfb501cfc9ed9ca04ba51;
    stim[24] = 297'h0ce204cc81d0fa3163719b232f5739a6000002de9afd356b92d17956dd35972975b66da110f;
    stim[25] = 297'h09a084c6b7a2440491ae56d5909bd5787d734e8b9ac1784e707a2da013708832c8fbb2d1c4f;
    stim[26] = 297'h0572b054ae24f340c25345eb304fb1ea3865ee35f33a8e0439b4f2a8a561c11a374f93dea3c;
    stim[27] = 297'h0eaf8b913293e5c35a2e7ad92d884060a0a59712156a0ab5638e8511bab553d0ae33effcb9b;
    stim[28] = 297'h08ff28c4113e16101d238567fc92a74da93dc7ce042f7abd2f08bdbeb86962f6bd5b7f39951;
    stim[29] = 297'h029f079aa6c7efcc89b72076417c20a8a41463e1ed36cb465c9d3139b2116b9421c59f5fd67;
    stim[30] = 297'h062254cda8e58d12dc305637e9ec6d33b32a708ae11a15052310dff340cfca2a6842f156e5e;
    stim[31] = 297'h0793757ea4d4ef5ccde53debf421cde89840edcf289bc6394c8c043ae6f8a997cb17542098d;
    stim[32] = 297'h01463c33f4a757934bb67282051aef65dd2776b68c7e4b12c8c0a045318e4bd966f74b53c20;
    stim[33] = 297'h09d3920e9bdd9a0747fcf29f81bb307a116fa74d843bbff0f816dd9ee9b14756dde4a1a1a80;
    stim[34] = 297'h095b3b75e0c38fb150901667dadbdceb1404844d50e5a29f474d5b9386c9f557713fe94b9e7;
    stim[35] = 297'h01d40c0b66808dde5789b5d895235fedc5152ad9a89f41c8fd28d41c845448855a27bdbdfca;
    stim[36] = 297'h028e05586449a96538e84592ee1647ef3287440781b3805084fea30f265c9822950d0e5889c;
    stim[37] = 297'h0deebb69db6d9ff79a4600a4bc18df2b845e93eeed9d4020878e445c3f3d3f0c7a76b74f14a;
    stim[38] = 297'h01c73ccce23afa541a47d3b3f3718e1cab5ea8fd34d25798c030fa24a936412c5d92f8369ef;
    stim[39] = 297'h013d7f44e19a4521878b79c8b8de383072861b183fb164b275b7ded144c1e255c895a3bd1b6;
    stim[40] = 297'h05187957bb0f6b6948efec66659d8addd40f0b4a8fcb3befe7f188e1aba12c655392f650721;
    stim[41] = 297'h07890d0eb83af2d06915a749dbe1d7bd6907eb09c9638ddfde01a3418f779f91f7a23755dbb;
    stim[42] = 297'h01b5e696f5c75ad3bcaa8ebb12d2de2d3f850f16513258fcd5bff1a4162354bf0a4b0b47ad0;
    stim[43] = 297'h0111cd3f0f1a01ede98bef410b51cd709e5b82ce15db76529ddc3c68df09ecaa6e62e1e6ca2;
    stim[44] = 297'h033f88ea7b9ca371bfa2cec3783a4a162fc7ba715442a41fb974617dca04cacdeace0537b0e;
    stim[45] = 297'h044157454397945ca023d145ca2e0e0d7c13371e90f2857569e7d1f2eecb1a4a134db22696e;
    stim[46] = 297'h04e46826f1a3b6896ddef689c69c8d8e2926e0bd85d8069fd5d4b78b69af3a663d938446b2c;
    stim[47] = 297'h0ab0063ab08afb6df623226ae0e37b1d49dee1e72c1e6a6de71b779d5edea35517fdb15b63f;
    stim[48] = 297'h0300bfa33c152e3a08b808fe6dacc0144537e3924180fd5ac07de6e03a159e18144782e12e5;
    stim[49] = 297'h02fa4a5f2d132fdc92594529165efe6cad5aba78ff7fda7c059f4230d0a01c26d9005ca4f74;
    stim[50] = 297'h09c60128c7e27bdd74d56d9d30d74962e27d54e32c8cd91c210169f4392a58d29e4a9b4da17;
    stim[51] = 297'h0e9a4124df07328f517438667e978afb21c14d849c4a8eb24f1463aca31503a19d0c8b99aa4;
    stim[52] = 297'h0919387ed7a4588e8d42e5cc603305e7ffc0473feb82dce37554a7c6f124a8a8e98b640a49a;
    stim[53] = 297'h0c1d4f07f492c2cedcea7b4cf3c31a94e19a5e840f4e4954327b509cfdc8ae06b56ed59c71a;
    stim[54] = 297'h0ef6016ce0ad6e648f67551de586ced3069e54ff32269085db1bb97bc6f2f9fdb52dbe12add;
    stim[55] = 297'h06335b26d211e5913ffa98dbd782351f211caa0af0afed2d1a9e35dc61b8db9dc766840684b;
    stim[56] = 297'h036f44d780f0592df20053752e372bc47bc41f6a0230cb7b0f9bf660fd12be23c8309efc687;
    stim[57] = 297'h038e23f6734b80c25a6898cba5903c34137e5141bda538514188b8c4cf61b416faa3556d2dc;
    stim[58] = 297'h0493bb03cb3f58df56902a27e9a726af4a2b475ac33299e3c878a46c303a90fd99a70634adc;
    stim[59] = 297'h049dbafb986c7dbdbfc5962876d60aa53cf48d2db3218be7bb407acc2527a1b90922dfe392d;
    stim[60] = 297'h05658fb47f722c2b9afc0d63cb786ee67b660da0e55495b4c5ab79896afbf07d38d1667d660;
    stim[61] = 297'h0628b1ee7f638946b0b05877882a17745f13c4caa0a32a6ef6ccb0152fa4791f86dd8c84636;
    stim[62] = 297'h0845d4f02a53f81502f74e9956c235d84a8444cab8d87c8a060399014044943ae8eae2fdead;
    stim[63] = 297'h0696c847575d0ad9926d62b56fccfd9df7de084f4f8319d2c2c4135d0705b1c49d17c4d16f2;
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
      expv[0] = 145'h0000000000000000000000000000000000000;
      expv[1] = 145'h0000000000000000000000000000000000000;
      expv[2] = 145'h0000000000000000000000000000000000000;
      expv[3] = 145'h0f5aedc1893dcd2713bb44c56eaea25a68bab;
      expv[4] = 145'h1fcbae3eedaf15995539bc1279f504462e787;
      expv[5] = 145'h1f51b9cf684ecfe1e9725fcd30f7e7e70ee95;
      expv[6] = 145'h0800000000000000000000000000000000000;
      expv[7] = 145'h0762a0b8aad71edf58a8e300e8966d58957e1;
      expv[8] = 145'h127383a347d5f34605ab9cecadc1cc19f1fab;
      expv[9] = 145'h104b05fd14567b94bbb9a8d4ebad86aa48eef;
      expv[10] = 145'h1eb5363f53d00758fa494ea385592b5016b95;
      expv[11] = 145'h1c7e83dcf2afba75cc61fdc4286605aa7ee2b;
      expv[12] = 145'h10c65b7d06ada791707335e3b366a9c1a99fd;
      expv[13] = 145'h14b4b2628deb64a14bf034a17f0a4e1d006fd;
      expv[14] = 145'h040c4505fb1c34e177075a7f7d48c7f13293f;
      expv[15] = 145'h1e00000000000000000000000000000000000;
      expv[16] = 145'h150c5f1ff4b7ebad55f71a132934dd26ac5ad;
      expv[17] = 145'h0893926e4b2c618291c78a68b90e61910f937;
      expv[18] = 145'h03b9183ec5123e1e68509867d214dd214a3ff;
      expv[19] = 145'h19bd1560d34cdb2ebc274626c11cef39ff721;
      expv[20] = 145'h1320025074326656d9726a90df34db22daca1;
      expv[21] = 145'h1c00000000000000000000000000000000000;
      expv[22] = 145'h16aae92509b2f0cd31b7afd75fda9abf060d7;
      expv[23] = 145'h159adf18ace2a79c06af9bd9f2c1a5afbb60b;
      expv[24] = 145'h0400000000000000000000000000000000000;
      expv[25] = 145'h18099903a136465eae05bd35faf2935cbab69;
      expv[26] = 145'h11098d6f44adab21369d1735825b770964cb5;
      expv[27] = 145'h1f60a95c488bd6609fdc6be675e5561d1b4f7;
      expv[28] = 145'h1117226526f5b25b112e242ad50a2b5057bff;
      expv[29] = 145'h0c00000000000000000000000000000000000;
      expv[30] = 145'h11df99136e41514829968cb93b9b35cf16fad;
      expv[31] = 145'h0aa99b51caac6fd3d8e115c235bfccfd34c55;
      expv[32] = 145'h04eafd49a87bd7e843db9e5136086f8be5509;
      expv[33] = 145'h0e00000000000000000000000000000000000;
      expv[34] = 145'h1600000000000000000000000000000000000;
      expv[35] = 145'h191f62a121b9d62809453e8e9b387aacff73d;
      expv[36] = 145'h121816cd016bb12a4655b3513fa80542adf6f;
      expv[37] = 145'h1e0ab0c8928b25dc2c880f03674625c94a397;
      expv[38] = 145'h1b76d3b6da0149783127dddb3a88b3d63ddd3;
      expv[39] = 145'h107999c475a767e6e351fa69a5f453662ee0d;
      expv[40] = 145'h0a8a430f167060e50cc964eb6f14712a56a37;
      expv[41] = 145'h0c00000000000000000000000000000000000;
      expv[42] = 145'h001a1d70754e93b7c3d61392c746b778fbdd5;
      expv[43] = 145'h1600000000000000000000000000000000000;
      expv[44] = 145'h0a00000000000000000000000000000000000;
      expv[45] = 145'h0311d4f7399d86f07574e2a884c2e04ef514d;
      expv[46] = 145'h12ae8a872fa28b945c6e3d21e5a3ecb509c89;
      expv[47] = 145'h0ed04de347ed138d39c17b0bb16f1af31e111;
      expv[48] = 145'h100c75611444d5c1c7c3ce583cef2dea8bc57;
      expv[49] = 145'h145c74117180288a6ffab580fa038f091e25d;
      expv[50] = 145'h165fb924b3fcd95ab5b4f80b3f0d0e14019ef;
      expv[51] = 145'h10f7bae9aa92c5c4fbb238420343ac692ab43;
      expv[52] = 145'h16651ea2e915f643831d649e28ca01d432355;
      expv[53] = 145'h0a70fdaf49cb98c0668e7fd7054f924c74903;
      expv[54] = 145'h029e0fe924f699e786bd081e9ca11c8b5a567;
      expv[55] = 145'h1402d9c15aaa3bcb0ca9fe644d72ef2edaf85;
      expv[56] = 145'h08b64da42331b7af055415e15e6b9b8ee3101;
      expv[57] = 145'h00b25be4005788f78996f61f360fdf10c28d1;
      expv[58] = 145'h0647ece69731974b20a2837b4b71b61b7d55b;
      expv[59] = 145'h177607967e544fd34e8eb5866548c3aecc18d;
      expv[60] = 145'h1575f730d92c50edad1a5b6642f5927c847f9;
      expv[61] = 145'h1e00000000000000000000000000000000000;
      expv[62] = 145'h0b128d61602ee8be2654dded9952fc8b768c7;
      expv[63] = 145'h15a9e054a69d32ad84899571b132044d748bf;
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
