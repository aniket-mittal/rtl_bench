// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 139;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03693 dut (
    .clk(clk),
    .rst(in_vec[176:176]),
    .i_m0_we(in_vec[175:175]),
    .i_m0_cyc(in_vec[174:174]),
    .i_m0_stb(in_vec[173:173]),
    .i_m0_sel(in_vec[172:169]),
    .i_m0_dat(in_vec[168:137]),
    .i_m0_adr(in_vec[136:105]),
    .i_m1_we(in_vec[104:104]),
    .i_m1_cyc(in_vec[103:103]),
    .i_m1_stb(in_vec[102:102]),
    .i_m1_sel(in_vec[101:98]),
    .i_m1_dat(in_vec[97:66]),
    .i_m1_adr(in_vec[65:34]),
    .i_s_dat(in_vec[33:2]),
    .i_s_ack(in_vec[1:1]),
    .i_s_int(in_vec[0:0]),
    .o_m0_ack(out_vec[138:138]),
    .o_m0_dat(out_vec[137:106]),
    .o_m0_int(out_vec[105:105]),
    .o_m1_ack(out_vec[104:104]),
    .o_m1_dat(out_vec[103:72]),
    .o_m1_int(out_vec[71:71]),
    .o_s_we(out_vec[70:70]),
    .o_s_stb(out_vec[69:69]),
    .o_s_cyc(out_vec[68:68]),
    .o_s_sel(out_vec[67:64]),
    .o_s_adr(out_vec[63:32]),
    .o_s_dat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h1d02c5f13d322bd6d172a5aeaa8a727e2c8f1eaf6bfbd;
    stim[1] = 177'h1e83c9a4fe02528b76fa138109cbbeeb69368bb883442;
    stim[2] = 177'h0b1d7a95ab71d27f67b9d6d9162cb221dab1793fd7f8f;
    stim[3] = 177'h0decf4b711a989eb7dee296e1977418907e50a9822cf4;
    stim[4] = 177'h0d33178fe8e09c816ebdc90425c9cd48f24eb53f45d19;
    stim[5] = 177'h08c38d9cffd3b7c19a50a196f53a6266a31a3a94db3d9;
    stim[6] = 177'h05ae6addb8e3ea31470e705be07ff7a295577acf509b7;
    stim[7] = 177'h04c9d10833e1f302ca6e49dc16aa4d6a7d7bee765934f;
    stim[8] = 177'h04d89d68eb061158efba1dc5ea96c565fa4b3eb959d6b;
    stim[9] = 177'h086a059df754b7d64e1ab942dafd0e86a9c83f82a59eb;
    stim[10] = 177'h064321e8107410ab09f53cafceaf83874bd64eca87bd3;
    stim[11] = 177'h0ea45cfbe2f771eb284c92dc7baac2fb690adf01dcab0;
    stim[12] = 177'h0fdc9ef08bbea4a6f0080dcb051e3c940d2082153b923;
    stim[13] = 177'h0beb56b4845fdf279c27f6bf27ee31cdbc87835d81fd9;
    stim[14] = 177'h1068e95c4943ea2cae1c66b2d30e85b6790370532799b;
    stim[15] = 177'h0e5e6c350de219693a218d7e2fdefa295cc326055a59d;
    stim[16] = 177'h0eb20fdf3a2013b184b73f32eec5c97c763ab7ed07db5;
    stim[17] = 177'h0e0a329bea47f0b6c3e2d7f2fba02c431f88739649840;
    stim[18] = 177'h077eb46d88680fb6bb7b52b987769879afc58db2a5a18;
    stim[19] = 177'h098026edf16de1c6c0249c3be18ada0122d26ff78c4c1;
    stim[20] = 177'h04a111d4e268e58062c340013381a82162229cd2566df;
    stim[21] = 177'h0f343b305e84838007756cc0a7831126b54c402b76140;
    stim[22] = 177'h0461047394edaa66bf87f961736bef76a534e6015d9f5;
    stim[23] = 177'h0a801b4efe94fea2788622c2e800ff31b05cb71fd675c;
    stim[24] = 177'h08bb2bde5d6e09cc39de023bca81fedfc9e590d23b130;
    stim[25] = 177'h08bc8a1ded68e3b5b2c51d6daa6bc73f6f184f1f18630;
    stim[26] = 177'h0f6801403cba2e5e35d091232cd188822c617f023f7dd;
    stim[27] = 177'h022d238639173e04a48efb4da7ed4cd775f1fbd0d28e4;
    stim[28] = 177'h03e50d9c87645267e90b707b2bcb64d53989975b0f4f7;
    stim[29] = 177'h0eda39f3e7a948dd8ddd735a4ceb5232e1c601514da25;
    stim[30] = 177'h060b0d0adbec76175756032eb89136506284d3f87d841;
    stim[31] = 177'h0840747b6bc55ecfd2c3ca129a343b32f9885443586d3;
    stim[32] = 177'h0c76f22df9372723472b37183dc215aa6661ea34fbee7;
    stim[33] = 177'h14b9cd6f1b67689a93a827842304d1fbd9019dd3bfffe;
    stim[34] = 177'h0695c2abe1e4aa65e2dc4f4e364031f43a318fd2c81d7;
    stim[35] = 177'h0abcf911d3ecd229c05d968335a416a4966dfe130461f;
    stim[36] = 177'h092468f81558e82dd88b6bf1347fbe11586d8d178d089;
    stim[37] = 177'h0c2222e983954d4eb54cea0fcd33421d6d454b7c17ef6;
    stim[38] = 177'h0aa6b5335cef600340892304d7e95e6bb77d93c71109e;
    stim[39] = 177'h0d7578b8a14a077db82c2063cdd1b31c21304562d2c7f;
    stim[40] = 177'h0fcb839d646e163f0f378e3d422ea2e680e16f7452c87;
    stim[41] = 177'h06030f5dd7275a3fc3cab88a6986865d4dfeabaf2781f;
    stim[42] = 177'h0bd368b62b6569efda55ec2e5a2acfe15e20875e25fea;
    stim[43] = 177'h01ec52f40159a5a964ff9a740ab6fd5a750fd4f967c20;
    stim[44] = 177'h0ee11cffeadcfddc9b2a137919bc45d7fa1c9032985c9;
    stim[45] = 177'h0b846d85125a8a56f7637d62fe55fc8a89c99903756fc;
    stim[46] = 177'h0bf143a6a64de6e4a149e27d85379e9ed176da6a24f18;
    stim[47] = 177'h0bf4dd9a11a37bef1316b7db74fdb1eed54b881d9d54f;
    stim[48] = 177'h06a180be6453b7fb33153e3789584d91b46a0e9d30de9;
    stim[49] = 177'h04a565dabaf2552976ab43fc744a088293adfd1884310;
    stim[50] = 177'h053e8ef881dff3b71ba5a85c1934e982136b4cd7a4548;
    stim[51] = 177'h077663146830397beb4b28e1df7aab2f54b35e20583cf;
    stim[52] = 177'h05623a9befe954eadf9ce3e6dea63dfb58b91f3d98ade;
    stim[53] = 177'h08da8b9a464ca5cf4a4f20a27c4fa39e14d7a7074c15a;
    stim[54] = 177'h044e5cefb74eb3338135f61b0f0b5532bca2b1959720b;
    stim[55] = 177'h0c925a5a66f900215ece88ba5889f8047c3bbf19b606c;
    stim[56] = 177'h004a2ef019518cea3eac260843474117d34fa614f9e2f;
    stim[57] = 177'h0cca434f4f9e2b2846615b123fd8e002a6dfad6fde0a8;
    stim[58] = 177'h0ac330223be09afc2356243fd6636ada0401a4b1bb539;
    stim[59] = 177'h0a174d37b7b304db5883ab4956e798be356a0b0379d10;
    stim[60] = 177'h129cf8466abb83b4f1ea95f6fb1c371a8d3b746d7c6a3;
    stim[61] = 177'h0cad87b84ce6bfa02185e59f309c97d394200bc21af49;
    stim[62] = 177'h0bfe9111f1ef4742dbfe6a7f139f501e9da8fe2043215;
    stim[63] = 177'h0f9ff5993a923242e8f53792e353341df4f846176994a;
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
      expv[0] = 139'h1eaf6bfbx7abdafefxxxxxxxxxxxxxxxxxx;
      expv[1] = 139'h0bb8834402ee20d10000000000000000000;
      expv[2] = 139'h393fd7f8ce4ff5fe3000000000000000000;
      expv[3] = 139'h0a9822cf42a608b3d3806241f94a5b865dd;
      expv[4] = 139'h353f45d18d4fd1746f73523c93a24109727;
      expv[5] = 139'h3a94db3d8ea536cf6c2899a8c68865bd4e9;
      expv[6] = 139'h3acf509b4eb3d426d000000000000000000;
      expv[7] = 139'h6e765934eb9d964d3160f9816534e88419f;
      expv[8] = 139'h7eb959d6afae5675a16308ac77dc4eb4758;
      expv[9] = 139'h7f82a59eafe0a967a43a5beb270502cefba;
      expv[10] = 139'h4eca87bd23b2a1ef432a085584f190f4083;
      expv[11] = 139'h1f01dcab07c0772ac75bb8f594222e7df17;
      expv[12] = 139'h42153b9220854ee487ef5253780e4f7845d;
      expv[13] = 139'h035d81fda0d7607f66ffef93ce15ab5a422;
      expv[14] = 139'h305327998c14c9e66000000000000000000;
      expv[15] = 139'h26055a59c98156967000000000000000000;
      expv[16] = 139'h37ed07db6dfb41f6d75009d8c25907ef9d1;
      expv[17] = 139'h339649840ce592610703f85b61f5194df52;
      expv[18] = 139'h0db2a5a1836ca96863b407db5dbf5a36c43;
      expv[19] = 139'h2ff78c4c2bfde31304c6f0e360101376f8b;
      expv[20] = 139'h1cd2566dc734959b7000000000000000000;
      expv[21] = 139'h002b7614000add85079241c003ba1d982f4;
      expv[22] = 139'h26015d9f69805767d136d5335fc08239ca7;
      expv[23] = 139'h371fd675cdc7f59d764a7f513c400da77f4;
      expv[24] = 139'h10d23b1304348ec4c000000000000000000;
      expv[25] = 139'h0f1f186303c7c618c241cfdbc6175b6a9af;
      expv[26] = 139'h3f023f7dcfc08fdf7000000000000000000;
      expv[27] = 139'h3bd0d28e4ef434a3921b9f02524691c31c8;
      expv[28] = 139'h175b0f4f45d6c3d3d000000000000000000;
      expv[29] = 139'h01514da2405453689f548cb8718cd6933ad;
      expv[30] = 139'h13f87d8404fe1f610e8d9418a130cbae244;
      expv[31] = 139'h1443586d0510d61b4000000000000000000;
      expv[32] = 139'h2a34fbee4a8d3efb9000000000000000000;
      expv[33] = 139'h5dd3bfffc774effff153b44d49dce6b78db;
      expv[34] = 139'h0fd2c81d43f4b2075000000000000000000;
      expv[35] = 139'h7e130461ef84c11876566914e02e7c88e9f;
      expv[36] = 139'h0d178d08a345e342249c7416ec42347c0aa;
      expv[37] = 139'h0b7c17ef42df05fbd000000000000000000;
      expv[38] = 139'h53c71109c4f1c4427657b001a0435a99ae7;
      expv[39] = 139'h4562d2c7e158b4b1f5b503bedc1abc5c50a;
      expv[40] = 139'h6f7452c86bdd14b217e70b1f8795c1ceb23;
      expv[41] = 139'h6baf2781eaebc9e07303ad1fe1e187aeeb9;
      expv[42] = 139'h475e25fe81d7897fa6e2b4f7ed29b45b15b;
      expv[43] = 139'h14f967c2053e59f080fcd2d4b276297a00a;
      expv[44] = 139'h1032985c840ca6172000000000000000000;
      expv[45] = 139'h1903756fc640dd5bf6cd452b7bb236c2892;
      expv[46] = 139'h1a6a24f1869a893c6000000000000000000;
      expv[47] = 139'h081d9d54d20767553eac7bb552edf6dd3f6;
      expv[48] = 139'h0e9d30de83a74c37ae43646d1a8f8de2561;
      expv[49] = 139'h3d1884310f46210c4000000000000000000;
      expv[50] = 139'h0cd7a4548335e915219ff9db8ddf477c40e;
      expv[51] = 139'h5e20583ce788160f33b81cbdf5ab318a341;
      expv[52] = 139'h5f3d98adc7cf662b71b4aa756fc11d4df7f;
      expv[53] = 139'h67074c1589c1d305646652e7a52d45cd232;
      expv[54] = 139'h71959720ac6565c821275999c0972e77dba;
      expv[55] = 139'h3f19b606cfc66d81b54c8010af692d2d337;
      expv[56] = 139'h6614f9e2e9853e78b028c6751f5517780ca;
      expv[57] = 139'h2d6fde0a8b5bf782a56f1594233521a7a7c;
      expv[58] = 139'h24b1bb53a92c6ed4e6604d7e11a198111df;
      expv[59] = 139'h0b0379d102c0de744000000000000000000;
      expv[60] = 139'h346d7c6a0d1b5f1a8000000000000000000;
      expv[61] = 139'h0bc21af482f086bd2000000000000000000;
      expv[62] = 139'h3e2043216f8810c856f7a3a16dff4888f8f;
      expv[63] = 139'h061769948185da652000000000000000000;
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
