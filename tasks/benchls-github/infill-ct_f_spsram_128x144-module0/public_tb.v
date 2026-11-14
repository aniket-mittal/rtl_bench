// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 297;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_f_spsram_128x144 dut (
    .CLK(clk),
    .A(in_vec[296:290]),
    .CEN(in_vec[289:289]),
    .D(in_vec[288:145]),
    .GWEN(in_vec[144:144]),
    .WEN(in_vec[143:0]),
    .Q(out_vec[143:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 297'h105fc9a30fc8a62b8214348ddc1c3e5de33c8d5c3560c25fd4dd16b02d3e0cece07bcc4ef92;
    stim[1] = 297'h12f8aafd72c29a8b203e50c6fc5f3f4d56345faf939d1ab3a2af14c0362c82d81017f693c06;
    stim[2] = 297'h154c77308a874a78a0efe3a3c38e49e23bd0c1990bd4b32e4ebf26ad057f80ea297fcca87b9;
    stim[3] = 297'h01eaead1d0eb9f122c427dda252c4b75970a5dffef2cdac30cc91fe31b18aed70ac5eda0f03;
    stim[4] = 297'h07c6c40099dcad390ecd1edfd27d69956d1cb0fe2b78abe611e2331259ffc785a2efad4f09f;
    stim[5] = 297'h0dcb1c271250c67066bd25f1e50f7ceac45df4ac3d959bb54c1c044b0efb06e3e68057b30c1;
    stim[6] = 297'h021d65d080fcb96fa68817614d488e962df44c1584c77b729111ba25a1ead9bdf6470da6b07;
    stim[7] = 297'h12b0bae0c98beb1117a5f42df079f1af50012cad05573ef94ed96900c3bd7fb76968e5791cf;
    stim[8] = 297'h1195a7fd56439c7f5663c93072a3f056b95bdff733bef3242f8134333786b9230efd0851700;
    stim[9] = 297'h0f7742f53dbc90fc2ec3b1484a90ef09537afa910c74219ea5f93576e6a232b53b53f7520ff;
    stim[10] = 297'h1d8914dd3b43279bcc114d10a2e1c3af536075be93599c5a627b30067e8989f3f3146649b15;
    stim[11] = 297'h13e5aaeb430ce27a01e05483b98b5d4eaa1bbeb5d7101aff4e5752247c59ca062da7e882b27;
    stim[12] = 297'h1a55e3438b545134a1f129d448453ad0927fed276fa53281091f94ac89e4ceead007aab97e4;
    stim[13] = 297'h136228775306879b78de2d44cfe5c1aeb5f352dd9b0e04b829795d3069c7288a0b839f76b61;
    stim[14] = 297'h1de1fa5ec52ed16259cab791bd55e8323a852072b29d3c3031716760d59c8bb6f4b3e05a73f;
    stim[15] = 297'h0b77e394a7fdea8dda645da6d0ab64ae4206eb7985202acae14e0c84e199dc647bd9b2f1fc0;
    stim[16] = 297'h1eeaa30e96a7bb6bdb96f0d231ad37e4a300cbb5fe7a44a57db96e7f911efe918cb02c57cba;
    stim[17] = 297'h15a8ec6d81a4c0d5339adf0c5dc0838e806dbcc8c7a405d446d6c486e27fdba8c3a55b36887;
    stim[18] = 297'h12d11ca4d76a47eb28c6d98ead364631112512f6d2b8694d523b77ff523c66b2dca45d4c78a;
    stim[19] = 297'h1828f76e63a0801a7db13f567912ea744b0430bfdf90677be45147ac50e7bc3f19a682202fb;
    stim[20] = 297'h00da1fd87261c445d51e9aabcd6d64ab89ee68beac26266f1339a9327faaf229845aa2a7946;
    stim[21] = 297'h1c665a7099399ee772973a0ed36d5c302d80456f24b679a0e2b73841d5572f805415d225fb6;
    stim[22] = 297'h00bf4e7a5ac17ff9d8d55927af206d93d42f708c31edf4f63664ccd3277e24af88e7615f9d4;
    stim[23] = 297'h067cfc22d7b73c31bd290789a50ae598984a7df1768abc5946c4c54feef286ba9b654424a21;
    stim[24] = 297'h0a5b1c1a8ee5e4efcf31dcee73abb69e3ef3f5d1830b0c08688c4c61b3f803b02b699a9b3ff;
    stim[25] = 297'h1ce7ea4c45fd35014bdafa1337f8a5bc039360f9b92973a9e5fdf3a6e32d57c76c96e8dba5d;
    stim[26] = 297'h0930aa4f5e025a0ccb66870a523cb78f62d6702a35d94dda5b3fed6ea4c1dea83dcc3170c6f;
    stim[27] = 297'h15cce31d8591c5871a5e6185c4731076ec7e6783b2686fb924161bb802547c2f8215e0bb3f6;
    stim[28] = 297'h1cbb3d2f281eabca4f63a01fb45ab5134cf7b95759745fb2697e780689bbfc6aec7484f3ed2;
    stim[29] = 297'h085d38c361544e44695341c68812370fd9b12e34fcf0fe8b21761a9251e8c3fac15786bb4b7;
    stim[30] = 297'h0de5da4bf320901378a97ffe871c3cbcecb1fb1ae14f66e94e7c8a83b89dd48c47b9b99e628;
    stim[31] = 297'h189a5c1110ce91197b176c3276ceb90834481589620e4b5f7b7f84bbb5afe830cbd5984cd50;
    stim[32] = 297'h03b9fae61a98c3786fcff6c44968a7ef5dde997a1ecf6dea0d1bde56ab0aeced24022fb137e;
    stim[33] = 297'h176137b00a2901382a15cb22d0a4ecebdec6ed15a21c7f27a9f274f941b66c5499784b6c46f;
    stim[34] = 297'h1717a4b86a29219aad0e67cf406cbc0b9cebae2886711f22d284a3404717fe819646d2fb7a9;
    stim[35] = 297'h18a6e8ec34a54c6c87b8b768a49505ee808693838f7b51f0c203414bef6da30d49561aa28c3;
    stim[36] = 297'h192d76ae3d5ef23abca738bd66276bc67ea5b5cad2346ea22bed8a7de9e5e69b2be05d7a343;
    stim[37] = 297'h1605831914fffdaf93e526022657deaf3d7eec0bfd2e8d4b1681e3185557a3d6da6e08c48b6;
    stim[38] = 297'h0272d6c56357c7b3a323ba3bd44c927e45822eb1e0339912be463d7ee37a1e556b5640c153a;
    stim[39] = 297'h10d0dec8fc49ff2fc6e4d55b5f05aa99eb367134ed4e95fce7c882613989a78966c953a812e;
    stim[40] = 297'h1ad1e7d65f4cdd7ae78599562905010da01100380dce8caa5b9e4c5c49b13042cb025a33f11;
    stim[41] = 297'h1c11f4dcea2192e0d98eebd7075727c3966b55db048cadc4463dc997c62872961876127661b;
    stim[42] = 297'h1b346f547ffd98eb33444bc7d7596401c0df82106bb7b16cc054a1a38bcdbaf65700b080076;
    stim[43] = 297'h154319e75e222ddbf6e73e7ec3dd3c59003830b881a30d61e2462750f43cadfa40166992304;
    stim[44] = 297'h1a74af438399af707873552fc52599a7a14f5dc05cd6c17a4c23ac99b1ebc9c3bacd713a33d;
    stim[45] = 297'h156a67649499a370f16aa0f7f01d0e6c6d1ba6b18da9f40136063cb134f595e2cc6f7c4fe9c;
    stim[46] = 297'h0dd67eef6fb20d1d867c95a1a401ee4a60b0a03e5b763a832656907870531a3732902f4f5f4;
    stim[47] = 297'h0898b44e19b07730da28628584d157b4c065b54dc794cee97826c9d80a25fad9746afbf7acf;
    stim[48] = 297'h1f9b007eb389580c02e184f885f3d6250852939a377a922933c2166baa508341d6546e7e22e;
    stim[49] = 297'h02f026f7f61f4ca33d1e770dc3b10cbaa2b53213478813152f51ebe0aaf1864ed2532987fd3;
    stim[50] = 297'h106105e6ec02a6a957fa7d574cc186e76eed106027f3aa04a9842bf09387d2b5aaaf46e7684;
    stim[51] = 297'h08595ab1106ae5eea6f3b850a1795a24d94072b7318da8f0de546df1fc0da0d36841ad4c036;
    stim[52] = 297'h11135ee925c21b75bfd639f67fa1f6cef7c3899ce219e9266c442dea19b73ea47f51ebb85e2;
    stim[53] = 297'h09ee275afa28025dd52f60d379812e3174f8b4cd6a2b48eaaffb8c18a1b034e7cbeb21e382d;
    stim[54] = 297'h0969cce73a34437657c300f10b531b40d7b7cf813ce5dddadcaab666ef9170cac8137de1e6c;
    stim[55] = 297'h0a51fb6fa1cd7e9650130b0da28fdb7dd949d4884abbacd82c47409e61e551ac23b4ede12b4;
    stim[56] = 297'h15b6b84e09a2cf7e70ddd9f985e99f608e9334533a8b78eca4508a69fdd7ae9f684b24a9908;
    stim[57] = 297'h0018c199ac3608eb063da21cbcf3515d3889af8a2f66607abcccab917ce291ca682c052732a;
    stim[58] = 297'h097853fb138d309aae07d76a4f83d09113c39678a3bcf7418336bd46cfaed3714a08cac62eb;
    stim[59] = 297'h11e3580301d1f291bda504ad6ef8614f5f268fe9cbbbfe786f66f132172bc0712c012a57008;
    stim[60] = 297'h13fedf3a8a75ff2ccd2123959664a3399b1c98e19027f3c31dd41e0fdc25f3a89cd49174754;
    stim[61] = 297'h1861ee7d0265cdf7fd8284e8fbbe8dae038fbf1ba3053ab9ccdba6d48c09770ff6ff0b7c645;
    stim[62] = 297'h09fa04a0220d8174012a40baecfd26424115f3ba5b7da064a5b34146e9ac29f171fb8b63c30;
    stim[63] = 297'h1f164c8038605dc4f485fbb3d462360f744f6e458c2d583d8e88cbd7358b20c336c4d4f83f5;
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
      expv[0] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 144'hxxxxxxxxxxxxx3xxx9xxxfxxxxxx5xxxxfxx;
      expv[7] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 144'hxxxxxxxxx2xxxxxxxxxxxxxxxxd6xxxxxxxx;
      expv[14] = 144'hxxxxxxxxx2xxxxxxxxxxxxxxxxd6xxxxxxxx;
      expv[15] = 144'hxxxxxxxxx2xxxxxxxxxxxxxxxxd6xxxxxxxx;
      expv[16] = 144'hxxxxxxxxx2xxxxxxxxxxxxxxxxd6xxxxxxxx;
      expv[17] = 144'hxxxxxxxxx2xxxxxxxxxxxxxxxxd6xxxxxxxx;
      expv[18] = 144'hxxxxxxxxx2xxxxxxxxxxxxxxxxd6xxxxxxxx;
      expv[19] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 144'hxxxxxxxxxxxxxxxxx3xxxxxxxxxxxx6xxxxx;
      expv[29] = 144'hxxxxxxxxxxxxxxxxx3xxxxxxxxxxxx6xxxxx;
      expv[30] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 144'hxxx0xxxxxxxxxxxxxxxxxxxx7xxxxxxxxxxc;
      expv[33] = 144'hxxx0xxxxxxxxxxxxxxxxxxxx7xxxxxxxxxxc;
      expv[34] = 144'hxxx0xxxxxxxxxxxxxxxxxxxx7xxxxxxxxxxc;
      expv[35] = 144'hxxxxxxxxxxxxxxxx7xxxxxxxxxxxxxxxxxxx;
      expv[36] = 144'hxxxxxxxxxxxxxxxx7xxxxxxxxxxxxxxxxxxx;
      expv[37] = 144'hxxxxxxxxxxxxxxxx7xxxxxxxxxxxxxxxxxxx;
      expv[38] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[39] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[40] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 144'hxxxxxxxxxxxxx3xxx9xxxfxxxxxx5xxxxfxx;
      expv[48] = 144'hxxxxxxxxxxxxxxxxx3xxxxxxxxxxxxxxxxxx;
      expv[49] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 144'hxxxxxxxxxxxxxx8xxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 144'hxxxxxxxxxxxxxx8xxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 144'hxxxxxx6xxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[59] = 144'hxxxxxx6xxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[60] = 144'hxxxxxx6xxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[61] = 144'hxxxxxx6xxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[62] = 144'hxxxxxx6xxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
      expv[63] = 144'hxxxxxx6xxxxxxxxxxxxxxxxxxxxxx9xxxxxx;
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
