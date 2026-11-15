// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 294;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084850 dut (
    .clk(clk),
    .rst(in_vec[293:293]),
    .sel(in_vec[292:291]),
    .in_valid(in_vec[290:288]),
    .in(in_vec[287:0]),
    .out(out_vec[96:1]),
    .out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 294'h39dbbee5d539255e903346d24593b0e951c537ad2ea5ebddab190f3111cdf4e9c2d347a5ce;
    stim[1] = 294'h24e30421dc8162d6b09c7535fa93bf9129076e0dc05442725d7bb9afc3cb42a50cfb1cdbbd;
    stim[2] = 294'h19bb621a9f537319049a4c86fe14a187723cdb2d3bc3e1761b5cc385ad92b079cd765388ba;
    stim[3] = 294'h162b9c8b0e03b88a81c65fc138a1fdcb0c01a290c5102efddfe376f9e7ee49d5c37137150d;
    stim[4] = 294'h047e962359d67b0ba1bc099c3039733f4392266baaf7617bec2497526411722eacdac89c94;
    stim[5] = 294'h1d58cf1f2d22ff7a88a14925cbd2718e1676d2b0b1da5fd571a9feeb23f9a442f653a5bb87;
    stim[6] = 294'h0ae8a1580c65fd3cd9e7162c223b7974bd8f7c3b7366e7de5c1ed0a8cabc3e9b2c54a90d11;
    stim[7] = 294'h0067b2a39cf75c65a031a082add7bd3409b84a758d16a46d8ba14468609f6c412c1012984e;
    stim[8] = 294'h0a043cb18e7506a08ec716f168a79c833ad270e53ad81942aac1b82ced697acc7ba192240f;
    stim[9] = 294'h1657558c21043b17a1cff142c6c685228c73db593fe954f70a329f7c132e4f13c3459e0cc3;
    stim[10] = 294'h158f7dfe31a8128dccc2d797307f550253b3117a7d711f9ab3fa7986c1d9606c98057bb711;
    stim[11] = 294'h133b7b9646fc6e8b15641fc3ccc2986d371000e230e1e98f640471edb6bb338d1cfacc95c0;
    stim[12] = 294'h0d8d1401817eced4cc4e07779affad128440d8a6b8e2455c02e5809db899f8b30d6457f6dd;
    stim[13] = 294'h047bbdcc21ac413e7eda3b705d12f78e64abfd7e0bfba7d99938c41987c14c57259ecfcfe9;
    stim[14] = 294'h091bfc95b77e4d961f22cae5c727e26c9a2c7f8c91ccdba0f1e587cbe3d4dd4ec170d95284;
    stim[15] = 294'h1cdcf545966d944946a4dae9e8c2bf378725b313f02d18ea972d7da9264cded2a846e4cdd6;
    stim[16] = 294'h150284588cb2ab2d611ff616abbdd3cdc9fbac73637ec7ffacfcb7f1d61581d1e3c056f577;
    stim[17] = 294'h04664a8b08b686603125a85abb1eebb4aa937727556ead83a7637e75ebef28131f49cb2aab;
    stim[18] = 294'h1327dbb7e20430ca89be01b6ecbd425dc0b95d074cfbcc8eed109f4fbfd5980eb0bbb019a4;
    stim[19] = 294'h13865ea6f6927718ef8d109457718eacf27db67cf834b5e1810b340d7b2e548a90e5e9f9fe;
    stim[20] = 294'h11ac2f36bf84caf92b50ec3b158f6770e2943200b8c1e6c33610eb5824f9741f92a517b961;
    stim[21] = 294'h1a1de6acfa51411625a39f5347edd082ca249b24f585c78a785dd0ec45ece29326e2ec4f1c;
    stim[22] = 294'h0e69e7ed0cd4c837babbfbdad8397939dcc5a36329195aeadf4149b042ca600dc05028097a;
    stim[23] = 294'h07f16de91337000194ce19eeafef62a7078ca04ffbe366a5c573a32ea3b0fc819a3f2ef2cb;
    stim[24] = 294'h172a793211bb701e4c1e42fc643f94647206474e82c3e634c44fc31fe5a73c4c5ec4563443;
    stim[25] = 294'h1dee2a64fd73f5950dad5890e08ab220ff909ab84fa7c850cae542419ecfad52f01a55b827;
    stim[26] = 294'h0bf0df12a3d2892d9116ef42706889c79e11bad4d23bcf90ead3b24882fe36d637b5219bea;
    stim[27] = 294'h127f8192f114573479e0b8930e9b29a745ba2905cccb9da8ff7df57df4762a436b0f60b655;
    stim[28] = 294'h066f66cb07ef7c10d435196caeb5384ef5e98f5280aeeb83109d99e74f26eba67719b10a50;
    stim[29] = 294'h1c67609e6a6049a81885b43566958b32f205e986b5d5754c54eff02fcf5eaeac3f5cbf3df6;
    stim[30] = 294'h0f38005fa824152a4382089c9b1799ce81e496331cf4f1e81aa20aebba88f596a69c37c94e;
    stim[31] = 294'h15818a46b32e47fa4b46e6e4f63f06f4b79b67d6c6949ce548fa80b27e14612bc97dc0f727;
    stim[32] = 294'h054aff005c3d693ecbffd2f53cc35210aadd3495bebb78c3ab683bf7c838f8a882de297365;
    stim[33] = 294'h13ae516bd3cc4b8bc197b6ef80ddc2fab177242c041e7b89c75d1125989410e5cdbfd037cf;
    stim[34] = 294'h0b573c0f4de7a5719a74f80b914e1c3dc84d03e3d249daa4062493dad907e8e617fb3a6b04;
    stim[35] = 294'h15961e9933bb05c0837eb0dcbe3528f412a332ae04aefb3216468f0d9b6050e5b270877a0d;
    stim[36] = 294'h1e483387525b9290e643cf1cb554c1036831f6780e2c38620129186715639cd20f4d4ee854;
    stim[37] = 294'h1b74023c81f79d2fb95067598101cc0923882b5542cad1a750b9cccc45e099052604cc60d8;
    stim[38] = 294'h065aa4d77611c4a18e744f63073f6a1859928499af6e5ff44f95722b9b8a4623bb5013207c;
    stim[39] = 294'h143dff6bd2420fa29077bb70e10da6f197fe34e296ba89374f8f7281e5fc87330149f0dcc9;
    stim[40] = 294'h13244bbca088ec673750a089fd466c2627c26d6913c0327a8d44d03b876356fa4e4162d767;
    stim[41] = 294'h1a0f147873f5b0b3df0ded778dfebad9b31bb6030b7a2914508d95aea2d02f9d60f055b900;
    stim[42] = 294'h1a8e060b7d84c294f7b4cee51c2c1d1b066ac4c2c9a80137436ab440bc19854515d839b2bf;
    stim[43] = 294'h1edcaf927c0adcbe38e4fd0cf7cc53c8ccc5025a799cc4e2a57097c50519173e659f72d389;
    stim[44] = 294'h1071d6cd75237178494a5de206af8901e3029258e7d349e8cb10d4600b2bddd1a652f19ee1;
    stim[45] = 294'h05cd2d6f1632312a033bd4a5cd44f8c9bd14040ecadfe52db02d4f127f6aaa578ac181eca9;
    stim[46] = 294'h01b27132b4ac2873601d564affb09493dfb686b9f7db33f7f35dfe6e25b921727a648416e7;
    stim[47] = 294'h0c49db130e96e7504a41fe01ee02a5121320049a73cbb7a21173b5cf5ca4c26a9970ff2bf1;
    stim[48] = 294'h12ae261b7ba7da98242a901c24df7b0655121417a0165a8e79290fca24a156d4b2b8cbb7bd;
    stim[49] = 294'h08a3f2be7c2c65c46bcb10355fc6e84d8192a1c65e308bedd57d3d6e646df81930267bc6aa;
    stim[50] = 294'h08877ce28ddf70dcf686401e0e68bbda1bcc6a2a5daaa63ffe945214409f842c454933752d;
    stim[51] = 294'h15c7a3f2cbee26c4d0f29d159a6260f0cf72196d3ac78680d824059c9a0589b87104d6afc7;
    stim[52] = 294'h1a2393a33f0cacddf3b9f22fc6d95b9c88a0ac77041889ef2a35b651d3fff5f89fd435814f;
    stim[53] = 294'h18a645f3833a34056ad5f45aa1727d8c4fdf9e9dad712d8d962c646de810cb586174371d89;
    stim[54] = 294'h032867b9c04ed896a45f438d682e22eacbaeca8f038f55ba333defaabbf334a3acf0ea1da0;
    stim[55] = 294'h154965613c00a69572d96dc69129fe2250b238342f5c9baa6cf3f6eafc61a435b0d5c9dcde;
    stim[56] = 294'h1b5b1830eaa3997cc63a271a523d7f7440665bafcb186b4c7f54ef8af8158d1f74e7d0de59;
    stim[57] = 294'h0fa38e5921dc74b135d096718d4e3a7e66642113c0a6e149c97fdf7f481382205e4ba638d2;
    stim[58] = 294'h14121ccd9a924dcfc66b53696cb092fd1ff8dcaf24436f8aa056134e44f59fb47301e98d5f;
    stim[59] = 294'h1ba32e59b4f839407fc0703a630bbe7092571de46394537e4dc175d41b6df16b56602ae618;
    stim[60] = 294'h0227f12fe3343bc005f56d0438c2f2e7e11f03a6d193312fc20ac15793d14daf8a70429fae;
    stim[61] = 294'h079b984212e4ddefc8c30fbce0bb717d14ea965b951afe7cfec0ea6c18e7b8fae2b7b82a13;
    stim[62] = 294'h10ba0c0d3f21e389b56323b48e65013415542a0bafa467ef88ca38c2997242c11803e7655e;
    stim[63] = 294'h1bcebdf77931bc3481fd91e43a3afd4558a571a066c76f7e23aa3aff0d89a793489e14f14c;
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
      expv[0] = 97'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 97'h0000000000000000000000000;
      expv[2] = 97'h0000000000000000000000000;
      expv[3] = 97'h0f7735f8796854a19f639b77b;
      expv[4] = 97'h176c4353ea6e6320934990dfd;
      expv[5] = 97'h1c6edf3cfdc93ab86e26e2a1a;
      expv[6] = 97'h0492ea4c822e45d59b5913929;
      expv[7] = 97'h1a4e31c2ceda56163b4bfaae3;
      expv[8] = 97'h03da15195787d3658a9521a22;
      expv[9] = 97'h1af7a68137094eb1a2d48db17;
      expv[10] = 97'h00879631cea0d411d8e2de2d1;
      expv[11] = 97'h0aeab184208762f439fe2858d;
      expv[12] = 97'h11efbfc6350251b9985af2e60;
      expv[13] = 97'h18530da6e2001c461c3d31ec8;
      expv[14] = 97'h1cb013b7133f1661ac8afedba;
      expv[15] = 97'h025ef1cc957fafc17f74fb332;
      expv[16] = 97'h1cb0f97c7a9ba9d82e1b2a508;
      expv[17] = 97'h1b9ea8b2cdb28928d49b5d3d1;
      expv[18] = 97'h1f96fe3ac2b03a3c780adeaee;
      expv[19] = 97'h0cc9516116d0cc0624b50b576;
      expv[20] = 97'h04fb76fc4086195137c036dd8;
      expv[21] = 97'h10cbd4ded24ee31df1a2128ae;
      expv[22] = 97'h021d6b049f2e83f254a2f72c2;
      expv[23] = 97'h1dba10594493649eb0b8f14f1;
      expv[24] = 97'h08293608594c01b80a05012f5;
      expv[25] = 97'h1e2dbd2266e0003299c33dd5f;
      expv[26] = 97'h09f863fcb4e7898bd88ac6887;
      expv[27] = 97'h1156441ff2135709f4f90a195;
      expv[28] = 97'h1e1be2547a5125b222dde84e0;
      expv[29] = 97'h0fbeafbe8ec5486d61ec16caa;
      expv[30] = 97'h13b33ce9e4dd74cee336214a0;
      expv[31] = 97'h12b1665e40bd30d6baaea98a9;
      expv[32] = 97'h07000bf50482a548704113937;
      expv[33] = 97'h1f50164fc28c25792fb81ee4f;
      expv[34] = 97'h095fe00b87ad27d97ffa5ea78;
      expv[35] = 97'h1bb85f562ee4858083cf7138f;
      expv[36] = 97'h0ae781e9bcf4ae334e9f01723;
      expv[37] = 97'h08d1e1b36c0a1cb64e10ef41a;
      expv[38] = 97'h05230ce2ac739a41e9a9dd0a9;
      expv[39] = 97'h17399988bc1320a4c0998c1b0;
      expv[40] = 97'h0b549aeec2389431ce89ec60f;
      expv[41] = 97'h07bfed7a4841f4520ef76e1c2;
      expv[42] = 97'h089a0770ec6adf49c82c5aece;
      expv[43] = 97'h11b2b5d45a05f3ac1e0ab7200;
      expv[44] = 97'h0d5688178330a8a2bb073657e;
      expv[45] = 97'h1b95f24f815b97c71c9fa19ee;
      expv[46] = 97'h021a8c01657bba34ca5e33dc3;
      expv[47] = 97'h05a9e24fed554af158303d953;
      expv[48] = 97'h1612927bf6d0d73efb667efe6;
      expv[49] = 97'h093b6261d2dcea09483fc03dc;
      expv[50] = 97'h1bef60caa24282f402cb51cf2;
      expv[51] = 97'h18dd09b0325438cbc6117dbaa;
      expv[52] = 97'h10ef9c51bbee1b9ed0c803c1d;
      expv[53] = 97'h0480b39340b1370e209ad5f8e;
      expv[54] = 97'h06b6ca3a7ffebf13fa86b029e;
      expv[55] = 97'h058c8dbd02196b0c2e86e3b13;
      expv[56] = 97'h050cf73809db12d48be871ad1;
      expv[57] = 97'h1e7edd5f8c3486b61ab93b9bd;
      expv[58] = 97'h07afee880ccb75f9630d698ff;
      expv[59] = 97'h1471cb243b8e9626ba12ce31b;
      expv[60] = 97'h0ac269c89eb3f68e603d31abf;
      expv[61] = 97'h182eba836dbe2d6acc055cc30;
      expv[62] = 97'h01582af27a29b5f14e0853f5d;
      expv[63] = 97'h137308425c9bbdf91861f79c0;
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
