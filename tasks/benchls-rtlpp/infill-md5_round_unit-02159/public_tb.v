// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 226;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02159 dut (
    .a(in_vec[225:194]),
    .b(in_vec[193:162]),
    .c(in_vec[161:130]),
    .d(in_vec[129:98]),
    .m(in_vec[97:66]),
    .s(in_vec[65:34]),
    .t(in_vec[33:2]),
    .round(in_vec[1:0]),
    .next_a(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 226'h0f59303f902b330254415b25a6f54f118468eeaeff99e6e979569ad09;
    stim[1] = 226'h17bf57f199304cca2092577b011c0717c3a60ce5b3017e7391cc8b97b;
    stim[2] = 226'h2368dac6ede94edd17133989e71e3c179296a8b4d04196e8df60bcb2d;
    stim[3] = 226'h2ffde0a36cda2a4421bc2593f45adb71e3cc6f95fcd32f45fb92a89d8;
    stim[4] = 226'h25f064b4167f795989cbb4c3ffa9fe1560272e6d3be37d8463a1596d6;
    stim[5] = 226'h21d58a08dafbce59430ae4c5d36b104616ce369c0537e90f5d04b9e68;
    stim[6] = 226'h2f6a97b83e8db5b12e7568ee3f5597c1efae70d53a4535c1e51fcaa83;
    stim[7] = 226'h3fba890784fc289825737fd2b0bdcdd3a65255f8c50fef7a88205d69b;
    stim[8] = 226'h04b21e17cee5f2325a9c22f216793f4dc2e7a7ef350a4376b6be8d59e;
    stim[9] = 226'h1d813d9dbac7ddb127fe3e5fe981fabe5ab3849a2cd664f26d917eac0;
    stim[10] = 226'h288d2d361f3b214ed159db109b6f262aa2bbc8a4e7e3efffa27dc5ba8;
    stim[11] = 226'h17d6a08038ddd17a8cd19960d9289a920982f478bf520c6766d9da759;
    stim[12] = 226'h2e82c6362cb59237bf850672478e5b84f0168d80a167ed9912d78e9c8;
    stim[13] = 226'h2b5660c14e4855759fc7f81277e3cd0b06ef496b3cc38b9f65fadfb96;
    stim[14] = 226'h2b24f35cf08de6c947daa4c2d78472ee06ee1282e599b0c5d2b5b0871;
    stim[15] = 226'h35aedb5cc4e21bd2c921cf929e846f98920a152dbebea45f0c9e259f7;
    stim[16] = 226'h286762807208fa2b99215ff04521ad875668bb8e00f082f056bff9124;
    stim[17] = 226'h26cb54855b7584b612229d97ac918c872a5733454af55af3c4cbaad8d;
    stim[18] = 226'h3d8b4290b790ebcb2de5b5f0b258c5a4ad76ce2b253dfe9c79e20e5a6;
    stim[19] = 226'h1a3594fb0fe387aaca091f698e7b44874a5d536efbb6b2c8d322e1f28;
    stim[20] = 226'h2a13864e42e7c7a9ce97dd8391bfd0a080e8f265bff45ce951c1a66b2;
    stim[21] = 226'h3055907bf9303d4a5294ea234f22710a66a19f90244a634b325a275c2;
    stim[22] = 226'h23e510c5d374b7c4ed6e162e860851f73aa7596b882dccc9dbff7f74a;
    stim[23] = 226'h2901f051706a729be3fe7568f9f534d779ffe8eac3b21f71e749caac7;
    stim[24] = 226'h37d07c11453a13896fba80e903461a12530a71bd5a362fe7b3b2c71be;
    stim[25] = 226'h324643b6afbfd94eca3ab1b37ae5502dacda4d192259d448c20b77eac;
    stim[26] = 226'h3d9bfa67d0686d31480e7ba5963103fa5374ab8b07f1b337cc8aa5537;
    stim[27] = 226'h10f1fe301fdc7a6a635663f5047c50b0304072127094aeffeb49d101f;
    stim[28] = 226'h18c2ec2aa1d266efc00d78cc6c24dd4fbc8800d8e4b75d2e4e3bba920;
    stim[29] = 226'h16e2f8d1de7cee9c479a7241a88c142bcf3ef2f9ce871ed659da55794;
    stim[30] = 226'h1a46cd489504db2dec84e072e26d886273889c072283ba0cba8d76ded;
    stim[31] = 226'h3440ccb56ae67c2b37f04adb330d6cbd301b524e975b50a0607c52ac2;
    stim[32] = 226'h0df55d41334b50b43cd85f2bb8c8ee45752e771d3298cd1dee4715c7b;
    stim[33] = 226'h2cef62003b6f437e5c6a80fca61da6e107f2c4ec6fdebe65adee4b79f;
    stim[34] = 226'h26a400f8228f575f61b74531aaf667512cdf04841816e028c25c89332;
    stim[35] = 226'h3b56c2d0a0c7c860cb2cf9ddb08f4455bfc8708d5e3fffa45a6054a2f;
    stim[36] = 226'h3db14e117171ff849a09d2359da5a8646de46a90dbdd63accc4d5e25b;
    stim[37] = 226'h26524d8a690214fbdaabdd609f14e00518779ead4066ea1726c6c622a;
    stim[38] = 226'h2a3e3f1f871a986f147443b783d5bf5f480fe20a93048704f0d38817d;
    stim[39] = 226'h2898a2086dcc5a8544474c50e0539781796a328c06ec42ce9e54dcbc4;
    stim[40] = 226'h0b3958b4b9a1399a72d7da13a9e2970d7cb939fc278d432ec8fcef87f;
    stim[41] = 226'h210a212365c93d03ad372ad6d595b9d5f4d0ff795492f5594ca22d24c;
    stim[42] = 226'h2953a4e1888f809b6bddec6056d4f02485f493e3a28d284ca2209776b;
    stim[43] = 226'h1a6e65da04caef9f9e79bf5ca136cb3d899ad9b477e4a147a46f0468a;
    stim[44] = 226'h337afce1c5a7d6a5fd6150a6a39fa143d7818a73adbd744b4a722c945;
    stim[45] = 226'h138b81856ec7a983efa3ca8942a88f1c42e159dcd38794f61bb7499a6;
    stim[46] = 226'h3b7e012c767a5a2320b41917cf997087a824613972672927f0d341d7f;
    stim[47] = 226'h3eb4d8ecd6596f7a0382959d9c6cdba24167a996ba4e29de7daa36ac1;
    stim[48] = 226'h0175cd5dc83d1ac4b56cccc9ed6fc9cd1eab93f153f24db8bb94a9755;
    stim[49] = 226'h1b87fe379cb5bc6923329c2ee8905e3793da83ef84546765fbcf1fd47;
    stim[50] = 226'h17e17522bf5613596001a7d6cbc599099ce81eece2392455f5da5e203;
    stim[51] = 226'h3dd250327bd1d4a27c55fae6fe5e82ad3284551b949259c9e61474e16;
    stim[52] = 226'h0b59e798eaada8f754c9cecbb55d3dfa324b423e14b0da46caf6d92d1;
    stim[53] = 226'h078265e3d632d6fb0eff94510b463c823f04128a8c66af637dfe19175;
    stim[54] = 226'h360b4d2669e559b99434e66f42cb4c36c3078b341847bc8f78e2428e1;
    stim[55] = 226'h06bdc9835a5075b57a7800ab8d07731fe2f5077a7283085d9c335c704;
    stim[56] = 226'h01ef6d0f408d9c288de75b7e86a9ccc38c38c954b08505562645e07fe;
    stim[57] = 226'h249ef2d2cd2b16b013b5fc1758e5938bb0b5b8036ca2f2aa21b87160c;
    stim[58] = 226'h11728f41efc2556b00bc73b9c4aca7b8b8b4cd2a2bdd2605f089fa95a;
    stim[59] = 226'h1c7e5c98cdb9e0e848017365e3e22cdd38fe6e5b2b07d065521faa089;
    stim[60] = 226'h2fc17a648b4014dad7674ecdc1fc9381494d79390912b3c09775bb9f5;
    stim[61] = 226'h04aa880c43850f9b254c60502c9ca073f9d6d5ff2215c1d79e4e5e4db;
    stim[62] = 226'h1252e4046352fdde292a271657c518e0575858e9865466049694a48e0;
    stim[63] = 226'h1fb0c45f38b9964631efb65957fbce28b181c938abb57f2a6f3127bdd;
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
      expv[0] = 32'h40accc09;
      expv[1] = 32'h64c13328;
      expv[2] = 32'hb7a53b74;
      expv[3] = 32'hb368a910;
      expv[4] = 32'h59fde566;
      expv[5] = 32'h6bef3965;
      expv[6] = 32'hfa36d6c4;
      expv[7] = 32'h13f0a260;
      expv[8] = 32'h3b97c8c9;
      expv[9] = 32'heb1f76c4;
      expv[10] = 32'h7cec853b;
      expv[11] = 32'he37745ea;
      expv[12] = 32'hb2d648de;
      expv[13] = 32'h392155d6;
      expv[14] = 32'hc2379b25;
      expv[15] = 32'h13886f4b;
      expv[16] = 32'hc823e8ae;
      expv[17] = 32'h6dd612d8;
      expv[18] = 32'hde43af2c;
      expv[19] = 32'h3f8e1eab;
      expv[20] = 32'h0b9f1ea7;
      expv[21] = 32'he4c0f529;
      expv[22] = 32'h4dd2df13;
      expv[23] = 32'hc1a9ca6f;
      expv[24] = 32'h14e84e25;
      expv[25] = 32'hbeff653b;
      expv[26] = 32'h41a1b4c5;
      expv[27] = 32'h7f71e9a9;
      expv[28] = 32'h87499bbf;
      expv[29] = 32'h79f3ba71;
      expv[30] = 32'h54136cb7;
      expv[31] = 32'hab99f0ac;
      expv[32] = 32'hcd2d42d0;
      expv[33] = 32'hedbd0df9;
      expv[34] = 32'h8a3d5d7d;
      expv[35] = 32'h831f2183;
      expv[36] = 32'hc5c7fe12;
      expv[37] = 32'ha40853ef;
      expv[38] = 32'h1c6a61bc;
      expv[39] = 32'hb7316a15;
      expv[40] = 32'he684e669;
      expv[41] = 32'h9724f40e;
      expv[42] = 32'h223e026d;
      expv[43] = 32'h132bbe7e;
      expv[44] = 32'h169f5a97;
      expv[45] = 32'hbb1ea60f;
      expv[46] = 32'hd9e9688c;
      expv[47] = 32'h5965bde8;
      expv[48] = 32'h20f46b12;
      expv[49] = 32'h72d6f1a4;
      expv[50] = 32'hfd584d65;
      expv[51] = 32'hef475289;
      expv[52] = 32'haab6a3dd;
      expv[53] = 32'h58cb5bec;
      expv[54] = 32'ha79566e6;
      expv[55] = 32'h6941d6d5;
      expv[56] = 32'h023670a2;
      expv[57] = 32'h34ac5ac0;
      expv[58] = 32'hbf0955ac;
      expv[59] = 32'h36e783a1;
      expv[60] = 32'h2d00536b;
      expv[61] = 32'h0e143e6c;
      expv[62] = 32'h8d4bf778;
      expv[63] = 32'he2e65918;
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
