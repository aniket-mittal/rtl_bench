// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 163;
  localparam OW = 103;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024278 dut (
    .up_clk(clk),
    .up_cs(in_vec[162:162]),
    .up_wr(in_vec[161:161]),
    .up_rd(in_vec[160:160]),
    .up_addr(in_vec[159:128]),
    .up_data_wr(in_vec[127:96]),
    .ctrl_up_data_rd_stat(in_vec[95:64]),
    .ctrl_up_data_rd_data(in_vec[63:32]),
    .ctrl_up_data_rd_ctrl(in_vec[31:0]),
    .up_data_rd(out_vec[102:71]),
    .up_busy(out_vec[70:70]),
    .ctrl_up_clk(out_vec[69:69]),
    .ctrl_up_cs_stat(out_vec[68:68]),
    .ctrl_up_cs_data(out_vec[67:67]),
    .ctrl_up_cs_ctrl(out_vec[66:66]),
    .ctrl_up_wr(out_vec[65:65]),
    .ctrl_up_rd(out_vec[64:64]),
    .ctrl_up_addr(out_vec[63:32]),
    .ctrl_up_data_wr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 163'h002a67f2d0096e013f65f1146b7eb7f823f7c7367;
    stim[1] = 163'h174084aa168942af331ebc007c2e91a039dc2c8cf;
    stim[2] = 163'h7e31bbccecf779342ccf5aae20442cebef35152a4;
    stim[3] = 163'h154928f2f6f35427ab126d2a39ceda961fe905905;
    stim[4] = 163'h25347fb3acbfa7d8f300d716e55e8189ac91df950;
    stim[5] = 163'h733624e99e5765b12619c64b84297d1489abab738;
    stim[6] = 163'h5bd1aca5667280db552e37a3df4dffb0946f05581;
    stim[7] = 163'h5f308d4af1a20679cbb2c8215eb21d491d6c46405;
    stim[8] = 163'h2e5c334ccc4f0b87dd3eb51b0db0d0dd596418798;
    stim[9] = 163'h4b34a6407d3fdee35b791feaa6b2ca5be99208e72;
    stim[10] = 163'h2efbccc8a21f316ae9d152d3648d3e8d4ecbe9290;
    stim[11] = 163'h398653f8d55b9a34b82601fff62f4dfd07b17e694;
    stim[12] = 163'h7e9d618b36bc8309e5e25fe125eaa1a6d1dfe634c;
    stim[13] = 163'h16bb90435e1bbd6f1046f11d87cbc752a1a27c2fb;
    stim[14] = 163'h15aef8203fdcec8eec2fd2ffedf9a1481cb30daa0;
    stim[15] = 163'h05eea0781d3e54af5229bfb5cbd6373d7684e28f9;
    stim[16] = 163'h0c8f44c8667dd97084b2f02ace30014996ddf1484;
    stim[17] = 163'h1876145c44657727498be35bb678a2cd869380e97;
    stim[18] = 163'h57fa72ec0cf893057521b1615ce3338523b621174;
    stim[19] = 163'h31937bcff750fe65b93e425022c69cd242a5c141f;
    stim[20] = 163'h353578ea5ae09c6671dcbe49497b8678acdf097d0;
    stim[21] = 163'h05ed6332fa3d05fe552959e2754e569f27ccb84f2;
    stim[22] = 163'h633518e2aa7113eefa5f5880ae8340c0268b90a6e;
    stim[23] = 163'h6d6af7841d69541d4b4396ff9d2bfac552fb8d556;
    stim[24] = 163'h0fe3e74436699c45941ef99a44e5428c93aaf88da;
    stim[25] = 163'h16e68c19603ae140dac17758ee68868ada46a25b0;
    stim[26] = 163'h513e557f12f8f3bbd7565872cad620e044ce47ff9;
    stim[27] = 163'h7d4fae7390130fbd309c7c8c99acad5e2f0a7443e;
    stim[28] = 163'h0a391304c2a24bc0ed684eb8b5a1a457d1a3e6364;
    stim[29] = 163'h3afd5b20b6aa99153a9b0d7242389c66ea1197c02;
    stim[30] = 163'h5b50d1b9e85d4c2a90fabc683942adee3e1aecf30;
    stim[31] = 163'h5577d158e9af96f0dc369f259c4f6b5532718459c;
    stim[32] = 163'h175961dc00e0306caf840648c91418edce010f837;
    stim[33] = 163'h1ed0d60f69f1e15887b63f45efb608ef4c347431e;
    stim[34] = 163'h1ed0b3f6c8e83daa1c655e04764c51d7e7d177a72;
    stim[35] = 163'h0fe1135ef4b5ed3d3ff66b4610f1c1d61bd69a272;
    stim[36] = 163'h1983e122a58cb6e56364b4e641725d3000ab5ad85;
    stim[37] = 163'h4a8ed30f859274656491dec59592b4a17f1973889;
    stim[38] = 163'h18afa2a2bb833f458106b1fb9587e166c0e8206a6;
    stim[39] = 163'h4a38d0fc7b7fe89b43223c10b75d5f02441a2e98b;
    stim[40] = 163'h70f670f7a3d1f05490ce3653dd36157cd9e35c56b;
    stim[41] = 163'h0ea5aa69530c6668bc3b36794d4fbe192883a95ac;
    stim[42] = 163'h7db6462864cdf129713181103b5a17b5b2b880694;
    stim[43] = 163'h5e2304dbb1937066fb925a7a4232fb3bcce35ed21;
    stim[44] = 163'h0ac90e783f8402635ecedeced9f25980c835a251f;
    stim[45] = 163'h74f676540c50d4ec19b7646d2942bd120d9943b2a;
    stim[46] = 163'h6bb8136aa5a6c2c8b668bfd372092cad4d52d34dc;
    stim[47] = 163'h0870c5d35cb40e25499743fd98188fe158a2ad314;
    stim[48] = 163'h490c046d931b4f4c56acc1fec754bb987f807e88f;
    stim[49] = 163'h6c40b26685581a9915dd28f868d734cefb409c741;
    stim[50] = 163'h3dd649027b59064457da21b040cf9741103f8f88e;
    stim[51] = 163'h1e34b7a8805948339895d564529087749a8a59803;
    stim[52] = 163'h655f73b4b5214998d237dd446e4f29918356710b5;
    stim[53] = 163'h2fbaa90e31a6651fa9345badb3c2242b8b7b5af69;
    stim[54] = 163'h0099f22568a959b7d54173851bc2550bca06964b3;
    stim[55] = 163'h6a7367ae56d5daac420351f41a109364c3274a969;
    stim[56] = 163'h0f13133af89c4d16a7b26884e815347613843a586;
    stim[57] = 163'h747903ec903b63149b46f97df229b89a93ad62c89;
    stim[58] = 163'h054e62e3329938d09a5b2db126b9c380671218eba;
    stim[59] = 163'h5a0a9604e44cb2a2cfc33279e9c046d78cbd5b210;
    stim[60] = 163'h5235863b82e8ef3d27d077f8dbb1188105a7e05cb;
    stim[61] = 163'h1a1201d655f4e76d56e45fb9924239133c86cef91;
    stim[62] = 163'h0025a0fb02c83790754c58296706fa04d5a1aba49;
    stim[63] = 163'h136e3921d9c004c72168a32e7e390b5e820ad1cd3;
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
      expv[0] = 103'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 103'hxxxxxxxxxxxxxxxxxx0096e013;
      expv[2] = 103'h6f56df778174084aa168942af3;
      expv[3] = 103'h6f56df7783e31bbccecf779342;
      expv[4] = 103'h6f56df778154928f2f6f35427a;
      expv[5] = 103'h6f56df77825347fb3acbfa7d8f;
      expv[6] = 103'h6f56df778333624e99e5765b12;
      expv[7] = 103'h6f56df7781bd1aca5667280db5;
      expv[8] = 103'h6f56df7781f308d4af1a20679c;
      expv[9] = 103'h6f56df7782e5c334ccc4f0b87d;
      expv[10] = 103'h6f56df7780e5c334ccd3fdee35;
      expv[11] = 103'h6f56df7782efbccc8a21f316ae;
      expv[12] = 103'h6f56df778398653f8d55b9a34b;
      expv[13] = 103'h6f56df7783e9d618b36bc8309e;
      expv[14] = 103'h6f56df77816bb90435e1bbd6f1;
      expv[15] = 103'h6f56df77815aef8203fdcec8ee;
      expv[16] = 103'h6f56df77805aef8203d3e54af5;
      expv[17] = 103'h6f56df77805aef820367dd9708;
      expv[18] = 103'h6f56df7781876145c446577274;
      expv[19] = 103'h6f56df77817fa72ec0cf893057;
      expv[20] = 103'h6f56df77831937bcff750fe65b;
      expv[21] = 103'h6f56df778353578ea5ae09c667;
      expv[22] = 103'h6f56df778053578ea5a3d05fe5;
      expv[23] = 103'h6f56df778233518e2aa7113eef;
      expv[24] = 103'h6f56df7782d6af7841d69541d4;
      expv[25] = 103'h6f56df7780d6af78416699c459;
      expv[26] = 103'h6f56df77816e68c19603ae140d;
      expv[27] = 103'h6f56df778113e557f12f8f3bbd;
      expv[28] = 103'h6f56df7783d4fae7390130fbd3;
      expv[29] = 103'h6f56df7780d4fae7392a24bc0e;
      expv[30] = 103'h6f56df7783afd5b20b6aa99153;
      expv[31] = 103'h6f56df7781b50d1b9e85d4c2a9;
      expv[32] = 103'h6f56df7781577d158e9af96f0d;
      expv[33] = 103'h6f56df778175961dc00e0306ca;
      expv[34] = 103'h6f56df7781ed0d60f69f1e1588;
      expv[35] = 103'h6f56df7781ed0b3f6c8e83daa1;
      expv[36] = 103'h6f56df7780ed0b3f6c4b5ed3d3;
      expv[37] = 103'h6f56df7781983e122a58cb6e56;
      expv[38] = 103'h6f56df7780983e122a59274656;
      expv[39] = 103'h6f56df77818afa2a2bb833f458;
      expv[40] = 103'h6f56df77808afa2a2bb7fe89b4;
      expv[41] = 103'h6f56df77830f670f7a3d1f0549;
      expv[42] = 103'h6f56df77800f670f7a30c6668b;
      expv[43] = 103'h6f56df7783db6462864cdf1297;
      expv[44] = 103'h6f56df7781e2304dbb1937066f;
      expv[45] = 103'h6f56df7780e2304dbbf8402635;
      expv[46] = 103'h6f56df77834f676540c50d4ec1;
      expv[47] = 103'h6f56df7782bb8136aa5a6c2c8b;
      expv[48] = 103'h6f56df7780bb8136aacb40e254;
      expv[49] = 103'h6f56df7780bb8136aa31b4f4c5;
      expv[50] = 103'h6f56df7782c40b26685581a991;
      expv[51] = 103'h6f56df7783dd649027b5906445;
      expv[52] = 103'h6f56df7781e34b7a8805948339;
      expv[53] = 103'h6f56df778255f73b4b5214998d;
      expv[54] = 103'h6f56df7782fbaa90e31a6651fa;
      expv[55] = 103'h6f56df7780fbaa90e38a959b7d;
      expv[56] = 103'h6f56df7782a7367ae56d5daac4;
      expv[57] = 103'h6f56df7780a7367ae589c4d16a;
      expv[58] = 103'h6f56df778347903ec903b63149;
      expv[59] = 103'h6f56df778047903ec929938d09;
      expv[60] = 103'h6f56df7781a0a9604e44cb2a2c;
      expv[61] = 103'h6f56df7781235863b82e8ef3d2;
      expv[62] = 103'h6f56df7781a1201d655f4e76d5;
      expv[63] = 103'h6f56df7780a1201d652c837907;
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
