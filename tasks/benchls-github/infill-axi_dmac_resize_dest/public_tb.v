// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axi_dmac_resize_dest dut (
    .clk(clk),
    .reset(in_vec[75:75]),
    .mem_data_valid(in_vec[74:74]),
    .mem_data(in_vec[73:10]),
    .mem_data_last(in_vec[9:9]),
    .mem_data_strb(in_vec[8:1]),
    .dest_data_ready(in_vec[0:0]),
    .mem_data_ready(out_vec[74:74]),
    .dest_data_valid(out_vec[73:73]),
    .dest_data(out_vec[72:9]),
    .dest_data_last(out_vec[8:8]),
    .dest_data_strb(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'h9c92d90575f94f5dea8;
    stim[1] = 76'hc5c668d38026001c0ab;
    stim[2] = 76'h679bf82ccf54a42be96;
    stim[3] = 76'h2459dcab385fa880df0;
    stim[4] = 76'h4b19d6765b9bc9613db;
    stim[5] = 76'h1f4dfb47abe6f298db3;
    stim[6] = 76'h6fa65066f11d384a284;
    stim[7] = 76'h026c4fafa424abf3272;
    stim[8] = 76'h715e2e3b5f3361a16d2;
    stim[9] = 76'h17748335d6cd20c80c0;
    stim[10] = 76'h47fa92ccb6dfe5e4173;
    stim[11] = 76'h54619e6af4a73344f5a;
    stim[12] = 76'h54fe58e7b38b2f518bb;
    stim[13] = 76'h78564f0e7cb8dfc09ab;
    stim[14] = 76'hb6cc0c4e20cc424883c;
    stim[15] = 76'h24f5b486ad82916784d;
    stim[16] = 76'h31e9ca67b4dc7aada62;
    stim[17] = 76'h296295c14110a3b3e70;
    stim[18] = 76'h63db08c527f3beccde8;
    stim[19] = 76'h469da4c2c3e2a08c742;
    stim[20] = 76'h399b95c1fd89bcc2198;
    stim[21] = 76'h54e66016957048c7db1;
    stim[22] = 76'h1e92a191c6ae2240d9b;
    stim[23] = 76'h04b9ca731acf0534e35;
    stim[24] = 76'h453ffdd893eea65690c;
    stim[25] = 76'h1908145184076683645;
    stim[26] = 76'h387ff3da12085ebdc35;
    stim[27] = 76'h1d9485320029b743bc3;
    stim[28] = 76'h3f0c99b3ac6de552226;
    stim[29] = 76'h7b59323dec949fafcc1;
    stim[30] = 76'h55b5f0b27b2a4c411b9;
    stim[31] = 76'h3f93151022a29c237c5;
    stim[32] = 76'h02c29f71649bca6e9a7;
    stim[33] = 76'h1e4f77fc8e6b654d245;
    stim[34] = 76'h0b58d904ca6a0e0b54f;
    stim[35] = 76'h4af03bc6432bb5e25a4;
    stim[36] = 76'h2ce2dfe282b5eb26d69;
    stim[37] = 76'h39013456cbd6625cb9a;
    stim[38] = 76'h5f19e347e02b9ebb3c7;
    stim[39] = 76'h7bf112ec0c0838992b7;
    stim[40] = 76'h60135a7a445eabad25d;
    stim[41] = 76'h2956ad78e533f9d8412;
    stim[42] = 76'h0c1f0415e4c2b8ff44a;
    stim[43] = 76'h0102e60667f98db3f17;
    stim[44] = 76'h02be4783e47d1f04af6;
    stim[45] = 76'h176c3a6376ff3b4461a;
    stim[46] = 76'h03c9ad431b1bda78202;
    stim[47] = 76'h6c105f214c4d5dae5f0;
    stim[48] = 76'h7f2b726ce9e8fb8381c;
    stim[49] = 76'h06b5db35abc069563d6;
    stim[50] = 76'h43909700404d307db57;
    stim[51] = 76'h6318ca149946d88d643;
    stim[52] = 76'h07ad764b4d0cf36c882;
    stim[53] = 76'h22c8ddb40ff1d76cef1;
    stim[54] = 76'h542584cea3e89d01b86;
    stim[55] = 76'h4221b8cf6be9d1787ae;
    stim[56] = 76'h6397dbdd0ba19207480;
    stim[57] = 76'h785b62ec0c09f243acb;
    stim[58] = 76'ha7ed4e59f5213aecb67;
    stim[59] = 76'h704f3b008caac4b64be;
    stim[60] = 76'h47f46b8bd25fdf5fc66;
    stim[61] = 76'h32c66099280861e4781;
    stim[62] = 76'h0cc6b2466786a75c6b1;
    stim[63] = 76'h73749d06d78e2e06a6e;
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
      expv[0] = 75'h0e496c82bafca7aef54;
      expv[1] = 75'h62e33469c013000e055;
      expv[2] = 75'h33cdfc1667aa5215f4b;
      expv[3] = 75'h122cee559c2fd4406f8;
      expv[4] = 75'h658ceb3b2dcde4b09ed;
      expv[5] = 75'h4fa6fda3d5f3794c6d9;
      expv[6] = 75'h37d32833788e9c25142;
      expv[7] = 75'h013627d7d21255f9939;
      expv[8] = 75'h38af171daf99b0d0b69;
      expv[9] = 75'h0bba419aeb669064060;
      expv[10] = 75'h63fd49665b6ff2f20b9;
      expv[11] = 75'h2a30cf357a5399a27ad;
      expv[12] = 75'h6a7f2c73d9c597a8c5d;
      expv[13] = 75'h7c2b27873e5c6fe04d5;
      expv[14] = 75'h1b6606271066212441e;
      expv[15] = 75'h527ada4356c148b3c26;
      expv[16] = 75'h18f4e533da6e3d56d31;
      expv[17] = 75'h14b14ae0a08851d9f38;
      expv[18] = 75'h31ed846293f9df666f4;
      expv[19] = 75'h234ed26161f150463a1;
      expv[20] = 75'h1ccdcae0fec4de610cc;
      expv[21] = 75'h6a73300b4ab82463ed8;
      expv[22] = 75'h4f4950c8e35711206cd;
      expv[23] = 75'h425ce5398d67829a71a;
      expv[24] = 75'h229ffeec49f7532b486;
      expv[25] = 75'h4c840a28c203b341b22;
      expv[26] = 75'h5c3ff9ed09042f5ee1a;
      expv[27] = 75'h4eca42990014dba1de1;
      expv[28] = 75'h1f864cd9d636f2a9113;
      expv[29] = 75'h7dac991ef64a4fd7e60;
      expv[30] = 75'h6adaf8593d9526208dc;
      expv[31] = 75'h5fc98a8811514e11be2;
      expv[32] = 75'h41614fb8b24de5374d3;
      expv[33] = 75'h4f27bbfe4735b2a6922;
      expv[34] = 75'h45ac6c8265350705aa7;
      expv[35] = 75'h25781de32195daf12d2;
      expv[36] = 75'h56716ff1415af5936b4;
      expv[37] = 75'h1c809a2b65eb312e5cd;
      expv[38] = 75'h6f8cf1a3f015cf5d9e3;
      expv[39] = 75'h7df8897606041c4c95b;
      expv[40] = 75'h7009ad3d222f55d692e;
      expv[41] = 75'h14ab56bc7299fcec209;
      expv[42] = 75'h060f820af2615c7fa25;
      expv[43] = 75'h4081730333fcc6d9f8b;
      expv[44] = 75'h015f23c1f23e8f8257b;
      expv[45] = 75'h0bb61d31bb7f9da230d;
      expv[46] = 75'h01e4d6a18d8ded3c101;
      expv[47] = 75'h36082f90a626aed72f8;
      expv[48] = 75'h3f95b93674f47dc1c0e;
      expv[49] = 75'h035aed9ad5e034ab1eb;
      expv[50] = 75'h61c84b802026983edab;
      expv[51] = 75'h718c650a4ca36c46b21;
      expv[52] = 75'h03d6bb25a68679b6441;
      expv[53] = 75'h51646eda07f8ebb6778;
      expv[54] = 75'h2a12c26751f44e80dc3;
      expv[55] = 75'h2110dc67b5f4e8bc3d7;
      expv[56] = 75'h31cbedee85d0c903a40;
      expv[57] = 75'h7c2db1760604f921d65;
      expv[58] = 75'h53f6a72cfa909d765b3;
      expv[59] = 75'h38279d804655625b25f;
      expv[60] = 75'h23fa35c5e92fefafe33;
      expv[61] = 75'h5963304c940430f23c0;
      expv[62] = 75'h4663592333c353ae358;
      expv[63] = 75'h39ba4e836bc71703537;
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
