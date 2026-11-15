// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084670 dut (
    .clock(clk),
    .reset(in_vec[263:263]),
    .io_selects_0_0(in_vec[262:261]),
    .io_selects_0_1(in_vec[260:259]),
    .io_operation_0(in_vec[258:256]),
    .io_inputs_0(in_vec[255:192]),
    .io_inputs_1(in_vec[191:128]),
    .io_inputs_2(in_vec[127:64]),
    .io_inputs_3(in_vec[63:0]),
    .io_outputs_0(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'hdd30f2e6d8dc6ff7a5b28ac3cdfd402abe7700a7ef97c3c9ec82fc1854f2ef63ed;
    stim[1] = 264'hda6df0d8876f0da92b8016452e639005dbc1227b06191bd9dd94ee3f2e901cafb7;
    stim[2] = 264'h74d1e19170cc3187b4db2e1904b18b0238eb6a69dbb660f38c1a83587aabbd0cd6;
    stim[3] = 264'h2c76a0e2c5da05ac237dbd3ad14a11e8b84655f56e5c04fecce260763745ef1fee;
    stim[4] = 264'h600ed8297540b26f8d71e13c381a13fb05c43e6dc316c725c42f2029bf2750d40d;
    stim[5] = 264'h07b346ea5b44adefdf5e10ed78f2489442ba126c0477c9952d1039ea808ed64bb3;
    stim[6] = 264'h6a44550b319b7d09c5d9f7d64216f931c64c639f52fa70f615abbdbb1103879dd9;
    stim[7] = 264'h1d7f0689148f05ca074bf4c76cd07f339c594e37a58344f2aa39b8c0d5da08ff96;
    stim[8] = 264'h65ed2b42dd306a2aa2ab7bc4fd081bec20c295200d3b6268bbcb3991d2adc4baed;
    stim[9] = 264'h41741a7d9fec801c7d1b79b71783b735c0cc0923b1974687417a27665ce5b2a4c4;
    stim[10] = 264'h68a966c3d3250f324f9571f3fab8706c141564a288d16731216136843980dc5615;
    stim[11] = 264'h24a83cf545a27ddad354acb369ac9524b0f0700d981ab972a7eda262b1af12216e;
    stim[12] = 264'h6003ddb175a36b0862c10a9be698b1fcd5e2adb6790e15e6c3e13687cd21da656e;
    stim[13] = 264'h61902d459403d9e82f83590bd9f9da04d9bb4b7341b6bd4e6581bbf3ab82ba4782;
    stim[14] = 264'h7c425e787a1889495741a9d124ab23b5942146623f840fa7443410681beb97dced;
    stim[15] = 264'h3dbe0ad597268bef0fcf8ebb84cec2a987605e654477b46fd9505f8ee33ce988c9;
    stim[16] = 264'h42c8f66695ed95fcba02ea1243961cd1552e892e701ad5097e275761dade7cbde9;
    stim[17] = 264'h1e5bfd6d45a74024772e9abd6daa52cc3bc1e11daad398625dba360ef1f5c95f54;
    stim[18] = 264'h000e9df7eac6bc8e60056cc5b51163a45644ded32ea110fe670fc293fa7ee25949;
    stim[19] = 264'h4d9c1467e8dc17e672ef606839bd1faed54bb6ef1655d3261e7008b0bf1553929a;
    stim[20] = 264'h2ef8cb547768d13cdc2ad90105d62102e46fd8f89e972aa3e1b33fce8ce69a0fa9;
    stim[21] = 264'h75ff736199201a0fb61bd7bbe0af2614ffd88e112e8b66e57202f23889a9383adf;
    stim[22] = 264'h0fdd24a476636ab88c9ac63e86dc0261c63824497925266716c46d25b236986f0f;
    stim[23] = 264'h1637375aaa7379e4b809920636109f02f6c589dc6cb604f5acc56cd8df6e8272d0;
    stim[24] = 264'hf2c9b21b2ac58c247004ecfd53fac5358720af7b5b0a62f6fa7ace2146612dc330;
    stim[25] = 264'h49f17ae614238171caaa953d1b3310cf2711839db63caac56498c20d4af6deedef;
    stim[26] = 264'h5e665ec8e7ebcf46210e6f7c60c8c23a922199a467fc0623aa364acab41e0ef59e;
    stim[27] = 264'h5777d292a8a1a1019f8ab0997b8cdd40c7d625828a925fecbcb1576b9974245c4d;
    stim[28] = 264'h0da92be1ffa9447d837a2ee924ca3646a6d5013dd9967d977c79bb53a3b1739ccd;
    stim[29] = 264'h17c4a42c3efb372598e7da5c1f7e496e26789772ce21b278edfadd06ef6672c773;
    stim[30] = 264'h34a89c6dab255844d28c2031fbfbea77bd960d6297cb89a2b009f9c94d2c070169;
    stim[31] = 264'h0ee7568c78781a039f2e309fe622d94b47e4af9155d7ecbb5da450dc9108971daa;
    stim[32] = 264'h22385f591464af68f44e7fd4354e84914093cacb84718dda3f05cb195f139e8068;
    stim[33] = 264'h6ede61b429a3b5159dac3c43e13ae767c305b05021575981325cbbd07418e2158f;
    stim[34] = 264'h009db8576f18d9b28fc2dbe6b9dc00c299930a54364477fda1f0d972ef575044bf;
    stim[35] = 264'h011d6f8fef79338c02251a9c5e1099995f89af3fb01658d48ea0f4101ddb360021;
    stim[36] = 264'h31acb5f3e7ddc8a88342e7177868ede551049d09e35b7c7bc8f28f2b16496e1e46;
    stim[37] = 264'h132630f5f790fe8fe175cb1520373566ab8b79c1ed0075397b5c5830fea88eec36;
    stim[38] = 264'h1e9ccf163e38b9045e631d6d2e98236d7f49ffd643dc11f562b5852a060af7f283;
    stim[39] = 264'h0a3f5e85b032aac3c212c2c28402fe0f2553c4ae9c998a2a47524a2f7278821cfa;
    stim[40] = 264'h2f33d169a7798a23619f7efa55e96ca9a540ac42c9f0dcc80792284ee1f5ee4260;
    stim[41] = 264'h25ab611c152b8f5c7ea68bd4233aefdec228a5dcf95a72772947dcf8e7a42e99fc;
    stim[42] = 264'h105e9d0f88b9fbc36a099cf898bfcb7445d6829a65456e314563dec35dacd39e03;
    stim[43] = 264'h58f6bb8da5467a134a8ed7b083bc326bc14ac959762b81735e094cf895cfa9e7ef;
    stim[44] = 264'h13b061cb75797a7a46fa081593578fd0f1174be44817d90df2088ca152a81a9f32;
    stim[45] = 264'h76add669c21a75c73ae2daa244690cac7d6f8151601eb077d7103c0ef593870fb0;
    stim[46] = 264'h1be3ab032ef6e33089ade7bfcb0ab3105035b67d6050f537df01b5ba43c43407cc;
    stim[47] = 264'h0c5ad7ec9079c48bb7fbb2dc8080df5c10e0db6b82eeabd6d7553c9e01e5e6b47c;
    stim[48] = 264'h6b442c04521c505f6f43b6aa5c88e68e489e5c082f1a13d65df4f672bb0fe16ab6;
    stim[49] = 264'h32ec2bde8a156318a9cc859a3810a446ff2c3384cbe13e4445c213fef682d8ac6a;
    stim[50] = 264'h32ce04e0942e8c54433a4cf3ba04cdabcd65c81a0d20d3857c037fefec621abe1b;
    stim[51] = 264'hef47bb876f97c8e45e3a8b2af9ccdc8468b6c57645d99ad832a1eac649ff9aa5c8;
    stim[52] = 264'h4feb14385c70d7574df082930b2cb8d97c497c94e6db52083615f21c09d4695ee6;
    stim[53] = 264'h2765f2e01d6d9f608223337c654f9bf91afd3e32b21f61fc2a34ed4bd2df9f7ed1;
    stim[54] = 264'h0b805c6ef900ae938cd995faae66816b3e6479cb18b669be0e7e712ea643eadb12;
    stim[55] = 264'h763f0b11327a5e6755c7f783911ddee7ea6b6ebc18a31c22736c4ca7fd5ca4a38d;
    stim[56] = 264'he0f571277312702fb9eeab77219c653b67eff5a8ed3a6440370b7534843e1b5460;
    stim[57] = 264'h1e74946cc6a1fb2792652ce9d5dbdcf7d2ecd1397908463ae15e355e943ab14fcc;
    stim[58] = 264'h5b11b8fe9381c68b16a5f21ca0388c1226c7edea8b7103baf2eee36e996f2ccb25;
    stim[59] = 264'h00a842f3ec14270675d224ca5559b19fb401a62faa70d3571cd7f28b32dd0377b1;
    stim[60] = 264'h4d707d43248b68413127f48c98921a2fe8762b6f219ee9d90b8c4c30e64c7b2e0a;
    stim[61] = 264'h227ec89191ed2f348279e5b4e660ad19a25e8b9ee10a8943d73692b4d91136d8f7;
    stim[62] = 264'h044c9fa18ef810b0439f8449a5969f7fcd3a8735d5d5ca40890f89917d85a762c8;
    stim[63] = 264'h767bf2c8879496779525369bc7d2a2203f347f76394bdf9dd3a733c3736ccc3331;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h319e0ed42102cffb;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h2f2029bf2750d40d;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h13b01f40de2b9ed6;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h4023a15183c6a3be;
      expv[10] = 64'h6136843980dc5615;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'he13687cd21da656e;
      expv[13] = 64'h11e9393f86942fb1;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'hb853a9fb6076ed8c;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0e9df7eac6bc8e60;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h73df8f5178a0bce0;
      expv[25] = 64'hbc18dad16fbb948b;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'hc2c2f910fc1c7100;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h9db8576f18d9b28f;
      expv[35] = 64'h3adf1fdef2671804;
      expv[36] = 64'h4784215bc46a6119;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h3d20346d12a2a90a;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h5e9d0f88b9fbc36a;
      expv[43] = 64'h4ac959762b81735e;
      expv[44] = 64'h0000000000000007;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000085;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000003;
      expv[49] = 64'h1cdaa7ec6fe4debb;
      expv[50] = 64'h95dde90067d7b84c;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0b7534843e1b5460;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'ha842f3ec14270675;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h9d50efe4efd9ec44;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
