// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_164210 dut (
    .clk(clk),
    .xpos(in_vec[96:86]),
    .ypos(in_vec[85:75]),
    .hcount_in(in_vec[74:64]),
    .vcount_in(in_vec[63:53]),
    .hsync_in(in_vec[52:52]),
    .vsync_in(in_vec[51:51]),
    .hblnk_in(in_vec[50:50]),
    .vblnk_in(in_vec[49:49]),
    .rgb_in(in_vec[48:25]),
    .rgb_pixel(in_vec[24:1]),
    .rst(in_vec[0:0]),
    .hcount_out(out_vec[68:58]),
    .vcount_out(out_vec[57:47]),
    .hsync_out(out_vec[46:46]),
    .vsync_out(out_vec[45:45]),
    .hblnk_out(out_vec[44:44]),
    .vblnk_out(out_vec[43:43]),
    .rgb_out(out_vec[42:19]),
    .pixel_addr(out_vec[18:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h0ce94ce6d9bb9ff0b08065113;
    stim[1] = 97'h1e0844fcd9c372932b8afa6bd;
    stim[2] = 97'h0aff82fc116f7c77d3d9b7cb4;
    stim[3] = 97'h17b0f3ac964dfe2e48c693b6c;
    stim[4] = 97'h060daaaa45436490687f52f68;
    stim[5] = 97'h1412ba22d656a02a8bb3d3a66;
    stim[6] = 97'h145fd1330613acf4693d91ea4;
    stim[7] = 97'h0e98c0e7ea270d53b3cba7eb8;
    stim[8] = 97'h15c04cbaab33d2f794b0b7c82;
    stim[9] = 97'h04dab559f126d0b01ab6ae12a;
    stim[10] = 97'h1fa2975f649b0afea323f1914;
    stim[11] = 97'h0b750de7979277412d5a7c9c6;
    stim[12] = 97'h04e6e26008562364e1ab48034;
    stim[13] = 97'h1d9aaa012d6b703d7ad660358;
    stim[14] = 97'h13008b3e9f0a9d85786e59626;
    stim[15] = 97'h16fc887680e2b40e1e88bd096;
    stim[16] = 97'h19351cd59a13d95b9dbc9fa3e;
    stim[17] = 97'h1671af2c7b91bfdabe6b4a1d0;
    stim[18] = 97'h0ebfa25efc5e6794ea964582a;
    stim[19] = 97'h1576c721127bef3ae90dad6e8;
    stim[20] = 97'h141834d79e2b4c2f9defb3502;
    stim[21] = 97'h17e211b06792dbc614949953c;
    stim[22] = 97'h177eb7e8363e1665817d37d82;
    stim[23] = 97'h0e43c3402abb488e3f4822a96;
    stim[24] = 97'h11a56dff873b4634fc9778030;
    stim[25] = 97'h0edbc581f1e4cb4b63073efe0;
    stim[26] = 97'h17ea7ba5611a5990fcc07d0aa;
    stim[27] = 97'h1addf89922030c446db024daa;
    stim[28] = 97'h0972de74a5c50e7aed9af4d00;
    stim[29] = 97'h17be29f03b9a506a77a917f3c;
    stim[30] = 97'h03e1b8eb8ae8712de3baf1314;
    stim[31] = 97'h09bc0123677c854e07acc9d2c;
    stim[32] = 97'h14425291ec1dbaa4bf9890fc8;
    stim[33] = 97'h1fbfed78d88c306f1ef04bc0a;
    stim[34] = 97'h19d5c7818a627236cc3d635a0;
    stim[35] = 97'h15e520261b81e53ecc56ff662;
    stim[36] = 97'h1c977bdb75073979a52a7d7fc;
    stim[37] = 97'h01995335f9116cbc67de1c64e;
    stim[38] = 97'h14543878516d65dccb33e24f6;
    stim[39] = 97'h1705e32ebf59122d9add83670;
    stim[40] = 97'h03163d854e68a3e7de054386a;
    stim[41] = 97'h1926dd0b919214277b9400876;
    stim[42] = 97'h1dccde80ff6ab1282b552eef0;
    stim[43] = 97'h05f2080ac027b8e62f4fba3e6;
    stim[44] = 97'h0d20d5cb3b224f2a8fd7a733a;
    stim[45] = 97'h1532e318518efd6cf58a6217a;
    stim[46] = 97'h16c31ac0f063f92a290538f94;
    stim[47] = 97'h191f0123037dcbe30d5531bbe;
    stim[48] = 97'h00c413939cda4c56f3ea9e614;
    stim[49] = 97'h1a311adf1b971712cc5b7482a;
    stim[50] = 97'h160776b1f7dbe01fbe967aa5c;
    stim[51] = 97'h0ab7c09678ad0be3da44ba1d2;
    stim[52] = 97'h15db51c61b95ef208b7221648;
    stim[53] = 97'h1e6106eddc5c37e027012f3ac;
    stim[54] = 97'h0a73283526a432c5b39a6bfc8;
    stim[55] = 97'h0217c0f09a474717e93e5900a;
    stim[56] = 97'h09608f3cbd6282ce7c4e4f230;
    stim[57] = 97'h0ef168909d6599471e0ac9bda;
    stim[58] = 97'h11dbcd0ba0057736fd0f044e4;
    stim[59] = 97'h1c016e33e1fa20b8424ff3b78;
    stim[60] = 97'h02e5401d95c9f1d89cb894ff4;
    stim[61] = 97'h17ef4f071250aed88143caf0e;
    stim[62] = 97'h16b25bd48dba728d9ddb1a1e6;
    stim[63] = 97'h12b6d7437125f4907308642f4;
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
      expv[0] = 69'hxxxxxxxxfc2c2xxxxx;
      expv[1] = 69'h00000004a4cae70fcd;
      expv[2] = 69'h000000071df4f5bfc1;
      expv[3] = 69'h000000078b923132c9;
      expv[4] = 69'h1f045bd9241a1ce7e5;
      expv[5] = 69'h0b2593780aa2ea2441;
      expv[6] = 69'h0a9150db3d1a4da1ad;
      expv[7] = 69'h08b595ab54ecf4f97a;
      expv[8] = 69'h0cc184ecbde52fbe93;
      expv[9] = 69'h19fa89c42c06a891f9;
      expv[10] = 69'h0eaaccf2bfa8cda086;
      expv[11] = 69'h167c49b5d04b52fd43;
      expv[12] = 69'h17d926c0d9386fee18;
      expv[13] = 69'h19e5e49c0f5eb4d535;
      expv[14] = 69'h1802158f615e1e0ab0;
      expv[15] = 69'h004b5add0387a0e802;
      expv[16] = 69'h0fa7c2a656e76f9899;
      expv[17] = 69'h1da038aff6af9dc508;
      expv[18] = 69'h156684f1e53aa7b7a2;
      expv[19] = 69'h0b1ee46bceba46fc75;
      expv[20] = 69'h17bf179b0be77e89ca;
      expv[21] = 69'h08449efef18521dda9;
      expv[22] = 69'h15e78ad599605db17d;
      expv[23] = 69'h0c19e4b2238fd1d60a;
      expv[24] = 69'h1a0d8f818d3f217219;
      expv[25] = 69'h100aaed2d2d8c3648f;
      expv[26] = 69'h1fe1ced6643f3595ed;
      expv[27] = 69'h007c7933111b6bb5dc;
      expv[28] = 69'h095846939ebb675950;
      expv[29] = 69'h064880c41a9deee04c;
      expv[30] = 69'h1d2971444b78edc45c;
      expv[31] = 69'h1c0ee6915381eb5c47;
      expv[32] = 69'h1ae2ba1ea92fe4e826;
      expv[33] = 69'h08d9df241bc7ba251e;
      expv[34] = 69'h047b076c8db30c6308;
      expv[35] = 69'h1e3623094fb3173272;
      expv[36] = 69'h0062989e5e694fa742;
      expv[37] = 69'h0986e07b2f19f245e6;
      expv[38] = 69'h16dd41c97732cdf860;
      expv[39] = 69'h0d7e445c8b66b03285;
      expv[40] = 69'h1e145b58f9f786233f;
      expv[41] = 69'h0bafd64509dee01af8;
      expv[42] = 69'h01539a2c4a0ad1d74a;
      expv[43] = 69'h02e46486398bd2ca63;
      expv[44] = 69'h003fdaabcaa3f6a540;
      expv[45] = 69'h02b009ef5b3d65b809;
      expv[46] = 69'h12cec8964a8a4430c7;
      expv[47] = 69'h061463baf8c357c4e4;
      expv[48] = 69'h103c18fb15bcf9c389;
      expv[49] = 69'h08c0df75c4b3164faa;
      expv[50] = 69'h04e7369007efa632ee;
      expv[51] = 69'h17c6e5c2f8f6910adb;
      expv[52] = 69'h0c7df6fbc822deeee0;
      expv[53] = 69'h059e2b45f809c56c30;
      expv[54] = 69'h1186e57cb16ce57ddc;
      expv[55] = 69'h1b771709c5fa48b771;
      expv[56] = 69'h0d49a908b39f13092f;
      expv[57] = 69'h1c2691d651c7818884;
      expv[58] = 69'h0f2f58a5cdbf472662;
      expv[59] = 69'h042759602e10916782;
      expv[60] = 69'h02e8015c76272a5563;
      expv[61] = 69'h0cf87e8bb620526171;
      expv[62] = 69'h0765727ca36772ec8f;
      expv[63] = 69'h01c4942d241cc7a63c;
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
