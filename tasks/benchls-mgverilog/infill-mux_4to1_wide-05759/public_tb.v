// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05759 dut (
    .in0(in_vec[129:98]),
    .in1(in_vec[97:66]),
    .in2(in_vec[65:34]),
    .in3(in_vec[33:2]),
    .select(in_vec[1:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h3f7a201b277a8aff5d2c3adf530bd455c;
    stim[1] = 130'h1d2940769d53f6629bd32bc2b67551545;
    stim[2] = 130'h13d436d7fb240f35ef45f04dbcf526d4a;
    stim[3] = 130'h07801d4f9e9a8136aabecd461db3faa90;
    stim[4] = 130'h201b4f8af000847d4c2116192e7c64867;
    stim[5] = 130'h175b26fe17897fd5b0f813e51b9ed64bc;
    stim[6] = 130'h2354cb6dfe9e1218f01f343b560e8bba3;
    stim[7] = 130'h1eae9212dde35feb05f53a1b0e7138f5c;
    stim[8] = 130'h28ff7e87191a4621ee356f2659fba7bc0;
    stim[9] = 130'h37b15a658a82cbf8ea6e9b130f40f6494;
    stim[10] = 130'h3409889778e86c3b1e0a087051a47421c;
    stim[11] = 130'h1fc780e05b3557b23689fde820a58783f;
    stim[12] = 130'h318142700817881520c84798292e7273c;
    stim[13] = 130'h3e118acf423206edf200fc2a90652ccd0;
    stim[14] = 130'h1d425b40b897d507f4b6f35ab76138a30;
    stim[15] = 130'h1dca7565749f361c93b722e325ee3f181;
    stim[16] = 130'h35ddbd9f5e3e80c2f51c6d74711a77008;
    stim[17] = 130'h217fb7962be3000d2c0f0860b8d631ecc;
    stim[18] = 130'h0239d88827f527058898edfd3249276fe;
    stim[19] = 130'h175da8f943292b42628a8442fd1a687a1;
    stim[20] = 130'h0c322d8ca048258a0dea36ef395fa4f87;
    stim[21] = 130'h1f10886fd68d7b7ba248767a7d0f0e410;
    stim[22] = 130'h2c3310454cf0b4531373be07a3b447341;
    stim[23] = 130'h2b2829aef146439ebdcae8a1e7830f1ea;
    stim[24] = 130'h2b3dc7d33dcb25f8b20a2171f375b5ad4;
    stim[25] = 130'h1c84a62ee1ab33c811a0b99f306847fc3;
    stim[26] = 130'h07c5793165325739c8f9649e66c6f27f7;
    stim[27] = 130'h099eb4a965e7598c6af908cff19c17fad;
    stim[28] = 130'h129fc9f1afab0446f2a261810d2715424;
    stim[29] = 130'h1096b36cedfecdc1158dfa84f7bd5604f;
    stim[30] = 130'h32780d09c68697744d302dc9dd86ba842;
    stim[31] = 130'h132aed2d75fc25f45d72844723b4b9a17;
    stim[32] = 130'h1dc8f9c1b6b487fa67f1c9bf4e977a954;
    stim[33] = 130'h1fa8db2e779897a0d665e703449c9083b;
    stim[34] = 130'h136367e10e7c11a95d10c68104cb21c25;
    stim[35] = 130'h3fe3f0aa847075d7e0e0e910f8739fc38;
    stim[36] = 130'h16f9791ae117590def951c9959bc1a954;
    stim[37] = 130'h0d9e98dfd386ef170668308fe12ac9d0d;
    stim[38] = 130'h25129539dcbf08358ede128588d40d51e;
    stim[39] = 130'h003a339cd511885f22ed638f2ad4dfd79;
    stim[40] = 130'h08291296c57079ea38930bb1b0970cdc6;
    stim[41] = 130'h2c09e45320e8945305456f95bcee1d946;
    stim[42] = 130'h0e0a0f6c6215caf05e24d1bdb236e81d6;
    stim[43] = 130'h3fec154b1017f80bd65ab704df8fc1506;
    stim[44] = 130'h34f26529b133db8e995a637d8a127b7b8;
    stim[45] = 130'h0611d7dfec2c944aaea8ab38af29cde05;
    stim[46] = 130'h0e55ab6014d2533dcce41e7812ab436af;
    stim[47] = 130'h35159caef8c1cbcc28153ca96b61fc556;
    stim[48] = 130'h00107d8ecb30bea5375a675e4b17af4df;
    stim[49] = 130'h1ec43d0e7bda39f0be6e16fc012ff69ac;
    stim[50] = 130'h3b305b62f07b0b4b96b5d017ba84322d1;
    stim[51] = 130'h2875b7e6ead5e7049cc2bd7c18aab336c;
    stim[52] = 130'h06aeba91753aaa847603c604c1866d08c;
    stim[53] = 130'h2370930bbcab2c78847bbcd53b7c50e08;
    stim[54] = 130'h13baf52a41709cbfd994079472b871bc4;
    stim[55] = 130'h0a864fc43e781ae28ae6cf19d67b534ad;
    stim[56] = 130'h00ee9f186c1b60589a192cc4b36f742a0;
    stim[57] = 130'h1068ef986b5df87a592b76d30a12c1f73;
    stim[58] = 130'h26309eea2837dfb582c5dc3dea0519637;
    stim[59] = 130'h3f55d7324d6bf86ab27f6a63d5f1df93a;
    stim[60] = 130'h12064dc81ad3a64438437d2347636031d;
    stim[61] = 130'h2d99a7d78cad9410129eadf85d76c1279;
    stim[62] = 130'h320c23d65729c7939528540b39587c81b;
    stim[63] = 130'h37226bbe1ac46dae46652362bc7c6c65e;
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
      expv[0] = 32'hfde8806c;
      expv[1] = 32'h754fd98a;
      expv[2] = 32'hbd17c136;
      expv[3] = 32'h1e00753e;
      expv[4] = 32'hb9f19219;
      expv[5] = 32'h5d6c9bf8;
      expv[6] = 32'h583a2ee8;
      expv[7] = 32'h7aba484b;
      expv[8] = 32'ha3fdfa1c;
      expv[9] = 32'hdec56996;
      expv[10] = 32'hd026225d;
      expv[11] = 32'h82961e0f;
      expv[12] = 32'hc60509c0;
      expv[13] = 32'hf8462b3d;
      expv[14] = 32'h75096d02;
      expv[15] = 32'hd27cd872;
      expv[16] = 32'hd776f67d;
      expv[17] = 32'h85fede58;
      expv[18] = 32'h2263b7f4;
      expv[19] = 32'h0ca4ad09;
      expv[20] = 32'he57e93e1;
      expv[21] = 32'h7c4221bf;
      expv[22] = 32'h33c2d14c;
      expv[23] = 32'hf72ba287;
      expv[24] = 32'hacf71f4c;
      expv[25] = 32'hc1a11ff0;
      expv[26] = 32'h9b1bc9fd;
      expv[27] = 32'h979d6631;
      expv[28] = 32'h4a7f27c6;
      expv[29] = 32'hdef55813;
      expv[30] = 32'h34c0b727;
      expv[31] = 32'h8ed2e685;
      expv[32] = 32'h7723e706;
      expv[33] = 32'h1272420e;
      expv[34] = 32'h39f046a5;
      expv[35] = 32'hff8fc2aa;
      expv[36] = 32'h5be5e46b;
      expv[37] = 32'h4e1bbc5c;
      expv[38] = 32'h3b784a16;
      expv[39] = 32'h5446217c;
      expv[40] = 32'he24c2ec6;
      expv[41] = 32'h1515be56;
      expv[42] = 32'h789346f6;
      expv[43] = 32'h596adc13;
      expv[44] = 32'hd3c994a6;
      expv[45] = 32'hb0b2512a;
      expv[46] = 32'h4aad0dab;
      expv[47] = 32'ha054f2a5;
      expv[48] = 32'h2c5ebd37;
      expv[49] = 32'h7b10f439;
      expv[50] = 32'hc1ec2d2e;
      expv[51] = 32'ha1d6df9b;
      expv[52] = 32'h1abaea45;
      expv[53] = 32'h8dc24c2e;
      expv[54] = 32'h4eebd4a9;
      expv[55] = 32'hf9e06b8a;
      expv[56] = 32'h03ba7c61;
      expv[57] = 32'h284b07dc;
      expv[58] = 32'ha814658d;
      expv[59] = 32'hc9fda98f;
      expv[60] = 32'h6b4e9910;
      expv[61] = 32'h32b65040;
      expv[62] = 32'he561f206;
      expv[63] = 32'h19948d8a;
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
