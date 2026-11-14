// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 256;
  localparam OW = 256;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025557 dut (
    .diff_i(in_vec[255:0]),
    .bpx_o(out_vec[255:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 256'h096f5cacd5c0280a105d582656fa0eed5b649648a52b614fad2517544e82a670;
    stim[1] = 256'h4a6bdc68db82d1025dca67ed704489821a2d7c4bf5cdb571d1079e9422913c8f;
    stim[2] = 256'h38c972784f24e62df8e46c69271afa78bb52ae0dd24f32bf3e320c774db81f47;
    stim[3] = 256'hef9bf6882ed74802ed11ac2f3f2ee191be416b22b38ebcbd4c0ab9fb4579e01b;
    stim[4] = 256'h8f4c8b687cb3f7777459f90c3d8d4e8125fd04be84765be34954882a3b1d42cd;
    stim[5] = 256'h581204bfd7b1820a48eb0bb90b4226f36e3812c9902fe14ffaa5d829d4eed4f2;
    stim[6] = 256'hb7ced459ed47449ec5c9c2f9e27c3d05b76f118f8c8afd7f718c664f2a53ac86;
    stim[7] = 256'h3a2c8ca04b3372a381bb1a69584d2d1bdf04d9b751658fc33ccf58c3f66a04a1;
    stim[8] = 256'h54194ec024800ae9ca8bf49bfae22817e5977f9d8e108ec40114da77c1185315;
    stim[9] = 256'h6562f0a0d40bb59e919105f8db05ad28686dc7c257384e0790cd61b822c729c8;
    stim[10] = 256'hf568c71cb10ab41bdad98885a4bba4acfbe02adb8f94e56ede1f5d0dff3f399d;
    stim[11] = 256'hee9ea4081c7e6dd1a1eb9423493eb575c3f2e88342799fbdb8264c68d06cd730;
    stim[12] = 256'ha5317307c0d961455d594d64ea19b20bd092d3935d6885266d2291253b87aaec;
    stim[13] = 256'h05f9eea670f5f7522e4e26981d5588eae43dfb53e8e7eaa4339383baec273870;
    stim[14] = 256'h0f1883ae71eb0ddaae3c677e6190b07743b5807abb393a017479b5d168deb076;
    stim[15] = 256'hc03ee899097eac16de42c6a3b64989aa6e7cd46795c67d2837c4bd350e5f2067;
    stim[16] = 256'hc0c74283405e40fe6c5fd8cad189b45eb3f18f32d25df01f5f7914a1050a6520;
    stim[17] = 256'h3472577e15d3e5370cf79d2d0ed94b39b610baddc7d92a24cebc781e5d50410e;
    stim[18] = 256'h0a3422f82b1d03d95cf5843e2df5f8c0c8f7dc35226ab7682f02ee3b23de2b9f;
    stim[19] = 256'h214a54b445b237be55264c9c0afd9186e854b4eaed885521aaa55100e880b933;
    stim[20] = 256'hede02c80e5a90b00a9655a059aff86b5980a8370d07d1249264f2fe6c8a3a3f2;
    stim[21] = 256'h76bbff9365ba9bd921cae86359e822bdd2dd476ab7e3cce550751ce79c7eab4e;
    stim[22] = 256'h2c41e6ce5eb3d4db09dcdd7765f70ba9c545b494d49a123ed90f3ad9016fe6a7;
    stim[23] = 256'h4d7a9e065abcf5df5f84a858b3a2f5ef81d9442676b4141bdc7b6ff2d2dab426;
    stim[24] = 256'h1b137926621a829ac2bc40202efaa76cf59043f1010a174672aa8be36cbf72f5;
    stim[25] = 256'h67659aaeb7227b25b0ad0e26f90b2d35c0d835f58bdf3ab96cbfc2c187fb6ed8;
    stim[26] = 256'h904f60e2ce35cbf81aa248e0ca68a5d2db77642443653db844f2bab81af879ff;
    stim[27] = 256'h6b27acbd5f0f548513c9c97e78119c6c481c3b8c27f33b96b4ca7565632150d4;
    stim[28] = 256'h61a5e833d2cd50b05cf5764c287781ab781de3cdbaf1116fcd30e516354493d9;
    stim[29] = 256'he09b45e46659c888a484cb4bbd45519adf3a9c5309ae219ddf807298d94bef7c;
    stim[30] = 256'h0762764f68363038df86b2ffa20e7eab0617e13a0bad5572be2a6e312dca7bc6;
    stim[31] = 256'hc98a32bbc1d585b12a41540218af8078e01b8fa56dc1684e1b681569be83bdc1;
    stim[32] = 256'ha5f3a91124b0eed3a585422c7df718040fdadce59838d691548db8e01ed2f29d;
    stim[33] = 256'hf702394fdb7b6ce576b452c705723a53b6f438ad92b1e67ab9835a476c25ade0;
    stim[34] = 256'h70044fb314f768932e85197fce3367002ecab748854207752c94ed2028712b31;
    stim[35] = 256'h8f04c661eaf1e7da531f72ae4a59353f50c5a6dc84e651ae5c8067e819a22538;
    stim[36] = 256'he8ec39846937f3c30d2b5a0680478857b9aa540ee10a652e23ad0edaa7ce9707;
    stim[37] = 256'h6ff342d77ec1a3f79340fd96e199083677d1b09117220d59725d657a402ede43;
    stim[38] = 256'h0c170a52614300686efbabb7b8742bc50eae108d7ed314fc61f64903b3c54a5d;
    stim[39] = 256'ha84e12870ae21e418f7fbcb31a5fed332d44933a4176e75d5d0347a5fe89215a;
    stim[40] = 256'hf8e2039995e614221c9ebbd00bee2fba8a8657c49b50eb4515392bc12de9423f;
    stim[41] = 256'h1185a5c8b5e5cfa35b43e2893a2163f12e968d366cfafc70bac24b4103331d9a;
    stim[42] = 256'hbba98b41499121081e64a37efedb5475d7732141f07e600cd2d2014b79a54b11;
    stim[43] = 256'h0a5930ddc6701bdffa5a90a8137b63ad4312d0cbd1d3f70153c75016749510a7;
    stim[44] = 256'he3cfc7ef939fde77c203c07fcb7368d55a319d57054090585d1b12b4ab7a70e3;
    stim[45] = 256'h9fb44fea9bf68ba50e23375a976caa9651b98a7190be3afb14f8815865a8d3ff;
    stim[46] = 256'hebfb2bcf4db0065cd3a025c9e0aa5fe404badfa2227d301e675c7ee7d672d4b3;
    stim[47] = 256'h2d29b890daf4e42eed0c80ba9391a2a76635caa4fa7fbcbc4a2e9d43dc713295;
    stim[48] = 256'h0488973a7549e520f5444ab67fe18848a67caa4733b15c025754b0c86a6280d5;
    stim[49] = 256'he4e9978b5412f260c13627a8175e4a2e4d748e11971b4e8a0a45f4bb47767a23;
    stim[50] = 256'h247e5d0b7811f037b83032fb020e0ea1c090cb19c893f74a9d02ce5a398d80ee;
    stim[51] = 256'h7c42238430291580559e9a57e5eb46410c1ff39e4020b9e9ce01beb421fb8394;
    stim[52] = 256'hb4cce1514ecf222c9d4b463fd0ddb2e0bbdab588b4f2224dc83948d9a34b1278;
    stim[53] = 256'hf0cd5da512f1a5d27d2cbcdeae312227f8b532fbecb3c09ebafff58791baacd3;
    stim[54] = 256'hbf73d2c5eaf7ac550a6fe670059a991440fbfb809891a04bbc477dc3353b4dba;
    stim[55] = 256'h7cb08e5df5346f49b8b9729302ebfe0b3cb1212e908998da11736455ea7152ee;
    stim[56] = 256'h5902c2541a41aeebb9b09a6b52ba382f217e867202eca8c939d3893b6707fcf9;
    stim[57] = 256'h56a9d8cfb4d4059757cea39af14a6e5495d754de17a0d8a1c4ec5f38916de1a8;
    stim[58] = 256'h0d992d0606482585850b28313cdb3a96ebb2850a8bb677626596adcf8a6e3e33;
    stim[59] = 256'h15c69b02b6fa502119bb81176454ae39d43e3d732903ae865696afebb4d6f3a3;
    stim[60] = 256'h63b331e16ad560cd5ecf8e1432c206c4854d55cfaa2e97ac4c193336d1708c25;
    stim[61] = 256'h38d04331b13f628f5c1e3165be36cd50bb8333d2d027254b023def0802a572c8;
    stim[62] = 256'he8b9bad9fd8aa6f308d46e324d9edc0cd2d86f087703faba56ad87999915b765;
    stim[63] = 256'h8b697afc7b929ea953e5acb351e4b732432b726a44ee5d757b1d9776840328ad;
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
      expv[0] = 256'h1c0528867068fb9f3e789dda7af9eef2db8b35b90b3cfc723945ccd4895f2ace;
      expv[1] = 256'h2e530eb5d4af33352ac4568a7ab0c0bcd25a5f9558669a50edd5fe1a07d3cfac;
      expv[2] = 256'h42c2a9043831e51dcd08efcd877c6802e9307e7856df80152566da6863167ac8;
      expv[3] = 256'hf4a38f32d221efac8e3cdba84cf73003bef52cc0f600207dc1a03bd9a9c7d56c;
      expv[4] = 256'ha62559217dc71ee2444a92db10408354f79604f1b3e0aef8ec9ceb5f806fd497;
      expv[5] = 256'h1e511aef969489401c96557ac842ae7ecde9bd1f29fa50fa636d20cb4716b2d5;
      expv[6] = 256'he9f89e431704ddf7f6e2801eb908602e6840fcdeb6d18429aaaf0e4ed9fb26a9;
      expv[7] = 256'h31c0b3593bdc1e25dd4eb9f1d13bac25ee161a4c0879742eef67459602b62c0d;
      expv[8] = 256'h15fcdb28a4507a123882012ac917d46723e34e53cbfbc1750afc9163638c9aa9;
      expv[9] = 256'h3bda30d5d3c2cab09a0b3e5f59cbc8aa2ec3cac38e3dad174e2e5048c3e6526a;
      expv[10] = 256'haaffde89ca3f0d21aacf30a6d1cb77e14e212d10e7feb602179fb6318cd023b3;
      expv[11] = 256'he1e2f38ae6ab1fb4a19e89eb6bf0225e936b603fb06b24d2aa73d924478f4d40;
      expv[12] = 256'h8c0af22723f25ea6cde2a95a06dcfdf3602bf4a3955d071e21bb7adbc7ee4bf2;
      expv[13] = 256'h7613af781956117111e4519631bd9f4c2fc71ac9d637af16050df3f8f5ed4210;
      expv[14] = 256'h3586683638bff8eb11c2ce3655ac001c9e8740bbc5215ee9a740daa09b985775;
      expv[15] = 256'hb2bb2c60965fda2542fd25f63391b9072b0fa998392f3dd102516a705def8e38;
      expv[16] = 256'hd13eea10bec7a4d26e7b9c9104e90db3009efa244036006e30929c2e251d5c5e;
      expv[17] = 256'h0664bcc07022a06ea517bfceae34571c6ddac285ab47af204eb233485a3db69b;
      expv[18] = 256'h1167e22500a007016999ba9e2d882dafc84cd7a25966d712eeec3c5a255c1c64;
      expv[19] = 256'h1517bcce7db366e6ffe063e320d2dbe876aafea97ac9f6ca7cbc7ac1cdcf1be2;
      expv[20] = 256'hdc8fa81f94ebb546a4a109ee6ce88ab6a6815b698efbc1982a7966078cfb4791;
      expv[21] = 256'h7765cf1ade1938cfc5cbea839bbed5ba10649ac3cf6c3952de53d76a0dcbd145;
      expv[22] = 256'h3765bc934c197405df61e9b12b691e9796973a44a39ffcb3076afe2078a9c7ba;
      expv[23] = 256'h276fc49eecfcac620dbc748f29b553ad822b0e3ada727f474e4e27defa06d81d;
      expv[24] = 256'h03c6d0752b6361ee10fa2144dd1b4258c009d6eb35068761cfc5a4fbbf8c9dc3;
      expv[25] = 256'h38c8dd7dfac009ca9dd3e7717552448318e73882eb1d7b0de7473aa4f57b3332;
      expv[26] = 256'h9b5b817560666db24e6b9bb0b0d7b4084e2d404007aef5be16cbbee81ccb066a;
      expv[27] = 256'h316215c1bb1b91bafa60aac76a87491fa6e595e34368abf1b38376f991740174;
      expv[28] = 256'h6d433ca3c3b78906df9918cd6a8963333f7d17da606d883d5cd178aecc625eb9;
      expv[29] = 256'hd3e9a5daeddf3575a6bed68c5c83b79a03321c267ff5481c70fd71252c0f4f28;
      expv[30] = 256'h00f92485786b07a217a916dd488966683e254f7cad41da47c0291f4ee46eb7fd;
      expv[31] = 256'hdf06b40fd3673b5e3de4150b04acdaf0e5a42b7056a952f076b058a6efd01d3b;
      expv[32] = 256'he7c47b7724e809e1adb066a43b927b9d771483c6a8c75ea049f970c7b2e8534f;
      expv[33] = 256'h8950dec396e59dfab873b4b68b211a2f12e5dc0aaddae3b4cf6f596ee1ae9fa6;
      expv[34] = 256'h15486860b3523d44b08cf49b8ba280fa3f8cf1ef4e627b4a59444de200e8cd25;
      expv[35] = 256'haf107d5410bcabe4219ff3871bd4b7be8cba8310eb0e6c3bc9aa5886bd3e670e;
      expv[36] = 256'hd30ac85e982fe24aa565e1dc48616bdacec375663c77e61b53e066d028b0df74;
      expv[37] = 256'h57bc7002aad4b1f9b641654f129c5d66d193fa8491178930e2a006f1ac3d57f6;
      expv[38] = 256'h0079554c1dbc58ab143b442f59a26681f1b6f66ae17f02663467171f3881d8e7;
      expv[39] = 256'h94b2221c51f46db5c135d9b3260ea393e893a404180856352c3bf1d16f0a9d9f;
      expv[40] = 256'hdc75da149861ed028133357bdfd62eac8a1ea6ac1e29fbe46ba99baa5d45c1de;
      expv[41] = 256'h7f3166c169d269b13bcc90f4a5a6c8031a11f9247c9854a16dea2eefec3df4d3;
      expv[42] = 256'he42c88c47c73561eda26b0d6c6e6a2c5ed03c9d36947801ea06741d6de9934ed;
      expv[43] = 256'h19b13e45447780ad7951bce1537b6cb7a4397ebe4ad4125d92cfd48c58c14914;
      expv[44] = 256'hfea922198d16b79ee2a9d5981e03b3e9590f523a210b995c88cda8fd8281e8a4;
      expv[45] = 256'hdf0b6d676b1ffc3c6172c616995f889ef6afb886df3b63dcdb56238a9593f628;
      expv[46] = 256'hd4dd701b8d4654e5bdf67a4b21ef39dabc94020f6235c09ae9a5dc478a345d2c;
      expv[47] = 256'h3ebf3b29303f97b5e91373da5b8f9069d5cc60c7ee11f8810eda7bbbc996e8e7;
      expv[48] = 256'h6296a4336c7bf6ee1571bef12304a2cd6cb32cf9fef3b0d91ae06b4d1eb4a50d;
      expv[49] = 256'hf2902930b916eb5e88f782596d3d1c017e5bfba4f87a4dfe1e02c5f346c7b3c6;
      expv[50] = 256'h0291eea768814596a1e1a9382401549117666f2599903b18303825d4642f11fd;
      expv[51] = 256'h116c33b7d1f31a33ec930eb8a6fc55098e94a19196be031572aca01746eb13e8;
      expv[52] = 256'he48ffc9818e2b92ddf7eebfcb38d421a5d4a3da68060f8f543c6ef0e3aa66752;
      expv[53] = 256'hd738dfffb2a8459ef37f6687bb5b090b4d4c6c2b1201d0b47be27ca77f9e61ac;
      expv[54] = 256'hbe267e9143569fe3b30083dfab670e00efd1050a9daf694dfb8d61bfb9ae042b;
      expv[55] = 256'h68d64f09f3f04e76d5c0f11292143bbbef355cdf8dc507381c3d817a396a759f;
      expv[56] = 256'h23e4276396fc722836cf83d09b3986489359176019b623bd793c1c52eeacf9a1;
      expv[57] = 256'h7d78d7cbc9b7a52d7ce577b1e5b3ff6f5dcfe84def95ea918e35a0c4425e910e;
      expv[58] = 256'h4185ec7845816fec263e4433622581e4a471de7ddfe7bec823cef9a9fb9375ee;
      expv[59] = 256'h6c62837f2a6e13e94b47eaada39e8af50a169afeecdd89dc344cb41bdda36bc4;
      expv[60] = 256'h55659b0acaa0eb86e5cd7db91e902f496d787fbe0c13aa51cd1de9a3bdaeec59;
      expv[61] = 256'h490ad8252b99c106fcafbf45c2d11e24d9273933001487152292f3ce1a7e12ce;
      expv[62] = 256'hff46c37ae62c29fbf25ac1c21266e0dd85f9b8c676c05bbf2d5b87457e3c83dd;
      expv[63] = 256'h977604296fbabbb901bbca0347ec5663c5bb7533694659babcf5fbcde7493751;
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
