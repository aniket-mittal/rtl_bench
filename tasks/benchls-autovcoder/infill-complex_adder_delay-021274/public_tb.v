// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021274 dut (
    .clk(clk),
    .reset_x(in_vec[149:149]),
    .enb(in_vec[148:148]),
    .In1_re(in_vec[147:111]),
    .In1_im(in_vec[110:74]),
    .In2_re(in_vec[73:37]),
    .In2_im(in_vec[36:0]),
    .Out1_re(out_vec[73:37]),
    .Out1_im(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h21cbc1fda7a728f97d0b9c56d80935dda931bf;
    stim[1] = 150'h2ad96229c2aee796dfdf1d5f0fafd7828e50bb;
    stim[2] = 150'h04f646485abd3ca535affbdf9148ec5f869e1b;
    stim[3] = 150'h1c1cf457de0b0d6d2780fd33cbc9675c6b9886;
    stim[4] = 150'h052088c746e4b2b0ca97112b6a05218e5befd6;
    stim[5] = 150'h15f5612acd494dc5498eb109defd98e2b7043c;
    stim[6] = 150'h0769234cafe38eb2cbb9121358c07725bf247f;
    stim[7] = 150'h175587d1ed50beff23d423988e59cf05b7a0a6;
    stim[8] = 150'h125f7865974e78925542955eb6c86d38fc2a43;
    stim[9] = 150'h166f2cd4a5966e396a433d9b1eef9d94988c15;
    stim[10] = 150'h12cf04ed0a989e4b25086f645d02517564ca30;
    stim[11] = 150'h19895410be1143e93a3649dcea691410e5710a;
    stim[12] = 150'h13a5ec219d9d4982e9aacca34980f8e47fd9fb;
    stim[13] = 150'h1ca1d20477b705d2eb1f02a32a8b753d8273f4;
    stim[14] = 150'h10e0e7d2b9d55f2bc5d840dbe409e0d3b73518;
    stim[15] = 150'h0b95e0de3c5749606fa27ef48032c179ada113;
    stim[16] = 150'h11b4c9c7c59cfbe37ac46a7b08233211c76dda;
    stim[17] = 150'h07caa1464116baa0f5df861f03bb1484f5ad46;
    stim[18] = 150'h0b292cc9138f7502c98fc20ae1e4c0743a19b1;
    stim[19] = 150'h11a7b532da8ebd6bec87f57c941ae23324a6d5;
    stim[20] = 150'h1fe428b4e5844638ee8e53a7dbee623eeb3e4e;
    stim[21] = 150'h0e47c87eaaf81f237f98d50cddaca1dced736d;
    stim[22] = 150'h2495e0431860e556d9bd0b1bc2d28ea1e74940;
    stim[23] = 150'h1e525c98148b4f0a7e1a611e1620b78588a040;
    stim[24] = 150'h0ef455689c417e30b88e4056c2cd64f206dc7f;
    stim[25] = 150'h18e0297d02fc8c06767d1455aeae8cb59a7df7;
    stim[26] = 150'h01c3ee486d6c758c0e9eb6c82acf710b8118fb;
    stim[27] = 150'h0d18d044b543ec94c2405e929233d6b05500b3;
    stim[28] = 150'h114f4b57ba3e377dd8355f9430a31d094dda6a;
    stim[29] = 150'h0a76dfb62e12c8105f3d7bd95e9c9d42f487f1;
    stim[30] = 150'h03809214d63b32c515dddbee94be08d9c80d54;
    stim[31] = 150'h10d99a8e0b5b0b8386b26255f752082e3339e3;
    stim[32] = 150'h1947add80e2692be05c019b2dcd53639adf41a;
    stim[33] = 150'h15860299d1823bf1e676de5a79777cb5b49b70;
    stim[34] = 150'h172083e2452bedb6114a5f6799083eff5c161b;
    stim[35] = 150'h00e862cc1f92d1e86a3c0fde15340776322aed;
    stim[36] = 150'h137b7739da3159376aa6641c1bd7acdc03d5fa;
    stim[37] = 150'h0d575aa690475a5f7b5e58a745ea304111419c;
    stim[38] = 150'h10ab4ff4a59cb4b19f4ef713ec4badf6a0a52c;
    stim[39] = 150'h0eb891b9f77aa8332902ab1bfc143a721b67ce;
    stim[40] = 150'h0d3acb3be0fbcd50a44115b07a76d6781784c4;
    stim[41] = 150'h1b0069d66bb7dfe8f4339976ed14123f290fa3;
    stim[42] = 150'h104330090bf7694ab312cc88afeabf3f29134b;
    stim[43] = 150'h1b6021f3819afb69b1f13f4cce532e968ef532;
    stim[44] = 150'h1eb899f3f59109e6f1a950ded28ab8553e11f5;
    stim[45] = 150'h0c9b2a41751b2543447fd7fa10260539c8cdad;
    stim[46] = 150'h182b6f9939c5d1cca4ad71294cea039e87f19e;
    stim[47] = 150'h1707be74fc76ca7d77d7206acb7645d1bfda96;
    stim[48] = 150'h0ff253e7022c16ca41eb646bbf2155e5a4bd7f;
    stim[49] = 150'h1f5285bc9524b1448bd17d7dcf09f9d51fb7c6;
    stim[50] = 150'h14b9fef85acac11e0e10dd732cb7ec53137a14;
    stim[51] = 150'h1a03067fd6146856a4bac4bdabbe2d366ca12b;
    stim[52] = 150'h10bad9572f69a54a34e42038b4ebb52a26d199;
    stim[53] = 150'h10230a4c45bac420ba8e52961e84376da735cb;
    stim[54] = 150'h0dab892fe23adb7ca12e7e554d16f2f361d434;
    stim[55] = 150'h0c9aa74e8514a4cefff7c8561b5141c6291130;
    stim[56] = 150'h1e815c48a02c98fc9aba98122bbfc3ea10b418;
    stim[57] = 150'h14cc69a12f68a74eb7f378e1de85a3d5628cc4;
    stim[58] = 150'h0de5333fb32c7b09a993c5937e0b7ba6853ded;
    stim[59] = 150'h0c06345c6a8e82f62359638d2ca7b1d730c842;
    stim[60] = 150'h147844f8d13108b8711321044e08e64c853934;
    stim[61] = 150'h075475ab09aac20103060679a2c0fbee43a196;
    stim[62] = 150'h1144ed4d2688b10d10e2d4378b768ebc742741;
    stim[63] = 150'h00471b64695eff9cd2e575bef518f69b0f013d;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h2b6588a70abb9e5b7f7;
      expv[2] = 74'h13d919216af4f294d6b;
      expv[3] = 74'h3073d15f782c35b49e0;
      expv[4] = 74'h24555fd9b008917cb2b;
      expv[5] = 74'h27a8c167cb9afdceae9;
      expv[6] = 74'h08b52b22971c663b72a;
      expv[7] = 74'h0866bd378cd1276cd31;
      expv[8] = 74'h0bb76a7bf82a3dc35f6;
      expv[9] = 74'h03129ebf1d2d48a84d3;
      expv[10] = 74'h3f15c5a3223bc2b5557;
      expv[11] = 74'h2d1b96131d5c65f18bd;
      expv[12] = 74'h33357f2d07b63462b74;
      expv[13] = 74'h1f517ca9ec6a5f494c2;
      expv[14] = 74'h33add1f39ca954d656a;
      expv[15] = 74'h326541b98f6a60f5100;
      expv[16] = 74'h0ae0e55fb4812b013c9;
      expv[17] = 74'h25d2359b377c06fab51;
      expv[18] = 74'h334c63a6815ef08203d;
      expv[19] = 74'h0d46854d9d5c12268fb;
      expv[20] = 74'h3ee86c1544344b2e278;
      expv[21] = 74'h1e599fb990046b41e34;
      expv[22] = 74'h3791fecb47a7840f4bd;
      expv[23] = 74'h39497260522d3c29f86;
      expv[24] = 74'h21e337047a7e514ce63;
      expv[25] = 74'h09928756156a88a3ddf;
      expv[26] = 74'h1855140c9c7d2fd819e;
      expv[27] = 74'h05a89bfdbddb0bfae87;
      expv[28] = 74'h16828849d1c4379f404;
      expv[29] = 74'h3fd4c1e2e81bb51f239;
      expv[30] = 74'h23fb8b5d88bd5ff1fe1;
      expv[31] = 74'h195fad425d3cc2ebc16;
      expv[32] = 74'h0b4416d5591d2e2bb53;
      expv[33] = 74'h17b33834996c8aa6db7;
      expv[34] = 74'h0a67b7208a7b1221fc2;
      expv[35] = 74'h299804c1003b3d630aa;
      expv[36] = 74'h33e45677eab55a9f0c4;
      expv[37] = 74'h1b9f2c57bbeb29bb4d1;
      expv[38] = 74'h28ef019011409303dcd;
      expv[39] = 74'h2a5385ac96ca0ad6f6c;
      expv[40] = 74'h245c6bb43cce9f4ce3c;
      expv[41] = 74'h1b72e61e69bee9ae238;
      expv[42] = 74'h3aa42ef56f0197bbc67;
      expv[43] = 74'h1a4912ccb05fe037fc7;
      expv[44] = 74'h0ed734b5092d908b19c;
      expv[45] = 74'h077a962e7ff1e8ee314;
      expv[46] = 74'h35bbab8d909c9b13b20;
      expv[47] = 74'h33318ea290151274f93;
      expv[48] = 74'h31cffc536d0d7726b10;
      expv[49] = 74'h2f50c3a9b8efe10fd8a;
      expv[50] = 74'h2abfd8d208c85673b4a;
      expv[51] = 74'h35e34ccad716d292342;
      expv[52] = 74'h2f3740189e79fbf2e64;
      expv[53] = 74'h028fb47fd03db2f003c;
      expv[54] = 74'h1bd786a7ca624865e16;
      expv[55] = 74'h1793ff2257c96daf5c8;
      expv[56] = 74'h1f2ed30ac2293e65c79;
      expv[57] = 74'h3cb2c940b9e13e46214;
      expv[58] = 74'h2f22eae726ef424f728;
      expv[59] = 74'h27a6ef5a0477620159a;
      expv[60] = 74'h096f31cb9f01790a908;
      expv[61] = 74'h0f621b8cb50fd0579f5;
      expv[62] = 74'h3723fa1528878c87d6c;
      expv[63] = 74'h2e5fe6490c67c5b5bfa;
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
