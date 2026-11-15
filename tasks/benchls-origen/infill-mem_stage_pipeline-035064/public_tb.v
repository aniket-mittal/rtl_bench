// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 167;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035064 dut (
    .clk(clk),
    .rst_n(in_vec[105:105]),
    .memory_stall(in_vec[104:104]),
    .ALU_result_3(in_vec[103:72]),
    .writedata_3(in_vec[71:40]),
    .D_readData(in_vec[39:8]),
    .WriteBack_3(in_vec[7:7]),
    .Mem_3(in_vec[6:5]),
    .Rd_3(in_vec[4:0]),
    .memory_result_4(out_vec[166:135]),
    .ALU_result_4(out_vec[134:103]),
    .forward_result_4(out_vec[102:71]),
    .Rd_4(out_vec[70:66]),
    .WriteBack_4(out_vec[65:65]),
    .Mem2Reg(out_vec[64:64]),
    .D_addr(out_vec[63:34]),
    .D_wen(out_vec[33:33]),
    .D_ren(out_vec[32:32]),
    .D_writeData(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h166293e2b48bd47b19b6ad5d644;
    stim[1] = 106'h192dbae9e693e4f583185cf253a;
    stim[2] = 106'h26476f3049349c644e6d2e4ebaf;
    stim[3] = 106'h32e1312dce379c9c3a7a11cdaba;
    stim[4] = 106'h359f20abe2e97ea2b5b62c156ef;
    stim[5] = 106'h2354c6ab9f6d898ab80fc727a31;
    stim[6] = 106'h3ae87c3b9994a087b4bd4bae923;
    stim[7] = 106'h32a10d428999377a4c65c45307d;
    stim[8] = 106'h3f3d295ada03e0dff09beb0a473;
    stim[9] = 106'h3837b97e7e2b927b75abb70b47f;
    stim[10] = 106'h2cc6c74340b21737fd6a0371700;
    stim[11] = 106'h259028e4ba6f62afe5b83fcbd75;
    stim[12] = 106'h3afb4bc82229d40f4e335a2b4ad;
    stim[13] = 106'h2eb27ff2e298fb135884a1643ae;
    stim[14] = 106'h25927080c253ab1bc4171224b2f;
    stim[15] = 106'h2ae7d39cba9cfabe530421463c9;
    stim[16] = 106'h37161b0b92df36a1dc708aa72c0;
    stim[17] = 106'h268271ae52e3fcce6b71c1d0d67;
    stim[18] = 106'h2ebd8004332332add76312a71ba;
    stim[19] = 106'h24343008274aa75e864087e6603;
    stim[20] = 106'h3c13f492eb34f11e541d97b9164;
    stim[21] = 106'h3dce9d0c59e5f4d9736bff43415;
    stim[22] = 106'h28a589f08e35dadcded824b474a;
    stim[23] = 106'h3607261506c6194b4de801296a4;
    stim[24] = 106'h3458026be18179c4e7e30c7a37a;
    stim[25] = 106'h298e971ac0e0885d58476d44db0;
    stim[26] = 106'h2af887b489d09b8323f53d22ad0;
    stim[27] = 106'h3e0c9e2f587f7c014907c8597c2;
    stim[28] = 106'h37e646d8487e1fd2d6e5b0c859b;
    stim[29] = 106'h305401e6900cb314ef5f5482f97;
    stim[30] = 106'h3cd53946d4fb7bdc78fbd13c0d9;
    stim[31] = 106'h280783f87f5e88ee08f089481a1;
    stim[32] = 106'h219c7e2b28b443e34a4d9692b1c;
    stim[33] = 106'h379ad1c97f6c15326bb337f44fe;
    stim[34] = 106'h292b4e57fdc7088061e2b63bf00;
    stim[35] = 106'h2f020fb2f8250354b36dab66acc;
    stim[36] = 106'h2fc0f7ae29d5afaa9c84c788a0c;
    stim[37] = 106'h247e70f9ea7ee14c8ebc45ff297;
    stim[38] = 106'h38de4f14181a1f105aa12d4addb;
    stim[39] = 106'h2b806ab30573d6ae2db6969bec2;
    stim[40] = 106'h39e877586596aa74cc9a8b5dc93;
    stim[41] = 106'h350d72388f0fd023e2466bf16ad;
    stim[42] = 106'h2ff7ceb32f23e0f9b1df40da892;
    stim[43] = 106'h29835a5ae1527d3fdfa4d313218;
    stim[44] = 106'h31afdc6ff34397c05e80dcd8d0a;
    stim[45] = 106'h2ea64106425882a37419655c154;
    stim[46] = 106'h3045672211660d8aa5c94a72fae;
    stim[47] = 106'h3e58aacf7469ad27f2c41587e16;
    stim[48] = 106'h2a1174ce889662f8b33415d5398;
    stim[49] = 106'h2ac2558a8a71b55547c7b3da37b;
    stim[50] = 106'h27ad3147f6438162829e160186e;
    stim[51] = 106'h3e2f24b5bb5c0be6124acd2241e;
    stim[52] = 106'h359af074e35ef474a581f4ed2b4;
    stim[53] = 106'h3dc6719ab602c1e8c15ec6d9755;
    stim[54] = 106'h3fbf78d5543e948128b88e7a5fd;
    stim[55] = 106'h3d1739a46afc034c7fc9ad96547;
    stim[56] = 106'h266bc2ed0c2dc552e6de8e2c0ec;
    stim[57] = 106'h3a2e5c18165aef9bf1aaa6b09a0;
    stim[58] = 106'h2a68cbc22471a048ef51c606550;
    stim[59] = 106'h267f8605fb6dc45e1ba03e68eb0;
    stim[60] = 106'h2484f2ed31e3cb797965e13b145;
    stim[61] = 106'h26c26672615824b05367c3a1025;
    stim[62] = 106'h37f568b4407fe25c6e0096be696;
    stim[63] = 106'h3df63a9f296ddbd920c5217ff11;
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
      expv[0] = 167'h0000000000000000000000000066293e29b147bd48;
      expv[1] = 167'h0000000000000000000000000092dbae9e584f3e69;
      expv[2] = 167'h000000000000000000000000006476f30644c64993;
      expv[3] = 167'h75f26973323b7982323b79823e2e1312dec3c979e3;
      expv[4] = 167'h75f26973323b7982323b79823e59f20abf2bea972e;
      expv[5] = 167'h75f26973323b7982323b79823e354c6abaab98d8f6;
      expv[6] = 167'h3d397e401aa6355c9aa6355cc4ae87c3ba7b084a99;
      expv[7] = 167'h3d397e401aa6355c9aa6355cc42a10d42ba4779399;
      expv[8] = 167'h3d397e401aa6355c9aa6355cc4f3d295afff0d3ea0;
      expv[9] = 167'h3d397e401aa6355c9aa6355cc4837b97e7b727b9e2;
      expv[10] = 167'h3d397e401aa6355c9aa6355cc4cc6c74347f73210b;
      expv[11] = 167'h0b9bd06b66363a1a66363a1a0059028e4bfe2af6a6;
      expv[12] = 167'h5efe41adac814725defe41add5afb4bc82f4409d22;
      expv[13] = 167'h5efe41adac814725defe41add5eb27ff2e35b18f29;
      expv[14] = 167'h218b25447593ff977593ff973a5927080ebcb13a25;
      expv[15] = 167'h259138a0ac9384062c9384063cae7d39c9e5abcfa9;
      expv[16] = 167'h318a2118573e9ce5b18a2118277161b0b91d6af32d;
      expv[17] = 167'h318a2118573e9ce5b18a21182768271ae7e6cc3f2e;
      expv[18] = 167'h068e8e5bb4138d72868e8e5b9debd80042dd2a3332;
      expv[19] = 167'h389518bb75ec0021f5ec0021ea43430080e875aa74;
      expv[20] = 167'h333f043221a1804121a180410cc13f492fe5114fb3;
      expv[21] = 167'h333f043221a1804121a180410cdce9d0c4974d5f9e;
      expv[22] = 167'h333f043221a1804121a180410c8a589f09cdad5de3;
      expv[23] = 167'h23a5c176c52c4f8423a5c176a960726152b494616c;
      expv[24] = 167'h23a5c176c52c4f8423a5c176a9458026bf4e9c1718;
      expv[25] = 167'h23a5c176c52c4f8423a5c176a998e971aed585080e;
      expv[26] = 167'h26ea3b424c74b8d64c74b8d642af887b4932b8099d;
      expv[27] = 167'h1569299fd7c43da41569299fc3e0c9e2f514c0f787;
      expv[28] = 167'h1569299fd7c43da41569299fc37e646d842dfde187;
      expv[29] = 167'h1569299fd7c43da41569299fc305401e684e31cb00;
      expv[30] = 167'h1569299fd7c43da41569299fc3cd53946dc7bdb74f;
      expv[31] = 167'h1569299fd7c43da41569299fc380783f86e08ee8f5;
      expv[32] = 167'h40ca0447c03c1fc3c03c1fc38619c7e2b0343e448b;
      expv[33] = 167'h15b4ecd20ce3f1590ce3f1597079ad1c972653c1f6;
      expv[34] = 167'h15b4ecd20ce3f1590ce3f1597092b4e57c068870dc;
      expv[35] = 167'h5fb1958f495a72bfc95a72bf80f020fb2d4b355082;
      expv[36] = 167'h355b6d1b78107d97b55b6d1b33fc0f7ae0a9fa5a9d;
      expv[37] = 167'h453c26647e07bd717e07bd713047e70f9cc814eea7;
      expv[38] = 167'h792fe275a3f387cf23f387cf5e8de4f14105f1a181;
      expv[39] = 167'h792fe275a3f387cf23f387cf5eb806ab31e26a3d57;
      expv[40] = 167'h5f34b4eddc0355985f34b4ed8b9e8775844ca76a59;
      expv[41] = 167'h5f34b4eddc0355985f34b4ed8b50d7238a3e02fdf0;
      expv[42] = 167'h5f34b4eddc0355985f34b4ed8bff7ceb309b0f3ef2;
      expv[43] = 167'h5406fa0effbe75997fbe75994a9835a5acfdd32715;
      expv[44] = 167'h1918a6fd4c1ad2d74c1ad2d7601afdc6fc057c3934;
      expv[45] = 167'h1918a6fd4c1ad2d74c1ad2d760ea641065372a8825;
      expv[46] = 167'h60aacb20f532083260aacb20d104567222aad86016;
      expv[47] = 167'h60aacb20f532083260aacb20d1e58aacf47fd29a46;
      expv[48] = 167'h60aacb20f532083260aacb20d1a1174ce88b2f6689;
      expv[49] = 167'h29aea099d08ba674508ba67462ac2558ab54551ba7;
      expv[50] = 167'h519ebdbe5612ac54519ebdbe6d7ad3147f28163864;
      expv[51] = 167'h0c307094bd698a3f8c307094b9e2f24b5861bec0b5;
      expv[52] = 167'h0c307094bd698a3f8c307094b959af074e4a47ef35;
      expv[53] = 167'h0c307094bd698a3f8c307094b9dc6719a98c1e2c60;
      expv[54] = 167'h0c307094bd698a3f8c307094b9fbf78d571248e943;
      expv[55] = 167'h0c307094bd698a3f8c307094b9d1739a45c734c0af;
      expv[56] = 167'h0c307094bd698a3f8c307094b966bc2ed32e55dcc2;
      expv[57] = 167'h60717436b35e176860717436b3a2e5c182bff9ae65;
      expv[58] = 167'h60717436b35e176860717436b3a68cbc218e041a47;
      expv[59] = 167'h32b00e7ad3465e1132b00e7ac167f8605ee145dcb6;
      expv[60] = 167'h477301dd33fc302fb3fc302fc2484f2ed197b73c1e;
      expv[61] = 167'h5889af4b24279769d889af4b156c266726054b8215;
      expv[62] = 167'h081d3e1b3613339336133393147f568b44c625fe07;
      expv[63] = 167'h081d3e1b361333933613339314df63a9f092bddd96;
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
