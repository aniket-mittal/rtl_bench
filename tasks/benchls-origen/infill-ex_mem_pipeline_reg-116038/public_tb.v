// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 204;
  localparam OW = 203;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116038 dut (
    .clk(clk),
    .reset(in_vec[203:203]),
    .Branch(in_vec[202:202]),
    .MemRead(in_vec[201:201]),
    .MemWrite(in_vec[200:200]),
    .RegWrite(in_vec[199:199]),
    .MemtoReg(in_vec[198:198]),
    .mux_ForwardB(in_vec[197:134]),
    .mux_ALU(in_vec[133:70]),
    .ALUzero(in_vec[69:69]),
    .adder2out(in_vec[68:5]),
    .rd(in_vec[4:0]),
    .EX_MEM_Branch(out_vec[202:202]),
    .EX_MEM_MemRead(out_vec[201:201]),
    .EX_MEM_MemWrite(out_vec[200:200]),
    .EX_MEM_RegWrite(out_vec[199:199]),
    .EX_MEM_MemtoReg(out_vec[198:198]),
    .EX_MEM_mux_ForwardB(out_vec[197:134]),
    .EX_MEM_mux_ALU(out_vec[133:70]),
    .EX_MEM_ALUzero(out_vec[69:69]),
    .EX_MEM_adder2out(out_vec[68:5]),
    .EX_MEM_rd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 204'haade672432a6d4343e8322b2ad477a2390ddee6a2bc8ca86128;
    stim[1] = 204'h98d513e12d6ae4c1fe39f78490268fbfec9b4d0b8b2066256f9;
    stim[2] = 204'h5837f4c774061e99b07d8d004312603d54cc856173289241b89;
    stim[3] = 204'h71935eca84ee43df7656d0b6d8ec00d2e7003774ed183127976;
    stim[4] = 204'h264d21ae83658d7ac6f802af3aadc3c23b41e80cb8c6e9ed6d8;
    stim[5] = 204'h5e63caa0eecf23bf7f9706b64e3f57863179188bd5bc5741b41;
    stim[6] = 204'h48ea9232d51f6c2454dd26ae013b3c616a2ad252103cf109091;
    stim[7] = 204'h00d0e7ad4a78c064086b1b98eecd7960979aa00f31c62564d62;
    stim[8] = 204'h33730fe9cb3a095b1c772ae1a6f926e790e02e3a605d564f35f;
    stim[9] = 204'h586225a03b694b946328d13909cf1eeb44864d33905884f4001;
    stim[10] = 204'h1d2046d15ef40ccdd1314450f44de84302fcbe04864ea586acc;
    stim[11] = 204'h4c5463feeaaa0dd8b647b06224cd6d14bd6c61e51a7a618f5ef;
    stim[12] = 204'h5d94591bef87f7aa08efafb7e1aa0b0f1ce707ce15e8afcb9c2;
    stim[13] = 204'h12a40773df5252e02774a5bd2e8986fa8867f61a5522feb4c2c;
    stim[14] = 204'h642b9362e1a6de2217858cb6ca91ed6bffb8da5b4684e983399;
    stim[15] = 204'h31925c166f04e3b6cdc19b756dd4fcd77d6b3469bf22075b103;
    stim[16] = 204'h25be98b4071b6ef911f7f626f76ecc8594fe91bb8cfdb687a41;
    stim[17] = 204'h77fd0684dec468d7a11f128ab87bfa8376eb6fe6abcfbd80f09;
    stim[18] = 204'h5814e504ec718ec082a816f9ebb56ed0c44c939883de0beaec4;
    stim[19] = 204'h75432ce05a8eb9aa4215d82cb1af4e2768b457ad99e6605da21;
    stim[20] = 204'h43db7b1d97499d0192f7fe7a2da8a8610331d499c6b4441cc4d;
    stim[21] = 204'h082e577fd24b86beb1ce382cacc4c4628ad0a4aa445d9789b32;
    stim[22] = 204'h104ebd61a5706be15e5a9f18ccad1369cf7c6d21046fedda1d8;
    stim[23] = 204'h54b5140543f180d18b53f13cba519dbf2c1e5659f65d21a902c;
    stim[24] = 204'h4b97688ed08c1c1c37c6d251c113da153851947cb9e4df3b812;
    stim[25] = 204'h02e697b083fe105cd77fb06b0bdca36b8bbcd9be9d1f6671a8d;
    stim[26] = 204'h6901f5e3869a7f22227f69ea4e819d3ddbe18bc522cb2ef8c98;
    stim[27] = 204'h2da26e3b3df25dc9fa4b0d235c1b36357bb5d0b3a1ff47aab64;
    stim[28] = 204'h61abb471f4fb90b6511cdb14d40dffd430e1b34aca544c00ab5;
    stim[29] = 204'h5de0a381bcabd14e5b66f6a916e8733b16bb161a177d690c262;
    stim[30] = 204'h477b771e1789be81d1cb435cf2e6384f2fd1e39a2d2267cfa5e;
    stim[31] = 204'h520f362fcb0eca549dc27472dc35995e5614c98cfd351573f1b;
    stim[32] = 204'h71c116df715bfc0b42dfab7b8bd3078d2be8eba01774e8179cd;
    stim[33] = 204'h1e0fbc65d1168ebdecdf1162eddfc478e1df1bfc10888f9c318;
    stim[34] = 204'h6d83eb5ba27c78cd2abe1a6371ea239bbcc711bea590ba0f4dc;
    stim[35] = 204'h697c751ed712598efd46de9e36909cbe775cb60f3dca13abe8a;
    stim[36] = 204'h2bb8202b99c36c2f391506fe38ef1028d99372b1744f4bd0a2c;
    stim[37] = 204'h62f7d557d0bd39edccca12eda1861ddea94b43b579d9843928e;
    stim[38] = 204'h111d6a79e79065138c241d3189644a4abe9833a3d00de948c81;
    stim[39] = 204'h354c71bf3a945efd79411f4016b3c151fe62307aaabd56175c7;
    stim[40] = 204'h770506e071ac0b1a62dd903aea6f9ef659ae29dbf234d2b3fc0;
    stim[41] = 204'h1b901554cf4bb4a200a96cd80e33a0082212adc0e2c7a3a475f;
    stim[42] = 204'h6b71f96a5f409e8b5d42985da663bdbd0b53fa7c7a36e8fc396;
    stim[43] = 204'h5bc030eae4b378dcd54a7c7c7aeba91b24044bd928de2446040;
    stim[44] = 204'h518fc89dde3421e35e7e5a89641c5f642f9879f66132d777e8f;
    stim[45] = 204'h19f71c9a92a13d1c05467472c3a747d559c33acbde1036edf47;
    stim[46] = 204'h7c639728da9aa22a7204bb30f338858864fd96a7408c9591d8a;
    stim[47] = 204'h01c64c393d61d7d2c05f187fb171940a727ea2d6720c03e6081;
    stim[48] = 204'h02444d9a7ea7283ef031e687a97723a98fa1db09772da37329e;
    stim[49] = 204'h7a916092d1e9f082af2fe7b4641bcfed3e88a8945f725761160;
    stim[50] = 204'h7c5f6460c3257ebacfff29cae122ccc5ee60dbe3655247bc55c;
    stim[51] = 204'h0b63a00f485b52b2a700cd702660054c2d28610faf82a7f4dca;
    stim[52] = 204'h052ccf5b6a5dbdef6e0dad9e69f775d65dd3c7fd736fa5217d4;
    stim[53] = 204'h0f8bf3bae43f2aa7165ef0a15f4c20e67bc83f0e6b3848b2a87;
    stim[54] = 204'h17652c43e54d259f77e472fef964e28c35bd92ddb8547e3b6ec;
    stim[55] = 204'h116f56c091f7754b7b087c7829fd238d542dd27c39b169e4210;
    stim[56] = 204'h5aa043bc499b513dca8e430584331fdc8eabc81e1f035ca5312;
    stim[57] = 204'h1052fdb1437571cef83321d9a33917c4d3962468eb78f941bf6;
    stim[58] = 204'h22b341cfa98ead85ec8775a6e87405d1df8bbe8f10fd217591b;
    stim[59] = 204'h39c1dd22b9786d7d86d844c06d103449049f76088766ba3a176;
    stim[60] = 204'hf02e4863e0e001ee8430209da116a8f62f2b83a3b0c573456fe;
    stim[61] = 204'h202c8c18009a35c5d3df1bcb46026f0482446016ea7d17d3695;
    stim[62] = 204'h66dcd3bf9e180f61210997cdf59ce47c40d30697a0cf6299c3f;
    stim[63] = 204'h0458e64ab3b1d571c351dd0ee91799e7556221ff9ffd295dbc3;
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
      expv[0] = 203'h000000000000000000000000000000000000000000000000000;
      expv[1] = 203'h000000000000000000000000000000000000000000000000000;
      expv[2] = 203'h000000000000000000000000000000000000000000000000000;
      expv[3] = 203'h5837f4c774061e99b07d8d004312603d54cc856173289241b89;
      expv[4] = 203'h71935eca84ee43df7656d0b6d8ec00d2e7003774ed183127976;
      expv[5] = 203'h264d21ae83658d7ac6f802af3aadc3c23b41e80cb8c6e9ed6d8;
      expv[6] = 203'h5e63caa0eecf23bf7f9706b64e3f57863179188bd5bc5741b41;
      expv[7] = 203'h48ea9232d51f6c2454dd26ae013b3c616a2ad252103cf109091;
      expv[8] = 203'h00d0e7ad4a78c064086b1b98eecd7960979aa00f31c62564d62;
      expv[9] = 203'h33730fe9cb3a095b1c772ae1a6f926e790e02e3a605d564f35f;
      expv[10] = 203'h586225a03b694b946328d13909cf1eeb44864d33905884f4001;
      expv[11] = 203'h1d2046d15ef40ccdd1314450f44de84302fcbe04864ea586acc;
      expv[12] = 203'h4c5463feeaaa0dd8b647b06224cd6d14bd6c61e51a7a618f5ef;
      expv[13] = 203'h5d94591bef87f7aa08efafb7e1aa0b0f1ce707ce15e8afcb9c2;
      expv[14] = 203'h12a40773df5252e02774a5bd2e8986fa8867f61a5522feb4c2c;
      expv[15] = 203'h642b9362e1a6de2217858cb6ca91ed6bffb8da5b4684e983399;
      expv[16] = 203'h31925c166f04e3b6cdc19b756dd4fcd77d6b3469bf22075b103;
      expv[17] = 203'h25be98b4071b6ef911f7f626f76ecc8594fe91bb8cfdb687a41;
      expv[18] = 203'h77fd0684dec468d7a11f128ab87bfa8376eb6fe6abcfbd80f09;
      expv[19] = 203'h5814e504ec718ec082a816f9ebb56ed0c44c939883de0beaec4;
      expv[20] = 203'h75432ce05a8eb9aa4215d82cb1af4e2768b457ad99e6605da21;
      expv[21] = 203'h43db7b1d97499d0192f7fe7a2da8a8610331d499c6b4441cc4d;
      expv[22] = 203'h082e577fd24b86beb1ce382cacc4c4628ad0a4aa445d9789b32;
      expv[23] = 203'h104ebd61a5706be15e5a9f18ccad1369cf7c6d21046fedda1d8;
      expv[24] = 203'h54b5140543f180d18b53f13cba519dbf2c1e5659f65d21a902c;
      expv[25] = 203'h4b97688ed08c1c1c37c6d251c113da153851947cb9e4df3b812;
      expv[26] = 203'h02e697b083fe105cd77fb06b0bdca36b8bbcd9be9d1f6671a8d;
      expv[27] = 203'h6901f5e3869a7f22227f69ea4e819d3ddbe18bc522cb2ef8c98;
      expv[28] = 203'h2da26e3b3df25dc9fa4b0d235c1b36357bb5d0b3a1ff47aab64;
      expv[29] = 203'h61abb471f4fb90b6511cdb14d40dffd430e1b34aca544c00ab5;
      expv[30] = 203'h5de0a381bcabd14e5b66f6a916e8733b16bb161a177d690c262;
      expv[31] = 203'h477b771e1789be81d1cb435cf2e6384f2fd1e39a2d2267cfa5e;
      expv[32] = 203'h520f362fcb0eca549dc27472dc35995e5614c98cfd351573f1b;
      expv[33] = 203'h71c116df715bfc0b42dfab7b8bd3078d2be8eba01774e8179cd;
      expv[34] = 203'h1e0fbc65d1168ebdecdf1162eddfc478e1df1bfc10888f9c318;
      expv[35] = 203'h6d83eb5ba27c78cd2abe1a6371ea239bbcc711bea590ba0f4dc;
      expv[36] = 203'h697c751ed712598efd46de9e36909cbe775cb60f3dca13abe8a;
      expv[37] = 203'h2bb8202b99c36c2f391506fe38ef1028d99372b1744f4bd0a2c;
      expv[38] = 203'h62f7d557d0bd39edccca12eda1861ddea94b43b579d9843928e;
      expv[39] = 203'h111d6a79e79065138c241d3189644a4abe9833a3d00de948c81;
      expv[40] = 203'h354c71bf3a945efd79411f4016b3c151fe62307aaabd56175c7;
      expv[41] = 203'h770506e071ac0b1a62dd903aea6f9ef659ae29dbf234d2b3fc0;
      expv[42] = 203'h1b901554cf4bb4a200a96cd80e33a0082212adc0e2c7a3a475f;
      expv[43] = 203'h6b71f96a5f409e8b5d42985da663bdbd0b53fa7c7a36e8fc396;
      expv[44] = 203'h5bc030eae4b378dcd54a7c7c7aeba91b24044bd928de2446040;
      expv[45] = 203'h518fc89dde3421e35e7e5a89641c5f642f9879f66132d777e8f;
      expv[46] = 203'h19f71c9a92a13d1c05467472c3a747d559c33acbde1036edf47;
      expv[47] = 203'h7c639728da9aa22a7204bb30f338858864fd96a7408c9591d8a;
      expv[48] = 203'h01c64c393d61d7d2c05f187fb171940a727ea2d6720c03e6081;
      expv[49] = 203'h02444d9a7ea7283ef031e687a97723a98fa1db09772da37329e;
      expv[50] = 203'h7a916092d1e9f082af2fe7b4641bcfed3e88a8945f725761160;
      expv[51] = 203'h7c5f6460c3257ebacfff29cae122ccc5ee60dbe3655247bc55c;
      expv[52] = 203'h0b63a00f485b52b2a700cd702660054c2d28610faf82a7f4dca;
      expv[53] = 203'h052ccf5b6a5dbdef6e0dad9e69f775d65dd3c7fd736fa5217d4;
      expv[54] = 203'h0f8bf3bae43f2aa7165ef0a15f4c20e67bc83f0e6b3848b2a87;
      expv[55] = 203'h17652c43e54d259f77e472fef964e28c35bd92ddb8547e3b6ec;
      expv[56] = 203'h116f56c091f7754b7b087c7829fd238d542dd27c39b169e4210;
      expv[57] = 203'h5aa043bc499b513dca8e430584331fdc8eabc81e1f035ca5312;
      expv[58] = 203'h1052fdb1437571cef83321d9a33917c4d3962468eb78f941bf6;
      expv[59] = 203'h22b341cfa98ead85ec8775a6e87405d1df8bbe8f10fd217591b;
      expv[60] = 203'h000000000000000000000000000000000000000000000000000;
      expv[61] = 203'h000000000000000000000000000000000000000000000000000;
      expv[62] = 203'h202c8c18009a35c5d3df1bcb46026f0482446016ea7d17d3695;
      expv[63] = 203'h66dcd3bf9e180f61210997cdf59ce47c40d30697a0cf6299c3f;
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
