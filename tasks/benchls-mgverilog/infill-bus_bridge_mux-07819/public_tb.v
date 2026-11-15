// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07819 dut (
    .clk(clk),
    .reset(in_vec[98:98]),
    .m_wr_rs(in_vec[97:97]),
    .m_rq_cyc(in_vec[96:96]),
    .m_rd_rq(in_vec[95:95]),
    .m_wr_rq(in_vec[94:94]),
    .m_ma(in_vec[93:79]),
    .m_sel(in_vec[78:75]),
    .m_fmc_select(in_vec[74:74]),
    .m_mb_write(in_vec[73:38]),
    .s0_addr_ack(in_vec[37:37]),
    .s0_rd_rs(in_vec[36:36]),
    .s0_mb_read(in_vec[35:0]),
    .m_addr_ack(out_vec[97:97]),
    .m_rd_rs(out_vec[96:96]),
    .m_mb_read(out_vec[95:60]),
    .s0_wr_rs(out_vec[59:59]),
    .s0_rq_cyc(out_vec[58:58]),
    .s0_rd_rq(out_vec[57:57]),
    .s0_wr_rq(out_vec[56:56]),
    .s0_ma(out_vec[55:41]),
    .s0_sel(out_vec[40:37]),
    .s0_fmc_select(out_vec[36:36]),
    .s0_mb_write(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h5528294fc268bc9195156b217;
    stim[1] = 99'h5086940978fc0b2bb36b7eff1;
    stim[2] = 99'h241c7033bbf57f2e9620ef17f;
    stim[3] = 99'h0e7b0919ec338817c3d63cd10;
    stim[4] = 99'h178fec6116097706c077fb717;
    stim[5] = 99'h0739815149670b5b2108cdc7a;
    stim[6] = 99'h186a53fd9bdc84486e71afdc1;
    stim[7] = 99'h7f62d26669f7bf472b171e53e;
    stim[8] = 99'h24aaba4fcb6ff259cc0ce9962;
    stim[9] = 99'h27d9378ac9f4d2569438af734;
    stim[10] = 99'h312e9d8353a708757e2e25024;
    stim[11] = 99'h01630ea8b8b0aaa09ba76896f;
    stim[12] = 99'h00b9154c987d69438fc59249d;
    stim[13] = 99'h3a4d41201a667e325d6141db5;
    stim[14] = 99'h0bb12e1984388a7ae96308626;
    stim[15] = 99'h0bc9284e46e4af5819d65595f;
    stim[16] = 99'h08de9c382a229aac15db5fb20;
    stim[17] = 99'h0a73b22d2a4c479208f8fb25d;
    stim[18] = 99'h1d9529b2e0f20a7afae970b65;
    stim[19] = 99'h2bb269747ec1e71627381f506;
    stim[20] = 99'h1a3f8730358c0f5e8cad236ad;
    stim[21] = 99'h23d39b343e27144999c43ff36;
    stim[22] = 99'h19c80c2695f431d0d27d9474e;
    stim[23] = 99'h08b5ca9c38965faa35d1934cf;
    stim[24] = 99'h2ac8a012a5bea1298c73e5d6d;
    stim[25] = 99'h25d2ded2032d923d63ea6f2fb;
    stim[26] = 99'h16ab3ceaa56e82dc7e73d1ee7;
    stim[27] = 99'h3a56cf78e2875c4a2209eb308;
    stim[28] = 99'h15cbaa629af4ef5e376cd17d6;
    stim[29] = 99'h10b8489bc047305472354fe40;
    stim[30] = 99'h311b5fe41825456d44f96a450;
    stim[31] = 99'h07d07611e9aa1271eb16c7c1a;
    stim[32] = 99'h0fa2f60ab850e3aa36c2596fb;
    stim[33] = 99'h1eb589c0ae0d2e9de4c81ccac;
    stim[34] = 99'h24dce7a84ac12ab42f106d170;
    stim[35] = 99'h1c59d7398f95057d5587d4ef3;
    stim[36] = 99'h3cd33c7b101e4356eb8d9f0e7;
    stim[37] = 99'h31574d1667c6f3b5b7e52e447;
    stim[38] = 99'h1272a2f0c2ddb263e3cc714c1;
    stim[39] = 99'h1209da7adc2ae48328501973a;
    stim[40] = 99'h040ee89e67f58b2553ff3b5f2;
    stim[41] = 99'h0eb710ce0c0254624e88ea018;
    stim[42] = 99'h2704a332824c63fc677d9a500;
    stim[43] = 99'h0a39507b36d01324498a2621a;
    stim[44] = 99'h230ee71848b4857945a8e5194;
    stim[45] = 99'h3043619e70b29bf061927e38b;
    stim[46] = 99'h0788e54fe115b8e3636bd2dd4;
    stim[47] = 99'h3a0d1ff6c4657232024608884;
    stim[48] = 99'h35da8eb5b9e7567f6f3a8d08c;
    stim[49] = 99'h3167a605b5d8cb8a51562edf8;
    stim[50] = 99'h13621996bca873412440f96d1;
    stim[51] = 99'h1943906bcb75e42dbf604e742;
    stim[52] = 99'h10146b03b08f4ec2bcb2384c0;
    stim[53] = 99'h2fa5370ee221af9c90c7be4b3;
    stim[54] = 99'h05cbcc814e9a25f30c36d37fc;
    stim[55] = 99'h24dbc8a90407c4cfa28fed45c;
    stim[56] = 99'h3b63df87bcf7f382ae6bd8d51;
    stim[57] = 99'h38485b43b2e7d9fe114027507;
    stim[58] = 99'h1a54273f5d55ded1894e5fc7b;
    stim[59] = 99'h3c076bb1b28275e7909c62024;
    stim[60] = 99'h33a8149b492a23968914337e1;
    stim[61] = 99'h10f53d775cc9a09a697a36063;
    stim[62] = 99'h1dc79b24823786882dd4f634d;
    stim[63] = 99'h29595e9e7fba4e52ac9419240;
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
      expv[0] = 98'h1bf1debf3754a0a5bf1debf37;
      expv[1] = 98'h3b7ebfeffb421a50b7ebfeffb;
      expv[2] = 98'h2deeffffff9071c0deeffffff;
      expv[3] = 98'h3e7f6fef1539ec24e7f6fef15;
      expv[4] = 98'h2c47ffffd75e3fb1c47ffffd7;
      expv[5] = 98'h3652dddefe1ce605652dddefe;
      expv[6] = 98'h0fe7fffdd361a94ffe7fffdd3;
      expv[7] = 98'h3bbb7deffffd8b49bbb7defff;
      expv[8] = 98'h1ff2dffdf692aae9ff2dffdf6;
      expv[9] = 98'h2bf3fff7b59f64debf3fff7b5;
      expv[10] = 98'h17f6ebd23dc4ba767f6ebd23d;
      expv[11] = 98'h0bbe7eabef058c3abbe7eabef;
      expv[12] = 98'h3bfe5f7edd02e455bfe5f7edd;
      expv[13] = 98'h2dd69d9fbde93504dd69d9fbd;
      expv[14] = 98'h2ef73ea6be2ec4b8ef73ea6be;
      expv[15] = 98'h039dfd7bdf2f24a139dfd7bdf;
      expv[16] = 98'h0f5fbdffab237a70f5fbdffab;
      expv[17] = 98'h2bcf9fb3fd29cec8bcf9fb3fd;
      expv[18] = 98'h2fbebf8bff7654a6fbebf8bff;
      expv[19] = 98'h2f7fb1fdc7aec9a5f7fb1fdc7;
      expv[20] = 98'h2ccff337ff68fe1cccff337ff;
      expv[21] = 98'h1d9fcbff368f4e6cd9fcbff36;
      expv[22] = 98'h0da7fd4f7e672030da7fd4f7e;
      expv[23] = 98'h275f3db7ef22d72a75f3db7ef;
      expv[24] = 98'h1cef7ffd6fab2280cef7ffd6f;
      expv[25] = 98'h16beeff6ff974b7b6beeff6ff;
      expv[26] = 98'h0fef7fbef75aacf3fef7fbef7;
      expv[27] = 98'h2e38bff71ae95b3de38bff71a;
      expv[28] = 98'h2bf6fd3fd7572ea9bf6fd3fd7;
      expv[29] = 98'h07f355fe5542e1227f355fe55;
      expv[30] = 98'h1d4f9ff55bc46d7fd4f9ff55b;
      expv[31] = 98'h1efb6efc9e1f41d8efb6efc9e;
      expv[32] = 98'h23ee35befb3e8bd83ee35befb;
      expv[33] = 98'h1e6f83cfaf7ad627e6f83cfaf;
      expv[34] = 98'h0af3b6dbfd93739eaf3b6dbfd;
      expv[35] = 98'h1f7bfd4fff71675cf7bfd4fff;
      expv[36] = 98'h2efcdff0f7f34cf1efcdff0f7;
      expv[37] = 98'h1ffff3fcefc55d34ffff3fcef;
      expv[38] = 98'h3e3cf77cd949ca8be3cf77cd9;
      expv[39] = 98'h3eb70bbf3a482769eb70bbf3a;
      expv[40] = 98'h17bffff7fb103ba27bffff7fb;
      expv[41] = 98'h27eb8eb5183adc437eb8eb518;
      expv[42] = 98'h0ef7dbbdff9c128cef7dbbdff;
      expv[43] = 98'h0eddb666db28e541eddb666db;
      expv[44] = 98'h165aaf71de8c3b9c65aaf71de;
      expv[45] = 98'h079d2fe7ffc10d8679d2fe7ff;
      expv[46] = 98'h37fefd6ffc1e23957fefd6ffc;
      expv[47] = 98'h2db579dc8ce8347fdb579dc8c;
      expv[48] = 98'h3ffff9d59fd76a3affff9d59f;
      expv[49] = 98'h257d76fffac59e9857d76fffa;
      expv[50] = 98'h17ef2f9ed14d88667ef2f9ed1;
      expv[51] = 98'h1bf6ddff4b650e41bf6ddff4b;
      expv[52] = 98'h2bef23d7f04051acbef23d7f0;
      expv[53] = 98'h0bbcfbeff7be94dcbbcfbeff7;
      expv[54] = 98'h30d3efbffc172f320d3efbffc;
      expv[55] = 98'h3a69fff57f936f22a69fff57f;
      expv[56] = 98'h2befbdfdf1ed8f7ebefbdfdf1;
      expv[57] = 98'h21fcbbf77fe1216d1fcbbf77f;
      expv[58] = 98'h1fd7f5ffff69509cfd7f5ffff;
      expv[59] = 98'h3d6de6bd7df01daed6de6bd7d;
      expv[60] = 98'h2ed34bbfe5cea052ed34bbfe5;
      expv[61] = 98'h2fd7b3686743d4f5fd7b36867;
      expv[62] = 98'h0bfdcfe3ef771e6cbfdcfe3ef;
      expv[63] = 98'h2fdfef93d4a5657afdfef93d4;
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
