// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 276;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028653 dut (
    .RegDst(in_vec[275:274]),
    .ALUSrc(in_vec[273:273]),
    .MemToReg(in_vec[272:271]),
    .Branch1(in_vec[270:270]),
    .Branch2(in_vec[269:269]),
    .Branch3(in_vec[268:268]),
    .Branch4(in_vec[267:267]),
    .Zero(in_vec[266:266]),
    .rt(in_vec[265:261]),
    .rd(in_vec[260:256]),
    .RD2(in_vec[255:224]),
    .imm32(in_vec[223:192]),
    .Result(in_vec[191:160]),
    .imm16_shifted(in_vec[159:128]),
    .RD(in_vec[127:96]),
    .PC4(in_vec[95:64]),
    .PCbeq(in_vec[63:32]),
    .PCj(in_vec[31:0]),
    .WA(out_vec[100:96]),
    .B(out_vec[95:64]),
    .WD(out_vec[63:32]),
    .next_pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 276'h5aecda6fc3b0a1a5800860fb1b9cda7cb96eb0b9e906f2b6f1933255bdd6350c52c5f;
    stim[1] = 276'hf1eef3cdff34a55ead904fcc06484ae301fa4cc4f844cc06b5cfd87ad7c0ec8aca050;
    stim[2] = 276'ha37f16055479f06328d314ef3dc59c7b1223b11bc24feed54f61092196810473d1f46;
    stim[3] = 276'hd24bdbec3c59f969fffbf0ef3ae122cf3a61dca08192868c507ac86bad164529cd3be;
    stim[4] = 276'h85a5fe7906112a3a66400d6b02ebbf6da2bc373e3dc34ec5ee15f40628d6b4eb668a3;
    stim[5] = 276'h1de7b6e779c985ef793a2fad0bd7654b3b8788c2b42e88ef8448032f88979c7fdc114;
    stim[6] = 276'h6eef66c14c070089118ad3dd623efbe9748a58c5296b8c9d8c16e98eb77dd32f15f19;
    stim[7] = 276'h744b7b5c4ca84d6ce2795f277fe0e4feab0b2e2e070631020f5678e1089ce66c35dee;
    stim[8] = 276'h793cea862ddff9707dd72f5003d43f6df24feface9022edd3a762afdd14ed01b16e9d;
    stim[9] = 276'h913c6939cde2de923a7eef5676df2dfdaad78cd5f36e0a6245476596b5334b2657c53;
    stim[10] = 276'hd91e901353ed6ce493ed8dee948bef2883e434c7296f4e9ddd314765c2ab708bcbb3f;
    stim[11] = 276'he3c6516acd1c6ca81faf7491a39962e5b12fbe5e5db73b5ad312a4cc55bd53df5f099;
    stim[12] = 276'h49ed9b2678eb80df3b49d0cce85c878bd7c243243a54de722af87914ff88c0108d510;
    stim[13] = 276'hb37b997891e71441982707d702214404b6183937289e6b1db9a1959cdcf16da32c033;
    stim[14] = 276'h2dd7ed358684753cb8e15a422ca1f0b8d94404b66f601db8f2b6324500e52554e4265;
    stim[15] = 276'hc86b41d9a53d712c46081f19263fbbc586b856a5ea06df414d1ad7b7a2a5f0b15ceb2;
    stim[16] = 276'h60f502da807fda44ec884d1e7cdcc27dc27cec33f85424fe950619b9c0bf03a855663;
    stim[17] = 276'h308ef79337c078b841097427f819ffec9a68e077e5f8847ef31536d4bf6f771a27931;
    stim[18] = 276'h21e65428525976c1c71cd890e6733dc26085f275be1fb4483ed7e0699da2b13f3d734;
    stim[19] = 276'he0f2e27c2c8ee2aea3064951298fc53b3a4fb4db5928f9117f83ddef895a969a24565;
    stim[20] = 276'h926da9a2a5440111b2112936454147dd62c745b131d1c0965471156242cb325400ff6;
    stim[21] = 276'hef47d0c240674a5e3518d342bd93682372e480992b4f5295ea59fcacd767cd87bbfba;
    stim[22] = 276'h8326f31120f41e197300c798e0e751ca268172119b445320b5502bb43c3b2f5d6f006;
    stim[23] = 276'h563b63ded77f31f8151e8c2cbd3d9a6464c4aa422ec370fb4e81e8e4b0ce9d5fb1cee;
    stim[24] = 276'h231745f724add8417009115c0ca818d77e14c3efb3e6c1f11dbaa2aa5545ff3d4736c;
    stim[25] = 276'h5474ab92194d180eb9f3d0d8497f7ca232340d5e985ca7426733bad11d9c2cb5e774d;
    stim[26] = 276'h0b14d8a1129c3bd7a361ec51601a8b7510e73fceef6dc041a32be56015c16f2e39c5d;
    stim[27] = 276'h787a9704e727808e86ab3d573d43ffd55190f7e2fdea46a80e65d9bec5536b5f7224f;
    stim[28] = 276'h3afca001d13594346c104730c11ba3ef0f8c0ea92c601fb9c62bb6fc8c921fc7bef06;
    stim[29] = 276'hf0ff43d1405f59b188eb874b6aa7fd5ab252b48337bd1aaeaa1a69fb7156b653b0c21;
    stim[30] = 276'h7984ebd688d2a3ff610a04f69ca1062005b775cd7ce0e180adc60f3da93807c8df90f;
    stim[31] = 276'h6d1b7c2f4d216b370b723505c08255b492fccd3565aadb42a606f79df1937b0b01868;
    stim[32] = 276'h79c0f192978f787e85ca9692472bf444ff3041130d4596789cb42d196da30fff5aad0;
    stim[33] = 276'h5120fb198afae01a76d412ab23cd79aa4217667bcdfa2e9a75afadf465cb9705242e3;
    stim[34] = 276'hf294137454fcb807014756368ca82debc90877fbdd12fc631a0f5f20d5db02652b1d0;
    stim[35] = 276'h6d42d08ff4afbae48cf36de8124676903c6c9b9d68ae91031d7fef74c3f25805c6f64;
    stim[36] = 276'h5baf3034e89f7b49f0fa228460fb61e8c89bb55454be579f05cc6f086afc926c065ba;
    stim[37] = 276'h20af43dff12ab74c151133c254796acd37c05ff90352f01f02e8176de7b0d38a393e1;
    stim[38] = 276'h1d08a28ab9d35fceaef899bd4d26b0bcad312157b9a937cd6a282d60a7621936c1c5d;
    stim[39] = 276'ha7afed0f43d96ea9830f88bf35facf9d7d7a84771768c2e295379a40df52c090aa50f;
    stim[40] = 276'h089f2fec6057f83fbc3a0b69d995af9434f94406785ad478f22ec8d603fdf8e812810;
    stim[41] = 276'h2f9346badff28f2f158200619ea6181ff7a939b187663802ef1507cd186332dc3d5a1;
    stim[42] = 276'haf6b4e7104e4d908df3eac1152fe42f9753b16b2e8e193b248aeb4171c400219f11d2;
    stim[43] = 276'h67efb43f488a0866c13e7b59a85998b8ba16da7a92b423d19c083c9e6ee29ded2a724;
    stim[44] = 276'ha86e873e2b05952f70635a4423bd63a76d0e062a068da3c6fc8e86318783ff65112af;
    stim[45] = 276'h03a2d6b1a422a0db1f5425e7a9006ca1457de03ede123d96b60abbefc78124fae1975;
    stim[46] = 276'hddcf3e434344197e03b70ffeaf98d35bc93ce86228944da4af1a2438c8dc5174f9194;
    stim[47] = 276'h1150cdca2b145e6126ecd9cf2e99a50dcadb4bfe32eb69c4a73fa8b13880f24bec5c4;
    stim[48] = 276'h68279e6900048d4f58156e7243115f21563cd9a265e107791f9974249fb47809719c1;
    stim[49] = 276'h296845725ca91ab182e634780fc5bba23b290872a947f5f4027f56825ef3e1e2c064d;
    stim[50] = 276'h32acfe5467f639d4f31fc1890bd0d3f26927614f721d6116e7712cd05d728a6f18cb9;
    stim[51] = 276'hed846044ca574c941507b997521e1688f019c41d546866489dc6fbb0edc3090c67870;
    stim[52] = 276'h5ed05fcc00bd8c38bdba3659c6403e4cdeceafaaf965f8a6608d2ecb18860376f4468;
    stim[53] = 276'h7b92ab8f0bc68085ec29da53031df73f7154e300d673404bf5f0b57965f7d9c69b5e5;
    stim[54] = 276'h0a8a9ef99abf1871a0b6cf191c34a1b5c562512077bff77787337c158eeaa24644c30;
    stim[55] = 276'h988a731463f37eea4014e5b433d6bc3999059417e63ff93ab0213c974e4b7c72b589d;
    stim[56] = 276'he66d12de3e3739b6cbd89278f2477bf59343cb32608898e1d926c07eee9a8f48d6777;
    stim[57] = 276'h17d131ac3e6bbc2b4d1f4281e6fc21a360814ca6175ddb6fc2b7685644ec075b86b49;
    stim[58] = 276'h5cb16727a33816187493cd34da38dcf4402e8d0b93b4f69fa2d9d0362225e2b581463;
    stim[59] = 276'hccfdb5d93e0afbcad1447fb9b8d27fc6edd551b781f34ad7acb58ec33d39b001347f9;
    stim[60] = 276'h92c15f1f5b6db0ffe828e1967aa3c10097ab2a345fd109096f32487a6919db618f204;
    stim[61] = 276'h5d5c181f805e1370c1da9335592f93a8955f41c0a0627cef64f958299fc9da561ad23;
    stim[62] = 276'h97d5d7419d7d9f5efd8b300e29326f47e6375fdf45c2c075f513d07b95361766bd0fd;
    stim[63] = 276'h8243ba1e7b43995f019b8f7e356c0afae3d21dcf25c2414ce29de059de01e7943d3df;
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
      expv[0] = 101'h0da6fc3b0a2b6f19332b6f1933;
      expv[1] = 101'h0055ead904cc4f844c87ad7c0e;
      expv[2] = 101'h1f06328d314ef3dc59ed54f610;
      expv[3] = 101'h00bec3c59fca08192868c507ac;
      expv[4] = 101'h1fe7906112d6b02ebb40628d6b;
      expv[5] = 101'h136e779c988ef8448032f88979;
      expv[6] = 101'h16089118adbe9748a598eb77dd;
      expv[7] = 101'h17d6ce2795e2e070638e1089ce;
      expv[8] = 101'h0e9707dd72edd3a762afdd14ed;
      expv[9] = 101'h1f939cde2dcd5f36e0596b5334;
      expv[10] = 101'h0001353ed6e9ddd314e9ddd314;
      expv[11] = 101'h00ca81faf7491a39964cc55bd5;
      expv[12] = 101'h19b2678eb878bd7c24914ff88c;
      expv[13] = 101'h1f44198270937289e659cdcf16;
      expv[14] = 101'h0b53cb8e150b8d944024500e52;
      expv[15] = 101'h001d9a53d7bc586b85f414d1ad;
      expv[16] = 101'h10a44ec884d1e7cdcc9b9c0bf0;
      expv[17] = 101'h078b841097077e5f886d4bf6f7;
      expv[18] = 101'h136c1c71cd890e67330699da2b;
      expv[19] = 101'h002aea3064951298fcdef895a9;
      expv[20] = 101'h1f9a2a54405b131d1c09654711;
      expv[21] = 101'h00a5e3518d82372e48cacd767c;
      expv[22] = 101'h1f31120f41798e0e75bb43c3b2;
      expv[23] = 101'h163ded77f3a422ec378e4b0ce9;
      expv[24] = 101'h0b8417009115c0ca812aa5545f;
      expv[25] = 101'h0ab92194d1d5e985caad11d9c2;
      expv[26] = 101'h0a8a1129c3b7510e7356015c16;
      expv[27] = 101'h0908e86ab36a80e65d6a80e65d;
      expv[28] = 101'h1e4346c104fb9c62bb6fc8c921;
      expv[29] = 101'h009b188eb848337bd19fb7156b;
      expv[30] = 101'h0e3ff610a0180adc60f3da9380;
      expv[31] = 101'h17b370b7235b492fcc79df1937;
      expv[32] = 101'h0f87e85ca96789cb42d196da30;
      expv[33] = 101'h0fb198afae67bcdfa2df465cb9;
      expv[34] = 101'h00807014757fbdd12ff20d5db0;
      expv[35] = 101'h0dae48cf366903c6c9f74c3f25;
      expv[36] = 101'h13034e89f779f05cc6f086afc9;
      expv[37] = 101'h1774c151133c25479676de7b0d;
      expv[38] = 101'h0428ab9d357cd6a2827cd6a282;
      expv[39] = 101'h1fea9830f88bf35faca40df52c;
      expv[40] = 101'h0ffec6057ff9434f94478f22ec;
      expv[41] = 101'h09f2f1582081ff7a937cd18633;
      expv[42] = 101'h1f908df3ea2f9753b14171c400;
      expv[43] = 101'h1b866c13e7b59a8599c9e6ee29;
      expv[44] = 101'h1f52f706353a76d0e03c6fc8e8;
      expv[45] = 101'h116b1a422a5e7a9006befc7812;
      expv[46] = 101'h00e4343441da4af1a2438c8dc5;
      expv[47] = 101'h08dca2b145bfe32eb68b13880f;
      expv[48] = 101'h19d4f58156f21563cd7791f997;
      expv[49] = 101'h14ab182e63ba23b2905f4027f5;
      expv[50] = 101'h169d4f31fc14f721d6cd05d728;
      expv[51] = 101'h00c941507b688f019cbb0edc30;
      expv[52] = 101'h05fcc00bd88a6608d2ecb18860;
      expv[53] = 101'h0a085ec29d04bf5f0b57965f7d;
      expv[54] = 101'h05ef99abf11b5c5625c158eeaa;
      expv[55] = 101'h1f31463f3793ab0213c974e4b7;
      expv[56] = 101'h009b6cbd89278f247707eee9a8;
      expv[57] = 101'h081ac3e6bbca6175dd85644ec0;
      expv[58] = 101'h16727a338169fa2d9d0362225e;
      expv[59] = 101'h005d93e0affc6edd55ec33d39b;
      expv[60] = 101'h1ff1f5b6dba345fd109096f324;
      expv[61] = 101'h0181f805e1cef64f958299fc9d;
      expv[62] = 101'h1f7419d7d9fdf45c2c07b95361;
      expv[63] = 101'h1fa1e7b439f7e356c014ce29de;
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
