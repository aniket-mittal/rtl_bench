// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HT_dynamic_key dut (
    .clk(clk),
    .rst(in_vec[128:128]),
    .key(in_vec[127:0]),
    .HT_key(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1205069db9f22ba629381000374f2f72c;
    stim[1] = 129'h14dad7083821d1db5241161c85d662a61;
    stim[2] = 129'h0b8763065a08dd484c8632d592b813f37;
    stim[3] = 129'h04502b2953d7528bf3a089651544d6889;
    stim[4] = 129'h0983251ed6b0a689e312d68c7f02b78fb;
    stim[5] = 129'h06b7d23247dcdbcaba3dd3678366b0507;
    stim[6] = 129'h057cdf810b98764d18711c373af8c1d10;
    stim[7] = 129'h06db67e788ded02967065325bc7421cac;
    stim[8] = 129'h0e4664c1c4b407f0ee8bea326c9b07143;
    stim[9] = 129'h010ccc46d80ca37b31484cc446cb83ef9;
    stim[10] = 129'h03f6a2a9537f51f4ebf8753f7076a50de;
    stim[11] = 129'h050cba58e57a93de9f7cfbeb6bdfc0c4b;
    stim[12] = 129'h0913deba7a80af8889d5c4f7a3a4c336c;
    stim[13] = 129'h094d782a688d428cd841782282dad5e78;
    stim[14] = 129'h0f2e74bfe08aa80044e4323bf5ae06b8c;
    stim[15] = 129'h01c867794d2c0a9d85ba3c3325624feae;
    stim[16] = 129'h096b31ac4ff38c6f5c58f573f9b1700e2;
    stim[17] = 129'h097d94d6bdd1fd1a45a7676c64c2712f9;
    stim[18] = 129'h049a32f8effc43f0d20ff1f09030f6b49;
    stim[19] = 129'h02fccf8f09c4044d4793c6a21d71d7437;
    stim[20] = 129'h04df552577736a56829613485d69aed46;
    stim[21] = 129'h0f4a31e7b7391b799d9c3adcde7774d7c;
    stim[22] = 129'h0ea494a7934e31f77ad73f7ea1c1fbcfd;
    stim[23] = 129'h061fc412163cc6735edd9046485a7c67f;
    stim[24] = 129'h06a1d202aa7f28ce3caa7dd60d03fc26a;
    stim[25] = 129'h0aa2b5d8d89d8143df745d1aa74dabf25;
    stim[26] = 129'h0a5a02aeb2e6a9a0e0da7f7eca6faeae0;
    stim[27] = 129'h04a489ad58cd8712c1242288c8cc410ec;
    stim[28] = 129'h185d9d07439aa38702d42ed0295afff96;
    stim[29] = 129'h0470a0cd487c30ad4c543bd34faebea58;
    stim[30] = 129'h0396c729e36fa00b056d75f4ccac9d669;
    stim[31] = 129'h091c17820e45286289f329a144661d164;
    stim[32] = 129'h0fb9b46db5831b18f96cbddaa5e35f836;
    stim[33] = 129'h0c927e7047e666a6b2492ff6f1f10fe27;
    stim[34] = 129'h0787c7d69110ed43fc550790bea9464b9;
    stim[35] = 129'h0e23a51722322d02e939fe9e8c8b0a784;
    stim[36] = 129'h07094fec56a79a3e03ac16c96650c69a7;
    stim[37] = 129'h0462f5bd140d22802069e49138f7afa86;
    stim[38] = 129'h0864bc4d117016fa756a1373974d2fb46;
    stim[39] = 129'h04751b5293b64d1fc1e50ffae5e48f4bf;
    stim[40] = 129'h01c892f8be0ef863c2f3258f71c262abe;
    stim[41] = 129'h0182f3597c4996f9717c8e96f58d3f8d8;
    stim[42] = 129'h069ec28087b995cabe0e9b9680e53c1f7;
    stim[43] = 129'h05fe9bfa7ab0f41c537da7ee16dd5ad50;
    stim[44] = 129'h04658e989ea835c39d1fe7d8354021d9e;
    stim[45] = 129'h02dc80adee3d414a13f3442f843de1069;
    stim[46] = 129'h0cca2ff65b41f1d93312d0fc112432a39;
    stim[47] = 129'h07d07d4188b527d8ef84537b0076265ec;
    stim[48] = 129'h01a7d5271913b0667464b7f729149f091;
    stim[49] = 129'h080273b229568143629ff6d76859f0dda;
    stim[50] = 129'h034bdec42a77d23de423561dcea17c200;
    stim[51] = 129'h0c2876baf1f5b244767df8c9a186990ad;
    stim[52] = 129'h0c469305ba466c9caadd97a65d2dccd9b;
    stim[53] = 129'h0dfbd7cf07887cfdab261192dedb7fc48;
    stim[54] = 129'h06c3c69e130b5f43163712da5c18a46fa;
    stim[55] = 129'h06b7c403e745fe522756aedb623170234;
    stim[56] = 129'h094ede90442b6d0771ea7a3ffd9ec6502;
    stim[57] = 129'h0a5b8e03bee429c98856e417fa3faf4df;
    stim[58] = 129'h0ac261eee41f90166ef452ad992886e1f;
    stim[59] = 129'h035938a4bf4c68f4541d935ed941e9935;
    stim[60] = 129'h0375a8e4e37bae2af0acdf6b964043a38;
    stim[61] = 129'h09b08fab398301d0f260df30dc7b4f4aa;
    stim[62] = 129'h07707fcda36d1a888881a3dbb1bfae2bc;
    stim[63] = 129'h0d878e6fac86c4a81052fac78c75e3a5c;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'hb8763065a08dd484c8632d592b813f37;
      expv[4] = 128'h00000000000000000000000000000000;
      expv[5] = 128'h983251ed6b0a689e312d68c7f02b78fb;
      expv[6] = 128'h00000000000000000000000000000000;
      expv[7] = 128'h57cdf810b98764d18711c373af8c1d10;
      expv[8] = 128'h00000000000000000000000000000000;
      expv[9] = 128'he4664c1c4b407f0ee8bea326c9b07143;
      expv[10] = 128'h00000000000000000000000000000000;
      expv[11] = 128'h3f6a2a9537f51f4ebf8753f7076a50de;
      expv[12] = 128'h00000000000000000000000000000000;
      expv[13] = 128'h913deba7a80af8889d5c4f7a3a4c336c;
      expv[14] = 128'h00000000000000000000000000000000;
      expv[15] = 128'hf2e74bfe08aa80044e4323bf5ae06b8c;
      expv[16] = 128'h00000000000000000000000000000000;
      expv[17] = 128'h96b31ac4ff38c6f5c58f573f9b1700e2;
      expv[18] = 128'h00000000000000000000000000000000;
      expv[19] = 128'h49a32f8effc43f0d20ff1f09030f6b49;
      expv[20] = 128'h00000000000000000000000000000000;
      expv[21] = 128'h4df552577736a56829613485d69aed46;
      expv[22] = 128'h00000000000000000000000000000000;
      expv[23] = 128'hea494a7934e31f77ad73f7ea1c1fbcfd;
      expv[24] = 128'h00000000000000000000000000000000;
      expv[25] = 128'h6a1d202aa7f28ce3caa7dd60d03fc26a;
      expv[26] = 128'h00000000000000000000000000000000;
      expv[27] = 128'ha5a02aeb2e6a9a0e0da7f7eca6faeae0;
      expv[28] = 128'h00000000000000000000000000000000;
      expv[29] = 128'h00000000000000000000000000000000;
      expv[30] = 128'h470a0cd487c30ad4c543bd34faebea58;
      expv[31] = 128'h00000000000000000000000000000000;
      expv[32] = 128'h91c17820e45286289f329a144661d164;
      expv[33] = 128'h00000000000000000000000000000000;
      expv[34] = 128'hc927e7047e666a6b2492ff6f1f10fe27;
      expv[35] = 128'h00000000000000000000000000000000;
      expv[36] = 128'he23a51722322d02e939fe9e8c8b0a784;
      expv[37] = 128'h00000000000000000000000000000000;
      expv[38] = 128'h462f5bd140d22802069e49138f7afa86;
      expv[39] = 128'h00000000000000000000000000000000;
      expv[40] = 128'h4751b5293b64d1fc1e50ffae5e48f4bf;
      expv[41] = 128'h00000000000000000000000000000000;
      expv[42] = 128'h182f3597c4996f9717c8e96f58d3f8d8;
      expv[43] = 128'h00000000000000000000000000000000;
      expv[44] = 128'h5fe9bfa7ab0f41c537da7ee16dd5ad50;
      expv[45] = 128'h00000000000000000000000000000000;
      expv[46] = 128'h2dc80adee3d414a13f3442f843de1069;
      expv[47] = 128'h00000000000000000000000000000000;
      expv[48] = 128'h7d07d4188b527d8ef84537b0076265ec;
      expv[49] = 128'h00000000000000000000000000000000;
      expv[50] = 128'h80273b229568143629ff6d76859f0dda;
      expv[51] = 128'h00000000000000000000000000000000;
      expv[52] = 128'hc2876baf1f5b244767df8c9a186990ad;
      expv[53] = 128'h00000000000000000000000000000000;
      expv[54] = 128'hdfbd7cf07887cfdab261192dedb7fc48;
      expv[55] = 128'h00000000000000000000000000000000;
      expv[56] = 128'h6b7c403e745fe522756aedb623170234;
      expv[57] = 128'h00000000000000000000000000000000;
      expv[58] = 128'ha5b8e03bee429c98856e417fa3faf4df;
      expv[59] = 128'h00000000000000000000000000000000;
      expv[60] = 128'h35938a4bf4c68f4541d935ed941e9935;
      expv[61] = 128'h00000000000000000000000000000000;
      expv[62] = 128'h9b08fab398301d0f260df30dc7b4f4aa;
      expv[63] = 128'h00000000000000000000000000000000;
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
