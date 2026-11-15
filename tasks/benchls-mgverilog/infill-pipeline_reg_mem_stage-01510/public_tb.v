// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 106;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01510 dut (
    .clk(clk),
    .rst(in_vec[106:106]),
    .RegWrite_In(in_vec[105:105]),
    .MemWrite_In(in_vec[104:104]),
    .MemRead_In(in_vec[103:103]),
    .PC_In(in_vec[102:71]),
    .ALUOut_In(in_vec[70:39]),
    .DataBusB_In(in_vec[38:7]),
    .AddrC_In(in_vec[6:2]),
    .MemtoReg_In(in_vec[1:0]),
    .RegWrite_Out(out_vec[105:105]),
    .MemWrite_Out(out_vec[104:104]),
    .MemRead_Out(out_vec[103:103]),
    .PC_Out(out_vec[102:71]),
    .ALUOut_Out(out_vec[70:39]),
    .DataBusB_Out(out_vec[38:7]),
    .AddrC_Out(out_vec[6:2]),
    .MemtoReg_Out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h6632f3cdac9378019094f6ca230;
    stim[1] = 107'h61cf1d73334fb23660894c7087e;
    stim[2] = 107'h1ab0f48433c272a525773a992ef;
    stim[3] = 107'h28850ac723cdbbbd1844da2d4be;
    stim[4] = 107'h0bbc5e13021acdba7db883a99ec;
    stim[5] = 107'h3db3236627d448e9e385cfcbf82;
    stim[6] = 107'h198731fed353060a20c86e41d46;
    stim[7] = 107'h0eb98919fa87dd8ac850e2bcf13;
    stim[8] = 107'h020ee38cad2e1da28582c640624;
    stim[9] = 107'h1c4c67d3af27b1bce01dfffbe7f;
    stim[10] = 107'h35d28d7b0cfb46ec3d34bddbc83;
    stim[11] = 107'h2b5409022f2730042d91cf65f71;
    stim[12] = 107'h1d54948547a872c974aa19753a9;
    stim[13] = 107'h3ad354732cb5758295a49afcfda;
    stim[14] = 107'h1b9296b58bf238e96daccd8558e;
    stim[15] = 107'h2066bb5728d7da9f53fe26bfc2a;
    stim[16] = 107'h15990e661a1d399d5db96641046;
    stim[17] = 107'h08ba42143371c7293c20611238b;
    stim[18] = 107'h112530a1042c25fa648491c1f46;
    stim[19] = 107'h30ae65fa1bbf81309d805bcbee0;
    stim[20] = 107'h1d71f77643b71ad4c4edf1bbd26;
    stim[21] = 107'h3b626a15a772797fc3b7d5fd8e9;
    stim[22] = 107'h0272ada0ad40d8ca237eb3ce542;
    stim[23] = 107'h2b81f92b78f70806af38ac7f87d;
    stim[24] = 107'h122fdbd683d9eeb932896b904f0;
    stim[25] = 107'h046bc2cdb61eaec2db0497a36a9;
    stim[26] = 107'h3ded047e2b6fb5999df38f4dcb8;
    stim[27] = 107'h15241596c23e3b65921569ab6c2;
    stim[28] = 107'h0cacf8333e17640cdcf44410bab;
    stim[29] = 107'h3f5584d82d95e902314ae18e68b;
    stim[30] = 107'h180bc57c7cd5180845e318eaba3;
    stim[31] = 107'h16f35082df104069a216e2a4c09;
    stim[32] = 107'h385f7a566425b55fdc20d5ca574;
    stim[33] = 107'h1eb9e81a468c30eaeff0d3f18a4;
    stim[34] = 107'h0febc392c465ab9e1f9cfa34c68;
    stim[35] = 107'h3abf8a91fa3f4b9ba496d931cde;
    stim[36] = 107'h281df57d9f110ce51867faab33f;
    stim[37] = 107'h2d7eef6cdd1393b60413b6f0601;
    stim[38] = 107'h5cfcc235ec2b145c058120260a3;
    stim[39] = 107'h2d618b230effec08998c35a3832;
    stim[40] = 107'h2fcf1b3c50208415a986d02f401;
    stim[41] = 107'h2319f91e5d9bfa3056bbb27af47;
    stim[42] = 107'h07f71807e036b7775e726384eb1;
    stim[43] = 107'h19130888326350b753d0bc1452f;
    stim[44] = 107'h0a18ff6fb982ba949252a9d3ab6;
    stim[45] = 107'h21088103a0031ab0ce47b23ddc4;
    stim[46] = 107'h04fb129c45e36f1dc603603d26c;
    stim[47] = 107'h249a56ec64138e4e78aeb7100d2;
    stim[48] = 107'h2ecad297917f057f787c083319d;
    stim[49] = 107'h17199f3136a9c4247f335e02c41;
    stim[50] = 107'h2382cb3851bb1658de8bd5dc09d;
    stim[51] = 107'h234945e4204c382d03267114600;
    stim[52] = 107'h27aaa7dc42f5bef375dfa8c983e;
    stim[53] = 107'h090c91977cb59eaed3a9e7d1a7a;
    stim[54] = 107'h2679da369e6825444404ad98d3d;
    stim[55] = 107'h215acf4c5f804f2db6d9838fd3d;
    stim[56] = 107'h21e83d52dec6765af266b7b1ffa;
    stim[57] = 107'h1dbd6ef5e5ffbd1ed30d17e08ec;
    stim[58] = 107'h3c28e7f849b4fb864bf6fa71da5;
    stim[59] = 107'h3cfeb0a78ab62464fc856059ef7;
    stim[60] = 107'h0ad099bb28691ab56e1bb27d760;
    stim[61] = 107'h3588286902723ac1731116db6c4;
    stim[62] = 107'h0e27a60fd7c5be9589374158e24;
    stim[63] = 107'h29dcbd82d64f04272c6197d7b8a;
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
      expv[0] = 106'h000000000000000000000000000;
      expv[1] = 106'h000000000000000000000000000;
      expv[2] = 106'h000000000000000000000000000;
      expv[3] = 106'h1ab0f48433c272a525773a992ef;
      expv[4] = 106'h28850ac723cdbbbd1844da2d4be;
      expv[5] = 106'h0bbc5e13021acdba7db883a99ec;
      expv[6] = 106'h3db3236627d448e9e385cfcbf82;
      expv[7] = 106'h198731fed353060a20c86e41d46;
      expv[8] = 106'h0eb98919fa87dd8ac850e2bcf13;
      expv[9] = 106'h020ee38cad2e1da28582c640624;
      expv[10] = 106'h1c4c67d3af27b1bce01dfffbe7f;
      expv[11] = 106'h35d28d7b0cfb46ec3d34bddbc83;
      expv[12] = 106'h2b5409022f2730042d91cf65f71;
      expv[13] = 106'h1d54948547a872c974aa19753a9;
      expv[14] = 106'h3ad354732cb5758295a49afcfda;
      expv[15] = 106'h1b9296b58bf238e96daccd8558e;
      expv[16] = 106'h2066bb5728d7da9f53fe26bfc2a;
      expv[17] = 106'h15990e661a1d399d5db96641046;
      expv[18] = 106'h08ba42143371c7293c20611238b;
      expv[19] = 106'h112530a1042c25fa648491c1f46;
      expv[20] = 106'h30ae65fa1bbf81309d805bcbee0;
      expv[21] = 106'h1d71f77643b71ad4c4edf1bbd26;
      expv[22] = 106'h3b626a15a772797fc3b7d5fd8e9;
      expv[23] = 106'h0272ada0ad40d8ca237eb3ce542;
      expv[24] = 106'h2b81f92b78f70806af38ac7f87d;
      expv[25] = 106'h122fdbd683d9eeb932896b904f0;
      expv[26] = 106'h046bc2cdb61eaec2db0497a36a9;
      expv[27] = 106'h3ded047e2b6fb5999df38f4dcb8;
      expv[28] = 106'h15241596c23e3b65921569ab6c2;
      expv[29] = 106'h0cacf8333e17640cdcf44410bab;
      expv[30] = 106'h3f5584d82d95e902314ae18e68b;
      expv[31] = 106'h180bc57c7cd5180845e318eaba3;
      expv[32] = 106'h16f35082df104069a216e2a4c09;
      expv[33] = 106'h385f7a566425b55fdc20d5ca574;
      expv[34] = 106'h1eb9e81a468c30eaeff0d3f18a4;
      expv[35] = 106'h0febc392c465ab9e1f9cfa34c68;
      expv[36] = 106'h3abf8a91fa3f4b9ba496d931cde;
      expv[37] = 106'h281df57d9f110ce51867faab33f;
      expv[38] = 106'h000000000000000000000000000;
      expv[39] = 106'h000000000000000000000000000;
      expv[40] = 106'h2d618b230effec08998c35a3832;
      expv[41] = 106'h2fcf1b3c50208415a986d02f401;
      expv[42] = 106'h2319f91e5d9bfa3056bbb27af47;
      expv[43] = 106'h07f71807e036b7775e726384eb1;
      expv[44] = 106'h19130888326350b753d0bc1452f;
      expv[45] = 106'h0a18ff6fb982ba949252a9d3ab6;
      expv[46] = 106'h21088103a0031ab0ce47b23ddc4;
      expv[47] = 106'h04fb129c45e36f1dc603603d26c;
      expv[48] = 106'h249a56ec64138e4e78aeb7100d2;
      expv[49] = 106'h2ecad297917f057f787c083319d;
      expv[50] = 106'h17199f3136a9c4247f335e02c41;
      expv[51] = 106'h2382cb3851bb1658de8bd5dc09d;
      expv[52] = 106'h234945e4204c382d03267114600;
      expv[53] = 106'h27aaa7dc42f5bef375dfa8c983e;
      expv[54] = 106'h090c91977cb59eaed3a9e7d1a7a;
      expv[55] = 106'h2679da369e6825444404ad98d3d;
      expv[56] = 106'h215acf4c5f804f2db6d9838fd3d;
      expv[57] = 106'h21e83d52dec6765af266b7b1ffa;
      expv[58] = 106'h1dbd6ef5e5ffbd1ed30d17e08ec;
      expv[59] = 106'h3c28e7f849b4fb864bf6fa71da5;
      expv[60] = 106'h3cfeb0a78ab62464fc856059ef7;
      expv[61] = 106'h0ad099bb28691ab56e1bb27d760;
      expv[62] = 106'h3588286902723ac1731116db6c4;
      expv[63] = 106'h0e27a60fd7c5be9589374158e24;
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
