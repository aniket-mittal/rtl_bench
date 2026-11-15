// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02553 dut (
    .clk(clk),
    .a(in_vec[100:69]),
    .b(in_vec[68:37]),
    .c(in_vec[36:5]),
    .shift(in_vec[4:0]),
    .OA(out_vec[95:64]),
    .OB(out_vec[63:32]),
    .OC(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h014b5de8b152b4d3797fbd78c7;
    stim[1] = 101'h18083cb37a9fd0a439b06dd32f;
    stim[2] = 101'h06d508095f7953915abfb5731c;
    stim[3] = 101'h06813ad12a3ff8c780ed0ef55f;
    stim[4] = 101'h0ad153761a965150f9d7dda922;
    stim[5] = 101'h1bde3b20a2f9b31ebe1955c488;
    stim[6] = 101'h1f4ccff4698b9923b52efcf86b;
    stim[7] = 101'h18a270335206ba4e4b662276ab;
    stim[8] = 101'h11c9dc9f0f0d2531283bf11989;
    stim[9] = 101'h08b4f73e2c42ca6ee690237397;
    stim[10] = 101'h0bbb0eb955011d367e269f2b46;
    stim[11] = 101'h0da658b81929b6d2a6890813b6;
    stim[12] = 101'h02feb360c47d0a991618d5bba7;
    stim[13] = 101'h0e8405a687df6033d73a7678b3;
    stim[14] = 101'h0bb9ae7a8cafe1bbf2ebfb351f;
    stim[15] = 101'h078c300fe8dbb77c2cd3daf6fb;
    stim[16] = 101'h1a1c82ac59bbce4e6b7eb113c4;
    stim[17] = 101'h05962efd40ead10c33b89a2c1f;
    stim[18] = 101'h16d338ef77bac4df966b4c23d7;
    stim[19] = 101'h06eea4cb5628cc5ecba8d56e46;
    stim[20] = 101'h01ab2c07fb5b01858fa84e4ce6;
    stim[21] = 101'h011fe6b80f72d721fb7f5bfdc2;
    stim[22] = 101'h01bbf1cbbbf9d8c166a17847cd;
    stim[23] = 101'h001759c01b3e69e3c8ff3cc8b2;
    stim[24] = 101'h1071a575331d00e890f2cda6d2;
    stim[25] = 101'h1ec2934b8116efadc90bf2c028;
    stim[26] = 101'h1e27d9959bd792a7c51498a27a;
    stim[27] = 101'h1b85ec14b86c696e701c644d43;
    stim[28] = 101'h1f78744a88f9cf9853dcd6535d;
    stim[29] = 101'h137a6c67acad10f36e73f418d2;
    stim[30] = 101'h1b05ad943af59a8734b8a3897e;
    stim[31] = 101'h06d547ce4c9569cd8c06be79c8;
    stim[32] = 101'h0379a461d661711ad4301b8260;
    stim[33] = 101'h1516d2e3f0511b185f62335075;
    stim[34] = 101'h122a5ac91ebf1bc4f77e1399b9;
    stim[35] = 101'h1e536ae140337887a9ef16eb5b;
    stim[36] = 101'h0a437600e5ce3ed362e2c1919d;
    stim[37] = 101'h0a61eb709df6305a84718e1b5d;
    stim[38] = 101'h09132a527eeeab47ddbe023f51;
    stim[39] = 101'h1c48235a600e327c14e998f5b1;
    stim[40] = 101'h1f26b5d634aec1f878e5da89d0;
    stim[41] = 101'h1198f29bcb1794de0600458ed9;
    stim[42] = 101'h134f8c7d4788784cfdb644f8a2;
    stim[43] = 101'h0d7b59703e46e6b952bfed57ef;
    stim[44] = 101'h1b98bfa4fe2b17311a6ab76cc9;
    stim[45] = 101'h0c9ca020eb1472139446cebbba;
    stim[46] = 101'h1acb3eb12f1863372b1034fa33;
    stim[47] = 101'h10615af63825aa5a23c337f056;
    stim[48] = 101'h0cb7644ac8761514807a0656b8;
    stim[49] = 101'h0dd61b34f9df7297f7325ef737;
    stim[50] = 101'h17ab4bda24be99bcd63bb63585;
    stim[51] = 101'h1c6e28ba5eb85a09f236e325b8;
    stim[52] = 101'h08b198ea2dadd1d43fcfff6984;
    stim[53] = 101'h0f9ffbdf34f251da320b43cec1;
    stim[54] = 101'h1430ae4a69168da7de13b03eee;
    stim[55] = 101'h0dda81c40890f1700a506db78d;
    stim[56] = 101'h1db56e32717637e87cde2f0162;
    stim[57] = 101'h06e795f0ce11ee152e0bce737b;
    stim[58] = 101'h17db3c647aad27219715d39143;
    stim[59] = 101'h00c18d4cdffd38abd73e08c245;
    stim[60] = 101'h1d2e58ac9c92203957567e42c6;
    stim[61] = 101'h1b1911bb6cd9d101746766f45e;
    stim[62] = 101'h19a8f3d26a6cd4101916324bcb;
    stim[63] = 101'h1541734aad231cb7cac2deec92;
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
      expv[0] = 96'hc0a8e01a8a95a69b56939261;
      expv[1] = 96'h45f291c3d4fe8521a281f3ba;
      expv[2] = 96'hedf54e0bfbca9c8ad1c84822;
      expv[3] = 96'h2f15650a51ffc63c59683de6;
      expv[4] = 96'hbd301b40d4b28a87a37177d0;
      expv[5] = 96'h24890e1117cd98f508984719;
      expv[6] = 96'hefd08aab4c5cc91df5d4b0e0;
      expv[7] = 96'he17fc73c9035d272eb66e627;
      expv[8] = 96'hf37ec4af78692989ba48b255;
      expv[9] = 96'hdf3cded86216537796976f13;
      expv[10] = 96'h219d2acca808e9b3993de30d;
      expv[11] = 96'h1fa79733c94db695fd95f732;
      expv[12] = 96'h047803f123e854c8d4af02a5;
      expv[13] = 96'h2461b7f23efb019ef8ceb563;
      expv[14] = 96'h8dc276f8657f0ddffcdee787;
      expv[15] = 96'h6ef65e7546ddbbe1ad7c9398;
      expv[16] = 96'hcbb60521cdde727329d3fb11;
      expv[17] = 96'hc00ece3a07568861a51b59c1;
      expv[18] = 96'h8c66cb6dbdd626fc7130881a;
      expv[19] = 96'h8b84a67fb14662f60e8d0e68;
      expv[20] = 96'hc08a7407dad80c2c581a7e93;
      expv[21] = 96'h42ef2a697b96b90f579198fd;
      expv[22] = 96'ha0940abedfcec60b14da8849;
      expv[23] = 96'h21d5f85cd9f34f1e21ed3563;
      expv[24] = 96'h4f2ca02a98e80744207e747a;
      expv[25] = 96'hf223051308b77d6e5117136f;
      expv[26] = 96'h8438948ddebc953e07615a51;
      expv[27] = 96'h5c552d6fc3634b7344466ddd;
      expv[28] = 96'h0f0039e947ce7cc2e6b52f5c;
      expv[29] = 96'hab2a0c096568879bd9082861;
      expv[30] = 96'hdb191744d7acd4397d71f084;
      expv[31] = 96'he38784c464ab4e6cc4e1423a;
      expv[32] = 96'hdbcc9ae8b30b88d6548c64e9;
      expv[33] = 96'hfddb9eaf8288d8c27d9a7345;
      expv[34] = 96'h4e15d842f5f8de27b1e97af4;
      expv[35] = 96'h71595a0a019bc43d51147b97;
      expv[36] = 96'hb9e762ea2e71f69b45880327;
      expv[37] = 96'h6bf364b1efb182d4133df3ae;
      expv[38] = 96'h795c9b79f7755a3ee5656c38;
      expv[39] = 96'hb5af1dbf007193e0a7be5b8d;
      expv[40] = 96'he6481d4da5760fc36ca4e411;
      expv[41] = 96'hb0a56c3058bca6f088bed366;
      expv[42] = 96'h1a02a3323c43c26729f5ea2c;
      expv[43] = 96'h6084aa3df23735ca8836a089;
      expv[44] = 96'ha2068c67f158b988c4ae74ee;
      expv[45] = 96'hb42652fd58a3909cfada0679;
      expv[46] = 96'h435289b578c319b9d144c18a;
      expv[47] = 96'h84769e40c12d52d1df471253;
      expv[48] = 96'hd4e93f9343b0a8a44780db59;
      expv[49] = 96'h69c12895cefb94bf888e8c78;
      expv[50] = 96'h30ca98b325f4cde6d7d27f92;
      expv[51] = 96'h7c2b9bbcf5c2d04f8779e97c;
      expv[52] = 96'ha0f378ca6d6e8ea16bee89ed;
      expv[53] = 96'hcc11fc6ea7928ed137ecad47;
      expv[54] = 96'hd09a0c7b48b46d3e3951ef35;
      expv[55] = 96'h71e72a3444878b80970af93c;
      expv[56] = 96'h9d7c19a78bb1bf4372a3374e;
      expv[57] = 96'h1d5cc877708f70a9e0ede444;
      expv[58] = 96'hc35fa2ccd569390c8e17d596;
      expv[59] = 96'h7214e603ffe9c55eb9da0b70;
      expv[60] = 96'h824256e0e49101ca9f44f3e0;
      expv[61] = 96'h9d439bd166ce880b0a09bfad;
      expv[62] = 96'h8804fa705366a0801c1832de;
      expv[63] = 96'h8e65faaa6918e5bebf2fdd22;
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
