// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 181;
  localparam OW = 181;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_070832 dut (
    .Clk(clk),
    .MemRead_in(in_vec[180:180]),
    .MemWrite_in(in_vec[179:179]),
    .RegWrite_in(in_vec[178:178]),
    .regWrite_jal_in(in_vec[177:177]),
    .MemToReg_in(in_vec[176:176]),
    .HiOrLo_in(in_vec[175:175]),
    .HiLoReg_in(in_vec[174:174]),
    .Add64_in(in_vec[173:173]),
    .HiLoSelect_in(in_vec[172:172]),
    .HiRsSel_in(in_vec[171:171]),
    .WriteHi_in(in_vec[170:170]),
    .WriteLo_in(in_vec[169:169]),
    .ALU_in(in_vec[168:137]),
    .ALU_hi_in(in_vec[136:105]),
    .RtRd_in(in_vec[104:100]),
    .Read1_in(in_vec[99:68]),
    .Read2_in(in_vec[67:36]),
    .PC_in(in_vec[35:4]),
    .MEMop_in(in_vec[3:0]),
    .MemRead_out(out_vec[180:180]),
    .MemWrite_out(out_vec[179:179]),
    .RegWrite_out(out_vec[178:178]),
    .regWrite_jal_out(out_vec[177:177]),
    .MemToReg_out(out_vec[176:176]),
    .HiOrLo_out(out_vec[175:175]),
    .HiLoReg_out(out_vec[174:174]),
    .Add64_out(out_vec[173:173]),
    .HiLoSelect_out(out_vec[172:172]),
    .HiRsSel_out(out_vec[171:171]),
    .WriteHi_out(out_vec[170:170]),
    .WriteLo_out(out_vec[169:169]),
    .ALU_out(out_vec[168:137]),
    .ALU_hi_out(out_vec[136:105]),
    .RtRd_out(out_vec[104:100]),
    .Read1_out(out_vec[99:68]),
    .Read2_out(out_vec[67:36]),
    .PC_out(out_vec[35:4]),
    .MEMop_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 181'h0698f3bf2d274ebf08cdeaf21306798c3de2196bcb5067;
    stim[1] = 181'h15bd7d13d9f09c6cd440c8fe5eb73d064aa7994a080999;
    stim[2] = 181'h004e7f689c8ac590f760c65dbaa864e3eb098a1bead57a;
    stim[3] = 181'h0674936403f9a8135c2bfcf0c9018a71af0f40f5d44a98;
    stim[4] = 181'h0f7bfd39359e595abe3f18d5dc89422024995dad45c789;
    stim[5] = 181'h0335ccd4858d47d74dd7dd12fd30753f3237695ef1af3d;
    stim[6] = 181'h0ba7e9eb06ddb24d9bea42d5b8e01cc28a249d918bd4bf;
    stim[7] = 181'h0bb0b76fb1664218692257b9848fe74b79bda85ed6def6;
    stim[8] = 181'h060c9a7637083c99d1611d075b8fdf0150895301c6cc2b;
    stim[9] = 181'h16c226ee81141f0e3a7fb6cf7f2192fb09321087256445;
    stim[10] = 181'h0e6f49a7d215098bf3789d5a28aeed3406cdaf18706932;
    stim[11] = 181'h07bce2f2bcc4a10a1cdd8dd010ab0b377ad37c456d49a1;
    stim[12] = 181'h094e0e38f87620bea853be6c5dd3669bed0070be08167f;
    stim[13] = 181'h10d42b611f446f63bc9436455281c3ad1c1b832475c409;
    stim[14] = 181'h01b1ff761f24cec1264b691fec2497b8041c3888f93144;
    stim[15] = 181'h0c3fbd9695ebfe7d26af53388a2bff88a4664d49bebb2c;
    stim[16] = 181'h0ccf500485c430ac616ec893cf4d01999140b75fe66ff9;
    stim[17] = 181'h024344bf8ab604a764a7a5f24451c15daddac7eede5c63;
    stim[18] = 181'h1f093bfb5c42bf81067029703ac26c2bcff33e512d1ab2;
    stim[19] = 181'h187fc1171f976932dce30a9a3b89aa933090de1526143f;
    stim[20] = 181'h00eb68f2064af1bb6f36ab4c46ca322726f93de6b8729e;
    stim[21] = 181'h18e15b7542da8cbc6e4263a151e83b78d3679e6394c222;
    stim[22] = 181'h1752e8b297b8c37d175d8b8974fda1138ff5b1950f5fbb;
    stim[23] = 181'h135460e3eab3e74f80a4c79f4c63ac41d4614cac95d85f;
    stim[24] = 181'h1505126ae6029853201f53e726764ab19d18227fa7b63b;
    stim[25] = 181'h1b53fccf0e8dd877f5adc2e8513dba027a99dffad5b294;
    stim[26] = 181'h07958117a4cc670c2fc5aa8dfe222190237518aa8db510;
    stim[27] = 181'h051a5771d9d038a50da702c2ed0b00ff323d589d1a458f;
    stim[28] = 181'h0d3232918c3136147abb19d79161e8166dea21e06369b3;
    stim[29] = 181'h120031bb6160ef0fb96c31ad5feffacb31b9d18041e00c;
    stim[30] = 181'h17199e08f6565c2b49be867f43a06bbde5d38e1ed212de;
    stim[31] = 181'h16804ca4c5edc66d1c7cb0666ec59208203757c5510b9e;
    stim[32] = 181'h1a22e48fccd9b49a4608e582a46690186c97d3d08c807c;
    stim[33] = 181'h125c7a0c49edd75fd1bd75357c5f3241162d09c8ef2829;
    stim[34] = 181'h1331234dc130e12302c29e542f9a6f18e088abbd934766;
    stim[35] = 181'h1aef0fb4789e252c5b419ee288ce39ab6ff9dfabef5a76;
    stim[36] = 181'h0d81a98a86c9fa55157542bde08f358f4d35b63e02dc6a;
    stim[37] = 181'h02036250fa23b574a99c29b24fc2f7476c66b5b11c53cb;
    stim[38] = 181'h04b9e30fb84e97443fd2fb813fb327010f71cc471c94a3;
    stim[39] = 181'h1693d152ad8a9b9fcfbe85ea430dd07cd90e28f37c2d3e;
    stim[40] = 181'h0abcf929b4024842c1916ff5a4aca051a5aa27a032a4af;
    stim[41] = 181'h1bb8d04d60bf0f6666ed07ab36bbd70450d93f7985668f;
    stim[42] = 181'h155732a202c361c79267e77a784ed9543f7339228c1410;
    stim[43] = 181'h1d3a1999328b6b235a64605a6ee1e95acf7e044d6aa0f9;
    stim[44] = 181'h022fd25d2f522c055d9992a24679d1f759f68a5c6d54ed;
    stim[45] = 181'h1385f8aa8aba41d0bcdbc6a196ebdc9fa5d0472a8eab97;
    stim[46] = 181'h177f9b94116365ece70312e7da4ecca98b0b325513b463;
    stim[47] = 181'h1acabc38f3a6bf940876100456e633adbd03dea78787d8;
    stim[48] = 181'h1cdcdc46ad241e4d3eb26e21407a0f80566946b702aedd;
    stim[49] = 181'h1197cfe07d46d64a91086eab337eeedb0b0d5e3bf8deed;
    stim[50] = 181'h17e6c22d31c1f209623140d9193c940b10757ff1b0ce0f;
    stim[51] = 181'h0d311b2daa0f9e81b176745029489948e9b7fc79598364;
    stim[52] = 181'h0a3cdd6e8d883bd1f4e99ab84392d58ecafe799994ae61;
    stim[53] = 181'h09b5fe86fe1ab3aa81b667ee3c16c3b8039bebc059db0d;
    stim[54] = 181'h05bab0a634a5a55d8b8c4faabe3e8eeff9eba417735649;
    stim[55] = 181'h1fa80455302c765115e99c746e0e0d13e61a15529a39fa;
    stim[56] = 181'h0d5e6bbf587777e7419f50d093e4f3aee0896013a55bc4;
    stim[57] = 181'h137df590221dac53739ef7ceea9ca9cbba98dad6d30cb6;
    stim[58] = 181'h140ad7de6a88126e70493b3ce2e9eb22dadbeed57d3b79;
    stim[59] = 181'h04120a817630aea7fbb63c551b3e2a1d874e2c3712820e;
    stim[60] = 181'h02a0a69e602fb98ff077e1981b76d33111cfa65643a636;
    stim[61] = 181'h153c70807fc02d1a0fadabe1aa207b0ad94fb2d7eeec6b;
    stim[62] = 181'h0bdae3e20e7bdff20519d09cd31c3bfa5babb5b905e8ca;
    stim[63] = 181'h0abf3192e06f64383c282bfc9ba436fa010c9a02abe518;
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
      expv[0] = 181'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 181'h0698f3bf2d274ebf08cdeaf21306798c3de2196bcb5067;
      expv[2] = 181'h15bd7d13d9f09c6cd440c8fe5eb73d064aa7994a080999;
      expv[3] = 181'h004e7f689c8ac590f760c65dbaa864e3eb098a1bead57a;
      expv[4] = 181'h0674936403f9a8135c2bfcf0c9018a71af0f40f5d44a98;
      expv[5] = 181'h0f7bfd39359e595abe3f18d5dc89422024995dad45c789;
      expv[6] = 181'h0335ccd4858d47d74dd7dd12fd30753f3237695ef1af3d;
      expv[7] = 181'h0ba7e9eb06ddb24d9bea42d5b8e01cc28a249d918bd4bf;
      expv[8] = 181'h0bb0b76fb1664218692257b9848fe74b79bda85ed6def6;
      expv[9] = 181'h060c9a7637083c99d1611d075b8fdf0150895301c6cc2b;
      expv[10] = 181'h16c226ee81141f0e3a7fb6cf7f2192fb09321087256445;
      expv[11] = 181'h0e6f49a7d215098bf3789d5a28aeed3406cdaf18706932;
      expv[12] = 181'h07bce2f2bcc4a10a1cdd8dd010ab0b377ad37c456d49a1;
      expv[13] = 181'h094e0e38f87620bea853be6c5dd3669bed0070be08167f;
      expv[14] = 181'h10d42b611f446f63bc9436455281c3ad1c1b832475c409;
      expv[15] = 181'h01b1ff761f24cec1264b691fec2497b8041c3888f93144;
      expv[16] = 181'h0c3fbd9695ebfe7d26af53388a2bff88a4664d49bebb2c;
      expv[17] = 181'h0ccf500485c430ac616ec893cf4d01999140b75fe66ff9;
      expv[18] = 181'h024344bf8ab604a764a7a5f24451c15daddac7eede5c63;
      expv[19] = 181'h1f093bfb5c42bf81067029703ac26c2bcff33e512d1ab2;
      expv[20] = 181'h187fc1171f976932dce30a9a3b89aa933090de1526143f;
      expv[21] = 181'h00eb68f2064af1bb6f36ab4c46ca322726f93de6b8729e;
      expv[22] = 181'h18e15b7542da8cbc6e4263a151e83b78d3679e6394c222;
      expv[23] = 181'h1752e8b297b8c37d175d8b8974fda1138ff5b1950f5fbb;
      expv[24] = 181'h135460e3eab3e74f80a4c79f4c63ac41d4614cac95d85f;
      expv[25] = 181'h1505126ae6029853201f53e726764ab19d18227fa7b63b;
      expv[26] = 181'h1b53fccf0e8dd877f5adc2e8513dba027a99dffad5b294;
      expv[27] = 181'h07958117a4cc670c2fc5aa8dfe222190237518aa8db510;
      expv[28] = 181'h051a5771d9d038a50da702c2ed0b00ff323d589d1a458f;
      expv[29] = 181'h0d3232918c3136147abb19d79161e8166dea21e06369b3;
      expv[30] = 181'h120031bb6160ef0fb96c31ad5feffacb31b9d18041e00c;
      expv[31] = 181'h17199e08f6565c2b49be867f43a06bbde5d38e1ed212de;
      expv[32] = 181'h16804ca4c5edc66d1c7cb0666ec59208203757c5510b9e;
      expv[33] = 181'h1a22e48fccd9b49a4608e582a46690186c97d3d08c807c;
      expv[34] = 181'h125c7a0c49edd75fd1bd75357c5f3241162d09c8ef2829;
      expv[35] = 181'h1331234dc130e12302c29e542f9a6f18e088abbd934766;
      expv[36] = 181'h1aef0fb4789e252c5b419ee288ce39ab6ff9dfabef5a76;
      expv[37] = 181'h0d81a98a86c9fa55157542bde08f358f4d35b63e02dc6a;
      expv[38] = 181'h02036250fa23b574a99c29b24fc2f7476c66b5b11c53cb;
      expv[39] = 181'h04b9e30fb84e97443fd2fb813fb327010f71cc471c94a3;
      expv[40] = 181'h1693d152ad8a9b9fcfbe85ea430dd07cd90e28f37c2d3e;
      expv[41] = 181'h0abcf929b4024842c1916ff5a4aca051a5aa27a032a4af;
      expv[42] = 181'h1bb8d04d60bf0f6666ed07ab36bbd70450d93f7985668f;
      expv[43] = 181'h155732a202c361c79267e77a784ed9543f7339228c1410;
      expv[44] = 181'h1d3a1999328b6b235a64605a6ee1e95acf7e044d6aa0f9;
      expv[45] = 181'h022fd25d2f522c055d9992a24679d1f759f68a5c6d54ed;
      expv[46] = 181'h1385f8aa8aba41d0bcdbc6a196ebdc9fa5d0472a8eab97;
      expv[47] = 181'h177f9b94116365ece70312e7da4ecca98b0b325513b463;
      expv[48] = 181'h1acabc38f3a6bf940876100456e633adbd03dea78787d8;
      expv[49] = 181'h1cdcdc46ad241e4d3eb26e21407a0f80566946b702aedd;
      expv[50] = 181'h1197cfe07d46d64a91086eab337eeedb0b0d5e3bf8deed;
      expv[51] = 181'h17e6c22d31c1f209623140d9193c940b10757ff1b0ce0f;
      expv[52] = 181'h0d311b2daa0f9e81b176745029489948e9b7fc79598364;
      expv[53] = 181'h0a3cdd6e8d883bd1f4e99ab84392d58ecafe799994ae61;
      expv[54] = 181'h09b5fe86fe1ab3aa81b667ee3c16c3b8039bebc059db0d;
      expv[55] = 181'h05bab0a634a5a55d8b8c4faabe3e8eeff9eba417735649;
      expv[56] = 181'h1fa80455302c765115e99c746e0e0d13e61a15529a39fa;
      expv[57] = 181'h0d5e6bbf587777e7419f50d093e4f3aee0896013a55bc4;
      expv[58] = 181'h137df590221dac53739ef7ceea9ca9cbba98dad6d30cb6;
      expv[59] = 181'h140ad7de6a88126e70493b3ce2e9eb22dadbeed57d3b79;
      expv[60] = 181'h04120a817630aea7fbb63c551b3e2a1d874e2c3712820e;
      expv[61] = 181'h02a0a69e602fb98ff077e1981b76d33111cfa65643a636;
      expv[62] = 181'h153c70807fc02d1a0fadabe1aa207b0ad94fb2d7eeec6b;
      expv[63] = 181'h0bdae3e20e7bdff20519d09cd31c3bfa5babb5b905e8ca;
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
