// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 197;
  localparam OW = 194;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059218 dut (
    .clk(clk),
    .reset(in_vec[196:196]),
    .if_write_ce(in_vec[195:195]),
    .if_write(in_vec[194:194]),
    .if_din(in_vec[193:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[193:193]),
    .if_empty_n(out_vec[192:192]),
    .if_dout(out_vec[191:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 197'h1523dd86993d81ce89a5a3d31208434635133df63582f5e001;
    stim[1] = 197'h13093312b75265eadf08232408cce363b9a426c65cafae85a8;
    stim[2] = 197'h083899c3bda3fbc768271289fe97efce72e181c1c463d8b278;
    stim[3] = 197'h0a50b3fe6a5ed66b5031466e7f22d2e2f9f5209b9d23478f08;
    stim[4] = 197'h0a5856a1cc0895a4d6704478b4bb21efa74f80f37ec164d053;
    stim[5] = 197'h0f01999253ff5e1b6b6d662ab10203547104949087457e0fb6;
    stim[6] = 197'h049e174912fe4029854346b1770a970d25159bb73f687917b0;
    stim[7] = 197'h070f9b2c8943fd2d874422ffa16bf63b6f5794bf8884942dca;
    stim[8] = 197'h06db7ef5f32e9a55c1e272548c2c6a36b200a2def7b0fd1ae1;
    stim[9] = 197'h0da792c97fa5fe5b2aa6ef2baaf8929fd6132f12d6d2ccb899;
    stim[10] = 197'h0b41a4d06d88090a9dd6035728a1e2d1dd815e0a93e4974070;
    stim[11] = 197'h0f6b1cba927e087ef0e9e6426594dea08293c088dd43a0dbfb;
    stim[12] = 197'h0f786def4b3cd7d6e031941e9e2db4293c0427c2ed48c68229;
    stim[13] = 197'h0eee38127ffc886b80c4cc6548dda246b28c7feed27d32cdd5;
    stim[14] = 197'h14e4c21c1c2a5ff2b0f8fcd4e2109a579924b7350ec8dcc204;
    stim[15] = 197'h02933ffd215b92f89f339099d14bc7e145e064458c705f390e;
    stim[16] = 197'h0964d6ce8a84f8dac331c93faf8cf3fbcb6150b3dfb97ea2a9;
    stim[17] = 197'h171cc15345c1f098b13d9df9c98a9ffbb609f6b982d0e44e91;
    stim[18] = 197'h085eb677dac30f10bd1ec979d914531e917ef5120f5feb97d8;
    stim[19] = 197'h05386fd77bcdc591d94bdda50c86b9d9f8a4272904c5d828af;
    stim[20] = 197'h04b081207cf8714ee1ee3c4d5d584df6cb795fbfac96d53d0f;
    stim[21] = 197'h016696d9b8fcbd0e8cdbcccb150c385efee2291a093eb829a4;
    stim[22] = 197'h09d52da3f10eadb2ef00005490c00bde33264ab68bd43d2993;
    stim[23] = 197'h0e4e8c0eb713ba554ea2d403132a88612206028b81da8dc050;
    stim[24] = 197'h0f2d1de6b895ea90f23ca11cc4c1fc695cb657bff3820a91c6;
    stim[25] = 197'h085ab32a225429cf4c3a4b9216d8c27ae48d0b40bc4d86ce15;
    stim[26] = 197'h0dda877249bff9de2bb53a1b530ccd682cc920978520e3d4d0;
    stim[27] = 197'h018b005dff5a90bdf2e417ca99c1036850a2166df049063aad;
    stim[28] = 197'h0f9a6f14248f770c6ce0d33e33768e5043c07cb51966e73f35;
    stim[29] = 197'h0391bc3adc7a04bc912b95fdfa4cd0cdbeb163383cf6755415;
    stim[30] = 197'h051e2ed9682577e0a9bc28c49a489c0f15bdf85328bff568dc;
    stim[31] = 197'h0353489e1fe7be95064a8287a49839dd7c2ae845112846cd94;
    stim[32] = 197'h00ea888b747f1807a2c9e2fb5bb0f96dffb3c094b54f9af691;
    stim[33] = 197'h0ce89d6a8038e0aee562f84b0123eb85db848bbcde2572bb2c;
    stim[34] = 197'h05defabdf44375b1118fa74394a50b5c6dd5064a5991cae6f3;
    stim[35] = 197'h0901977be8a4bd0a84c19c89dfb05d4a7b9f6b2317303a846a;
    stim[36] = 197'h058ea1a07617da80ab8b5ace9ec670007120d05bc62d8175c8;
    stim[37] = 197'h05c88ba706cb5cbf3aad48a7e66bb600fe20b4a3061f35e546;
    stim[38] = 197'h02fa20b5d0d7ff45acee8a6ce03615a527ef7ac3a3a6651e34;
    stim[39] = 197'h06247705e5438080b61e646b05d5401f8e6ad8b2ebaf85b560;
    stim[40] = 197'h0b78fb0ff165b3cf4259bd17100516297d8754da262ce95541;
    stim[41] = 197'h0aa615b034dc08289fc346cc74b0045c09546d93383a452105;
    stim[42] = 197'h0cab0755906e7c2471c8a186aa6a44787ff745904364c6d80c;
    stim[43] = 197'h031d2d591a1e20389678c989281ee789681192e66925a4eae4;
    stim[44] = 197'h0c878eb26f3b9590a71d16b2b41d03ce8b6b769a86eb7d2c5e;
    stim[45] = 197'h0a2011214fded3410a15f02dd831f981579a55c57ddc9cdba7;
    stim[46] = 197'h0acca9ac9488d3dfd663b58eee081f43e0cbaca0dfafb06722;
    stim[47] = 197'h095537f106a3b077d422a815ed9232b6c73cbb8f0e6e2f4c29;
    stim[48] = 197'h0b44d5cc320c698f5692a5e89729ee26fce7e6df8db7360f87;
    stim[49] = 197'h0bb2a676ba6911a557763e077dcc1d98db4afbd3b861054acb;
    stim[50] = 197'h06e639c092709d0858190db64cf9dac8e1a61453e76045036e;
    stim[51] = 197'h0361ddbb889bac3779a2c1f86ad4e34986b914b183ae22d6cc;
    stim[52] = 197'h041a612ff2a12fe6f42a3f9c657ea5764d69eaa523da683ae4;
    stim[53] = 197'h0d6c586ee181e8216994c11ffaaf9ff8988b9adf89397726ca;
    stim[54] = 197'h030107e7b2cabe09ecb70dbca059cebcf36edd7f3a25fc4547;
    stim[55] = 197'h0b6c73930254ffa7e694686f368ad1bce9e45e9bfb6efd8e25;
    stim[56] = 197'h0563b5d44605ddb9bf7babb47f250316a52b36e36930478552;
    stim[57] = 197'h0cba643306ca7740f925e2b95009815fd473e10a216d306be1;
    stim[58] = 197'h03efd1ae35114e0fc6dc05295d15706d343e7537a679768c09;
    stim[59] = 197'h1333e3bdff384fbb6b7b30a05e3ac5ba99c8610ee93926d38d;
    stim[60] = 197'h03cd1d83f002d52eb6a174e9f3508dafa8efe762019509bb0f;
    stim[61] = 197'h00a95bf6ab1142cd4e9ebfd46b5b8d324dd8cea503efe80f40;
    stim[62] = 197'h01dcb7931be59fe6358d28cf1b8ac0c6fceca17d0ecb2554a4;
    stim[63] = 197'h0beab764e88a034103ecd2d4ebc6566a4ebfd6b4c01980860a;
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
      expv[0] = 194'h2000000000000000000000000000000000000000000000000;
      expv[1] = 194'h2000000000000000000000000000000000000000000000000;
      expv[2] = 194'h2000000000000000000000000000000000000000000000000;
      expv[3] = 194'h2000000000000000000000000000000000000000000000000;
      expv[4] = 194'h2000000000000000000000000000000000000000000000000;
      expv[5] = 194'h2000000000000000000000000000000000000000000000000;
      expv[6] = 194'h2000000000000000000000000000000000000000000000000;
      expv[7] = 194'h2000000000000000000000000000000000000000000000000;
      expv[8] = 194'h3c0666494ffd786dadb598aac4080d51c41252421d15f83ed;
      expv[9] = 194'h3c0666494ffd786dadb598aac4080d51c41252421d15f83ed;
      expv[10] = 194'h3c0666494ffd786dadb598aac4080d51c41252421d15f83ed;
      expv[11] = 194'h3c0666494ffd786dadb598aac4080d51c41252421d15f83ed;
      expv[12] = 194'h369e4b25fe97f96caa9bbcaeabe24a7f584cbc4b5b4b32e26;
      expv[13] = 194'h369e4b25fe97f96caa9bbcaeabe24a7f584cbc4b5b4b32e26;
      expv[14] = 194'h369e4b25fe97f96caa9bbcaeabe24a7f584cbc4b5b4b32e26;
      expv[15] = 194'h2000000000000000000000000000000000000000000000000;
      expv[16] = 194'h2000000000000000000000000000000000000000000000000;
      expv[17] = 194'h2000000000000000000000000000000000000000000000000;
      expv[18] = 194'h2000000000000000000000000000000000000000000000000;
      expv[19] = 194'h2000000000000000000000000000000000000000000000000;
      expv[20] = 194'h2000000000000000000000000000000000000000000000000;
      expv[21] = 194'h2000000000000000000000000000000000000000000000000;
      expv[22] = 194'h2000000000000000000000000000000000000000000000000;
      expv[23] = 194'h2000000000000000000000000000000000000000000000000;
      expv[24] = 194'h2000000000000000000000000000000000000000000000000;
      expv[25] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[26] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[27] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[28] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[29] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[30] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[31] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[32] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[33] = 194'h393a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[34] = 194'h193a303adc4ee9553a8b500c4caa218488180a2e076a37014;
      expv[35] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[36] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[37] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[38] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[39] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[40] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[41] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[42] = 194'h3cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[43] = 194'h1cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[44] = 194'h1cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[45] = 194'h1cb4779ae257aa43c8f284731307f1a572d95effce082a471;
      expv[46] = 194'h376a1dc926ffe778aed4e86d4c3335a0b324825e14838f534;
      expv[47] = 194'h376a1dc926ffe778aed4e86d4c3335a0b324825e14838f534;
      expv[48] = 194'h376a1dc926ffe778aed4e86d4c3335a0b324825e14838f534;
      expv[49] = 194'h3e69bc50923ddc31b3834cf8cdda39410f01f2d4659b9cfcd;
      expv[50] = 194'h33a275aa00e382bb958be12c048fae176e122ef37895caecb;
      expv[51] = 194'h33a275aa00e382bb958be12c048fae176e122ef37895caecb;
      expv[52] = 194'h33a275aa00e382bb958be12c048fae176e122ef37895caecb;
      expv[53] = 194'h33a275aa00e382bb958be12c048fae176e122ef37895caecb;
      expv[54] = 194'h33a275aa00e382bb958be12c048fae176e122ef37895caecb;
      expv[55] = 194'h32ac1d5641b9f091c722861aa9a911e1ffdd16410d931b603;
      expv[56] = 194'h32ac1d5641b9f091c722861aa9a911e1ffdd16410d931b603;
      expv[57] = 194'h32ac1d5641b9f091c722861aa9a911e1ffdd16410d931b603;
      expv[58] = 194'h32ac1d5641b9f091c722861aa9a911e1ffdd16410d931b603;
      expv[59] = 194'h32ac1d5641b9f091c722861aa9a911e1ffdd16410d931b603;
      expv[60] = 194'h2000000000000000000000000000000000000000000000000;
      expv[61] = 194'h2000000000000000000000000000000000000000000000000;
      expv[62] = 194'h2000000000000000000000000000000000000000000000000;
      expv[63] = 194'h2000000000000000000000000000000000000000000000000;
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
