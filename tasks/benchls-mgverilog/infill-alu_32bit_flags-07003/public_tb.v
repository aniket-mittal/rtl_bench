// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07003 dut (
    .srca(in_vec[65:34]),
    .srcb(in_vec[33:2]),
    .alucontrol(in_vec[1:0]),
    .aluresult(out_vec[35:4]),
    .aluflags(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h39933f438a450f696;
    stim[1] = 66'h26882d5fa59089fda;
    stim[2] = 66'h2f723ac190375265a;
    stim[3] = 66'h03e5c75176b559b16;
    stim[4] = 66'h0b3f332fd42895d27;
    stim[5] = 66'h0d7c4bcb700800077;
    stim[6] = 66'h386c583e06963b0e8;
    stim[7] = 66'h2f5381f7b4bf86b36;
    stim[8] = 66'h2ff20005e3d1f1516;
    stim[9] = 66'h1ed795bb6578626a6;
    stim[10] = 66'h0c45ee47fb3f43ee2;
    stim[11] = 66'h3a5791ea374921b7e;
    stim[12] = 66'h21db2aba6d0e78a4d;
    stim[13] = 66'h1f9883a6ed572e66a;
    stim[14] = 66'h009f0a52bc419f3bc;
    stim[15] = 66'h35cdabd594b34ce6a;
    stim[16] = 66'h10c8dce1c99339fde;
    stim[17] = 66'h21a626868dace862c;
    stim[18] = 66'h1fad1dbf371f23262;
    stim[19] = 66'h1f1fe62ad4a7734e7;
    stim[20] = 66'h248718b460f28d9a6;
    stim[21] = 66'h1d4db8f9910659945;
    stim[22] = 66'h1fcb2ec889a359db4;
    stim[23] = 66'h1962a33d399512d48;
    stim[24] = 66'h38ded0569ed8b4ef8;
    stim[25] = 66'h2ec44d2720125c22a;
    stim[26] = 66'h075aaa709f2157d5c;
    stim[27] = 66'h300816485119e9b01;
    stim[28] = 66'h0376637a0c9354a59;
    stim[29] = 66'h010584fdd8a0c16ba;
    stim[30] = 66'h1fd60bd2795eafc83;
    stim[31] = 66'h06eacd9558a35a8b1;
    stim[32] = 66'h2cf381f7c86ce0fbe;
    stim[33] = 66'h205b28510e4200c3a;
    stim[34] = 66'h07dacb506e5c181e7;
    stim[35] = 66'h3ed0238d104e076f2;
    stim[36] = 66'h09a728f6a7260a1ee;
    stim[37] = 66'h0713eb3c0c65a5182;
    stim[38] = 66'h0afd6c00581a8c284;
    stim[39] = 66'h0fb307d13fbe6bc8d;
    stim[40] = 66'h1da9bbc811d8986ee;
    stim[41] = 66'h238f68da6492e5ccc;
    stim[42] = 66'h260d95f61df26ecc0;
    stim[43] = 66'h1996d26503f71affd;
    stim[44] = 66'h1200a21aea404a949;
    stim[45] = 66'h22902b2af7fb12785;
    stim[46] = 66'h18a80b0572401ea4f;
    stim[47] = 66'h3007e92e867a41c99;
    stim[48] = 66'h2e6e2d6042d39d112;
    stim[49] = 66'h07b12441dbcbdb16f;
    stim[50] = 66'h25874baad956d1e7d;
    stim[51] = 66'h0232b66ab2175e40f;
    stim[52] = 66'h1230b17e292a93e60;
    stim[53] = 66'h0ccf406750024af91;
    stim[54] = 66'h0b9af309541555f40;
    stim[55] = 66'h2771f0cfb1dd4e9b3;
    stim[56] = 66'h0bcaa5d0d6ee97d26;
    stim[57] = 66'h057f7916cc1755b56;
    stim[58] = 66'h2d36d8c1a86c46659;
    stim[59] = 66'h096b8c3b82238e874;
    stim[60] = 66'h3bf8420b40111ca83;
    stim[61] = 66'h27939dd132b848a4a;
    stim[62] = 66'h0ffb2a0c970ccb684;
    stim[63] = 66'h119cf726db25f2782;
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
      expv[0] = 36'h20043d040;
      expv[1] = 36'h920025768;
      expv[2] = 36'h00c849060;
      expv[3] = 36'h0a9504450;
      expv[4] = 36'h7cfedfff0;
      expv[5] = 36'hf5f12f3d8;
      expv[6] = 36'hfc0a4d328;
      expv[7] = 36'h904e02cc8;
      expv[8] = 36'h8f4000058;
      expv[9] = 36'h114000a90;
      expv[10] = 36'h201509180;
      expv[11] = 36'hc90406888;
      expv[12] = 36'hd332c8568;
      expv[13] = 36'h3440089a0;
      expv[14] = 36'hf382a6399;
      expv[15] = 36'h520423120;
      expv[16] = 36'h020063870;
      expv[17] = 36'hbd4c3ba58;
      expv[18] = 36'h5c3404980;
      expv[19] = 36'h7effddbb0;
      expv[20] = 36'h820822418;
      expv[21] = 36'h311d7d952;
      expv[22] = 36'ha5ba228f9;
      expv[23] = 36'h4bded8462;
      expv[24] = 36'h5ede15183;
      expv[25] = 36'h800130888;
      expv[26] = 36'h99f009199;
      expv[27] = 36'h7bb8b2612;
      expv[28] = 36'hdb8c3b528;
      expv[29] = 36'h000201a60;
      expv[30] = 36'hff7abf698;
      expv[31] = 36'hb91dcc298;
      expv[32] = 36'h218203cf0;
      expv[33] = 36'h010801040;
      expv[34] = 36'hbf7b6d798;
      expv[35] = 36'h41000c340;
      expv[36] = 36'h0498205a0;
      expv[37] = 36'h100684600;
      expv[38] = 36'h8c5fe0a29;
      expv[39] = 36'h3fd270210;
      expv[40] = 36'h462261200;
      expv[41] = 36'h20893a9c3;
      expv[42] = 36'h100013083;
      expv[43] = 36'h567edd952;
      expv[44] = 36'h9f015e198;
      expv[45] = 36'haa5462ca8;
      expv[46] = 36'heba07e978;
      expv[47] = 36'ha6369d94a;
      expv[48] = 36'h090834000;
      expv[49] = 36'h7feffd5f0;
      expv[50] = 36'h30c1e70c2;
      expv[51] = 36'hc8dff9ab8;
      expv[52] = 36'hed6d15909;
      expv[53] = 36'hf333d5b98;
      expv[54] = 36'h7ec123f50;
      expv[55] = 36'hdff7fb7e8;
      expv[56] = 36'h0b2a17410;
      expv[57] = 36'h105d44510;
      expv[58] = 36'h132a49702;
      expv[59] = 36'h2e3c6b0b0;
      expv[60] = 36'hefe57aad8;
      expv[61] = 36'h8a4022008;
      expv[62] = 36'h9c1fd5d39;
      expv[63] = 36'h4413c8800;
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
