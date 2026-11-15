// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 260;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_189240 dut (
    .out1(in_vec[259:234]),
    .out2(in_vec[233:208]),
    .out3(in_vec[207:182]),
    .out4(in_vec[181:156]),
    .out5(in_vec[155:130]),
    .out6(in_vec[129:104]),
    .out7(in_vec[103:78]),
    .out8(in_vec[77:52]),
    .out9(in_vec[51:26]),
    .out10(in_vec[25:0]),
    .max(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 260'he1d16d91467363f1707e07bf73b19dbb273c0d3182346a4b038546f9da82eeebe;
    stim[1] = 260'ha6f352ecd3d77056fa5fa8c91d84003552c8a597de8c46ce759c11c4c3ad849d6;
    stim[2] = 260'h923fb79c23627341654c5962d48b30e4509c5d9b5625ff6dd21a5ba61bacba2c1;
    stim[3] = 260'hfc00e2c38f7a16d6951b3efe4bafb395a0b618e81ad0671bd3d66b8f52046188a;
    stim[4] = 260'h4b38db9e0cd35026eeb885d4335fa58d5b993d9f915f9df0b60a1f6870bbc40e3;
    stim[5] = 260'hd17096dec3d15f7a28de786716e84dfc371c233b1d3ca49f40a52052171cdb387;
    stim[6] = 260'h1d64a58baa1171aeeb00c6d8ade0ec06d782aac4614a7642642160e1ac87f93fe;
    stim[7] = 260'h16df8fe1fb7cf27b500b2d850e9195a5058a61844cb4762af9e18675d56346bf2;
    stim[8] = 260'hd8d55c947945be288d4eaf8d04d41c73c06bf71befee609ff30ed74bb720b8651;
    stim[9] = 260'hc217f5d6707e8bdf6ced8d3a6716a4956a1a4b0c712a7e10569a68fe62138b62a;
    stim[10] = 260'h5dc6bee5a37762aff012e632452e808f0f54fa72a3852c774740b470da183edf6;
    stim[11] = 260'h25eb669312fd4078b8ebcd3278a135df4e296ad734b1b6b01456790667790d166;
    stim[12] = 260'h53134bec4f32676a345334a8d90fe1c1c744a1632c2b37aa4303ba96c5f290596;
    stim[13] = 260'heeab59fa3ead6758f41c4a185551935c3702841cf2a86b5957d5e86a2278e89aa;
    stim[14] = 260'hfd0423932816ef17227f96e8b2c249f149cc0ee1fdffbf9c8bc482c4f1f7dd538;
    stim[15] = 260'h765739c898ca9eaee06dafb026861d0409565849a6a71eb5cddebe3fe22b3f759;
    stim[16] = 260'h6c67b2d1189732285a739269ecde4a08376fe28b4c30f70547d2aff794081435a;
    stim[17] = 260'h8870388d298019e7373aacc33b87743824778afeeef3cda66153410882f9d4832;
    stim[18] = 260'h351e825d8ade720b44f05d7ea245493ad94ed15dcb4705bcdbaea00d28e3f112b;
    stim[19] = 260'hfc354d0a0c632a60d060d35cfb991aa08ab1859fd9cbe9b073e3742ceea42f5ed;
    stim[20] = 260'h6325de70138261c2aa8df71ad10ccd8fc3c974c12ac2d91a4d1caa8750964e649;
    stim[21] = 260'hc3f6b3f443fa60f8ae4188aa44ab408e3adac5ed4d9a65a481646b6c6406c3428;
    stim[22] = 260'hdbad08f03f809916f8de80e7b83f4e007260e4389add8d42773f9fcefa5dfc02e;
    stim[23] = 260'h88ca86c16f8476747a03500782c0f58b28e02b9a4fd0783d184ab436900faed78;
    stim[24] = 260'hb64781fe1f9af33bc03991f1e7833fdefb5b34e22e9ede2424010f430c1ebc8d6;
    stim[25] = 260'hd74ff6b87f820a0d24337e65ff2f2d6091f7333c410b390600e300ff422d014ee;
    stim[26] = 260'hcf098805a612fb9e61e6e48fcc88718531953bf7c39a49bea63bd469e86399cb4;
    stim[27] = 260'hc92add3dd3063d5c537ae6417c981c4ba46e65f1a402f0ba84652b65bb721c293;
    stim[28] = 260'h044134985b3d282db448cb5c6baf42aa17a9144a0d6d2f215773bd603727cf352;
    stim[29] = 260'h6de4828a2cc6a8ae260099c19c94cd91ee3856109716e68d4feb04852bebf0ab9;
    stim[30] = 260'h0ed62424ad17db17aa033d14afb923d54e0847fbeaba42cb98004eb92307cc215;
    stim[31] = 260'hde44a61ea7ea97eb02e6b019c334cc27d97a5cb27bf1e8cf4c875ad9f3015b479;
    stim[32] = 260'h9fa9fcd3f59ed95044c7deadc7d8659a9cd8e12c909970b6d3f9c4af4d3d31e47;
    stim[33] = 260'h4b8019c1933cde9d00a9a1a912293bba2755d8a28ca95388bbae73735c5f7096b;
    stim[34] = 260'h6e3aad9526e2cacb92fea543b83039816377272868e0aacdb5bcd697b4aac6df0;
    stim[35] = 260'hc5ac17aafda5beb7aedecdf3ca816c0c0526d7b0838ea1694eeff5c12b30ae1d0;
    stim[36] = 260'hf458b7e1fa70264fb93a4db00736bd5b1c5ef47ff37d51d6a4a559d9fb0819e93;
    stim[37] = 260'h5970d1989e39dd150cea02dc8c67eb7ff8760b2af2b87dd2019acfae6ab0193ce;
    stim[38] = 260'ha87474969eb79e4313bac5fae8ae1d317f7f1a5f46f165a7c618a5e7730b879f2;
    stim[39] = 260'h45420e474783430d39435d05e1e8c236446881d591e050cebcaa030d61cd42f23;
    stim[40] = 260'he36c95e1fd19706d2b3d84ac96acdd9021a73b97625c5a457b08959a6247fc4df;
    stim[41] = 260'h84f31c72f680ecdfbfa6ee37b4aca46fa1215ea8f1679c4bbbc8888bb93e4ca22;
    stim[42] = 260'he10d4939f39d9c2dd451c584f3aabf3221f47c0fce1604b764b69222e1c8ed923;
    stim[43] = 260'h6c316be52583a48da85fbb2c294df40e8d8a9337047c798eb9f2849c4a5dbae70;
    stim[44] = 260'h33456e1dfb2daa27ec3a45649c4bd4622322efee05234cd9e1796186b56cde9cf;
    stim[45] = 260'h1ff2b6c027836569dada292f72144396bdbe945bc402b0229879cff779b472c76;
    stim[46] = 260'h3cb4a8f833e1684c2d60fa4fe02fe96b77f56c6b1338710892644b5000e6b8a9c;
    stim[47] = 260'hede8e54cbad7669e14e50e6bb8e3391da6a1570bee3266efc212991482ef2865e;
    stim[48] = 260'h5357d26aa780f3a3787e223e8d908bc87fb5714626f4cd996c09706a19fac7203;
    stim[49] = 260'h820e6eb34104442ad935e53e266c7d2e8b16563fb8b8ba6d67299cb4c8d4e42bd;
    stim[50] = 260'h741bc540a3d55e50a683d65085abcabf8e36e193ee4ec69c8880d4e101bd251c2;
    stim[51] = 260'hf186d0cfcc4e06975af4969b65f4f20a7208e548b441302d0d6124a086622bd5b;
    stim[52] = 260'h6361968daa92bf5e1657bd82aefee83f7ce9ef7f8396278b46577d872836c8a0d;
    stim[53] = 260'h88a23887924414406b60d38caebd4fe88b7a0e4008e8a4291bfba6c919060c067;
    stim[54] = 260'h49c0e98d6ee91eb895a742a32f5439453c85e27a564ee9cc9fbba375b7e7ebacb;
    stim[55] = 260'h57fe9057a99332feaf05671e91d36069e8fc5bb33cba1fb2fccf3816ed7e112ef;
    stim[56] = 260'h8a6b6318e7231105ad26a6b483bec2e71eebd14d2abe70955b5d1a472f8613e98;
    stim[57] = 260'h4ca0ce62c20a6518676e559a48f6f5aecdf0ce0786855aefdee38312c58d5b0a0;
    stim[58] = 260'h2121159d99fdab5e9a48a5592b37bb653e3666af59128aa9dbaaa79b430558a46;
    stim[59] = 260'h9d2522a3021d8b8c85cfb0c7f2441de607845c6bcfba5db3b92c8520be714d5d4;
    stim[60] = 260'h0a733b02927bbefe9a3a5d94be48089bf176e8fcd9dee6f789394c1591c09d7db;
    stim[61] = 260'ha0c82245670c2cfe2cfe494bc6138abbaf32de227a885d17891696f2153db3de4;
    stim[62] = 260'hfbb84498f9031ec87b39437f52da65ca36147fbef2f09d5b288ed832ffdc7f3ec;
    stim[63] = 260'ha980f4f49634e9830beb120c0425743ad95c946b280aad36ccd24309933a6fc9b;
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
      expv[0] = 4'h8;
      expv[1] = 4'h6;
      expv[2] = 4'h1;
      expv[3] = 4'h2;
      expv[4] = 4'h7;
      expv[5] = 4'h1;
      expv[6] = 4'h8;
      expv[7] = 4'h6;
      expv[8] = 4'h1;
      expv[9] = 4'h8;
      expv[10] = 4'h9;
      expv[11] = 4'h8;
      expv[12] = 4'h2;
      expv[13] = 4'h2;
      expv[14] = 4'h1;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h7;
      expv[18] = 4'h1;
      expv[19] = 4'h8;
      expv[20] = 4'h3;
      expv[21] = 4'h8;
      expv[22] = 4'h9;
      expv[23] = 4'h2;
      expv[24] = 4'h9;
      expv[25] = 4'h5;
      expv[26] = 4'h6;
      expv[27] = 4'h7;
      expv[28] = 4'h1;
      expv[29] = 4'h0;
      expv[30] = 4'h8;
      expv[31] = 4'h2;
      expv[32] = 4'h5;
      expv[33] = 4'h9;
      expv[34] = 4'h0;
      expv[35] = 4'h7;
      expv[36] = 4'h7;
      expv[37] = 4'h7;
      expv[38] = 4'h7;
      expv[39] = 4'h6;
      expv[40] = 4'h6;
      expv[41] = 4'h7;
      expv[42] = 4'h3;
      expv[43] = 4'h9;
      expv[44] = 4'h1;
      expv[45] = 4'h2;
      expv[46] = 4'h8;
      expv[47] = 4'h2;
      expv[48] = 4'h8;
      expv[49] = 4'h3;
      expv[50] = 4'h0;
      expv[51] = 4'h2;
      expv[52] = 4'h8;
      expv[53] = 4'h2;
      expv[54] = 4'h7;
      expv[55] = 4'h1;
      expv[56] = 4'h5;
      expv[57] = 4'h6;
      expv[58] = 4'h1;
      expv[59] = 4'h7;
      expv[60] = 4'h8;
      expv[61] = 4'h7;
      expv[62] = 4'h9;
      expv[63] = 4'h5;
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
