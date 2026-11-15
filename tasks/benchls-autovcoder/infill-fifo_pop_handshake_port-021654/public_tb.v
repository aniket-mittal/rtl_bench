// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 142;
  localparam OW = 138;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021654 dut (
    .clk(clk),
    .rst(in_vec[141:141]),
    .input_port_PopNB_mioi_biwt(in_vec[140:140]),
    .input_port_PopNB_mioi_bdwt(in_vec[139:139]),
    .input_port_PopNB_mioi_idat(in_vec[138:1]),
    .input_port_PopNB_mioi_ivld(in_vec[0:0]),
    .input_port_PopNB_mioi_idat_mxwt(out_vec[137:1]),
    .input_port_PopNB_mioi_ivld_mxwt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 142'h297096f26f9ec9af60e11da5697043bf8878;
    stim[1] = 142'h3d5eba3a17a3de44df4a3ecc2cdeda563dfe;
    stim[2] = 142'h0bef1143521ff9567ca2928d670cbc288964;
    stim[3] = 142'h060662f5f28861051ba607a17cd7433f616d;
    stim[4] = 142'h0bd46969698644bece40330fd0939bd8cf9b;
    stim[5] = 142'h14b242849fe60eda382a23e484d2c7badb60;
    stim[6] = 142'h03ae211e23c32d54462d2e769a75ab0dba68;
    stim[7] = 142'h0114bdb5fd3d9053059c7b1c4eb39ad2e0bf;
    stim[8] = 142'h05084bb84c3e8aa6f9d5b8ab7e3372435b5c;
    stim[9] = 142'h01f0bfa40b578320b8ae7e14cc0271127cf4;
    stim[10] = 142'h1fcbda518368e5fd27675ccd05d9a543e251;
    stim[11] = 142'h1554140c316dd645f1d6c1c4023996817ebe;
    stim[12] = 142'h0fe6ab08cc502cfe35a4816bbbbd377ae04d;
    stim[13] = 142'h08e62687a91dc47997f32d41d6fc55e1ade3;
    stim[14] = 142'h0f19ef883ee55c1ea5c2e41aca8d72f17c65;
    stim[15] = 142'h035e8a9abd568bc0c3ecd060d51c0cd8b017;
    stim[16] = 142'h1c4864f21632917d5d509c6acefcd9df003d;
    stim[17] = 142'h05adc268baa133be0ab7650958d5f37bc444;
    stim[18] = 142'h1c57e86ff0cdfb328172de68e5530f99e674;
    stim[19] = 142'h09897ae2998fa0159f5f374c4766b4fa5674;
    stim[20] = 142'h05d41a603cb96237833a42817b5fbeb98edb;
    stim[21] = 142'h077091ba5e239ea4cfb9c8472e25b060a5a1;
    stim[22] = 142'h169586da756c1be5b02fddf58aaaa90f9e7a;
    stim[23] = 142'h12e2214993919fb68b2722824452baae3e53;
    stim[24] = 142'h1b5b43948335fd1a1f53f5337b4a1838973c;
    stim[25] = 142'h0c4cbce8eab0c2e7fa26e20c01c2e009b0e5;
    stim[26] = 142'h17fd03ab3a3280e97ca980d7a3970f540d3a;
    stim[27] = 142'h0f913287b630194eb43da7ca54876d4925d7;
    stim[28] = 142'h1846b45174294b557fbd118c30f9683fc565;
    stim[29] = 142'h1cf1455bc352340d117d30491bb5968451b4;
    stim[30] = 142'h159609b54e4f1ed5aeacd9e1bbcf507e0bef;
    stim[31] = 142'h0df0fc1b83bf3d6e0c0638d8d1e58cfebf86;
    stim[32] = 142'h19c2498823b3348362ca6743f57a6f55c616;
    stim[33] = 142'h0dd4f7851215c639fb10d3167558f474152d;
    stim[34] = 142'h199a2427ebbdda7b021577612a424b8393e3;
    stim[35] = 142'h18c4c52f06c2b3c4c230325a14c928009ba5;
    stim[36] = 142'h1adef590257ec5c18fa09dce93ecb789da99;
    stim[37] = 142'h0715acb0da895d71c6237ac088038d90b9fc;
    stim[38] = 142'h0ef933ab635c4cd5f3cbf0ad261b28a570fa;
    stim[39] = 142'h1cc1a9259d56252059a44d985c18f6da2d3a;
    stim[40] = 142'h057bc98be6d062f8d9895c80d5bb3dfea734;
    stim[41] = 142'h136996c13a8d5ba7679d38bb0c607dc81697;
    stim[42] = 142'h19ca628d207a1fbadb4551549458ad9dc3bd;
    stim[43] = 142'h0056ecbfaffaca1684dd7f5a4f7f2122dfce;
    stim[44] = 142'h15f44e90acbacfc9e6348d791d141c169768;
    stim[45] = 142'h14be860560c07504250d313dd9991dce90a4;
    stim[46] = 142'h00dbece07fe01ee6e3b9e1f2a8b53f8938eb;
    stim[47] = 142'h125e758ed77f5b7ecca7f2619736820deaa7;
    stim[48] = 142'h19e8f1df0aa780695ec4f0d409a8b7e5be71;
    stim[49] = 142'h025f8598d880c9dcf39cb3746b18aeb302b8;
    stim[50] = 142'h177847d3c1899e4c52a9516e3d5c95174580;
    stim[51] = 142'h1e1f22146c7f2936199f5f0a76afd76ab264;
    stim[52] = 142'h048085ebf595374981eddd5f00f21f4b4110;
    stim[53] = 142'h0dd16ade7e6280adf1f360414737823a0d71;
    stim[54] = 142'h0c23fc5f146385859a09bb7d8d621b530051;
    stim[55] = 142'h19f235851d16054315e3fa2db6f20babf0a8;
    stim[56] = 142'h1831ad7b34e6c5240789228a8c5676545ba3;
    stim[57] = 142'h04e21d242f189d7a339a96dd3c1b6cad9447;
    stim[58] = 142'h02565ff99b457921780b3a128a159d15e40a;
    stim[59] = 142'h0d0d5123f4b11d004a6d4fc76584254fba6b;
    stim[60] = 142'h316311cadb5045b1df41ddbe734dfef43f70;
    stim[61] = 142'h1f8ae35b86e24f638c6ffaaaca8ad80b218e;
    stim[62] = 142'h035b67e3dc1a8189ed8da92d53d911287e35;
    stim[63] = 142'h116b6f26d02fa266e6022062bff907f4f8d0;
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
      expv[0] = 138'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 138'h2aeba3a17a3de44df4a3ecc2cdeda563dfe;
      expv[2] = 138'h1f71143521ff9567ca2928d670cbc288964;
      expv[3] = 138'h30262f5f28861051ba607a17cd7433f616d;
      expv[4] = 138'h1e86969698644bece40330fd0939bd8cf9b;
      expv[5] = 138'h25a42849fe60eda382a23e484d2c7badb60;
      expv[6] = 138'h1d6211e23c32d54462d2e769a75ab0dba68;
      expv[7] = 138'h088bdb5fd3d9053059c7b1c4eb39ad2e0bf;
      expv[8] = 138'h2844bb84c3e8aa6f9d5b8ab7e3372435b5c;
      expv[9] = 138'h0f8bfa40b578320b8ae7e14cc0271127cf4;
      expv[10] = 138'h3e7da518368e5fd27675ccd05d9a543e251;
      expv[11] = 138'h2a8140c316dd645f1d6c1c4023996817ebe;
      expv[12] = 138'h3f2ab08cc502cfe35a4816bbbbd377ae04d;
      expv[13] = 138'h0722687a91dc47997f32d41d6fc55e1ade3;
      expv[14] = 138'h38def883ee55c1ea5c2e41aca8d72f17c65;
      expv[15] = 138'h1ae8a9abd568bc0c3ecd060d51c0cd8b017;
      expv[16] = 138'h22464f21632917d5d509c6acefcd9df003d;
      expv[17] = 138'h2d5c268baa133be0ab7650958d5f37bc444;
      expv[18] = 138'h22be86ff0cdfb328172de68e5530f99e674;
      expv[19] = 138'h0c57ae2998fa0159f5f374c4766b4fa5674;
      expv[20] = 138'h2e81a603cb96237833a42817b5fbeb98edb;
      expv[21] = 138'h3b891ba5e239ea4cfb9c8472e25b060a5a1;
      expv[22] = 138'h34986da756c1be5b02fddf58aaaa90f9e7a;
      expv[23] = 138'h172214993919fb68b2722824452baae3e53;
      expv[24] = 138'h1af43948335fd1a1f53f5337b4a1838973c;
      expv[25] = 138'h224bce8eab0c2e7fa26e20c01c2e009b0e5;
      expv[26] = 138'h3fd03ab3a3280e97ca980d7a3970f540d3a;
      expv[27] = 138'h3c93287b630194eb43da7ca54876d4925d7;
      expv[28] = 138'h022b45174294b557fbd118c30f9683fc565;
      expv[29] = 138'h279455bc352340d117d30491bb5968451b4;
      expv[30] = 138'h2ca09b54e4f1ed5aeacd9e1bbcf507e0bef;
      expv[31] = 138'h2f8fc1b83bf3d6e0c0638d8d1e58cfebf86;
      expv[32] = 138'h0e2498823b3348362ca6743f57a6f55c616;
      expv[33] = 138'h2e8f7851215c639fb10d3167558f474152d;
      expv[34] = 138'h0ce2427ebbdda7b021577612a424b8393e3;
      expv[35] = 138'h060c52f06c2b3c4c230325a14c928009ba5;
      expv[36] = 138'h16ef590257ec5c18fa09dce93ecb789da99;
      expv[37] = 138'h389acb0da895d71c6237ac088038d90b9fc;
      expv[38] = 138'h37d33ab635c4cd5f3cbf0ad261b28a570fa;
      expv[39] = 138'h261a9259d56252059a44d985c18f6da2d3a;
      expv[40] = 138'h2bfc98be6d062f8d9895c80d5bb3dfea734;
      expv[41] = 138'h1b596c13a8d5ba7679d38bb0c607dc81697;
      expv[42] = 138'h0e6628d207a1fbadb4551549458ad9dc3bd;
      expv[43] = 138'h02aecbfaffaca1684dd7f5a4f7f2122dfce;
      expv[44] = 138'h2f84e90acbacfc9e6348d791d141c169768;
      expv[45] = 138'h25e860560c07504250d313dd9991dce90a4;
      expv[46] = 138'h06fece07fe01ee6e3b9e1f2a8b53f8938eb;
      expv[47] = 138'h12e758ed77f5b7ecca7f2619736820deaa7;
      expv[48] = 138'h0f4f1df0aa780695ec4f0d409a8b7e5be71;
      expv[49] = 138'h12f8598d880c9dcf39cb3746b18aeb302b8;
      expv[50] = 138'h3bc47d3c1899e4c52a9516e3d5c95174580;
      expv[51] = 138'h30f22146c7f2936199f5f0a76afd76ab264;
      expv[52] = 138'h24085ebf595374981eddd5f00f21f4b4110;
      expv[53] = 138'h2e96ade7e6280adf1f360414737823a0d71;
      expv[54] = 138'h213fc5f146385859a09bb7d8d621b530051;
      expv[55] = 138'h0fa35851d16054315e3fa2db6f20babf0a8;
      expv[56] = 138'h019ad7b34e6c5240789228a8c5676545ba3;
      expv[57] = 138'h2721d242f189d7a339a96dd3c1b6cad9447;
      expv[58] = 138'h12a5ff99b457921780b3a128a159d15e40a;
      expv[59] = 138'h2855123f4b11d004a6d4fc76584254fba6b;
      expv[60] = 138'h0b311cadb5045b1df41ddbe734dfef43f70;
      expv[61] = 138'h0b311cadb5045b1df41ddbe734dfef43f70;
      expv[62] = 138'h1af67e3dc1a8189ed8da92d53d911287e35;
      expv[63] = 138'h0b76f26d02fa266e6022062bff907f4f8d0;
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
