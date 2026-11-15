// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02387 dut (
    .enable(in_vec[129:129]),
    .inverse(in_vec[128:128]),
    .i_0(in_vec[127:112]),
    .i_1(in_vec[111:96]),
    .i_2(in_vec[95:80]),
    .i_3(in_vec[79:64]),
    .i_4(in_vec[63:48]),
    .i_5(in_vec[47:32]),
    .i_6(in_vec[31:16]),
    .i_7(in_vec[15:0]),
    .o_0(out_vec[127:112]),
    .o_1(out_vec[111:96]),
    .o_2(out_vec[95:80]),
    .o_3(out_vec[79:64]),
    .o_4(out_vec[63:48]),
    .o_5(out_vec[47:32]),
    .o_6(out_vec[31:16]),
    .o_7(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h0a4e1d3caac6125d1b77f64fc50f35a36;
    stim[1] = 130'h27cdb8e052c6d5034e10d58b093c793a1;
    stim[2] = 130'h094cb52177675265ce597652ff98104c6;
    stim[3] = 130'h3cd630554b6297dac015e9f13b4c2699e;
    stim[4] = 130'h13fe3c92210ffba1a46dc03cf75c908fd;
    stim[5] = 130'h2945ec78caacf6bf0a4e7624bcaca748b;
    stim[6] = 130'h0c2e1d9e9ad3cb03eaf6decd3d050855f;
    stim[7] = 130'h18e29a76db2292bf4a117e17666796be3;
    stim[8] = 130'h3ceecdfe9b9c6e2cd21c440ecdfb9817e;
    stim[9] = 130'h0332b8314096181d58cad66995d698469;
    stim[10] = 130'h35632779370f36f018e16b68c430de4d5;
    stim[11] = 130'h08ec61e7db423ddb183881467d160fcad;
    stim[12] = 130'h0ebaa2c60b54a4b2e3598dc0c073a0f4d;
    stim[13] = 130'h2cc9b11713f043ab42a7648215e1b860b;
    stim[14] = 130'h3f97b1b91453fcaa177e8d35d5fd55f5d;
    stim[15] = 130'h2abcf61e09bcf25735ff7b36599c9a39c;
    stim[16] = 130'h1ba22499229fdd041d5eb3de5e9821412;
    stim[17] = 130'h018633ed3cc8fec056504e06c27941bbf;
    stim[18] = 130'h15158b73b7958eb5a6d3106246dbd20ed;
    stim[19] = 130'h268b05743ac4527f16e2aa4e24bcb3cbb;
    stim[20] = 130'h2e66bf741cbf8fe9486b91ea90859b457;
    stim[21] = 130'h2359777e4b90fbe380757aea2babfd136;
    stim[22] = 130'h15ea8c26de816433684cb6af54c417dde;
    stim[23] = 130'h344831a58fcbb935ad1c37df47a2a2d7b;
    stim[24] = 130'h225dc4edc4dbe0da7425328ccedf6529c;
    stim[25] = 130'h2b8734c8d75158be4f9a8feea2bb022d7;
    stim[26] = 130'h1141a687b4a162e35898993642ea31f0e;
    stim[27] = 130'h1715405d700a74d925833107c51e512be;
    stim[28] = 130'h107dae022ee40ecdd18aa2a3d3a0a08c2;
    stim[29] = 130'h06c66c2b10033ecccc52cdf4f6abcdda0;
    stim[30] = 130'h08583f1c6a38d3aff4fb77468dcdb0745;
    stim[31] = 130'h317dafe94763cd9efdc0f6102c24c622e;
    stim[32] = 130'h0b9a52e032371b1134a8b5d1fd887c3fe;
    stim[33] = 130'h0f3187ee9cdb74cac91f6a92482a15735;
    stim[34] = 130'h18b420cb9af853043a2ddd99af5ec7439;
    stim[35] = 130'h38bcfcd2fa1344c273d75971aa9aa6f71;
    stim[36] = 130'h3b44f2aaff6ba49b9c35001c156a55100;
    stim[37] = 130'h23768cd8f7545b85f9443f110094b7e59;
    stim[38] = 130'h0a1c8cbce63ade1e599c2c29c2245d557;
    stim[39] = 130'h183c9c119742efeb518f8e035f3eece15;
    stim[40] = 130'h1fb8fc2d9e0e4a8935e9ba9808cd0c095;
    stim[41] = 130'h0d8171476ffbaa52a4a71175c266bb3bc;
    stim[42] = 130'h2da4308e513a27ee0817b1ed3c54df37c;
    stim[43] = 130'h0557795de6b7ac53079142d4080b4b97c;
    stim[44] = 130'h35ef2673b70c10a327802f8efbd750a6c;
    stim[45] = 130'h1cde0bbdaa7c5c347bec3436cca19ccdf;
    stim[46] = 130'h280e239d18eebc0b8e14d71d374d37b5d;
    stim[47] = 130'h097051c73651060dba4d87b3df13999ce;
    stim[48] = 130'h087c87b1f6bd024516ccc5814e0aff5da;
    stim[49] = 130'h0b9a2ba5fa0f0a11a0eab58485227ef8b;
    stim[50] = 130'h149a48aaf20eb9bb92ec07353de7e0e0c;
    stim[51] = 130'h370bfe0c7461ab51717ff8537e10caebf;
    stim[52] = 130'h3cc4da00af50ec3e2c3efee3b84ed8212;
    stim[53] = 130'h0ffb8d6a7a6944825bd85c7d324354081;
    stim[54] = 130'h0a0c0772eb801365c2899298d1728eac0;
    stim[55] = 130'h1e183d2beff9bb7046957542364a9e249;
    stim[56] = 130'h2b19674acd2ee5b452d94a707e3d05c46;
    stim[57] = 130'h2e5ccc98718c9c487784c3a69c4c14501;
    stim[58] = 130'h38c8a9c77fe1dc8f7e5abe398e8888a0f;
    stim[59] = 130'h17ee472af02c81889f25878d72bc01cf3;
    stim[60] = 130'h0841f213017324df75eb1d873eee92af0;
    stim[61] = 130'h130202f045c6bf4fe890f322ead720929;
    stim[62] = 130'h2100f6420cf0ab1476e37efb69f590758;
    stim[63] = 130'h0176c0e6151806f92c8967889b95e33da;
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
      expv[0] = 128'ha4e1d3caac6125d1b77f64fc50f35a36;
      expv[1] = 128'h7cdbe10d8e0558b02c6d93c7503493a1;
      expv[2] = 128'h94cb52177675265ce597652ff98104c6;
      expv[3] = 128'hcd63b629015eb4c205547dac9f13699e;
      expv[4] = 128'h3fe3c92210ffba1a46dc03cf75c908fd;
      expv[5] = 128'h945ea4e7c78c624baacfcaca6bf0748b;
      expv[6] = 128'hc2e1d9e9ad3cb03eaf6decd3d050855f;
      expv[7] = 128'h8e29a76db2292bf4a117e17666796be3;
      expv[8] = 128'hceecb9c621c4dfb9dfe9e2cd40ec817e;
      expv[9] = 128'h332b8314096181d58cad66995d698469;
      expv[10] = 128'h563270f38e16430d77936f01b68ce4d5;
      expv[11] = 128'h8ec61e7db423ddb183881467d160fcad;
      expv[12] = 128'hebaa2c60b54a4b2e3598dc0c073a0f4d;
      expv[13] = 128'hcc9b2a76117148213f045e1b3ab4860b;
      expv[14] = 128'hf97b453f77e85fd51b91caa1d35d5f5d;
      expv[15] = 128'habcf5ff761e0b3659bcf99c92573a39c;
      expv[16] = 128'hba22499229fdd041d5eb3de5e9821412;
      expv[17] = 128'h18633ed3cc8fec056504e06c27941bbf;
      expv[18] = 128'h5158b73b7958eb5a6d3106246dbd20ed;
      expv[19] = 128'h68b06e2a5743a4e2ac454bcb27f13cbb;
      expv[20] = 128'he66b86b9f7411ea9cbf80859fe94b457;
      expv[21] = 128'h3597075777e4aea2b90fbabfbe38d136;
      expv[22] = 128'h5ea8c26de816433684cb6af54c417dde;
      expv[23] = 128'h4483fcbbd1c37a2a1a58935a7df42d7b;
      expv[24] = 128'h25dc42534edc28cc4dbeedf60da7529c;
      expv[25] = 128'hb873f9a84c8dfeea75152bb08be422d7;
      expv[26] = 128'h141a687b4a162e35898993642ea31f0e;
      expv[27] = 128'h715405d700a74d925833107c51e512be;
      expv[28] = 128'h07dae022ee40ecdd18aa2a3d3a0a08c2;
      expv[29] = 128'h6c66c2b10033ecccc52cdf4f6abcdda0;
      expv[30] = 128'h8583f1c6a38d3aff4fb77468dcdb0745;
      expv[31] = 128'h17da763cdc0fc24cfe94d9ef6102622e;
      expv[32] = 128'hb9a52e032371b1134a8b5d1fd887c3fe;
      expv[33] = 128'hf3187ee9cdb74cac91f6a92482a15735;
      expv[34] = 128'h8b420cb9af853043a2ddd99af5ec7439;
      expv[35] = 128'h8bcfa1343d75a9aacd2f4c27971a6f71;
      expv[36] = 128'hb44ff6bac35056a52aaf49b901c15100;
      expv[37] = 128'h37689443cd8ff1107545094bb85f7e59;
      expv[38] = 128'ha1c8cbce63ade1e599c2c29c2245d557;
      expv[39] = 128'h83c9c119742efeb518f8e035f3eece15;
      expv[40] = 128'hfb8fc2d9e0e4a8935e9ba9808cd0c095;
      expv[41] = 128'hd8171476ffbaa52a4a71175c266bb3bc;
      expv[42] = 128'hda43817b08e51ed313a2c54d7ee0f37c;
      expv[43] = 128'h557795de6b7ac53079142d4080b4b97c;
      expv[44] = 128'h5ef270c17802bd75673b0a32f8ef0a6c;
      expv[45] = 128'hcde0bbdaa7c5c347bec3436cca19ccdf;
      expv[46] = 128'h80e2e14d39d171d38eeb74d3c0b87b5d;
      expv[47] = 128'h97051c73651060dba4d87b3df13999ce;
      expv[48] = 128'h87c87b1f6bd024516ccc5814e0aff5da;
      expv[49] = 128'hb9a2ba5fa0f0a11a0eab58485227ef8b;
      expv[50] = 128'h49a48aaf20eb9bb92ec07353de7e0e0c;
      expv[51] = 128'h70bf461a17ffe10ce0c7b5178537aebf;
      expv[52] = 128'hcc4df50ec3ef84eda00ac3e2ee3b8212;
      expv[53] = 128'hffb8d6a7a6944825bd85c7d324354081;
      expv[54] = 128'ha0c0772eb801365c2899298d1728eac0;
      expv[55] = 128'he183d2beff9bb7046957542364a9e249;
      expv[56] = 128'hb1962d9474aca707d2eee3d05b455c46;
      expv[57] = 128'he5cc784cc9873a6918c9c4c1c4874501;
      expv[58] = 128'h8c8afe1de5abe8889c77c8f7e3988a0f;
      expv[59] = 128'h7ee472af02c81889f25878d72bc01cf3;
      expv[60] = 128'h841f213017324df75eb1d873eee92af0;
      expv[61] = 128'h30202f045c6bf4fe890f322ead720929;
      expv[62] = 128'h100f6e376420efb6cf0a9f59b1470758;
      expv[63] = 128'h176c0e6151806f92c8967889b95e33da;
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
