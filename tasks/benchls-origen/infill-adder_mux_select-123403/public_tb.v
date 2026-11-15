// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123403 dut (
    .a(in_vec[160:129]),
    .b(in_vec[128:97]),
    .mux_in1(in_vec[96:65]),
    .mux_in2(in_vec[64:33]),
    .mux_in3(in_vec[32:1]),
    .select(in_vec[0:0]),
    .final_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h15a170a3dd714f1685cd270b3829f6378e4ebde20;
    stim[1] = 161'h1f0c1727f1abe91167f717947d94d183232176928;
    stim[2] = 161'h0a5a32a3dcdb45ef8d7e65b6903907e19b660f8fd;
    stim[3] = 161'h0a9aa2bbe64cb943d3447d2fe2ca14ca178878b11;
    stim[4] = 161'h183bb0ae38e29014ce9f91cebdb88c7bd6a45e6a6;
    stim[5] = 161'h1f01c61d3dac8c8a1be6891cc4676189abad4f827;
    stim[6] = 161'h06927cc01509403566bbc10fd05ba673499189e78;
    stim[7] = 161'h0a6f1f3da90d0becbfd0c01854168fcaa6d973fad;
    stim[8] = 161'h0cc9d30d13a082ad530ab134492662591eafb72be;
    stim[9] = 161'h0346f43bbfb572a8b51ebe996b3b969b3d0dd6688;
    stim[10] = 161'h036e9171093ecb0652b5228c9084d8e6663343550;
    stim[11] = 161'h0c4949941d69419b2a187fdd35380502046b13fc5;
    stim[12] = 161'h08f31b7cd8e863964941e96ab8bfabcd2c89751e2;
    stim[13] = 161'h1c142a9a87f3afd2b6a482b4bc79a39d74b932df3;
    stim[14] = 161'h1c34e6163689e0387f5d23d386a1279ae1d5dbfdb;
    stim[15] = 161'h10b643ff1df81e097fe181bbdee5d6f99876fc46a;
    stim[16] = 161'h0b1d35ac435d20ba55402741ad38d464f10a9980a;
    stim[17] = 161'h17cd480f96218e7d4c527947ccf0987ce09f58f97;
    stim[18] = 161'h1707d2fcbf2d5c54c651fd33755d307a913b1068b;
    stim[19] = 161'h04255aef317046b23ce6ebe587d2638e77b5e85ea;
    stim[20] = 161'h06ee8dc1f995d84e9745518204e7344ecaad67f89;
    stim[21] = 161'h1282c64d5b720513fae194ca7c043e20546426ac1;
    stim[22] = 161'h05b2c1236227bbc3119d479144d1bb285a6fd055c;
    stim[23] = 161'h06c40cb36e13f8c871573c2af60a20e140e260531;
    stim[24] = 161'h0b01f84f1307a5cf14009525087112a10faa6f005;
    stim[25] = 161'h0c5496daf1242bbfea12203fccac8e2f0fd09c1df;
    stim[26] = 161'h169ef15012eb5969891a51f5792bbff01b39850a9;
    stim[27] = 161'h1a49d006f2b3ea4ef49aff404463a2b2b43f0c7cd;
    stim[28] = 161'h05f7ed95a83937899f261e2cc8be432e09720aee9;
    stim[29] = 161'h037c21d821ae6d1ac369be875f0904f90da225559;
    stim[30] = 161'h1734cd8b317fa52ee6a561c4c55f6e07951b72a60;
    stim[31] = 161'h1b00cf89879ac6cf203164241d8c39812e73c7cf4;
    stim[32] = 161'h00f3c03d9421912bb2caad63b914c3661c865e9d8;
    stim[33] = 161'h0b5048082209b88493c491765ed0de6e668a972a6;
    stim[34] = 161'h04ca34d9331bcc8c6ef88f514a530f5faa850bd9d;
    stim[35] = 161'h0e0e41f76605edd3e11aeb7178528b64ddc3283d5;
    stim[36] = 161'h1ed2a2063fe2dd9920610481157e52e1d3d6ea343;
    stim[37] = 161'h0e82c176df097529a34a62f4aafa18a576f579153;
    stim[38] = 161'h166abca781d2276d97710fcb9e9a21d1624128d95;
    stim[39] = 161'h11f81c878d35b23cb083010bde0d971bc39cc1c97;
    stim[40] = 161'h08c435e489977df278cd7e80cb8997ee485111968;
    stim[41] = 161'h14191cac8085681741d965f7699a4a61f3bf3703a;
    stim[42] = 161'h1a87cda03d020fcf84909112d5fba988d47275e14;
    stim[43] = 161'h16defff905497e156c84d6f11510964f6d05b8046;
    stim[44] = 161'h03cf6197bb05f66af18896d0079cc033865b20b80;
    stim[45] = 161'h1ce182d3e0dd04464bc06bb705a7c124efa45fc52;
    stim[46] = 161'h1d7e46cb0b066caa3fd902dc94b3ed0fd884e4295;
    stim[47] = 161'h0d0d7a85f2929b509e02d017c7a3bedc4757c5cae;
    stim[48] = 161'h156c1aaff0c5c5a565f91e1b9846f71d5d4e657a9;
    stim[49] = 161'h0ed9c31cdb4b094d07779dede032dc1e0f7ebec87;
    stim[50] = 161'h1e34020bd4affcf89d9f1f0ebff2526660e10d589;
    stim[51] = 161'h1828c1b5c5ece703f76714f247c87537cc1233d29;
    stim[52] = 161'h0046a1dc77556cfd558e7e17d308beefe5917951b;
    stim[53] = 161'h1eed440e19ac4beb1f1b82aed7d0d3e829bf15a53;
    stim[54] = 161'h17aefd9623c766d515ade19408979b52794dc3712;
    stim[55] = 161'h15ed3d6ed9383fbd1c8ece3d01193969146c01cb3;
    stim[56] = 161'h1bda9ed3859aca6993ef58ffb5d94ff1ee4c2fa2f;
    stim[57] = 161'h1e145e667780b6c15fe82e47143e51b7999981f9f;
    stim[58] = 161'h16168cecd6d6b10b8c10501a405a01fa6923ea79c;
    stim[59] = 161'h00dbbfc281625a26793c9afc058e75352c734d74b;
    stim[60] = 161'h1c0a33338eca1c641755d78b3a701cd536aec7392;
    stim[61] = 161'h179573d20fdb3e9b322754da23782bf25151131ae;
    stim[62] = 161'h091ffd55b143512f86da3c3cb64563b0abc36602b;
    stim[63] = 161'h0e29bcb93412187edca28496cfd3550ec37d66da0;
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
      expv[0] = 32'h9895fdd2;
      expv[1] = 32'h85c001ca;
      expv[2] = 32'h81c83f0c;
      expv[3] = 32'h1650a650;
      expv[4] = 32'h88f20617;
      expv[5] = 32'h233b0c4d;
      expv[6] = 32'hdcdde7ab;
      expv[7] = 32'ha0b47e55;
      expv[8] = 32'h0352add2;
      expv[9] = 32'h17e33722;
      expv[10] = 32'h656ae3ba;
      expv[11] = 32'ha9c02810;
      expv[12] = 32'h0edbf898;
      expv[13] = 32'he3cd1ceb;
      expv[14] = 32'h35093cd7;
      expv[15] = 32'h75731043;
      expv[16] = 32'h73d2b334;
      expv[17] = 32'h6784c3e7;
      expv[18] = 32'haae983d4;
      expv[19] = 32'hacad0d0a;
      expv[20] = 32'h2739a276;
      expv[21] = 32'he021f102;
      expv[22] = 32'h3ed3e733;
      expv[23] = 32'hb051070a;
      expv[24] = 32'h43889508;
      expv[25] = 32'h65647178;
      expv[26] = 32'hc95dff80;
      expv[27] = 32'h231d1595;
      expv[28] = 32'h45f21970;
      expv[29] = 32'hf84827c8;
      expv[30] = 32'h45a395d0;
      expv[31] = 32'h14dcb2c5;
      expv[32] = 32'ha8aa8b49;
      expv[33] = 32'h6ad00465;
      expv[34] = 32'h52987afd;
      expv[35] = 32'hc2945b26;
      expv[36] = 32'habf2970e;
      expv[37] = 32'h57d0c52b;
      expv[38] = 32'hf4d10e8b;
      expv[39] = 32'hf06cb8de;
      expv[40] = 32'h92dd9eb7;
      expv[41] = 32'ha4f4261e;
      expv[42] = 32'hbc4eeb7d;
      expv[43] = 32'he143f073;
      expv[44] = 32'hf6aac014;
      expv[45] = 32'hedf438d1;
      expv[46] = 32'ha59f687e;
      expv[47] = 32'hfd00aeb3;
      expv[48] = 32'hc237b8ea;
      expv[49] = 32'h0196e0f0;
      expv[50] = 32'hff929333;
      expv[51] = 32'h3e43a9be;
      expv[52] = 32'h9845f77f;
      expv[53] = 32'hbe869f41;
      expv[54] = 32'hdbb32359;
      expv[55] = 32'h08c9cb48;
      expv[56] = 32'haeca7f8f;
      expv[57] = 32'ha1f28dbc;
      expv[58] = 32'h6769efc2;
      expv[59] = 32'h2c73a9a9;
      expv[60] = 32'h56a27cbc;
      expv[61] = 32'h3b859369;
      expv[62] = 32'hb22b1d85;
      expv[63] = 32'h11dea9bf;
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
