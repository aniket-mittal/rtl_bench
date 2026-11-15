// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 176;
  localparam OW = 274;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098963 dut (
    .RegWriteA(in_vec[175:175]),
    .MemtoRegA(in_vec[174:174]),
    .MemWriteA(in_vec[173:173]),
    .ALUOutA(in_vec[172:141]),
    .WriteDataA(in_vec[140:109]),
    .WriteRegA(in_vec[108:104]),
    .RegWriteB(in_vec[103:103]),
    .MemtoRegB(in_vec[102:102]),
    .MemWriteB(in_vec[101:101]),
    .ALUOutB(in_vec[100:69]),
    .WriteDataB(in_vec[68:37]),
    .WriteRegB(in_vec[36:32]),
    .ReadData(in_vec[31:0]),
    .Wen(out_vec[273:273]),
    .Ren(out_vec[272:272]),
    .Addr(out_vec[271:240]),
    .WriteData(out_vec[239:208]),
    .RegWriteAOut(out_vec[207:207]),
    .MemtoRegAOut(out_vec[206:206]),
    .MemWriteAOut(out_vec[205:205]),
    .ALUOutAOut(out_vec[204:173]),
    .WriteDataAOut(out_vec[172:141]),
    .ReadDataMOutA(out_vec[140:109]),
    .WriteRegAOut(out_vec[108:104]),
    .RegWriteBOut(out_vec[103:103]),
    .MemtoRegBOut(out_vec[102:102]),
    .MemWriteBOut(out_vec[101:101]),
    .ALUOutBOut(out_vec[100:69]),
    .WriteDataBOut(out_vec[68:37]),
    .ReadDataMOutB(out_vec[36:5]),
    .WriteRegBOut(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 176'he11aafd9fb0b9b906537ffc6c8c3e5772077908748eb;
    stim[1] = 176'h092b8a99be247bd1d1c52925271374d802b7476daebf;
    stim[2] = 176'h1676c0ac87250fa62dc9b948c94f8679957d09a30ecb;
    stim[3] = 176'hd0c11d4fdce5f9a82ae376f4670070e4a67a78e1664d;
    stim[4] = 176'h6ef6c7a599163f3d4af851939337f04b3753370f9aef;
    stim[5] = 176'h8283c29f72bc76a08db500340bc7c00bb6b5c38abc6c;
    stim[6] = 176'hb9facaa2a9c22c9dc38b669f228a21db97a699f13ce6;
    stim[7] = 176'he14e4b74185c681e129d9e7c8d64e838b84765218749;
    stim[8] = 176'h1576664605d007ac1ca5b61ff4e37c7b274b2568cd34;
    stim[9] = 176'hd93846cb3dfdbdf3ae5e8a409ed854483562b6bff0b0;
    stim[10] = 176'h2028b5594af713f726530b50c61e99154f3c7a0916e2;
    stim[11] = 176'hf1291244b11f9905d1057411ddd7b1881ecfb3ae63d6;
    stim[12] = 176'h56a71334eff73052d118c7b44939b26c938fcd2b1d3a;
    stim[13] = 176'hebef5e48be1f5c58eb635ffe3debac094c7a2ae80bc3;
    stim[14] = 176'hc39227b2c16e6bc07d4c3415d754141ded635fb7bff5;
    stim[15] = 176'h2114865d45525c2cfafe790f130ae5a0540350b1ee6e;
    stim[16] = 176'h5fafbd2c2c3c0d2e86b236eef286d9a6ca6562ce548d;
    stim[17] = 176'h8cbca0236ee558d04a8baf64a8a4498b2a107226e5f3;
    stim[18] = 176'hf581a1a35b255b3cb103ce348ff89bd7204191ed623a;
    stim[19] = 176'ha1ff8c5f5e0d878b0f27e74799209cdf4b66f87245a7;
    stim[20] = 176'hc28a12fb7f8d360a5c8959b99d1b914dbcf735529d54;
    stim[21] = 176'h334c8ad898b2e354edbeb21c117f9a58df64527ab957;
    stim[22] = 176'h73a37901b4b9345decd3f2579b7968c0a13b0c855ff8;
    stim[23] = 176'h968cae96b7ce850ed630ebd59fb11160b3eefd2d142d;
    stim[24] = 176'h749f5a5ea7e63fe51e703c041b0400b3bf4ef60873b8;
    stim[25] = 176'h5800693e22df72723515c424e86c2d9e48bf93432d0a;
    stim[26] = 176'hf1087c5e3a7ef2ad2bfd8917e01bab5cff740c71f6e9;
    stim[27] = 176'h079bca80bc20ea02b35ff04e48514a86a99add9583af;
    stim[28] = 176'habd2c4146df2b15e4e85e608dfd9e59bca627ee4a101;
    stim[29] = 176'h65a33fa0c77c864be4e221fe2696889c747847f732cc;
    stim[30] = 176'hb96a40be93062bf8a5fbfdedca77f21d2582c1dd401d;
    stim[31] = 176'h29ad2ab5e919402fce2570bc218bef0d1015ff02c4ee;
    stim[32] = 176'h88f3bbb9f6f320654a1b1e28323db8d0b7e616026f92;
    stim[33] = 176'hc74ee38941f651fc02f4a66c287ea82c02ffc9b5501e;
    stim[34] = 176'h4261bbe49fbcdeff235a1389b724e918e519d3b297bf;
    stim[35] = 176'hca30471c24b9f9156f547f1ed00c76ffe8fdc26473ae;
    stim[36] = 176'h6594a23d4dbe8e36af65bc83b2acdbcf682a1bcf567e;
    stim[37] = 176'hbf23dc0c1297d0e1ac7247ab3d9397b8d4f557cac042;
    stim[38] = 176'h2b2bd54971242912ce4f2e6dad8b0ddccb92a75e2ce1;
    stim[39] = 176'he5f10e2bb536209ce5f907a8d15a486eaa0b98f6c061;
    stim[40] = 176'h72f931cd3a3051ff09ebe016e71c244bdd504c792b2d;
    stim[41] = 176'hfc9c9871ddd47b7c637ce893c7e56144aed7bed7c7aa;
    stim[42] = 176'h4e1800e329de8085e5d6335ba3c3803f884b745eb890;
    stim[43] = 176'ha3196c15f59ff9b9de41c1931fb9ce73cbd6879d2713;
    stim[44] = 176'h29cf8225aa69c3ae9e7222e9e0e9c31bf9d86dc7097d;
    stim[45] = 176'h38b1a0771df76c9a6d37f8f5d851bbb82980a1bfc0da;
    stim[46] = 176'h42b12b19da7e329ef9378a6aee11d0b8a0f474107872;
    stim[47] = 176'h5f1d26640a8a210daf73c477f668e05bc5d88927db65;
    stim[48] = 176'h76a4cdd050241cb4f9251d2ad445ffdc2d670ca88b6f;
    stim[49] = 176'hbb36eb93363b287aba3e0a8d614311bc9218da78aff4;
    stim[50] = 176'h0fd0262b4ca99fbb05ac17f55d7d8967e31f9168c952;
    stim[51] = 176'h36902ffd7d052052cb8375bdc592b1548b2354340ff8;
    stim[52] = 176'hfd4a6c01b2232d0c3b7372e4b937a6dd32286e542103;
    stim[53] = 176'h998f9a98500116acac7b66ffa3ad4da216816183e984;
    stim[54] = 176'h2691d19c1c45ad176a1b4ad629b4f0e7a1f2f4acdfaf;
    stim[55] = 176'h409973bae3d045dadbe9b009beb8aafeeb50ed34ea63;
    stim[56] = 176'h7c7026d1cbb0fa9286cc64850bd44248af991519ca6e;
    stim[57] = 176'hf20b686592e3421a792e58e7445c0bd3918417fce284;
    stim[58] = 176'hd07126d5728f9bfb39447f192597e621e262121a1e01;
    stim[59] = 176'h93b8b19889032f125bf715d25836c39ed5c859ba6196;
    stim[60] = 176'h162d921d82f1433485d56729dcc916d1d54d2930426c;
    stim[61] = 176'h5dd21cab49e3cf3bc86f03b174313ccc0fc39269115f;
    stim[62] = 176'h626ace665470fea6d532655a073526b426de8e7e2d80;
    stim[63] = 176'h28fb2074a79d6e5c23355a0a2485c7d4e0c1f7689e26;
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
      expv[0] = 274'h308d57ecfd85cdc83e11aafd9fb0b9b907210e91d6537ffc6c8c3e577207210e91d77;
      expv[1] = 274'h1294929389ba6c015092b8a99be247bd1c8edb5d7f1c52925271374d802a8edb5d7f7;
      expv[2] = 274'h14dca464a7c33ccab1676c0ac87250fa6213461d96dc9b948c94f867995613461d97d;
      expv[3] = 274'h38608ea7ee72fcd41d0c11d4fdce5f9a82f1c2cc9aae376f4670070e4a66f1c2cc9ba;
      expv[4] = 274'h377b63d2cc8b1f9ea6ef6c7a599163f3d46e1f35deaf851939337f04b3746e1f35df3;
      expv[5] = 274'h2a801a05e3e005db58283c29f72bc76a09871578d8db500340bc7c00bb6b871578d95;
      expv[6] = 274'h2cfd655154e1164eeb9facaa2a9c22c9dd33e279cc38b669f228a21db97b33e279cc6;
      expv[7] = 274'h30a725ba0c2e340f0e14e4b74185c681e0ca430e9329d9e7c8d64e838b84ca430e927;
      expv[8] = 274'h22db0ffa71be3d93a1576664605d007ac04ad19a69ca5b61ff4e37c7b2744ad19a68b;
      expv[9] = 274'h1c9c23659efedef9dd93846cb3dfdbdf3b6d7fe160e5e8a409ed854483576d7fe1602;
      expv[10] = 274'h30145aaca57b89fb92028b5594af713f72f4122dc46530b50c61e99154f2f4122dc5c;
      expv[11] = 274'h38948922588fcc82ef1291244b11f9905d675cc7ad1057411ddd7b1881ed675cc7acf;
      expv[12] = 274'h1b53899a77fb9829656a71334eff73052d9a563a75118c7b44939b26c9399a563a74f;
      expv[13] = 274'h35f7af245f0fae2c7ebef5e48be1f5c58e55d01786b635ffe3debac094c655d01787a;
      expv[14] = 274'h11c913d960b735e03c39227b2c16e6bc06bf6f7febd4c3415d754141ded6bf6f7fea3;
      expv[15] = 274'h308a432ea2a92e1672114865d45525c2cea163dcddafe790f130ae5a0540a163dcdc3;
      expv[16] = 274'h3fd7de96161e069745fafbd2c2c3c0d2e8c59ca91a6b236eef286d9a6ca6c59ca91a5;
      expv[17] = 274'h05d7b2545224c59508cbca0236ee558d04e44dcbe6a8baf64a8a4498b2a0e44dcbe70;
      expv[18] = 274'h3ac0d0d1ad92ad9e5f581a1a35b255b3cb23dac475103ce348ff89bd720523dac4741;
      expv[19] = 274'h20ffc62faf06c3c58a1ff8c5f5e0d878b1f0e48b4ef27e74799209cdf4b7f0e48b4e6;
      expv[20] = 274'h1145097dbfc69b052c28a12fb7f8d360a46aa53aa9c8959b99d1b914dbce6aa53aa97;
      expv[21] = 274'h29a6456c4c5971aa7334c8ad898b2e354ea4f572aedbeb21c117f9a58df6a4f572ae4;
      expv[22] = 274'h39d1bc80da5c9a2ef73a37901b4b9345de190abff0cd3f2579b7968c0a12190abff1b;
      expv[23] = 274'h2875eacfd888b059f968cae96b7ce850edfa5a285b630ebd59fb11160b3ffa5a285ae;
      expv[24] = 274'h3a4fad2f53f31ff28749f5a5ea7e63fe51ec10e771e703c041b0400b3bf5ec10e770e;
      expv[25] = 274'h1c00349f116fb93915800693e22df7272326865a15515c424e86c2d9e48b26865a15f;
      expv[26] = 274'h38843e2f1d3f79569f1087c5e3a7ef2ad218e3edd2bfd8917e01bab5cff618e3edd34;
      expv[27] = 274'h1ff8272428a54354c079bca80bc20ea02bbb2b075f35ff04e48514a86a99bb2b075fa;
      expv[28] = 274'h25e9620a36f958af2abd2c4146df2b15e4fdc94202e85e608dfd9e59bca6fdc942022;
      expv[29] = 274'h32d19fd063be4325f65a33fa0c77c864be8fee65984e221fe2696889c7468fee65998;
      expv[30] = 274'h3cb5205f498315fc5b96a40be93062bf8b83ba803a5fbfdedca77f21d25983ba803a2;
      expv[31] = 274'h24d6955af48ca017e29ad2ab5e919402fdfe0589dce2570bc218bef0d101fe0589dd5;
      expv[32] = 274'h0d8f14191edc685bf88f3bbb9f6f3206542c04df24a1b1e28323db8d0b7e2c04df246;
      expv[33] = 274'h33a771c4a0fb28fe0c74ee38941f651fc1936aa03c2f4a66c287ea82c02f936aa03df;
      expv[34] = 274'h1130ddf24fde6f7f94261bbe49fbcdeff3a7652f7e35a1389b724e918e51a7652f7f9;
      expv[35] = 274'h1518238e125cfc8abca30471c24b9f915784c8e75cf547f1ed00c76ffe8f84c8e75dd;
      expv[36] = 274'h32ca511ea6df471b56594a23d4dbe8e36a379eacfcf65bc83b2acdbcf682379eacfca;
      expv[37] = 274'h3f91ee06094be870dbf23dc0c1297d0e1aaf958084c7247ab3d9397b8d4eaf9580855;
      expv[38] = 274'h3595eaa4b892148962b2bd54971242912d4ebc59c2e4f2e6dad8b0ddccb94ebc59c32;
      expv[39] = 274'h32f88715da9b104e7e5f10e2bb536209cf31ed80c25f907a8d15a486eaa131ed80c2b;
      expv[40] = 274'h397c98e69d1828ff872f931cd3a3051ff098f2565a9ebe016e71c244bdd498f2565b0;
      expv[41] = 274'h3e4e4c38eeea3dbe3fc9c9871ddd47b7c77daf8f5437ce893c7e56144aed7daf8f557;
      expv[42] = 274'h170c007194ef4042f4e1800e329de8085ee8bd71205d6335ba3c3803f884e8bd7120b;
      expv[43] = 274'h318cb60afacffcdcea3196c15f59ff9b9d0f3a4e27e41c1931fb9ce73cbd0f3a4e276;
      expv[44] = 274'h34e7c112d534e1d7429cf8225aa69c3ae8db8e12fbe7222e9e0e9c31bf9cdb8e12fb8;
      expv[45] = 274'h2c58d03b8efbb64d338b1a0771df76c9a7437f81b4d37f8f5d851bbb8299437f81b40;
      expv[46] = 274'h3158958ced3f194f742b12b19da7e329eee820f0e59378a6aee11d0b8a0ee820f0e54;
      expv[47] = 274'h3f8e933205451086d5f1d26640a8a210db124fb6caf73c477f668e05bc5d124fb6cb8;
      expv[48] = 274'h3b5266e828120e5a776a4cdd050241cb4e195116df9251d2ad445ffdc2d6195116de7;
      expv[49] = 274'h2d9b75c99b1d943d5bb36eb93363b287abb4f15fe9a3e0a8d614311bc921b4f15fe98;
      expv[50] = 274'h260bfaaebec4b3f180fd0262b4ca99fbb122d192a45ac17f55d7d8967e3122d192a5f;
      expv[51] = 274'h2b4817febe829029636902ffd7d052052ca8681ff0b8375bdc592b1548b2a8681ff03;
      expv[52] = 274'h3ea53600d91196861fd4a6c01b2232d0c2dca84207b7372e4b937a6dd322dca842068;
      expv[53] = 274'h3db37fd1d6a6d10b4998f9a98500116acac307d308c7b66ffa3ad4da2168c307d3081;
      expv[54] = 274'h2348e8ce0e22d68bb2691d19c1c45ad177e959bf5ea1b4ad629b4f0e7a1fe959bf5f2;
      expv[55] = 274'h304cb9dd71e822ed6409973bae3d045dadda69d4c7be9b009beb8aafeeb5da69d4c70;
      expv[56] = 274'h3e381368e5d87d4947c7026d1cbb0fa9282a3394dc6cc64850bd44248af82a3394dd9;
      expv[57] = 274'h3905b432c971a10d3f20b686592e3421a62ff9c50992e58e7445c0bd39182ff9c5084;
      expv[58] = 274'h1838936ab947cdfd9d07126d5728f9bfb224343c039447f192597e621e2624343c022;
      expv[59] = 274'h3b8ae92c1b61cf6ae93b8b19889032f124b374c32dbf715d25836c39ed5cb374c32c8;
      expv[60] = 274'h1ab394ee648b68eaa162d921d82f143348526084d85d56729dcc916d1d54526084d8d;
      expv[61] = 274'h3ee90e55a4f1e79de5dd21cab49e3cf3bd24d222be86f03b174313ccc0fd24d222be3;
      expv[62] = 274'h313567332a387f536626ace665470fea6d1cfc5b01532655a073526b426d1cfc5b01e;
      expv[63] = 274'h247d903a53ceb72e128fb2074a79d6e5c3eed13c4c3355a0a2485c7d4e0deed13c4c1;
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
