// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 196;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175117 dut (
    .a_i(in_vec[195:164]),
    .b_i(in_vec[163:132]),
    .c_i(in_vec[131:100]),
    .d_i(in_vec[99:68]),
    .round_i(in_vec[67:66]),
    .m_i(in_vec[65:34]),
    .s_i(in_vec[33:32]),
    .t_i(in_vec[31:0]),
    .a_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 196'h7875b3407d2c225a11d13aca5ea70bdb6f367fb3b8f239f9f;
    stim[1] = 196'h53f0a7b0cd5499d30d61a4dcac58d16e999956c3ab57d109a;
    stim[2] = 196'hc3d54ad33ab97b5c0d622e6fc25c798671627e733fa79d3c9;
    stim[3] = 196'h65ee53619e3f65fbefc29b44d3a9390bd2a0b3b34b0d89b66;
    stim[4] = 196'hc70e3db4c799168a5d5196c0f4a2f75b725e510af98132ec3;
    stim[5] = 196'h8df91755b957f39e3a0c12bea492f033ffb1fa6e640ac11b3;
    stim[6] = 196'h26bd1f2ec8e28c2d9a9bdb6e80ac94254774f55da80b49422;
    stim[7] = 196'hef0f5059ac4e6810679dd9fe406b30a1c1ed45c8821dfc41c;
    stim[8] = 196'hdab6d1138c693e73e241da6902e55af61b54b09a08eb1a175;
    stim[9] = 196'h19217e465c1db82e95424a3c2f306ecead4dab3e594b732fc;
    stim[10] = 196'h87a8b8640c7e42d8611f92b362146cba5fd2f34141aab5203;
    stim[11] = 196'hb23796fa727d4b643abc5f0ad3a0b634c8719b70b29210f20;
    stim[12] = 196'h5a2593ba5a8b6ea158ecc8c2d4ba3ec3a96c2464496e0a965;
    stim[13] = 196'hf7a37a3344301d8a15cf99f351ba678da811994654f99b761;
    stim[14] = 196'h38b608200eb415e75f3c444990d3558b4a93d5eebb71d669b;
    stim[15] = 196'ha09a329555ed8194be80dec4ff131098a52099ea0bd7d85e3;
    stim[16] = 196'h9d37887eb8cb981c9b896fef6b586659f4239c736ec0f967a;
    stim[17] = 196'h410cf13c4c793852d4b1d4bef8f1f780fd55502d909d72088;
    stim[18] = 196'hdd6f0ffcd379fc0d3e1465ab1725fca8ce0ffc64ee36fdd0b;
    stim[19] = 196'h9f7d49a12f4db62fc8bbc633a3ce336c5baaabca85af0972b;
    stim[20] = 196'h2ba6ad48c56be7782efbb27cc6a18289cb02291591983ea47;
    stim[21] = 196'heb511b29858c7309a3579e785c0c0dba57bfaa823e2e51470;
    stim[22] = 196'hbc7e8b52f6a86c67d0897e62c49e4b8996ed9a321b67e972b;
    stim[23] = 196'h4692fc48edb2beaef50ed9cd6b5a99cadc76f4480138b2957;
    stim[24] = 196'h63cde0dd557b9e7a63d19bc128ba18a3f74b9739c792d151a;
    stim[25] = 196'h294f72179c80b3487c522103c656bc11697b8150aa3c39800;
    stim[26] = 196'hda65bcf59b24555179172ac9e7a971045536b8d03a3db4766;
    stim[27] = 196'hdd352d2f7d0e8e47d3ec0981e7902e5c34e9ee8b5ec9cdc1a;
    stim[28] = 196'h06f51af49f934d5cb6d5e0d31656510fa4cc89fc931454ad4;
    stim[29] = 196'h181d7b7d89b263c68d70fc66c39aa77ca0cfd7899eeab25fd;
    stim[30] = 196'h4940f87f795e24f598225d56b71406452f9fdaa48b25d8948;
    stim[31] = 196'h18dcd2e5e45904031fb0e99a2630fcf9e8bb2b109c116711f;
    stim[32] = 196'he27b0e2ee16bcc592b8eb638bda51b985aad522207d2106fa;
    stim[33] = 196'h501b75303f5e8a8127d657f93fa66ff51b8f8380ad1617e1e;
    stim[34] = 196'h8b9c07423ae7f93f0dca3c2cfbcd28115a0b6d1d6fcbdf9c0;
    stim[35] = 196'h92b1a2f304ca3d5ad2f41b17aacfd4898bc3a9b50ebc3a639;
    stim[36] = 196'hd218c88fb6e96eddcb00e466a2870186846465f0f07ee5326;
    stim[37] = 196'hd71bf34cadb608b92f0b5e65331cb93cfc420709f9b36163c;
    stim[38] = 196'hcbd1c3ec012e6b687cd50494dc098bf11ced71facf6b1801f;
    stim[39] = 196'h60b37e05254bd7a9135f980c3b72aeb9b85afebbeac8f07b4;
    stim[40] = 196'he8fa817f5732e916193aa94255cd432491329d6710ca51b08;
    stim[41] = 196'h1bf39add2946d928e454ab72f3225534e5f71e02e970d2952;
    stim[42] = 196'h5a28d37f03ba12ab95b8ce5cbe6172f018c9973687c4301f1;
    stim[43] = 196'hf490faf72973beabbb4eb7f3f8c223d96a046b33696352f02;
    stim[44] = 196'h7b875806d6ebb578978ec49c93ae73d74bd08007acbac9929;
    stim[45] = 196'hd825d83696ff25cf64f421534a44ee525853d11ddefcb8d0f;
    stim[46] = 196'h4a2d75583f2eb490fa69435edc057eccc2e5d9218f7582a6f;
    stim[47] = 196'h98eab5c438ef88f34b8cfdfba8f34f851c7f1f9b0695c1d71;
    stim[48] = 196'h0ddb9bf0803fba52cbf9fb4401a83cc2d6d050d21443f843f;
    stim[49] = 196'h0c514e7b3b390230f26648db48d4dd318fe8cfb09e4ced8f1;
    stim[50] = 196'h7e083220eccb07e7d9e975283da3b22df3bef194adba2464a;
    stim[51] = 196'heb1d9ae8d1cb5aee258b925b3b8bfc17e5f4fb0b7733c9cdd;
    stim[52] = 196'h846581e9f63cee6574808778ababef3f68dde6971d7f1159d;
    stim[53] = 196'hd2571c0469a7d86626a596368f20fff20fb409eb7c8f88d02;
    stim[54] = 196'he2115ba29424b4293513d670e820bece1ad0a9d000ff710a7;
    stim[55] = 196'h6a60d44bd4bd23b5158c07ecd66503ca4c6d7f9584ec010cd;
    stim[56] = 196'h326fff62a3a61cc89681435abe5671921738e198d1cfcb410;
    stim[57] = 196'h709560107ca5707dde84bb243c1e1de835368f7c4c205258d;
    stim[58] = 196'h7e93458f3cc3372478b8791056c2b72b178afaee1c9c0b2c6;
    stim[59] = 196'h6c2ed592c5e4f5ba8a563cd818e68ced8936fa647fc5814b9;
    stim[60] = 196'h473cd2f15e108db7977275a62dc6ac81de74161370f21af8f;
    stim[61] = 196'h9f79aad02d8989c2766e5a7116292aaba6858d70f4ea4af97;
    stim[62] = 196'hb6a4ef72b46295c04239313a1d8ffcf1ef396a975c6db0cfd;
    stim[63] = 196'h2176088446f1461fbb52c234e7a0173122b0cd7b8f77e84b0;
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
      expv[0] = 32'h21e78407;
      expv[1] = 32'hdc40ffb9;
      expv[2] = 32'h931397d5;
      expv[3] = 32'hb3073a4f;
      expv[4] = 32'hf66bc72c;
      expv[5] = 32'h8ee10021;
      expv[6] = 32'h5ff95835;
      expv[7] = 32'hf0e76237;
      expv[8] = 32'h59808fd5;
      expv[9] = 32'h497efb17;
      expv[10] = 32'h22bfaa05;
      expv[11] = 32'h41e228c1;
      expv[12] = 32'h6d946750;
      expv[13] = 32'he7c97aa1;
      expv[14] = 32'h69dedc38;
      expv[15] = 32'h07186fe8;
      expv[16] = 32'h813c8716;
      expv[17] = 32'hdc083f3b;
      expv[18] = 32'hbf0e798e;
      expv[19] = 32'hd4968635;
      expv[20] = 32'h44b788e7;
      expv[21] = 32'hd4946ce9;
      expv[22] = 32'hb172e4d1;
      expv[23] = 32'hd4b31e31;
      expv[24] = 32'h6ed7b79d;
      expv[25] = 32'h2f01c05b;
      expv[26] = 32'h6e524364;
      expv[27] = 32'h7115eb8f;
      expv[28] = 32'h0a7d8a3a;
      expv[29] = 32'h5160387c;
      expv[30] = 32'h581ff2ad;
      expv[31] = 32'h5f4fdee3;
      expv[32] = 32'h6d7d09e8;
      expv[33] = 32'hb7b16945;
      expv[34] = 32'h2f4ef1b4;
      expv[35] = 32'h2a75e2c4;
      expv[36] = 32'hcb073eb5;
      expv[37] = 32'h2656364d;
      expv[38] = 32'h123e8c87;
      expv[39] = 32'hfc1561c4;
      expv[40] = 32'h562f1593;
      expv[41] = 32'h14688cd3;
      expv[42] = 32'hf78b94a2;
      expv[43] = 32'h5e268d71;
      expv[44] = 32'h0d20a6a5;
      expv[45] = 32'h5034ceff;
      expv[46] = 32'h12b4fb3a;
      expv[47] = 32'hfce02198;
      expv[48] = 32'he2e263b2;
      expv[49] = 32'hb24efe08;
      expv[50] = 32'h5fdc799b;
      expv[51] = 32'he6a2eda7;
      expv[52] = 32'hf5f72047;
      expv[53] = 32'h80c58869;
      expv[54] = 32'hd94bb26f;
      expv[55] = 32'hc083eb12;
      expv[56] = 32'h4b209b2f;
      expv[57] = 32'h64130132;
      expv[58] = 32'h21009518;
      expv[59] = 32'he4b7196b;
      expv[60] = 32'h197a8526;
      expv[61] = 32'hd6038942;
      expv[62] = 32'heeb14dc0;
      expv[63] = 32'h47081656;
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
