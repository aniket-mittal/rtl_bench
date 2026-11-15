// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pcie_tlp_fc_count dut (
    .clk(clk),
    .rst(in_vec[131:131]),
    .tlp_hdr(in_vec[130:3]),
    .tlp_valid(in_vec[2:2]),
    .tlp_sop(in_vec[1:1]),
    .tlp_ready(in_vec[0:0]),
    .out_fc_ph(out_vec[38:35]),
    .out_fc_pd(out_vec[34:26]),
    .out_fc_nph(out_vec[25:22]),
    .out_fc_npd(out_vec[21:13]),
    .out_fc_cplh(out_vec[12:9]),
    .out_fc_cpld(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'hfe93c82f9e888de586e3e8c891f32fbdb;
    stim[1] = 132'hdffa69179cca250139ee585cc19352643;
    stim[2] = 132'h1666580bc8603749653ee9e28c59ce27a;
    stim[3] = 132'h1c1ddd6f88a0c685544d44fd638c54899;
    stim[4] = 132'h70ed42e9d89fbd42c8038bed2578e4009;
    stim[5] = 132'h757f8220fe28c452112cc96d493bbf1f5;
    stim[6] = 132'h4b73feb5bc64728abae99b1a40907367a;
    stim[7] = 132'h51069e4ac6b59b6ed130feaf8c3e856d4;
    stim[8] = 132'h2158419f297fb94b133ed3bba72282468;
    stim[9] = 132'ha41fb3b881dd1821432e4b73a88b95aa2;
    stim[10] = 132'h15a4c576df26b5c2167d60eb93e61a45c;
    stim[11] = 132'h5594c66a927a6bc5db1c190936abfeef9;
    stim[12] = 132'h6e565795900b0650072440cf74fc121b3;
    stim[13] = 132'h363a516a25d4f9cf2524e0fdc38b3ab70;
    stim[14] = 132'h735fa5bde5cc739ed9ca3a22598d5cafe;
    stim[15] = 132'h0a7d838a691c7632affe453b0fc7daafc;
    stim[16] = 132'h513ddd5d09bf2dd9148629dafa2116a94;
    stim[17] = 132'h290ebea2e9307e7dc3a800f58151fdf11;
    stim[18] = 132'h1fe3f3e63a7e48b320a2118adcbec7efe;
    stim[19] = 132'h3470b168402c82abb1c946f79dba8fcfb;
    stim[20] = 132'h564bc04f503015a9234ebf2c377a1656b;
    stim[21] = 132'h3d5b4061ccaa05568480b4fba3f928c21;
    stim[22] = 132'h710f4af54d9e73007ca0a5dfecfc822a9;
    stim[23] = 132'h75fd3d5f52b6fa9945e544e451862191c;
    stim[24] = 132'h024438f09060f99c4a0b8f2158488ddac;
    stim[25] = 132'h310f8b4c770dbbdfb149c3dbb75d37e98;
    stim[26] = 132'h394f61171e49032668f7d42c17a7f324e;
    stim[27] = 132'h7b949b5184b89c0e7c17d58a019ad356c;
    stim[28] = 132'h542ac42a7bf4f2e276a45d219838f7247;
    stim[29] = 132'h0ddd9ea7d738b00bfee1ab736da23f6cf;
    stim[30] = 132'h29987c18df33ba6555ebea2da6e1dcb21;
    stim[31] = 132'h2f06d5c6f95e2cfb977552b55a1e11a96;
    stim[32] = 132'h0e38ad1b57be6c2515dd2f8c83f0a37ee;
    stim[33] = 132'h08a64f7e655ca7c619d52f9b6df8541fe;
    stim[34] = 132'h5259b12544d53712fea800d34beae0c24;
    stim[35] = 132'h0e5168a111f76e88b7dc4ab2526bf7ee0;
    stim[36] = 132'h368f6b1bdee9857041db3a0158811af9a;
    stim[37] = 132'h3e37f3a434f8feb6ecc43d9ea1808a9a9;
    stim[38] = 132'h1c7241a5ac198549c9f2f495a9fd8adcc;
    stim[39] = 132'h5a8435f2f3c622735682edddffd3a70a7;
    stim[40] = 132'h25f04731b415dc12db109bd991fff02f8;
    stim[41] = 132'h27156dc57a02d1ea8971ef67599b47794;
    stim[42] = 132'h05d3d36e73c66a66f4d17f56a10ef08db;
    stim[43] = 132'h1a9ab9c9de17e93b8ea93937a1b64e3ea;
    stim[44] = 132'h6dd7105a436c5ab28bf69a551b5683a48;
    stim[45] = 132'h59cf906897a72a4e374fb7af0fbfbe153;
    stim[46] = 132'h3e3c65703047ae59e04840c1c37cdbdf3;
    stim[47] = 132'h48632153303b3b411ddbac748184b73bf;
    stim[48] = 132'h27d177a49ce3ad15d11aaf84486dfc1a7;
    stim[49] = 132'h3ab902c5cbe6ad397a1b9a88eea5e9636;
    stim[50] = 132'h048285ecc64bd1d3df54ba4ac50adad01;
    stim[51] = 132'h22afb2d81c14c930b2559dcefeacc3802;
    stim[52] = 132'h1acd80c0900fe1bbb7f49e6501342ff70;
    stim[53] = 132'h4873c7cafd9f886d566a55f67776d3d33;
    stim[54] = 132'h61416cd9af47ea54bf7cf821fe33ec1bc;
    stim[55] = 132'h30b2bd14bf8363403f10f328c58b10690;
    stim[56] = 132'h6f920c6959cbb923906ddbc87af0d48b7;
    stim[57] = 132'h6bc3938f986d89e683df0db0af97261b3;
    stim[58] = 132'h625d470fd090e3a74e244b3c18989be40;
    stim[59] = 132'h77a4c764bee91d6f26a53ea2b59b9f458;
    stim[60] = 132'h19f8d33aa4339184f857252dfd91a4944;
    stim[61] = 132'h34f507f12ec18b08fd883e0c9c17b3cd7;
    stim[62] = 132'h5dd25e27bb5bb4baa517190fdd35cbcec;
    stim[63] = 132'h124ba8404ca821901fa75eb06e9e6bfec;
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
      expv[0] = 39'h0000000000;
      expv[1] = 39'h0000000000;
      expv[2] = 39'h0000000000;
      expv[3] = 39'h0000000000;
      expv[4] = 39'h0000000000;
      expv[5] = 39'h0000000000;
      expv[6] = 39'h0000000000;
      expv[7] = 39'h0000000000;
      expv[8] = 39'h0000000000;
      expv[9] = 39'h0000000000;
      expv[10] = 39'h0000000000;
      expv[11] = 39'h0000000000;
      expv[12] = 39'h0000000000;
      expv[13] = 39'h0000000000;
      expv[14] = 39'h0000000000;
      expv[15] = 39'h0000000000;
      expv[16] = 39'h0000000000;
      expv[17] = 39'h0000000000;
      expv[18] = 39'h0000000000;
      expv[19] = 39'h0000000000;
      expv[20] = 39'h0000000000;
      expv[21] = 39'h0000000000;
      expv[22] = 39'h0000000000;
      expv[23] = 39'h0000000000;
      expv[24] = 39'h0000000000;
      expv[25] = 39'h0000000000;
      expv[26] = 39'h0000000000;
      expv[27] = 39'h0000000000;
      expv[28] = 39'h0000000000;
      expv[29] = 39'h0000000000;
      expv[30] = 39'h0000000000;
      expv[31] = 39'h0000000000;
      expv[32] = 39'h0000000000;
      expv[33] = 39'h0000000000;
      expv[34] = 39'h0000000000;
      expv[35] = 39'h0000000000;
      expv[36] = 39'h0000000000;
      expv[37] = 39'h0000000000;
      expv[38] = 39'h0000000000;
      expv[39] = 39'h0000000000;
      expv[40] = 39'h0000000000;
      expv[41] = 39'h0000000000;
      expv[42] = 39'h0000000000;
      expv[43] = 39'h0000000000;
      expv[44] = 39'h0000000000;
      expv[45] = 39'h0000000000;
      expv[46] = 39'h0000000000;
      expv[47] = 39'h0000000000;
      expv[48] = 39'h0000000000;
      expv[49] = 39'h0000000000;
      expv[50] = 39'h0000000000;
      expv[51] = 39'h0000000000;
      expv[52] = 39'h0000000000;
      expv[53] = 39'h0000000000;
      expv[54] = 39'h0000000000;
      expv[55] = 39'h0000000000;
      expv[56] = 39'h0000000000;
      expv[57] = 39'h0000000000;
      expv[58] = 39'h0000000000;
      expv[59] = 39'h0000000000;
      expv[60] = 39'h0000000000;
      expv[61] = 39'h0000000000;
      expv[62] = 39'h0000000000;
      expv[63] = 39'h0000000000;
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
