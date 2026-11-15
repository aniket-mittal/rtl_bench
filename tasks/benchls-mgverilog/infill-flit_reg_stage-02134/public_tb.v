// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 146;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02134 dut (
    .clk(clk),
    .rst(in_vec[146:146]),
    .m_flits_d(in_vec[145:2]),
    .v_m_flits_d(in_vec[1:1]),
    .dc_done_access(in_vec[0:0]),
    .m_d_areg_flits(out_vec[145:2]),
    .v_m_d_areg_flits(out_vec[1:1]),
    .m_d_areg_state(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h667a436cd8e7119994c95385913b3d8b6799a;
    stim[1] = 147'h498a0a579a69ba371f5ccdf89721c750e93ca;
    stim[2] = 147'h50731d84b366b753e59749de99bf81fa691e0;
    stim[3] = 147'h3190ee8bf77014be8c4fd81d5a4ea1563e2a9;
    stim[4] = 147'h35f6e631a260f310aa58eb7462a965535f658;
    stim[5] = 147'h1d3ce25934f94a3c28da2693a9f7ac365b07b;
    stim[6] = 147'h1404d77f46ae624b342dfe8e724c9022be116;
    stim[7] = 147'h1507be0a4f5505d9207f3782efb81e3b56c0d;
    stim[8] = 147'h10999d1724bdf7e3d66be21d187d60b3bdff9;
    stim[9] = 147'h3fca6982c8db2a258087f2f9c0720199295c9;
    stim[10] = 147'h0354782a23579d6d04a52c41b552659800b09;
    stim[11] = 147'h141b427abb3f14556554094e1aeb7b8ec311f;
    stim[12] = 147'h355d0b2f85dbd0642b7164b44a47782f87514;
    stim[13] = 147'h2857888a64af15cd3c6a5768aaff6082e24cf;
    stim[14] = 147'h1e694638ffba8ae77f0984ea80baeb43c547f;
    stim[15] = 147'h0a282b4b044f3863e8cbbf09184723afe7258;
    stim[16] = 147'h2c9e6c39765ae6f40d484e53f9ac3fab138d8;
    stim[17] = 147'h1998b084e4cc31089688644c745cb7a01afe7;
    stim[18] = 147'h24e96f3cd45203b96fb1a6b1ea54c9824f2ac;
    stim[19] = 147'h0a8473df60aa891650e2376c7cabc668b8e2a;
    stim[20] = 147'h3782da7e7bc131ca484d35d91f87f8f9198db;
    stim[21] = 147'h03c1a6cc49df03b02af39fda4af56d7751386;
    stim[22] = 147'h0a2cf6a32593fe7d9cf1e34b492d71b3e373e;
    stim[23] = 147'h37d4e3b1bc26316c411507c0dc3b0c6d8db28;
    stim[24] = 147'h0c5c1573cffc4ee42203162190c742b6d151d;
    stim[25] = 147'h00c81cbcbb1b379bb370c7921d10cb7bbda1f;
    stim[26] = 147'h1bbd8633238f8ae90e8aa05d81a47c399f4cf;
    stim[27] = 147'h018e7ad6122ad30d6c9f0b526caa099efbb68;
    stim[28] = 147'h0ae50484d5ae3058b530f057e8fc59bf4dc0d;
    stim[29] = 147'h1688e36fdf8b65826b881b597bfeb3d098e07;
    stim[30] = 147'h2241e43dba2dc84ddb4de5aaeadfb509868d1;
    stim[31] = 147'h258b7ddffee920d38be53760dfc7cf5a3c7f0;
    stim[32] = 147'h23540f21f253899cb7f67dc44dc48c3cdd46c;
    stim[33] = 147'h1ecc3805ce4ba9d9517ef45b2e4d79bc6906a;
    stim[34] = 147'h1627eea4408e14f1bfd80df59443e14b160e8;
    stim[35] = 147'h19ff220f312d4b6fbe2369330c508cf824a7e;
    stim[36] = 147'h36d7f2e310a4ced1a4f92b737b60dcdb283df;
    stim[37] = 147'h3785e00026522d2388ae7b3d37ab96dbedf9e;
    stim[38] = 147'h09e6a0acfcde5cc93921da2bc3794277227e7;
    stim[39] = 147'h2cf9bb97efd481b06888f1eb3e1e597f3c949;
    stim[40] = 147'h2b3bd230dbb25f7f17ce9c5ed4e8bea45e972;
    stim[41] = 147'h3eb9719e4aeebdb19dcf693f60380621a4562;
    stim[42] = 147'h2f311f931eac0bd953b281873bfc0e5418539;
    stim[43] = 147'h22f69d4d15b90ac0675c48c9a508c3c40a266;
    stim[44] = 147'h15cf68e564c08f2178decc6ada8d357eee60b;
    stim[45] = 147'h09f15a7ea7c97f3e50e06478375c25827c9fd;
    stim[46] = 147'h1902de0cd129d346393d3c523edb0ffbeded6;
    stim[47] = 147'h1be9590a625e9fdb453ab28baba4941e4adc3;
    stim[48] = 147'h3f3915808db7964bee588d8b809f466328c7f;
    stim[49] = 147'h224b7ebff480bd287e7178f3478342411290f;
    stim[50] = 147'h282ca8571c26df0b7422d2d26420f2ca23fcd;
    stim[51] = 147'h01bbde21e919204f7bdda43532a7b1400021d;
    stim[52] = 147'h2f781cb88ca4a2cc844b69a14582a5ec111aa;
    stim[53] = 147'h069a1ca70db297a0b3bf5b2b1947a8eeb9f87;
    stim[54] = 147'h056ad0c545d2c61eb7f7bbe0de9dc2f2c725a;
    stim[55] = 147'h094e32f1719c763c2c781563f8bb6d90cbb68;
    stim[56] = 147'h16f40091a160517dce6a7e494550acf6e0a5b;
    stim[57] = 147'h37d6ca0df2b5c4b9f920079e42142b7d01c4e;
    stim[58] = 147'h2bf3ec7ad0fbd8c90106a36ccf6cd43bae2f7;
    stim[59] = 147'h20daf021c240bd16a4700e0fcecd2bf9fcf73;
    stim[60] = 147'h029c15a4d4d874190740ec6ca675be69ad36e;
    stim[61] = 147'h343e873873f6b7de497f73f0dcd192dddbc91;
    stim[62] = 147'h02b01bd80b24f05e34ee529497bf69da7b4b0;
    stim[63] = 147'h37ca1ce1d85dd3fcff32387022a30571a6ff2;
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
      expv[0] = 146'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 146'h0000000000000000000000000000000000000;
      expv[2] = 146'h0000000000000000000000000000000000000;
      expv[3] = 146'h0000000000000000000000000000000000000;
      expv[4] = 146'h0000000000000000000000000000000000000;
      expv[5] = 146'h0000000000000000000000000000000000000;
      expv[6] = 146'h0000000000000000000000000000000000000;
      expv[7] = 146'h1404d77f46ae624b342dfe8e724c9022be117;
      expv[8] = 146'h0000000000000000000000000000000000000;
      expv[9] = 146'h0000000000000000000000000000000000000;
      expv[10] = 146'h0000000000000000000000000000000000000;
      expv[11] = 146'h0000000000000000000000000000000000000;
      expv[12] = 146'h0000000000000000000000000000000000000;
      expv[13] = 146'h0000000000000000000000000000000000000;
      expv[14] = 146'h0000000000000000000000000000000000000;
      expv[15] = 146'h0000000000000000000000000000000000000;
      expv[16] = 146'h0000000000000000000000000000000000000;
      expv[17] = 146'h0000000000000000000000000000000000000;
      expv[18] = 146'h0000000000000000000000000000000000000;
      expv[19] = 146'h0000000000000000000000000000000000000;
      expv[20] = 146'h0a8473df60aa891650e2376c7cabc668b8e2b;
      expv[21] = 146'h0000000000000000000000000000000000000;
      expv[22] = 146'h03c1a6cc49df03b02af39fda4af56d7751387;
      expv[23] = 146'h0a2cf6a32593fe7d9cf1e34b492d71b3e373f;
      expv[24] = 146'h0a2cf6a32593fe7d9cf1e34b492d71b3e373f;
      expv[25] = 146'h0000000000000000000000000000000000000;
      expv[26] = 146'h0000000000000000000000000000000000000;
      expv[27] = 146'h0000000000000000000000000000000000000;
      expv[28] = 146'h0000000000000000000000000000000000000;
      expv[29] = 146'h0000000000000000000000000000000000000;
      expv[30] = 146'h0000000000000000000000000000000000000;
      expv[31] = 146'h0000000000000000000000000000000000000;
      expv[32] = 146'h0000000000000000000000000000000000000;
      expv[33] = 146'h0000000000000000000000000000000000000;
      expv[34] = 146'h1ecc3805ce4ba9d9517ef45b2e4d79bc6906b;
      expv[35] = 146'h1ecc3805ce4ba9d9517ef45b2e4d79bc6906b;
      expv[36] = 146'h19ff220f312d4b6fbe2369330c508cf824a7f;
      expv[37] = 146'h0000000000000000000000000000000000000;
      expv[38] = 146'h3785e00026522d2388ae7b3d37ab96dbedf9f;
      expv[39] = 146'h0000000000000000000000000000000000000;
      expv[40] = 146'h0000000000000000000000000000000000000;
      expv[41] = 146'h2b3bd230dbb25f7f17ce9c5ed4e8bea45e973;
      expv[42] = 146'h3eb9719e4aeebdb19dcf693f60380621a4563;
      expv[43] = 146'h0000000000000000000000000000000000000;
      expv[44] = 146'h22f69d4d15b90ac0675c48c9a508c3c40a267;
      expv[45] = 146'h0000000000000000000000000000000000000;
      expv[46] = 146'h0000000000000000000000000000000000000;
      expv[47] = 146'h1902de0cd129d346393d3c523edb0ffbeded7;
      expv[48] = 146'h0000000000000000000000000000000000000;
      expv[49] = 146'h0000000000000000000000000000000000000;
      expv[50] = 146'h0000000000000000000000000000000000000;
      expv[51] = 146'h0000000000000000000000000000000000000;
      expv[52] = 146'h0000000000000000000000000000000000000;
      expv[53] = 146'h2f781cb88ca4a2cc844b69a14582a5ec111ab;
      expv[54] = 146'h0000000000000000000000000000000000000;
      expv[55] = 146'h056ad0c545d2c61eb7f7bbe0de9dc2f2c725b;
      expv[56] = 146'h056ad0c545d2c61eb7f7bbe0de9dc2f2c725b;
      expv[57] = 146'h0000000000000000000000000000000000000;
      expv[58] = 146'h37d6ca0df2b5c4b9f920079e42142b7d01c4f;
      expv[59] = 146'h0000000000000000000000000000000000000;
      expv[60] = 146'h0000000000000000000000000000000000000;
      expv[61] = 146'h029c15a4d4d874190740ec6ca675be69ad36f;
      expv[62] = 146'h0000000000000000000000000000000000000;
      expv[63] = 146'h0000000000000000000000000000000000000;
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
