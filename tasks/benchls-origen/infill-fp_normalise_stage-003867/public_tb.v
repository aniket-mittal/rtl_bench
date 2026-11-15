// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 168;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_003867 dut (
    .clock(clk),
    .cout_Multiply(in_vec[167:132]),
    .zout_Multiply(in_vec[131:96]),
    .sout_Multiply(in_vec[95:64]),
    .productout_Multiply(in_vec[63:14]),
    .modeout_Multiply(in_vec[13:12]),
    .idle_Multiply(in_vec[11:10]),
    .operationout_Multiply(in_vec[9:9]),
    .NatLogFlagout_Multiply(in_vec[8:8]),
    .InsTag_Multiply(in_vec[7:0]),
    .cout_Normalise(out_vec[167:132]),
    .zout_Normalise(out_vec[131:96]),
    .sout_Normalise(out_vec[95:64]),
    .productout_Normalise(out_vec[63:14]),
    .modeout_Normalise(out_vec[13:12]),
    .idle_Normalise(out_vec[11:10]),
    .operationout_Normalise(out_vec[9:9]),
    .NatLogFlagout_Normalise(out_vec[8:8]),
    .InsTag_Normalise(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 168'ha6aad1119cb0fc40087e784343ba2c933f58643195;
    stim[1] = 168'h9d94d733a4de891b6d31b018a07b66b47b8bdc4fa9;
    stim[2] = 168'h6d91350ea66d2ae6bfc4b65e4c84e7167ef6cc74d1;
    stim[3] = 168'h2c9e417de2fcbccbaa52ad0240d30c8aceaa4923fd;
    stim[4] = 168'ha6d4fb516ecdfeaaa280e7c8ecc1d73263a017559a;
    stim[5] = 168'hd89daa96600e1284be92661ac440305483308013e5;
    stim[6] = 168'hfd27469c055969e4c23ab281dc1387267994af45e2;
    stim[7] = 168'h1d1d9ac0b9f0dc15171a4ccbf68c37f9c4a57928d3;
    stim[8] = 168'h523f17fd63b3264bbf471be03c8d08b3dd85bbea89;
    stim[9] = 168'ha68f6f5df4b9f3d6a29774d169918ff948a40c6f51;
    stim[10] = 168'h62d33bd7bacd279d0db1bc51aa75faf3246dab6d6a;
    stim[11] = 168'had3d7347d856075bee1f7a154e419b7705bed619a7;
    stim[12] = 168'h7f24557e430e728783bc69d0834ec2e1355eb378fd;
    stim[13] = 168'hadf99090c118dd31e4130167ba02a4cfa64a432410;
    stim[14] = 168'h2a36250c6844e9d5216bfabd237d8db7de6d044750;
    stim[15] = 168'h79ecc0cd52f0d34e792c8292a4d1970a9ea61a468a;
    stim[16] = 168'h01ca86e95aca8c6d4e97fd1b3ee6a428fe09102f2c;
    stim[17] = 168'h120de55c8c6d3af486b871bc10bd0036b377d2a045;
    stim[18] = 168'hac792437b0812b7b148a1c54f8c97cd8342a945b2c;
    stim[19] = 168'he370e3d67779d6b5a562864d0c62cff234a3b2a1c1;
    stim[20] = 168'h0ab8bac72e02a46930dd82f5c21f97a8459417b59f;
    stim[21] = 168'hcd8e6bd2199732fc7de26da6293a0e7d15813773d8;
    stim[22] = 168'hda1efd322b2f4b37f84bc8e29be8655992b1d1bad7;
    stim[23] = 168'h9fe44cd9171dea022133ac103e5eefb7ba760d8c29;
    stim[24] = 168'hf9ac85c3ed858e2d28bdc8b07eb1be48bf4adf822d;
    stim[25] = 168'h8cae111fbba57151e1c52e3c9611eba636217a94d7;
    stim[26] = 168'h2c03ee6eb31963d398cc510ebb10c8756f5c6fd787;
    stim[27] = 168'h9ac50b53f1936568ab9fa70b39c4d75476d88eddf8;
    stim[28] = 168'h26d538c5982d835ae22ed2bccc5628b0003a2f1ceb;
    stim[29] = 168'h3833591e50034a07a8b3b2fd196775a12c16c1f163;
    stim[30] = 168'h52162cc67893bacbe1886db47dd8f786494b0dac32;
    stim[31] = 168'h57414233f0d8a085d8eb608e30413cc5564719bf31;
    stim[32] = 168'hca893f2bd412b014176ec1b50e592997a5ca991daa;
    stim[33] = 168'h90631cf919408c8984a0b8625088af0062a9e5e583;
    stim[34] = 168'hf6d51f1ba0b54f6c5a22469bc3221222f021bd3e8e;
    stim[35] = 168'h5589760c45ea395042b58a2978a570236cdc87a7f6;
    stim[36] = 168'hcc6e2b9d0056d2bdaf179bef5fbd975f65a27fcf3a;
    stim[37] = 168'h0108b118a03d31be5b2280f56f930a385a71469d3c;
    stim[38] = 168'h9dc65fa24204cf579e00fb7f1a6e64d0ff8cafb1fd;
    stim[39] = 168'hf9f37587541e92e65bbafed177500b90716e6c0740;
    stim[40] = 168'hfacc802675fd41deb99f5c5f1c4b086f662449d63d;
    stim[41] = 168'ha7c8c1aa4b760bf52c5c0c5b42d463f0eb17b2e99a;
    stim[42] = 168'hc151e24dbdbb78aa7a8353db2f2bee3780d6483e12;
    stim[43] = 168'h1d451636ccfd9fd5772334eb14f5644bf95dd3fa10;
    stim[44] = 168'h714a8d86b87ce39abce84d7ee6209ea668e3bee339;
    stim[45] = 168'hba3f9e32202f5057b1e3d9ac6d33f7cf72fbba675b;
    stim[46] = 168'haa6c45e8a91cf2403377f1e022c9ea7de8bbad3a9b;
    stim[47] = 168'h52602c72d41a55a89b2602e3f359ef20d2f9bd45b1;
    stim[48] = 168'h1cac34a3f912308ce6ce2500ba39e78ea7dc601e8b;
    stim[49] = 168'h9a6ac5fa341841cf8b693ae77c68ebbc1a0058f453;
    stim[50] = 168'h8f0c8a1ba712caaf91aab587aaf28c6355a7eb7d15;
    stim[51] = 168'h655d1c5b534ffd8616f24b4fb57ad4b6defe77d1c5;
    stim[52] = 168'ha17e811ee48812d73b471ad3ed71f57e674d37eced;
    stim[53] = 168'hf02e182aade2eee30b12f5edbc74e3d37b7ffa3245;
    stim[54] = 168'hc6161e983e04f65e12f1322f102d98c3d094111337;
    stim[55] = 168'h66359b6e16eafbcbd4a74c43751904d619c047e74a;
    stim[56] = 168'h74846a3fa383cf9d18cd4b9a8dbb974fd72bb2ea69;
    stim[57] = 168'heee3a572fea24fb8646fa05228d8524a536ddef0a5;
    stim[58] = 168'h2f7a2731fbef89b6f8de9f95049ff0e49144e3e5a6;
    stim[59] = 168'hf57aea92986a2f69e0bf2c1ad3cc2a1863b0e36ebe;
    stim[60] = 168'h504e223a7a444b3a8de74cdca3cc52361c871389ad;
    stim[61] = 168'h0293548e85ec30ea35082c4457a82b8a2d7add58f6;
    stim[62] = 168'ha3e4f50afec327299cbca5d11bb88455d3cf97637d;
    stim[63] = 168'h470d69d41a597e18de6c0fe0fedac4dad37bb42c44;
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
      expv[0] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'ha6aad1119cb5d164997e784343ba2c933f58643195;
      expv[2] = 168'h9d94d733a4de891b6d31b018a07b66b47b8bdc4fa9;
      expv[3] = 168'h6d91350ea66d2ae6bfc4b65e4c84e7167ef6cc74d1;
      expv[4] = 168'h2c9e417de3042738b352ad0240698645675524a3fd;
      expv[5] = 168'ha6d4fb516ecdfeaaa280e7c8ecc1d73263a017559a;
      expv[6] = 168'hd89daa9660160eb99392661ac420182a41984013e5;
      expv[7] = 168'hfd27469c055969e4c23ab281dc1387267994af45e2;
      expv[8] = 168'h1d1d9ac0b9f0dc15171a4ccbf68c37f9c4a57928d3;
      expv[9] = 168'h523f17fd63b3264bbf471be03c8d08b3dd85bbea89;
      expv[10] = 168'ha68f6f5df4b9f3d6a29774d169918ff948a40c6f51;
      expv[11] = 168'h62d33bd7bacd279d0db1bc51aa75faf3246dab6d6a;
      expv[12] = 168'had3d7347d856075bee1f7a154e419b7705bed619a7;
      expv[13] = 168'h7f24557e430e728783bc69d0834ec2e1355eb378fd;
      expv[14] = 168'hadf99090c118dd31e4130167ba02a4cfa64a432410;
      expv[15] = 168'h2a36250c6844e9d5216bfabd237d8db7de6d044750;
      expv[16] = 168'h79ecc0cd52f0d34e792c8292a4d1970a9ea61a468a;
      expv[17] = 168'h01ca86e95aca8c6d4e97fd1b3ee6a428fe09102f2c;
      expv[18] = 168'h120de55c8c6de801b5b871bc10bd0036b377d2a045;
      expv[19] = 168'hac792437b0812b7b148a1c54f8c97cd8342a945b2c;
      expv[20] = 168'he370e3d677764be6c162864d0cc59fe469476521c1;
      expv[21] = 168'h0ab8bac72e02a46930dd82f5c21f97a8459417b59f;
      expv[22] = 168'hcd8e6bd21998fcbd42e26da6291d073e8ac09bb3d8;
      expv[23] = 168'hda1efd322b2f4b37f84bc8e29be8655992b1d1bad7;
      expv[24] = 168'h9fe44cd9171dea022133ac103e5eefb7ba760d8c29;
      expv[25] = 168'hf9ac85c3ed858df245bdc8b07eb1be48bf4adf822d;
      expv[26] = 168'h8cae111fbba57151e1c52e3c9611eba636217a94d7;
      expv[27] = 168'h2c03ee6eb31963d398cc510ebb10c8756f5c6fd787;
      expv[28] = 168'h9ac50b53f1936568ab9fa70b39c4d75476d88eddf8;
      expv[29] = 168'h26d538c5982d835ae22ed2bccc5628b0003a2f1ceb;
      expv[30] = 168'h3833591e500ab14580b3b2fd1933bad0960b60f163;
      expv[31] = 168'h52162cc67893bacbe1886db47dd8f786494b0dac32;
      expv[32] = 168'h57414233f0d8a085d8eb608e30413cc5564719bf31;
      expv[33] = 168'hca893f2bd412b014176ec1b50e592997a5ca991daa;
      expv[34] = 168'h90631cf919408c8984a0b8625088af0062a9e5e583;
      expv[35] = 168'hf6d51f1ba0b54f6c5a22469bc3221222f021bd3e8e;
      expv[36] = 168'h5589760c45ea395042b58a2978a570236cdc87a7f6;
      expv[37] = 168'hcc6e2b9d0056d2bdaf179bef5fbd975f65a27fcf3a;
      expv[38] = 168'h0108b118a03d31be5b2280f56f930a385a71469d3c;
      expv[39] = 168'h9dc65fa2420c9851c200fb7f1a3732687fc657f1fd;
      expv[40] = 168'hf9f37587541e92e65bbafed177500b90716e6c0740;
      expv[41] = 168'hfacc802675fd41deb99f5c5f1c4b086f662449d63d;
      expv[42] = 168'ha7c8c1aa4b760bf52c5c0c5b42d463f0eb17b2e99a;
      expv[43] = 168'hc151e24dbdbb78aa7a8353db2f2bee3780d6483e12;
      expv[44] = 168'h1d451636ccfd9fd5772334eb14f5644bf95dd3fa10;
      expv[45] = 168'h714a8d86b887ab225fe84d7ee6104f533471df6339;
      expv[46] = 168'hba3f9e32202f5057b1e3d9ac6d33f7cf72fbba675b;
      expv[47] = 168'haa6c45e8a91cf2403377f1e022c9ea7de8bbad3a9b;
      expv[48] = 168'h52602c72d41a55a89b2602e3f359ef20d2f9bd45b1;
      expv[49] = 168'h1cac34a3f912308ce6ce2500ba39e78ea7dc601e8b;
      expv[50] = 168'h9a6ac5fa341841cf8b693ae77c68ebbc1a0058f453;
      expv[51] = 168'h8f0c8a1ba712caaf91aab587aaf28c6355a7eb7d15;
      expv[52] = 168'h655d1c5b535794631af24b4fb53d6a5b6f7f3bd1c5;
      expv[53] = 168'ha17e811ee48812d73b471ad3ed71f57e674d37eced;
      expv[54] = 168'hf02e182aaddb8fabf312f5edbce9c7a6f6fff43245;
      expv[55] = 168'hc6161e983dff4e3d37f1322f105b3187a128221337;
      expv[56] = 168'h66359b6e16eafbcbd4a74c43751904d619c047e74a;
      expv[57] = 168'h74846a3fa383cf9d18cd4b9a8dbb974fd72bb2ea69;
      expv[58] = 168'heee3a572fea6c292526fa05228d8524a536ddef0a5;
      expv[59] = 168'h2f7a2731fbef89b6f8de9f95049ff0e49144e3e5a6;
      expv[60] = 168'hf57aea92986a2f69e0bf2c1ad3cc2a1863b0e36ebe;
      expv[61] = 168'h504e223a7a444b3a8de74cdca3cc52361c871389ad;
      expv[62] = 168'h0293548e85ec30ea35082c4457a82b8a2d7add58f6;
      expv[63] = 168'ha3e4f50afec5c422aebca5d11bb88455d3cf97637d;
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
