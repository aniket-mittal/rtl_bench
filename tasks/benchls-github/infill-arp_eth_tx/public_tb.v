// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 324;
  localparam OW = 127;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  arp_eth_tx dut (
    .clk(clk),
    .rst(in_vec[323:323]),
    .s_frame_valid(in_vec[322:322]),
    .s_eth_dest_mac(in_vec[321:274]),
    .s_eth_src_mac(in_vec[273:226]),
    .s_eth_type(in_vec[225:210]),
    .s_arp_htype(in_vec[209:194]),
    .s_arp_ptype(in_vec[193:178]),
    .s_arp_oper(in_vec[177:162]),
    .s_arp_sha(in_vec[161:114]),
    .s_arp_spa(in_vec[113:82]),
    .s_arp_tha(in_vec[81:34]),
    .s_arp_tpa(in_vec[33:2]),
    .m_eth_hdr_ready(in_vec[1:1]),
    .m_eth_payload_axis_tready(in_vec[0:0]),
    .s_frame_ready(out_vec[126:126]),
    .m_eth_hdr_valid(out_vec[125:125]),
    .m_eth_dest_mac(out_vec[124:77]),
    .m_eth_src_mac(out_vec[76:29]),
    .m_eth_type(out_vec[28:13]),
    .m_eth_payload_axis_tdata(out_vec[12:5]),
    .m_eth_payload_axis_tkeep(out_vec[4:4]),
    .m_eth_payload_axis_tvalid(out_vec[3:3]),
    .m_eth_payload_axis_tlast(out_vec[2:2]),
    .m_eth_payload_axis_tuser(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 324'hbb838d5e711a8a57cd810a80e87df0270d9ff8419abac822d785274e3b0ab99277e21ff8f6394106d;
    stim[1] = 324'hf633511b75c073cefca881008422a47f89d95f67d0e8ce35dd248a516e358f072afa60498e11031a1;
    stim[2] = 324'h48e9a40c1549c9c6270758285301d8d9ea14ddc1808c0993548d832f04dbbd362bf121c9990a9f989;
    stim[3] = 324'h77c3a86f2222bc8ff5c226b3b5146f2489d6c498598cde717f456dcc4b5e0fcf7fbe0b6a171d368b2;
    stim[4] = 324'h30857c9c7318f370db739b7a858383b18c437070cff5448ece77711bf97416b491d94daa778fb23e9;
    stim[5] = 324'h7c3ac6a96ae2fd72d814a1d37a81047e50cee560b0c5f094952fd90e5cb276bd7804d000671dd9d7f;
    stim[6] = 324'h7a805c39ebfcafec4f9fa9ffa2cc107a2f1dc6a3eeac71f748382b71dfcb1cd2d1ace6807bf0b0383;
    stim[7] = 324'h65870057db022f64ca1da0527a11fff8e2ae5a4540e45980db90a3e4ade9282c16dad4eb4cc2bc626;
    stim[8] = 324'h6cf9e3eaff4157358a47fbe14bdd68eac8236ee556b1ffb1aa39faf3a0a6c9ba44debea409a2ef4a9;
    stim[9] = 324'h612ab9551190975a10305e515426288a8f4a4dac120a0618857170a29ad2bbf99ff99b11ec6e3a5ec;
    stim[10] = 324'h097b0e8ece2945b9a311f0ac8d96d0757618767a2af42d2079415d278a347241b00f1ec0038b8eda1;
    stim[11] = 324'h54a2528d008eaf9b72595ab73697f1c1af782cf8ba9bc1eb999faaeb53babf41d2b4685bec6653459;
    stim[12] = 324'h40dbc2346e12550ebdcb282725cc6c1df6bc026dec9ec13e2452184aab8cc67c65532a44f98a81f24;
    stim[13] = 324'h6608de41c53854e5ba19a670a2a7585cedcd601f5802d6f9ac4f11c9c8ff9a618c4b7e9fbda4ee4ee;
    stim[14] = 324'h1d62bbcab34e00ee820a8c8e15436e95c66cd874b3d8f6987c711e088eea07642c5f6a437845778b6;
    stim[15] = 324'h11211154801f67dda52a7a9049cd4be139319460f841b05ab7927c12d175d7e112142a0b4ee0ecb5a;
    stim[16] = 324'h450b308afcf188bd5d0a309d155fa7a962d26619836cfea222c937c9dc3622788af7f8d17337e9800;
    stim[17] = 324'h3c6e6e511e9f23d503a02b5a49abb7f9609944728d0b26784bfc1d543bcd112eda87acf3e44d681a1;
    stim[18] = 324'h1a77815210739eba870b7c04831c07dce84a9b56b3bf8f653f6a5c605c74f69ca0a882cf1a2240144;
    stim[19] = 324'h601012494124faec654add33d95a8d841952f6ae986a37c79711a309a2f4f844098e07cfc44411b0d;
    stim[20] = 324'h1ecd4ebcdb1f1b2d776fe71455fde939cac86034102c3660d907ed30b32b32a19368db4db8f87ea7b;
    stim[21] = 324'h1eaabac36669567a21adab85bb4fd6f05220779aef4845ca91285f4328d0e59198270005211769465;
    stim[22] = 324'h06c7b04e5bf2852eef8c08bc413964ce71def73614c0b4ab61fcf56eb11eb0b89b6fb81f469f373d9;
    stim[23] = 324'h3dff1ac57b0729279bf922c9dd151cfa29d0ace196c8f20906827a619ca35cf663b3976778cf520e8;
    stim[24] = 324'h5e7277f9c1d414522df5d6a74f9c92829158dc70a0e1247ce3155293704fb25f9521c4dc9e4f43cf3;
    stim[25] = 324'h3753e640054a79807282944a0448f02970a1bd6986fea01e157860f0af3a9958f6d1c783b074ee3d7;
    stim[26] = 324'h662e3eabcd81674225707543832499f602100b26df23ece19d6621574118c2f4868ea6c0b259bf7d1;
    stim[27] = 324'h32123edd9cb259a7631c83b4045a019489da8f04c338c74bbf3ff0f166cc67d822ddc8ba2defd971a;
    stim[28] = 324'h3bd8d50cada547a492114baf78cee8f1f42c93f70ea88eb04ed17391947faca66bca6b66089f26f9f;
    stim[29] = 324'h7c2ea7bfd53db8e481c39c79cccd0cc78e50b20be4e17e467ba962928a3945e42aad1c2f1f053472c;
    stim[30] = 324'h35839a299f65a045987b19106a3e7276e417c32ff22b2b8a05ca884ca8009d38ec5985ecf01fe10f2;
    stim[31] = 324'h759106180217b49a4db4b81f9a8419278287fb917fc430eecc17c07c946f88815e5941b3bfc294fa9;
    stim[32] = 324'h093378b34b1d57818194d4b949ab538c2e5463e5e703d3678e35a560ce3412bc8433411f576d7092b;
    stim[33] = 324'h5bcee893ce003d1b78b84338cc5e06c406bef8a3f072bc064c9f08a8afc2c80b167afd7d953c2f687;
    stim[34] = 324'h037f0e9ae16d1340a8f1c7bdb4ea5f2d7f69177674610182bb49964792cca80dfed3f52c41d61139e;
    stim[35] = 324'h090a5ebfc677482933e9790c44bd7d530195d6606a80d8a210e11482e1936ec1f4f08ba2d8d772bf6;
    stim[36] = 324'h34a38050f3ab9dd2cc2140465bd19a88303e11955eb382992fc83b124954f25977f65908b8e34a641;
    stim[37] = 324'h391d1e7d67383681b228a9c6db9b98b71d779a14661ca2617b2a72764ea96bd5e065d5a0914074faa;
    stim[38] = 324'h621b90b1b9af06c8511fda92e34c560150dae7032e0a7802ce449c0cb32ee41f4b4fc062e8a537315;
    stim[39] = 324'h12a9bd042f2147f7722c253ed5ba5b0da89d5c9ae664805d43fc1af139f8933166ae9b6464e035abe;
    stim[40] = 324'h7a70d256cfdbf256b9e13e3b622c784aa0ad4f6e59ca6061674a73c847ea0d7cb917229dac6b870d2;
    stim[41] = 324'h7d2c50fb3c1c5e89576befbda3c1e3912a98ad15ef8003107835b81ee876c706b9ec39f984aaadeb2;
    stim[42] = 324'h54b3c4500fb60bdc8387eab594b6002181d41acfbcd50ccf5d5447b3a9aef79145b2531a2a62d6b07;
    stim[43] = 324'h3cf856e18ed81d6a8f73d812eb7d51a227d8153bbaa41c3db305ee8dd07166ecb9a1070643aea9157;
    stim[44] = 324'h2b24e3c97927b98f97f9b8ce191691f74ef58cc96ed4fa068dd0bcd5cf3a91002f2488a08577028fa;
    stim[45] = 324'h55398d96fd4223d1f5659cb5dfe5abd71a4c492565197f3bb3b85a6ac23523b587fa5c564a08a4bd1;
    stim[46] = 324'h2b9c24ad18fa7e954bab77fe639637f952c23e4b9d66a3c3c45a59bd3497f8d84beb74f5573162df9;
    stim[47] = 324'h0ebf2ca28f0f1cafd5ec712d7377a777e86dcf716d2e45576a0010548e3935bd357e389107d9fe38f;
    stim[48] = 324'h728b1e76f27c7ae83074fec86f7b2f9692f0f2bb503c07df9d0c8df1e8a3933428671225ac91cf0c6;
    stim[49] = 324'h37ba58af1dbd158dd2a6c1e2575786e113b6570cd792f590ec6444d21f525d6e6693b1005b1c4b7b1;
    stim[50] = 324'h5bade9f68a5a053849c526fd629430bb4600c30c6141969b06a4101f7b5e892c91dc7cd8addd596f9;
    stim[51] = 324'h01e768fa4db770157a3bb91bc29a84849650aee6c4b5b8ecc9c9d34eedcc6c10c3d114c3a83708f6b;
    stim[52] = 324'h55a72f0d2943f1ee947bb085c6a2008a6a1d20ad41f63b44e3575d86448a21405bd6b680746424da8;
    stim[53] = 324'h0e8e9821e7ff0fa0615f785c40f5e3db246cd136085b723f4d8a4d67ff8e28e77ac0dd99492e85d63;
    stim[54] = 324'h66b363a31bebfdb791865e36a3133c7609c350cb6d078d53691f4ae4bf95d065222079ec7dbfecafd;
    stim[55] = 324'h1998553e4edd50a6208bf4f1227ea6f89123819230ad025bb09fe14fd01d0e5805b84c26893fea732;
    stim[56] = 324'h51728d0b4b18778dbd3f0e927554a5ead3137829a1fd12ff9e443f0764afe527b9da399140d120cae;
    stim[57] = 324'h08e82f3cea1dec93747c490d61e218fce34f48fbb1bd8122d5fc262940c75279925a4bbba06795523;
    stim[58] = 324'h17cf057d431780e5eea13eb3050cf5c28a0a4850f0e5dd7f98f39adb12a112a138cf9cf712f4fdd43;
    stim[59] = 324'h409aee8fe9fd7c883ca901ef6fe4a406afbc4a34e49c9fc97d83827dee0f5e00b4457a01f0ad88a14;
    stim[60] = 324'h7383b1e51bb18a8b267c81c77612a507ec62b2d61e66b93f7ca966d6997081e7e64549e0b16d9d25e;
    stim[61] = 324'h6f3c9270e7abd7349b2001844797b59cae74626cd1334ece85771a026d602da5843c19b1524cb6655;
    stim[62] = 324'h7e6df588a8c185b9602a15bbfc0c49f8da1537cc1dcd0cea7e4f7c9a240f45f157e09e6ecfcb3f7ad;
    stim[63] = 324'h2a81c26ab750867dcc96ca56c78d0406945db9194dbd3e0ff4a1545a0402a3ccc73025d1d3bc16cdb;
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
      expv[0] = 127'h00000000000000000000000000000010;
      expv[1] = 127'h00000000000000000000000000000010;
      expv[2] = 127'h00000000000000000000000000000010;
      expv[3] = 127'h40000000000000000000000000000010;
      expv[4] = 127'h3be1d43791115e47fae11359da8a2011;
      expv[5] = 127'h3be1d43791115e47fae11359da8a3799;
      expv[6] = 127'h1be1d43791115e47fae11359da8a3259;
      expv[7] = 127'h1be1d43791115e47fae11359da8a24f9;
      expv[8] = 127'h1be1d43791115e47fae11359da8a24f9;
      expv[9] = 127'h1be1d43791115e47fae11359da8a2b79;
      expv[10] = 127'h1be1d43791115e47fae11359da8a2b79;
      expv[11] = 127'h1be1d43791115e47fae11359da8a20d9;
      expv[12] = 127'h1be1d43791115e47fae11359da8a2099;
      expv[13] = 127'h1be1d43791115e47fae11359da8a2099;
      expv[14] = 127'h1be1d43791115e47fae11359da8a2099;
      expv[15] = 127'h1be1d43791115e47fae11359da8a2099;
      expv[16] = 127'h1be1d43791115e47fae11359da8a2099;
      expv[17] = 127'h1be1d43791115e47fae11359da8a2099;
      expv[18] = 127'h1be1d43791115e47fae11359da8a2259;
      expv[19] = 127'h1be1d43791115e47fae11359da8a2259;
      expv[20] = 127'h1be1d43791115e47fae11359da8a2c39;
      expv[21] = 127'h1be1d43791115e47fae11359da8a2cd9;
      expv[22] = 127'h1be1d43791115e47fae11359da8a2679;
      expv[23] = 127'h1be1d43791115e47fae11359da8a2f39;
      expv[24] = 127'h1be1d43791115e47fae11359da8a2f39;
      expv[25] = 127'h1be1d43791115e47fae11359da8a38b9;
      expv[26] = 127'h1be1d43791115e47fae11359da8a3fb9;
      expv[27] = 127'h1be1d43791115e47fae11359da8a22b9;
      expv[28] = 127'h1be1d43791115e47fae11359da8a22b9;
      expv[29] = 127'h1be1d43791115e47fae11359da8a36f9;
      expv[30] = 127'h1be1d43791115e47fae11359da8a36f9;
      expv[31] = 127'h1be1d43791115e47fae11359da8a36f9;
      expv[32] = 127'h1be1d43791115e47fae11359da8a2639;
      expv[33] = 127'h1be1d43791115e47fae11359da8a25b9;
      expv[34] = 127'h1be1d43791115e47fae11359da8a2f19;
      expv[35] = 127'h1be1d43791115e47fae11359da8a2f19;
      expv[36] = 127'h1be1d43791115e47fae11359da8a2f19;
      expv[37] = 127'h1be1d43791115e47fae11359da8a27f9;
      expv[38] = 127'h1be1d43791115e47fae11359da8a27f9;
      expv[39] = 127'h1be1d43791115e47fae11359da8a27b9;
      expv[40] = 127'h1be1d43791115e47fae11359da8a27b9;
      expv[41] = 127'h1be1d43791115e47fae11359da8a27b9;
      expv[42] = 127'h1be1d43791115e47fae11359da8a27b9;
      expv[43] = 127'h1be1d43791115e47fae11359da8a3fd9;
      expv[44] = 127'h1be1d43791115e47fae11359da8a3f19;
      expv[45] = 127'h1be1d43791115e47fae11359da8a3f19;
      expv[46] = 127'h1be1d43791115e47fae11359da8a25b9;
      expv[47] = 127'h1be1d43791115e47fae11359da8a3519;
      expv[48] = 127'h1be1d43791115e47fae11359da8a2b99;
      expv[49] = 127'h1be1d43791115e47fae11359da8a2b99;
      expv[50] = 127'h1be1d43791115e47fae11359da8a2e99;
      expv[51] = 127'h1be1d43791115e47fae11359da8a3b59;
      expv[52] = 127'h5be1d43791115e47fae11359da8a259c;
      expv[53] = 127'h2ad3978694a1f8f74a3dd842e351059d;
      expv[54] = 127'h0ad3978694a1f8f74a3dd842e3510011;
      expv[55] = 127'h0ad3978694a1f8f74a3dd842e3510059;
      expv[56] = 127'h0ad3978694a1f8f74a3dd842e3510059;
      expv[57] = 127'h0ad3978694a1f8f74a3dd842e3510059;
      expv[58] = 127'h0ad3978694a1f8f74a3dd842e3510539;
      expv[59] = 127'h0ad3978694a1f8f74a3dd842e3511519;
      expv[60] = 127'h0ad3978694a1f8f74a3dd842e3511519;
      expv[61] = 127'h0ad3978694a1f8f74a3dd842e3511519;
      expv[62] = 127'h0ad3978694a1f8f74a3dd842e3510e99;
      expv[63] = 127'h0ad3978694a1f8f74a3dd842e35100d9;
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
