// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 109;
  localparam OW = 109;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  tlul_cmd_intg_gen dut (
    .tl_i(in_vec[108:0]),
    .tl_o(out_vec[108:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 109'h06cc112b623223ecaae912b0702f;
    stim[1] = 109'h0cd3528b7784a677f4e62a3c16d8;
    stim[2] = 109'h0abfe1432d7acf36492ce6e86fd4;
    stim[3] = 109'h0fdf783397f7da054adef4ce9a26;
    stim[4] = 109'h14022af0a1483413d57319847d2c;
    stim[5] = 109'h1069e742bd804065df4e62d8b1e5;
    stim[6] = 109'h1a54c6b536c13d4c619d24e9b266;
    stim[7] = 109'h1c1cf4cae8b373987cb41f3c5b6a;
    stim[8] = 109'h0092e08308ca3a5fa4fa38f77bad;
    stim[9] = 109'h0ae61ea758c3b95864b41f1219e3;
    stim[10] = 109'h1b72953a2c14cfdfe67494404bfa;
    stim[11] = 109'h1d165e5ec849d248f6a6eabe39d5;
    stim[12] = 109'h172b0005ccbd2a749173fb1e2b63;
    stim[13] = 109'h15d255a6265c7a1ab2374fa32058;
    stim[14] = 109'h0c64c92c6b3a2eee511003ca4faf;
    stim[15] = 109'h11f481e18a253e6c2c2ff1a81fee;
    stim[16] = 109'h177c7c5f0b9e457b2c0e9efbe5f6;
    stim[17] = 109'h01cfafa338ec3fc2dea67634fdc2;
    stim[18] = 109'h0f6c195a5431776dc181c595a6f3;
    stim[19] = 109'h16ccea5f290c30ed137f8e02a6e8;
    stim[20] = 109'h08112756d5178be2761ace826243;
    stim[21] = 109'h1170c251f39811cd71141a9221c5;
    stim[22] = 109'h03b6e8bf753aa0b1851625162dae;
    stim[23] = 109'h143c1e3122fc6a325ca040c4e632;
    stim[24] = 109'h03904522fb94392eb383fa50d07c;
    stim[25] = 109'h16e4a90c1103182c74f94659bf18;
    stim[26] = 109'h1453462198e2f2d932795a7ac638;
    stim[27] = 109'h108dc154be821f13f2f4164234b8;
    stim[28] = 109'h01b77657f485e64f37260fa47b16;
    stim[29] = 109'h1ff738b8895332e4c381fdbcbdb6;
    stim[30] = 109'h1f3aad06a8c6624aec1d649c3c46;
    stim[31] = 109'h14167cbc7e2576e8d39e0198a883;
    stim[32] = 109'h03f41a91c080181033a89e0c1797;
    stim[33] = 109'h067cb4821b824de8e0b3124976bc;
    stim[34] = 109'h1734f7e55f9b2d2d350ba7f53556;
    stim[35] = 109'h184a0c0f7fb8c71e47a212b49c2f;
    stim[36] = 109'h0ac69ddee2a07b57e85cd7ce34c1;
    stim[37] = 109'h00f6b2d490881283b0e58a203293;
    stim[38] = 109'h175d9897da9487909767d9689d6a;
    stim[39] = 109'h13b19b7a299752d379d395ef0ae9;
    stim[40] = 109'h135c04ae0da939c31f87105d7847;
    stim[41] = 109'h0a906ad63eedf0b1e591a0ad8b30;
    stim[42] = 109'h0a63eacd1d8132372234f495473e;
    stim[43] = 109'h166a5d2a88ca9978e476f540986a;
    stim[44] = 109'h0b160996cf6acb62a5ab5c25c4b8;
    stim[45] = 109'h177aa81ed985b281609d87fc25f2;
    stim[46] = 109'h0415666445c077d642c3c16a00a2;
    stim[47] = 109'h033f7dc26505dddacbbd07ae7742;
    stim[48] = 109'h14d5af62eb8ef0ef0d758d7ad10d;
    stim[49] = 109'h07942195a3539ff30e0d94c3e6d9;
    stim[50] = 109'h0d626872536e37237a5626ef67cd;
    stim[51] = 109'h068a771a5ddde55b9b59534dfd60;
    stim[52] = 109'h08dafc4bd52b0b60092cfcbe5ea4;
    stim[53] = 109'h1a7b351ec7955aefcf78559db495;
    stim[54] = 109'h00fe6998920b329b2c424e879b5f;
    stim[55] = 109'h0fdbfd369fb07c4cf8bd3c1e4630;
    stim[56] = 109'h03f1d87fce4443967e88a5c64860;
    stim[57] = 109'h1e4cda041caa01dad73f3a513296;
    stim[58] = 109'h09508b98b9de0adc17cde30170a2;
    stim[59] = 109'h1ce56db9ed9b0431010ad9e3b21c;
    stim[60] = 109'h1b7901860743d56caa3fc2672d78;
    stim[61] = 109'h0211ac351d2715ff1584d66856b1;
    stim[62] = 109'h11533742d9a02d38e02aeb0745cf;
    stim[63] = 109'h0bb34d457ae45447b4d6f5f041f6;
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
      expv[0] = 109'h06cc112b623223ecaae912b00b9f;
      expv[1] = 109'h0cd3528b7784a677f4e62a3c1f6c;
      expv[2] = 109'h0abfe1432d7acf36492ce6e81100;
      expv[3] = 109'h0fdf783397f7da054adef4ce8164;
      expv[4] = 109'h14022af0a1483413d57319847c40;
      expv[5] = 109'h1069e742bd804065df4e62d8ffeb;
      expv[6] = 109'h1a54c6b536c13d4c619d24e98a78;
      expv[7] = 109'h1c1cf4cae8b373987cb41f3c5d8e;
      expv[8] = 109'h0092e08308ca3a5fa4fa38f76f21;
      expv[9] = 109'h0ae61ea758c3b95864b41f121dc7;
      expv[10] = 109'h1b72953a2c14cfdfe6749440559c;
      expv[11] = 109'h1d165e5ec849d248f6a6eabe435d;
      expv[12] = 109'h172b0005ccbd2a749173fb1e1ee3;
      expv[13] = 109'h15d255a6265c7a1ab2374fa3280c;
      expv[14] = 109'h0c64c92c6b3a2eee511003ca0347;
      expv[15] = 109'h11f481e18a253e6c2c2ff1a85842;
      expv[16] = 109'h177c7c5f0b9e457b2c0e9efbc948;
      expv[17] = 109'h01cfafa338ec3fc2dea67634a64c;
      expv[18] = 109'h0f6c195a5431776dc181c59581f5;
      expv[19] = 109'h16ccea5f290c30ed137f8e02920e;
      expv[20] = 109'h08112756d5178be2761ace825883;
      expv[21] = 109'h1170c251f39811cd71141a92198b;
      expv[22] = 109'h03b6e8bf753aa0b1851625163ee2;
      expv[23] = 109'h143c1e3122fc6a325ca040c4a4e6;
      expv[24] = 109'h03904522fb94392eb383fa50dd9e;
      expv[25] = 109'h16e4a90c1103182c74f94659fa0e;
      expv[26] = 109'h1453462198e2f2d932795a7aef72;
      expv[27] = 109'h108dc154be821f13f2f416422a6e;
      expv[28] = 109'h01b77657f485e64f37260fa414c0;
      expv[29] = 109'h1ff738b8895332e4c381fdbc81ac;
      expv[30] = 109'h1f3aad06a8c6624aec1d649c0618;
      expv[31] = 109'h14167cbc7e2576e8d39e0198b90b;
      expv[32] = 109'h03f41a91c080181033a89e0c5ea7;
      expv[33] = 109'h067cb4821b824de8e0b31249017a;
      expv[34] = 109'h1734f7e55f9b2d2d350ba7f55a34;
      expv[35] = 109'h184a0c0f7fb8c71e47a212b4f761;
      expv[36] = 109'h0ac69ddee2a07b57e85cd7ce215b;
      expv[37] = 109'h00f6b2d490881283b0e58a200687;
      expv[38] = 109'h175d9897da9487909767d968b590;
      expv[39] = 109'h13b19b7a299752d379d395ef2de9;
      expv[40] = 109'h135c04ae0da939c31f87105d6855;
      expv[41] = 109'h0a906ad63eedf0b1e591a0adf210;
      expv[42] = 109'h0a63eacd1d8132372234f49568e2;
      expv[43] = 109'h166a5d2a88ca9978e476f540da78;
      expv[44] = 109'h0b160996cf6acb62a5ab5c259040;
      expv[45] = 109'h177aa81ed985b281609d87fc623a;
      expv[46] = 109'h0415666445c077d642c3c16a5204;
      expv[47] = 109'h033f7dc26505dddacbbd07ae56d8;
      expv[48] = 109'h14d5af62eb8ef0ef0d758d7ac045;
      expv[49] = 109'h07942195a3539ff30e0d94c3be19;
      expv[50] = 109'h0d626872536e37237a5626ef0e83;
      expv[51] = 109'h068a771a5ddde55b9b59534dc2c4;
      expv[52] = 109'h08dafc4bd52b0b60092cfcbe41cc;
      expv[53] = 109'h1a7b351ec7955aefcf78559df545;
      expv[54] = 109'h00fe6998920b329b2c424e87d833;
      expv[55] = 109'h0fdbfd369fb07c4cf8bd3c1e57da;
      expv[56] = 109'h03f1d87fce4443967e88a5c67e32;
      expv[57] = 109'h1e4cda041caa01dad73f3a5177aa;
      expv[58] = 109'h09508b98b9de0adc17cde3010082;
      expv[59] = 109'h1ce56db9ed9b0431010ad9e3943a;
      expv[60] = 109'h1b7901860743d56caa3fc267515c;
      expv[61] = 109'h0211ac351d2715ff1584d6685717;
      expv[62] = 109'h11533742d9a02d38e02aeb0766d3;
      expv[63] = 109'h0bb34d457ae45447b4d6f5f05742;
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
