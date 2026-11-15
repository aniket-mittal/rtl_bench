// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006499 dut (
    .clk(clk),
    .rst(in_vec[103:103]),
    .btb_target(in_vec[102:71]),
    .ras_target(in_vec[70:39]),
    .pc_go(in_vec[38:38]),
    .stall(in_vec[37:37]),
    .good_target(in_vec[36:5]),
    .id_pc_src(in_vec[4:3]),
    .btb_v(in_vec[2:2]),
    .btb_type(in_vec[1:0]),
    .pc_out(out_vec[64:33]),
    .v_pc_out(out_vec[32:32]),
    .pc_plus4(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'hfc78c17749fb2626e4b0a057e4;
    stim[1] = 104'h9ca39a0f70e953db7fd73c60e3;
    stim[2] = 104'h0494f805c9fa26ca17e19d932a;
    stim[3] = 104'h7609c6e93a1b908256f489875d;
    stim[4] = 104'h7a60dbf859d7f8141964b84148;
    stim[5] = 104'h233326b657b4005ec56aad64fd;
    stim[6] = 104'h5dbcb5b3038f005c8f27faf84b;
    stim[7] = 104'h07e3181a8a101281d5331e8fb8;
    stim[8] = 104'h2611166f4637e63f3e97f5e0ac;
    stim[9] = 104'h53fb6e744171122fafb7e7ed9d;
    stim[10] = 104'h1a68167826868606d694d579b6;
    stim[11] = 104'h66c1a0792184eeac5b7d31456e;
    stim[12] = 104'h7c5161b5243009bca347eae862;
    stim[13] = 104'h13d2f19f69ba3d8e409e1e09e8;
    stim[14] = 104'h5ed36b080a0e2c40ea2ebf8644;
    stim[15] = 104'h02e407c4812995cae71c0087ba;
    stim[16] = 104'h4c07d3922d8d207ea9c538fe84;
    stim[17] = 104'h46bc4855f472783a7a037e8c2a;
    stim[18] = 104'h55a0e9d150214a03e296ac2a06;
    stim[19] = 104'h485e5e84082f3434690c5985dd;
    stim[20] = 104'h65ade6d4f790bd8203d597310c;
    stim[21] = 104'h5b71e679c253e183c5e46ace22;
    stim[22] = 104'h31ef4bbf0c164d1798c9135af2;
    stim[23] = 104'h02907d3139c2e3962c3caa52c9;
    stim[24] = 104'h733e5b3c7aeccf562a59b6bf42;
    stim[25] = 104'h702c055482347616bbe8b94f54;
    stim[26] = 104'h0a5136b8d2487a3b88ddffacde;
    stim[27] = 104'h760743f7ed04b17ac424dcfc72;
    stim[28] = 104'h71d50dd019e94bf9171915facb;
    stim[29] = 104'h7477410f2c2d5849c717abda61;
    stim[30] = 104'h5652a811593ef53b32df7fe1d6;
    stim[31] = 104'h7597a46f013e14d229f3bcdc72;
    stim[32] = 104'h3155eb8e24476e79aee580ab4e;
    stim[33] = 104'h4abd94fafa3bf396a0aec2bbb7;
    stim[34] = 104'h338476c3278783a334a43224e7;
    stim[35] = 104'h7ebda1ba7413577f31b9cd6666;
    stim[36] = 104'h10e210cf3ed60d1d9f8aeacb30;
    stim[37] = 104'h3f58173bfa7b6edd559eac2a63;
    stim[38] = 104'h0322257e1927387cf7674b8b8e;
    stim[39] = 104'hae6045d290bf3c3eb88078a02b;
    stim[40] = 104'h3f68b34ba31f49e55209fd4a33;
    stim[41] = 104'h3b03631e8f45d50098fba2da23;
    stim[42] = 104'h512f92d9eb4bdb568967d13599;
    stim[43] = 104'h6daca879b79d5029c82b222f3a;
    stim[44] = 104'h7b7e26efefa305f8e44398abf5;
    stim[45] = 104'h292e591ba10e75f58aad6a79cc;
    stim[46] = 104'h438becc25335e32d5f2ad8293d;
    stim[47] = 104'h606c2846de6d9a9d03c0e68ac5;
    stim[48] = 104'h25f92d38eece0ca0c1cb5304a8;
    stim[49] = 104'h3b723290efadf51fb3bddaf32f;
    stim[50] = 104'h593ea033c0c381c35bbefaa1f6;
    stim[51] = 104'h213071433ac68a9c306e841639;
    stim[52] = 104'h19a72c83ffe1454ef49bb2dd2c;
    stim[53] = 104'h4affaf0d014c8b8b9b3b760177;
    stim[54] = 104'h436d340922b2971f718580bb21;
    stim[55] = 104'h57951d90a12b626cd1b1d7505e;
    stim[56] = 104'h0f6e5bfecd22090f14f2179200;
    stim[57] = 104'h7e500edfb2d1c43b2dd37651b1;
    stim[58] = 104'h3c337b66717b93f48abf232da6;
    stim[59] = 104'h2a90ef479c37db373724feaeeb;
    stim[60] = 104'h096254cd3ccb539bc680928c6b;
    stim[61] = 104'h2eba10f44d8b753b7411cdbc99;
    stim[62] = 104'h7f2a1cea769fd24529918b26a4;
    stim[63] = 104'h7dff2997bdfe33816dd85e3203;
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
      expv[0] = 65'h00008000100040004;
      expv[1] = 65'h00008000100040004;
      expv[2] = 65'h00008000100040004;
      expv[3] = 65'h00008000000040004;
      expv[4] = 65'h1d8271ba5ec138dd6;
      expv[5] = 65'h1d8271ba4ec138dd6;
      expv[6] = 65'h08ccc9ad946664d70;
      expv[7] = 65'h08ccc9ad846664d70;
      expv[8] = 65'h01f8c606b0fc63039;
      expv[9] = 65'h01f8c606a0fc63039;
      expv[10] = 65'h01f8c606a0fc63039;
      expv[11] = 65'h069a059e134d02cf4;
      expv[12] = 65'h19b0681e5cd8340f6;
      expv[13] = 65'h19b0681e4cd8340f6;
      expv[14] = 65'h19b0681edcd8340fa;
      expv[15] = 65'h19b0681eccd8340fa;
      expv[16] = 65'h19b0681eccd8340fa;
      expv[17] = 65'h19b0681eccd8340fa;
      expv[18] = 65'h19b0681eccd8340fa;
      expv[19] = 65'h19b0681eccd8340fa;
      expv[20] = 65'h19b0681eccd8340fa;
      expv[21] = 65'h19b0681eccd8340fa;
      expv[22] = 65'h05e46ace32f235675;
      expv[23] = 65'h05e46ace22f235675;
      expv[24] = 65'h05e46ace22f235675;
      expv[25] = 65'h05e46ace22f235675;
      expv[26] = 65'h05e46ace22f235675;
      expv[27] = 65'h05e46ace22f235675;
      expv[28] = 65'h1b412c5ebda0962f9;
      expv[29] = 65'h1b412c5eada0962f9;
      expv[30] = 65'h0717abda738bd5ed7;
      expv[31] = 65'h0717abda638bd5ed7;
      expv[32] = 65'h0717abda638bd5ed7;
      expv[33] = 65'h0717abda638bd5ed7;
      expv[34] = 65'h0717abda638bd5ed7;
      expv[35] = 65'h0717abda638bd5ed7;
      expv[36] = 65'h0717abda638bd5ed7;
      expv[37] = 65'h0717abda638bd5ed7;
      expv[38] = 65'h159eac2a7acf56157;
      expv[39] = 65'h00008000100040004;
      expv[40] = 65'h00008000100040004;
      expv[41] = 65'h08c7d2795463e93ce;
      expv[42] = 65'h08c7d2794463e93ce;
      expv[43] = 65'h08c7d2794463e93ce;
      expv[44] = 65'h1b6b2a1e7db5950f7;
      expv[45] = 65'h1b6b2a1e6db5950f7;
      expv[46] = 65'h1b6b2a1e6db5950f7;
      expv[47] = 65'h10e2fb3098717d988;
      expv[48] = 65'h10e2fb3088717d988;
      expv[49] = 65'h10e2fb3118717d98c;
      expv[50] = 65'h10e2fb3108717d98c;
      expv[51] = 65'h164fa80cfb27d406b;
      expv[52] = 65'h164fa80ceb27d406b;
      expv[53] = 65'h164fa80ceb27d406b;
      expv[54] = 65'h164fa80ceb27d406b;
      expv[55] = 65'h164fa80ceb27d406b;
      expv[56] = 65'h15e547643af2a3b25;
      expv[57] = 65'h15e547642af2a3b25;
      expv[58] = 65'h15e547642af2a3b25;
      expv[59] = 65'h15e547642af2a3b25;
      expv[60] = 65'h15e547642af2a3b25;
      expv[61] = 65'h15e54764baf2a3b29;
      expv[62] = 65'h15e54764aaf2a3b29;
      expv[63] = 65'h15e54764aaf2a3b29;
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
