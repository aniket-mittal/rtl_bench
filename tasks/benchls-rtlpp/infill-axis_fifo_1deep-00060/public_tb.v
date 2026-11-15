// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 171;
  localparam OW = 174;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00060 dut (
    .ap_clk(clk),
    .ap_rst_n(in_vec[170:170]),
    .in0_V_TVALID(in_vec[169:169]),
    .in0_V_TDATA(in_vec[168:1]),
    .out_V_TREADY(in_vec[0:0]),
    .count(out_vec[173:172]),
    .maxcount(out_vec[171:170]),
    .in0_V_TREADY(out_vec[169:169]),
    .out_V_TVALID(out_vec[168:168]),
    .out_V_TDATA(out_vec[167:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 171'h39fed76aff08e426a234745887afe5bb63b0d9dc873;
    stim[1] = 171'h20656324e9216c6df98c066b3344b25acdc25d99df8;
    stim[2] = 171'h605de9481e8680acf5f8e565e5fd4a288450feb8e2d;
    stim[3] = 171'h6ddd4051931638bbc739d59a49f291a74b48291a6ff;
    stim[4] = 171'h5fcbabc27eeb70c0dfb2c7b87d0fff411055be4333f;
    stim[5] = 171'h4ab14f3bc7514e5ebbd8b3b123b09bf2c2e9502f98a;
    stim[6] = 171'h6c5d45dbafa0f9dc71d7bd3af2c35fc811ebd7430f3;
    stim[7] = 171'h6f58efe1d52b7a77fbe0f5b85bccedfe6b3c8d54707;
    stim[8] = 171'h57662db699717aed647592a90d7be0b7376f087beec;
    stim[9] = 171'h65da19b2fb27623fa377270c8b33da5576f4a14af6f;
    stim[10] = 171'h5c6af4b17fe520d4e9df0206a178a5b4c1b9544b6fc;
    stim[11] = 171'h524e66dd657123eedbe1c3b36c3d8f5d2154cf04608;
    stim[12] = 171'h5f39903ba40dc47ffb2d856f1e8d6ce51c9b012a2c0;
    stim[13] = 171'h526c8e16c9a8bd6b6cf5e3f44624481c1a309c5b7fa;
    stim[14] = 171'h64b0accc9be4446bd8366865ef0165802c5d6473db3;
    stim[15] = 171'h6ba5109c2c8d21dab0be7906a1f0a22c6dffa96b994;
    stim[16] = 171'h52ce13253d2528097333dd4342aeeee8dba5aaa262a;
    stim[17] = 171'h56f7a98b3f4eb56f926fe15b7e5c264354e9ba80966;
    stim[18] = 171'h5c68557a219c8da4340015883b8d31b47b229e49020;
    stim[19] = 171'h7cf73cbfd185bea8c6056e3c98acd095eeb1d9936ac;
    stim[20] = 171'h55404a807c64d98ff881f604463d4c8046c47a9e893;
    stim[21] = 171'h5a6d5c6fcad4257b356c2a19fd40c4de5553f34f880;
    stim[22] = 171'h763cfb91d10feca03289f5e1599498e4d24e6ee9cd3;
    stim[23] = 171'h64f15d2121a673af9c5952e63984448f237758418a1;
    stim[24] = 171'h628867fda8361ff51bb235f352a3d731e2b7a75709d;
    stim[25] = 171'h5193dba2c68ca292b76aae6a718965f7673f735d4e2;
    stim[26] = 171'h61e6344352d3f7c558138345dc9d4de20654dcf587b;
    stim[27] = 171'h7484ecc6fc99c22d7ec6e10a9de8fab466f9269bae2;
    stim[28] = 171'h452d93c9b4f5855cd5f7b12b5aa8c9202a9c4b55b19;
    stim[29] = 171'h58d238d9d82cda9e2e1df58e5abf33fecc3443d098d;
    stim[30] = 171'h5d10837184d4e1c2ac2ad1ff84f6d56acf3e9c2e75c;
    stim[31] = 171'h52921e49d7bc087754178eade5d298bec418a6dce17;
    stim[32] = 171'h63465cb54a613f99ee3c7acdf79cab42a6bbc4cf15d;
    stim[33] = 171'h47f410fbf5d060ef102a2f3f4b3d597e5362caafb9f;
    stim[34] = 171'h731ec7d1e7a531b6bb58ef22c74b284e99f6532f966;
    stim[35] = 171'h532f55c9e28537c39992b678319ac6c4e66e2dab030;
    stim[36] = 171'h736c1e556cba3de2d019d11c580032f2e0d26cfb367;
    stim[37] = 171'h78d4fa7f28e7c20d06c2b8ee6c6538d0679af28d756;
    stim[38] = 171'h650c371c1b931d5a0764fa0b74ff83c83ee9c329423;
    stim[39] = 171'h5a338b442bba9ab71ed84f01e1f1f8f8aac4fc6541d;
    stim[40] = 171'h6006cde987fdefb2e13d09e0af12e6d419d98dc34ef;
    stim[41] = 171'h55abd265f950697503e19d3fe89206c8d76cc54df62;
    stim[42] = 171'h4ae248fe904f2bfcae4fb8b326c2270408a443870fd;
    stim[43] = 171'h45c426571081131670df711d1b600ea99ada56ad215;
    stim[44] = 171'h5be504e9c93b4849408b3630f4e57f5efb03eb4e219;
    stim[45] = 171'h4883b6e18e8bdb7759a98ffd15e4318b9c4de47cbfe;
    stim[46] = 171'h69c7c1f5fc8d0f0a3e65a3ae4fe3f11329b4c2c09a4;
    stim[47] = 171'h08d788f1acd8cded40cf3efb7d109e83204c7bc2f46;
    stim[48] = 171'h72a425165d5e51535ecdc90bd08710b200e4df01758;
    stim[49] = 171'h68c5598c4e4c8e68293dcae4b65303dd80329a8661c;
    stim[50] = 171'h5e05de240ff56389c516d0fa4e7551a2e4771efc8de;
    stim[51] = 171'h53e33458077827a5ca1345b8976b1823e77f11e80b8;
    stim[52] = 171'h6d4446dd462d6d1e4295e25127e0feb3988b878021a;
    stim[53] = 171'h67053dfd7c6289003ca528d8ed81b435bdf292fc602;
    stim[54] = 171'h6856115dab01025a725c8d27be330da5156f052082d;
    stim[55] = 171'h6e2ae23155da1a8fb6565c569ad3680b50ba32c383a;
    stim[56] = 171'h52c94d40c0f4e07951fdf1d8db4a8fa34f769c23ebf;
    stim[57] = 171'h40d43c5a0d27942b9dd62e6609a3d058e8d9c0bc606;
    stim[58] = 171'h587151c03d1d1f53a021e7f7f41873b586abb197fb0;
    stim[59] = 171'h4af9065aa51e0ccb3e92b4d4447d28d88dfea612c0e;
    stim[60] = 171'h4334d837054421a3f3350dbc589d3bb7bef5894bd8d;
    stim[61] = 171'h7385cf67c209de542eb1fa9fa67b9d01ddf4231db6f;
    stim[62] = 171'h7bfad82ed0d1c97a44e5ce377341b7772c55ef95b11;
    stim[63] = 171'h70ad7c92ea0bdb3f4153bb1b46af2e557afe0a21f5a;
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
      expv[0] = 174'h0axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 174'h0axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 174'h0axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 174'h0axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 174'h1bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 174'h2b6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[6] = 174'h2b6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[7] = 174'h1b6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[8] = 174'h0a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[9] = 174'h0a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[10] = 174'h3b6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[11] = 174'h3a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[12] = 174'h3a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[13] = 174'h3a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[14] = 174'h3a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[15] = 174'h0a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[16] = 174'h1a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[17] = 174'h1a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[18] = 174'h1a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[19] = 174'h1a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[20] = 174'h2a6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[21] = 174'h2b6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[22] = 174'h2b6eea028c98b1c5de39ceacd24f948d3a5a4148d37f;
      expv[23] = 174'h3be7b9e5fe8c2df546302b71e4c56684af758ecc9b56;
      expv[24] = 174'h2bb1e7dc8e887f6501944faf0acca4c7269273774e69;
      expv[25] = 174'h1b278ae9090d339d7ce2ca9731cc2224791bbac20c50;
      expv[26] = 174'h1a278ae9090d339d7ce2ca9731cc2224791bbac20c50;
      expv[27] = 174'h0a278ae9090d339d7ce2ca9731cc2224791bbac20c50;
      expv[28] = 174'h1a278ae9090d339d7ce2ca9731cc2224791bbac20c50;
      expv[29] = 174'h1b278ae9090d339d7ce2ca9731cc2224791bbac20c50;
      expv[30] = 174'h2ba4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[31] = 174'h2ba4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[32] = 174'h1ba4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[33] = 174'h0aa4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[34] = 174'h0ba4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[35] = 174'h3ba4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[36] = 174'h3aa4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[37] = 174'h0aa4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[38] = 174'h1aa4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[39] = 174'h2ba4276637e4ce116bf6370854ef47d5a337c934dd71;
      expv[40] = 174'h3b2861b8e0dc98ead03b27d05ba7fc1e41f74e194a11;
      expv[41] = 174'h2b2861b8e0dc98ead03b27d05ba7fc1e41f74e194a11;
      expv[42] = 174'h2b2861b8e0dc98ead03b27d05ba7fc1e41f74e194a11;
      expv[43] = 174'h1b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[44] = 174'h0a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[45] = 174'h0b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[46] = 174'h0b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[47] = 174'h0a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[48] = 174'h0a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[49] = 174'h0a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[50] = 174'h1a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[51] = 174'h1a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[52] = 174'h1a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[53] = 174'h2a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[54] = 174'h3a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[55] = 174'h0a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[56] = 174'h1a00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[57] = 174'h1b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[58] = 174'h1b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[59] = 174'h1b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[60] = 174'h1b00366f4c3fef7d9709e84f05789736a0cecc6e1a77;
      expv[61] = 174'h2b7157118aaed0d47db2b2e2b4d69b405a85d1961c1d;
      expv[62] = 174'h1b7157118aaed0d47db2b2e2b4d69b405a85d1961c1d;
      expv[63] = 174'h0a7157118aaed0d47db2b2e2b4d69b405a85d1961c1d;
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
