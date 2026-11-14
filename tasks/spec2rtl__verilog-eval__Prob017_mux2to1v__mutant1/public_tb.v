// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h1914ec91927ea741f707820da9a736249916925e41b63433766;
    stim[1] = 201'h118b416a12284a887f3f3f788bf40c25ed325e36b15f3e4e7be;
    stim[2] = 201'h0af17e84540124eb351c81a0861d04206e5d740388236cb0aa0;
    stim[3] = 201'h1e634ce2d1a50a9465bd916ca715577fb9e3eea1201da4f5029;
    stim[4] = 201'h1acbf5fe103f1cbee18b19b7b80073fa5a5ad0861c12c338eda;
    stim[5] = 201'h1403ed7a2e6a3c483cb76f75761e4ecdf27e4ad4a3e147705d7;
    stim[6] = 201'h182b53d92aa11329c555d6d9843b91429a925639419fe5bd31c;
    stim[7] = 201'h19a2c157ecaa0303b1eeb913d6f7e8f2f82c80058eafa9cbfd2;
    stim[8] = 201'h009c33d86f1855929435f7464f6eb3271b4e831d8bb033f6db3;
    stim[9] = 201'h078469518f8363af6952d6c1d1da7d2aa2c9dd8c90a9edae9d5;
    stim[10] = 201'h046c4feb48d9da3127de422d2f842480594ee5b01b7b57efa6f;
    stim[11] = 201'h0b99cf615ebdf3204d27c7e0dfb494f045da63f1e38d483a0ea;
    stim[12] = 201'h00b134901303adcc5630487a360715e3d87653f91f94ea049c7;
    stim[13] = 201'h05d37cc15ca57efd4198430c0b5ca52bfa6015a72be2ddab6b7;
    stim[14] = 201'h1cff04a793632cceb0d7c0705b372f948de8849dca9c258e81c;
    stim[15] = 201'h1d1c44df28942dde379df3311380665035bf33b2896cd0f69a4;
    stim[16] = 201'h093d77807cf2a5e963099d44e0aba420548d0fd18566899313b;
    stim[17] = 201'h0b09999d5c1877a8aba212237435ebd9b9e51f0e7bb417de856;
    stim[18] = 201'h1efe59154ddecfb9a0a4350eba9a4c108c16f9b41e8bed61109;
    stim[19] = 201'h082cb7c17dfa6d74137d82d81af0187764a28e8a7bbbd1c89bd;
    stim[20] = 201'h1247a6c34103136f8a0c324cbea91689150924dc983c070748f;
    stim[21] = 201'h0703ceebfb76df3571a4043d0daa2f8a54d8aad73587237f4ac;
    stim[22] = 201'h051c4e712ea3022ff83c7015fcb1d8eeed711cbb085a792a4f8;
    stim[23] = 201'h02534cf7e3f6a35341bf524d9acf96b1383c748567ee3abc6e8;
    stim[24] = 201'h0c5233ce00697ff0d74cb3ff54e5725c9c0aa57cd4da55e7162;
    stim[25] = 201'h1a704de8053985eaf4b59ca77b8da3d9cd9a0504719721b89fb;
    stim[26] = 201'h0e48c5da7b9bb7eee1e1f613a261d47b437418ca15ecec01cca;
    stim[27] = 201'h111c7986e5d564473d8a5372bd2d627228d0215f5d6e70006d7;
    stim[28] = 201'h1082448903f639cf5b6da6d9467535eb30719aeef72227e45bb;
    stim[29] = 201'h16c066112c7db50a3c8c00239bea9f475b28dfcee3e8f6405c2;
    stim[30] = 201'h00736dbec686f9fad4a510f463d6dcee8e8cb2ef1cc6da92f7c;
    stim[31] = 201'h1e4d4a763ab56ca3b88171760935f3b1ba5b38345ed9b84bc33;
    stim[32] = 201'h039ac8915b180a43c0d7c273136cff2e813755076a21da5791c;
    stim[33] = 201'h17bac7615fb0740e864b0be38fc22205a211e742a1de19a90cb;
    stim[34] = 201'h11189a83a7970f6b572e00cc7956459f9ec801818480289dfba;
    stim[35] = 201'h14a2a41120ac3eb23f427a7662a1e5ee7bda3d423bad43e86eb;
    stim[36] = 201'h13627b03c20634f61958a8c707371fcd1be12101dc75200ab14;
    stim[37] = 201'h1f09e87ceae58d243c2c565082562b2228652fcf8c0aee4e143;
    stim[38] = 201'h0de92058114e25ef6f167a8228afc2114f8ca83b6f696e47aec;
    stim[39] = 201'h009a4dbb2949aad53a0141f7f861c3e254f2a70a29ba3fd9ffe;
    stim[40] = 201'h1c449b82591ef210163e8d4ce6184eb964af05a59f26121c9c1;
    stim[41] = 201'h112c663529c76278f41894b642607ddd167dc4896862643adf4;
    stim[42] = 201'h0dd4cb383d1adab196ffb039d789da3829c582980fc0159b9f3;
    stim[43] = 201'h1271cd8e64f6a0bbdfd32e2e2bdd09b4902e53c46ee805ca255;
    stim[44] = 201'h1d40244688b24a6d092913cbd586a181095542f86059251e264;
    stim[45] = 201'h0bbb759f2cd9ee3be6da0f7d857c24d7a901e1c5b1415ae1fd4;
    stim[46] = 201'h0e5b95743e2a9c027aa45b3c0f4ff65e7932c04a74d537fd0bf;
    stim[47] = 201'h1431e50b66a22b99a60274f494a0af14bf182263dd650214dd2;
    stim[48] = 201'h02d3345f084a0e44ac928fbde6b3b374b7a049198379c0f3b19;
    stim[49] = 201'h1ef79c29b9177fefd0d3fc7f0009089ed775cdd0e4bb9008bd9;
    stim[50] = 201'h1ecaf471a2ddc679f319a8b6c804562d54206ff66d8296634f5;
    stim[51] = 201'h1f4ec75bac5e4cb1ec199606340655d668f64bafe74a9963cf1;
    stim[52] = 201'h11714769deab49022e57675d0aac088c6dc366fd066f09290a9;
    stim[53] = 201'h0fc01b9497efa52e49dfac31f2c8fea3aec478408a7ab253d84;
    stim[54] = 201'h0062d6fa970a01b79a886dafea4cb70fbcb05aac87ee0febc73;
    stim[55] = 201'h00f91e24efb58c35c9fce38c08d65226a0e6d390ba33b0de84d;
    stim[56] = 201'h1188ca4be925a0ed8658550a3aedf65398d07f3ad31079edacd;
    stim[57] = 201'h171a94bb16a0cb5982222b19099635cec78c18620a05639566e;
    stim[58] = 201'h1e3d9ae3257481d442628e09e8423ff876cebdbb8062639874f;
    stim[59] = 201'h00acf3f6c273613ad1546b3f1ec9035b7c4cc82c19af5dafffd;
    stim[60] = 201'h0b2e8f63ac056c8d5c5078da7f0f264eaac1dfc8ef4a53ae737;
    stim[61] = 201'h077a5417b8857327219d4d4c1eb630aad9e2bb3d87a84f11ccb;
    stim[62] = 201'h08190c6ca83fa513bc418ecbf0cdc01253111722ead25ffa593;
    stim[63] = 201'h0acdc0fbe6a4c3e0ec19594104f7d073cba3e039bfa009aed06;
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
      expv[0] = 100'hc8a7648c93f53a0fb83c106d4;
      expv[1] = 100'h8c5a0b5091425443f9f9fbc45;
      expv[2] = 100'h578bf422a0092759a8e40d043;
      expv[3] = 100'h15577fb9e3eea1201da4f5028;
      expv[4] = 100'hd65faff081f8e5f70c58cdbdc;
      expv[5] = 100'h1e4ecdf27e4ad4a3e147705d6;
      expv[6] = 100'hc15a9ec95508994e2aaeb6cc2;
      expv[7] = 100'hcd160abf6550181d8f75c89eb;
      expv[8] = 100'h6eb3271b4e831d8bb033f6db2;
      expv[9] = 100'hda7d2aa2c9dd8c90a9edae9d4;
      expv[10] = 100'h842480594ee5b01b7b57efa6e;
      expv[11] = 100'h5cce7b0af5ef9902693e3f06f;
      expv[12] = 100'h0715e3d87653f91f94ea049c6;
      expv[13] = 100'h5ca52bfa6015a72be2ddab6b6;
      expv[14] = 100'he7f8253c9b19667586be0382d;
      expv[15] = 100'he8e226f944a16ef1bcef99889;
      expv[16] = 100'haba420548d0fd18566899313a;
      expv[17] = 100'h584ccceae0c3bd455d10911ba;
      expv[18] = 100'h9a4c108c16f9b41e8bed61108;
      expv[19] = 100'hf0187764a28e8a7bbbd1c89bc;
      expv[20] = 100'ha91689150924dc983c070748e;
      expv[21] = 100'h381e775fdbb6f9ab8d2021e86;
      expv[22] = 100'h28e273897518117fc1e380afe;
      expv[23] = 100'h129a67bf1fb51a9a0dfa926cd;
      expv[24] = 100'h62919e70034bff86ba659ffaa;
      expv[25] = 100'h8da3d9cd9a0504719721b89fa;
      expv[26] = 100'h72462ed3dcddbf770f0fb09d1;
      expv[27] = 100'h2d627228d0215f5d6e70006d6;
      expv[28] = 100'h7535eb30719aeef72227e45ba;
      expv[29] = 100'hb603308963eda851e460011cd;
      expv[30] = 100'h039b6df63437cfd6a52887a31;
      expv[31] = 100'h35f3b1ba5b38345ed9b84bc32;
      expv[32] = 100'h1cd6448ad8c0521e06be13989;
      expv[33] = 100'hc22205a211e742a1de19a90ca;
      expv[34] = 100'h88c4d41d3cb87b5ab9700663c;
      expv[35] = 100'ha1e5ee7bda3d423bad43e86ea;
      expv[36] = 100'h9b13d81e1031a7b0cac546383;
      expv[37] = 100'h562b2228652fcf8c0aee4e142;
      expv[38] = 100'h6f4902c08a712f7b78b3d4114;
      expv[39] = 100'h04d26dd94a4d56a9d00a0fbfc;
      expv[40] = 100'h184eb964af05a59f26121c9c0;
      expv[41] = 100'h896331a94e3b13c7a0c4a5b21;
      expv[42] = 100'h89da3829c582980fc0159b9f2;
      expv[43] = 100'hdd09b4902e53c46ee805ca254;
      expv[44] = 100'hea0122344592536849489e5ea;
      expv[45] = 100'h5ddbacf966cf71df36d07bec2;
      expv[46] = 100'h4ff65e7932c04a74d537fd0be;
      expv[47] = 100'ha18f285b35115ccd3013a7a4a;
      expv[48] = 100'hb3b374b7a049198379c0f3b18;
      expv[49] = 100'h09089ed775cdd0e4bb9008bd8;
      expv[50] = 100'h04562d54206ff66d8296634f4;
      expv[51] = 100'h0655d668f64bafe74a9963cf0;
      expv[52] = 100'hac088c6dc366fd066f09290a8;
      expv[53] = 100'h7e00dca4bf7d29724efd618f9;
      expv[54] = 100'h4cb70fbcb05aac87ee0febc72;
      expv[55] = 100'hd65226a0e6d390ba33b0de84c;
      expv[56] = 100'hedf65398d07f3ad31079edacc;
      expv[57] = 100'hb8d4a5d8b5065acc111158c84;
      expv[58] = 100'h423ff876cebdbb8062639874e;
      expv[59] = 100'hc9035b7c4cc82c19af5dafffc;
      expv[60] = 100'h0f264eaac1dfc8ef4a53ae736;
      expv[61] = 100'hb630aad9e2bb3d87a84f11cca;
      expv[62] = 100'hcdc01253111722ead25ffa592;
      expv[63] = 100'h566e07df35261f0760caca082;
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
