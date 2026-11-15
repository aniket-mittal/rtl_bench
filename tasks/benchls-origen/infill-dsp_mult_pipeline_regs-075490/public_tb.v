// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 106;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_075490 dut (
    .clk(clk),
    .RSTM(in_vec[109:109]),
    .CEM(in_vec[108:108]),
    .MREG(in_vec[107:107]),
    .M_temp(in_vec[106:17]),
    .result_SIMD_carry(in_vec[16:9]),
    .configuration_input(in_vec[8:1]),
    .configuration_enable(in_vec[0:0]),
    .M(out_vec[105:16]),
    .M_SIMD(out_vec[15:8]),
    .configuration_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h32c6901744d5f5c3b2bc9e0b5da3;
    stim[1] = 110'h28dceb83a52ed0e1236383a142e0;
    stim[2] = 110'h156a97d85c17758920a2a809c063;
    stim[3] = 110'h178835afe82660b0e94ad69d0ac0;
    stim[4] = 110'h0c00c71ba419e0ba268de386122d;
    stim[5] = 110'h0ec1458063148f15efacced3fa94;
    stim[6] = 110'h1c3311dc641810a8a920f232922a;
    stim[7] = 110'h12d60068c7dd4f4241c584d4be1b;
    stim[8] = 110'h1130547c6009ddf5be45bc8971b3;
    stim[9] = 110'h010f231eea98a0fb6da73cf6bdb7;
    stim[10] = 110'h1134a7e90b456a4ca5dc8bb06c67;
    stim[11] = 110'h19f32e349ec02b9b5e6bef6cde15;
    stim[12] = 110'h0c73b5e97cf9ba9c8e21b69b1d22;
    stim[13] = 110'h1502660283d2cec25ddd3db307be;
    stim[14] = 110'h133b91f0782c65c502e7645f90c4;
    stim[15] = 110'h1dfe2391ee842ac4b09306e71c58;
    stim[16] = 110'h18a0cbc138661a67ddbddf512882;
    stim[17] = 110'h0c06d38dd3abd9dd4bf0a356684c;
    stim[18] = 110'h14d8feffbef5a141dceeb9ed284f;
    stim[19] = 110'h12213657459b475773eeceaf52df;
    stim[20] = 110'h1fdab3890dccb22fb71dab2aa0a3;
    stim[21] = 110'h011e795671312d21180f3f76eb47;
    stim[22] = 110'h058fcd9c90fe3ca8e36f38ca2c18;
    stim[23] = 110'h05702b04106f26c59209b8619ad9;
    stim[24] = 110'h0d72fc0abc56bd60e3df58084442;
    stim[25] = 110'h0f300523be5cbe14e46141cc61ba;
    stim[26] = 110'h00fb44bbd10b88fcdbb058a06450;
    stim[27] = 110'h00cfe83159e5a396e2c7b5d14a7b;
    stim[28] = 110'h0f5cb0b2a578eff1ad20bec33b99;
    stim[29] = 110'h02933d8ff187d0b40d9ca55f5492;
    stim[30] = 110'h0a9250e5bbac1b38bff72118a39e;
    stim[31] = 110'h16378a0c7937ec5028f47a66d76c;
    stim[32] = 110'h0e8c5c4f5288b971f92d6df0694b;
    stim[33] = 110'h0f41a20e2c42611b96c6e8012661;
    stim[34] = 110'h1131643f2c96d53f0dc47d3f2a43;
    stim[35] = 110'h04dd354c12abd36587b7f3e7af92;
    stim[36] = 110'h1c364415b4178b5c57c4e5737c8c;
    stim[37] = 110'h0ba92f3616bde5b30caf0c1e109d;
    stim[38] = 110'h1c2c44fdc4496747c943fc7c005d;
    stim[39] = 110'h00de21e0704d3a578aad3b2b7617;
    stim[40] = 110'h13d463098ea4785c17237602f9eb;
    stim[41] = 110'h0e62c59b1ca9255cbd006ec6a507;
    stim[42] = 110'h1399e02187c05a1004a4e0f10835;
    stim[43] = 110'h031781fa0013349585e872cb9dc2;
    stim[44] = 110'h0c97db98529435aa6464660e8e5b;
    stim[45] = 110'h0a4cc461d7f7bb6c3a9ba61a4ebf;
    stim[46] = 110'h01b5956620731883f6faff954757;
    stim[47] = 110'h003187bbf429d66174fdf1bc2351;
    stim[48] = 110'h0d9f4dd63c25427313cab7c57b53;
    stim[49] = 110'h1c3d21d5c3ef9ecc9bc635f0e31b;
    stim[50] = 110'h06f5ad9d5c336fe02f68116ddae5;
    stim[51] = 110'h058c8fd4c94d76d4c54c11440196;
    stim[52] = 110'h1ce5897d0d78c831b7b9286757ff;
    stim[53] = 110'h133dcf041e8d70bb5f3419d8b449;
    stim[54] = 110'h0e63271a8d7a3a8082887ce0f4ee;
    stim[55] = 110'h13f524dc90f96df68d777261ecfc;
    stim[56] = 110'h12ee39bfbed269b2fdd801eb4b08;
    stim[57] = 110'h1e99bd49c7b8d4f0ce13efea1eb4;
    stim[58] = 110'h04b482f7b520e714e92fb04065a9;
    stim[59] = 110'h1df4a915d89be07bc2055596f573;
    stim[60] = 110'h1f155edbaf8244322fc6b699c886;
    stim[61] = 110'h15e7ceee36f017df495df2717e98;
    stim[62] = 110'h0ca8b9bc2fd47f26417bf48d66cc;
    stim[63] = 110'h1cb055cb59fe909ae005e411b3ca;
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
      expv[0] = 106'h163480ba26afae1d95e4f05aexx;
      expv[1] = 106'h163480ba26afae1d95e4f05aed1;
      expv[2] = 106'h2b54bec2e0bbac490515404e0d1;
      expv[3] = 106'h3c41ad7f413305874a56b4e8531;
      expv[4] = 106'h000000000000000000000000031;
      expv[5] = 106'h000000000000000000000000016;
      expv[6] = 106'h000000000000000000000000016;
      expv[7] = 106'h16b003463eea7a120e2c26a5f16;
      expv[8] = 106'h0982a3e3004eefadf22de44b80d;
      expv[9] = 106'h087918f754c507db6d39e7b5ed9;
      expv[10] = 106'h09a53f485a2b52652ee45d836db;
      expv[11] = 106'h000000000000000000000000033;
      expv[12] = 106'h00000000000000000000000000a;
      expv[13] = 106'h281330141e967612eee9ed9830a;
      expv[14] = 106'h19dc8f83c1632e28173b22fc80a;
      expv[15] = 106'h19dc8f83c1632e28173b22fc80a;
      expv[16] = 106'h2ff11c8f7421562584983738e0a;
      expv[17] = 106'h05065e09c330d33eedeefa8940a;
      expv[18] = 106'h26c7f7fdf7ad0a0ee775cf6940a;
      expv[19] = 106'h1109b2ba2cda3abb9f76757a927;
      expv[20] = 106'h00000000000000000000000006f;
      expv[21] = 106'h08f3cab389896908c079fbb7551;
      expv[22] = 106'h2c7e6ce487f1e5471b79c6516a3;
      expv[23] = 106'h2b8158208379362c904dc30cda3;
      expv[24] = 106'h00000000000000000000000006c;
      expv[25] = 106'h00000000000000000000000006c;
      expv[26] = 106'h07da25de885c47e6dd82c50326c;
      expv[27] = 106'h067f418acf2d1cb7163dae8a56c;
      expv[28] = 106'h00000000000000000000000003d;
      expv[29] = 106'h1499ec7f8c3e85a06ce52afaacc;
      expv[30] = 106'h0000000000000000000000000cc;
      expv[31] = 106'h31bc5063c9bf628147a3d336bcc;
      expv[32] = 106'h31bc5063c9bf628147a3d336bcc;
      expv[33] = 106'h31bc5063c9bf628147a3d336ba5;
      expv[34] = 106'h098b21f964b6a9f86e23e9f9530;
      expv[35] = 106'h26e9aa60955e9b2c3dbf9f3d721;
      expv[36] = 106'h000000000000000000000000021;
      expv[37] = 106'h000000000000000000000000021;
      expv[38] = 106'h00000000000000000000000004e;
      expv[39] = 106'h06f10f038269d2bc5569d95bb2e;
      expv[40] = 106'h1ea3184c7523c2e0b91bb017c0b;
      expv[41] = 106'h0000000000000000000000000f5;
      expv[42] = 106'h1ccf010c3e02d08025270788483;
      expv[43] = 106'h18bc0fd00099a4ac2f43965ce1a;
      expv[44] = 106'h00000000000000000000000001a;
      expv[45] = 106'h00000000000000000000000002d;
      expv[46] = 106'h0dacab310398c41fb7d7fcaa35f;
      expv[47] = 106'h018c3ddfa14eb30ba7ef8de11ab;
      expv[48] = 106'h0000000000000000000000000a8;
      expv[49] = 106'h0000000000000000000000000a9;
      expv[50] = 106'h37ad6ceae19b7f017b408b6ed8d;
      expv[51] = 106'h2c647ea64a6bb6a62a608a20072;
      expv[52] = 106'h000000000000000000000000072;
      expv[53] = 106'h19ee7820f46b85daf9a0cec5aff;
      expv[54] = 106'h000000000000000000000000024;
      expv[55] = 106'h1fa926e487cb6fb46bbb930f624;
      expv[56] = 106'h1771cdfdf6934d97eec00f5a524;
      expv[57] = 106'h1771cdfdf6934d97eec00f5a524;
      expv[58] = 106'h25a417bda90738a7497d8203224;
      expv[59] = 106'h34cdea4e3dc6a786709f7f50fd4;
      expv[60] = 106'h2fa548aec4df03de102aacb7ab9;
      expv[61] = 106'h2f3e7771b780befa4aef938bfb9;
      expv[62] = 106'h0000000000000000000000000b9;
      expv[63] = 106'h0000000000000000000000000b9;
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
