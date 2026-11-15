// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 305;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174665 dut (
    .iCLK(clk),
    .iRST(in_vec[304:304]),
    .iLevel_Up(in_vec[303:303]),
    .iLevel_Down(in_vec[302:302]),
    .iState_flag(in_vec[301:2]),
    .iBallDie(in_vec[1:1]),
    .iSpecial_attacked(in_vec[0:0]),
    .oLevel(out_vec[5:4]),
    .oSlider_flag(out_vec[3:2]),
    .oSpecial_block(out_vec[1:1]),
    .oRST(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 305'h1ede49ce7f84a97593781428e295bf55f6d2f95c3ec52e4ef8ff031bdbe32a7bdd261a6af2a2e;
    stim[1] = 305'h14b64d53ce9581f8e087ab7dac251c1d5c24d86a493d900f7afe8759cc8fd8ef47027161dc0b5;
    stim[2] = 305'h06bcb5bc495410d40554b9d6673c8d9bce5a68745e8a9ba2c69e70d086068876cc379daa65bc4;
    stim[3] = 305'h0d3322dec6c01cee224418bd1e13604b0199ce76b5bbc70df4a6df616482b38ece450611e712d;
    stim[4] = 305'h04ea06163aec5c5fd57df8b3623c2406408e564b10d61dfd97e9da345452ddc510940dcdb8bd1;
    stim[5] = 305'h0e80377e10a64d57663edc000cbb72b450da6a6213cd5797aaea8f7ee334c942c99869266c5cb;
    stim[6] = 305'h01f17b16f1f90341cf5de681f8074e05f606c2cda7805aee42974c71b678abceab337784384da;
    stim[7] = 305'h0ffa5bed6c1879b34e21d90916fe1928bee9559e37ad2dbdc479374da129ff35211859c40651c;
    stim[8] = 305'h0cf4b036b75f25c6f9b7aadd704b8286fbc280b59475654a4cb6d54e5cc0cc8dd61325146e9f7;
    stim[9] = 305'h0896f49487de265a98bc478b3d9721ce7d4661cd6d4c18834841b44eb6ff24ded6a5b6d3bba67;
    stim[10] = 305'h02ecf898e4b455ebc25d14010ee5199e7ddf8a95cfd51cb4e6209f5162f5f2c583f54958e20fc;
    stim[11] = 305'h00e10d0e89ec88aa8f412f0cf3e0f9c3731be51ad28ad2355fc43345f530526bf54244b1d2910;
    stim[12] = 305'h07f48fa3d7b8db19638d1dead3da6b1ab857679ca404f21d331a29df2cef754ab3a3659b0d6f5;
    stim[13] = 305'h0563541246567bc2c69c36e103805af3a5222bcc6b5899cad363dcdbfbf684901263f1289b2ff;
    stim[14] = 305'h030cc6810778877dca5c6bc384a4f6e59ccca88fbc66ba0fc1779791df0d6e93f7f61aab6242f;
    stim[15] = 305'h0b676daad9237c695202cf2fc27154ad61bfdfabae780fb61db7dfb67ef73b2f1cbe454236b54;
    stim[16] = 305'h0780ace566391331d5f07aa5523f25583cfe0b8d13fcbaef7ddf45357c9b163a657ca734f517f;
    stim[17] = 305'h0038aa453482299642ce6bd22fa9a681ae987b57dca2759e2af7a3bc841b5205605c38f2c50a1;
    stim[18] = 305'h08257448e61370e69ec0a911fe5d97d9beb06c6c5b0888cf870f2b9b829a2512b1a5ea60f0c3e;
    stim[19] = 305'h04ee2d9c49325e8bc84b3e49143e0fb5d37ac3db63fce3da18887839d453027b2a261bb0f164d;
    stim[20] = 305'h0e572da7bda87ff8271b6f64e3805719a2467f2e23217ca0469210b684c759b7f5872bed3622f;
    stim[21] = 305'h057729178bcca3ee9c5bc55bd688164046a2f6e4908fd2348521afae1750a212ec76c50f2fa14;
    stim[22] = 305'h034a8934827276520cabbc6f5112f93787babe027cec72ac1515d340713d3337a5f8a764b1415;
    stim[23] = 305'h06f2f55d975381274343282de0b344d7afe2aad45e7decb31ce7ec96cd2761acf83f9a5f41f85;
    stim[24] = 305'h003a4b453325f6e5bae3f0b3038aa709b99e85fefc4da25252d5416e9248d4fba9865a9750379;
    stim[25] = 305'h17da24d5b9d81c905724bf18b51740660ef5d38c15744490b8817a4eb40c1e747e93945bd3e17;
    stim[26] = 305'h047a54646a6a4a96ddc54e3e497b5d4dca6883d76a14b729032ae1cc94cdfd6b4f7cea24a9ae9;
    stim[27] = 305'h02755e34b87c1610b8718a6adabaedd40647623c6ff806da74d7b4f5b35e51cb57f140c2d6794;
    stim[28] = 305'h035024acac9c0cde73ffdcb010d93f259159cfb53a03d0b35c819b70bc7de36493e0f018eb828;
    stim[29] = 305'h0e060aaba8a646ecf252d76aaa9b3f6f855c69c758668a75912729bb83d4f745c2b06e1fbc3f6;
    stim[30] = 305'h0c89a492ed07b41c1f625dde46ba863d45d7546dad733c7bda73b18d630f47308ba4e0de5b94c;
    stim[31] = 305'h041f6dfbb526fa739d6fa8f052ded6590d6273de14c820428e5f34566d01808a21cc1caa5f524;
    stim[32] = 305'h024a5c11006aefa87143a5181e176e1bef95da62b99530a2243a9074ebf6af80c2654041af240;
    stim[33] = 305'h0acd9cd0f3301541b79abfa480fb3e3fd9f1ad156dba18f737557f934fab37d59d91157032ef5;
    stim[34] = 305'h0d160b408910b80f95d2dde586a8625ad8864440e18c958b402503b8711b04a66c76cea13412f;
    stim[35] = 305'h00b30970b798b891176e4073b3a19fd1865c7a2963e41dff16d0fa6a86ae95335c2c0414215c1;
    stim[36] = 305'h0dd0e1dcdf6de710341b9132e699f5cf4cc6b4d1ccbf0ad6647af002506fd566a71247e56e971;
    stim[37] = 305'h0aa72762f332706c63840a40f11c5fc5afa09b868ad04e3496f030fde6649ea7b55eb323d3d6a;
    stim[38] = 305'h01db8737cb45cba1158d4a836806dd40b8a5c19efd8d9563ed75d9902d0a338773d7d1d762485;
    stim[39] = 305'h0fc99d9671190486514b5620f49cca0b510611a09ff0f3e9f6ef29d407e935c27c1369bf24d57;
    stim[40] = 305'h00f37146206d2b18de97cd6323a48f12da174b98d263a09e45d3a80f4cf50be6f7d768d4008b6;
    stim[41] = 305'h08a5f8b481ff3aac0581a6ac241af8b123f9b77bb7e3080a4e32d6bd80dda6f024d9e3cf057e1;
    stim[42] = 305'h0161b8f4e65808c274d78e34e3adf2653526a04355ac82843d268b254035ab3132f07844ee201;
    stim[43] = 305'h05079b6da835b59a90b50795143851bc37ed48365789264ed8eb11153376e8068a33783be1517;
    stim[44] = 305'h0460d3d8915b7de90a8ca256350d54a05c9bfd800b31175bf2fd0201b3095f9a91319ac4e7394;
    stim[45] = 305'h0a26b143af5ac4831cf37df458c619102291e2b792e09a2a412bc859173ba8611467fdee9bc56;
    stim[46] = 305'h023eda7cd6ad98d0d4080e1f2da10fbd634af172d9d87392289592d4d5339fe9df9f490916f31;
    stim[47] = 305'h0a693d0d5a653cb2a05a877b59d556e86fbbbc343a98e0e916f7714d7fca88183d4b30d03da67;
    stim[48] = 305'h05de3a302c3d49038cb3bc7ff5af09a8b8d5f6d41f00b9c6cc049f355d80e28e54e81edbd8ea5;
    stim[49] = 305'h0f03fe1acbc5ddee661ebc56c90b01442995f31b132857132267abca07fd5924bd34f54afef60;
    stim[50] = 305'h059b1ab76fa434fb42a23ed880fee5f269721da0b484212e648199d24047787c8b06183f6e12c;
    stim[51] = 305'h0112ed8b501d023372951eb47a25ae348bb6a677db0014b829e3f7b1814757b7a41f605049d08;
    stim[52] = 305'h00321cd755258ba4b7c838986c4f26ec2bc936a6d9329f42ee0abf5125d10ba56d7246e58f067;
    stim[53] = 305'h00c9addef5cbe9f48cb99635da199a31ac68254fe5fac0532cdcd6d14bbc67235e17fb1b68402;
    stim[54] = 305'h0026706e657d213f6b9e8bfce7a746035cd933e94ebef81a2913da70a3fc7cb46676efefe17f2;
    stim[55] = 305'h0c392d6a3f801d60f6a787f9aa500049d369d15c39e6eebd348f1e5ad18a07d0bc00fe539ef46;
    stim[56] = 305'h0dcbcddebdf9c0a90ecfbbb2a01c9f62f5989e576235d5312474d89a0e73abb6d3e6592fdf122;
    stim[57] = 305'h0da337805a25e07ce04b04574751c6e582f60905ced0885981201e140a41223ed9aa6c98c5584;
    stim[58] = 305'h0dca1bfce7a15b2c0bb2e9033dbd908d4c3e1550cbfa8e61d1952777a328f80e461a032f47f4d;
    stim[59] = 305'h0069482183dcb7fd69e0b1f2fbad28e2c03ba745446eeca99bd1fcfd6e490da266b9f05747cc4;
    stim[60] = 305'h0e736cf6fb00d09d5b37324962a374ad5d20cc768b83a30657db98983fd3784a0457d360e09ca;
    stim[61] = 305'h0d38ada8c812d560c2d0290f5b517759e659530d5f77b9a1602e1c55c280c1c9ada01c36f254f;
    stim[62] = 305'h0b34f9733202716caf8e8903eb80ae852ab0f3afafc9b3a3e3e01ebde8ddeccf4e0bff9785247;
    stim[63] = 305'h096878b65e7832cf63d54dba9c12e158039adb7e8fee42d58188fe3dea16bbac8905e2288a7ba;
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
      expv[0] = 6'h02;
      expv[1] = 6'h02;
      expv[2] = 6'h02;
      expv[3] = 6'h02;
      expv[4] = 6'h02;
      expv[5] = 6'h02;
      expv[6] = 6'h02;
      expv[7] = 6'h02;
      expv[8] = 6'h02;
      expv[9] = 6'h02;
      expv[10] = 6'h02;
      expv[11] = 6'h02;
      expv[12] = 6'h02;
      expv[13] = 6'h02;
      expv[14] = 6'h02;
      expv[15] = 6'h02;
      expv[16] = 6'h02;
      expv[17] = 6'h02;
      expv[18] = 6'h02;
      expv[19] = 6'h02;
      expv[20] = 6'h02;
      expv[21] = 6'h02;
      expv[22] = 6'h02;
      expv[23] = 6'h02;
      expv[24] = 6'h02;
      expv[25] = 6'h02;
      expv[26] = 6'h02;
      expv[27] = 6'h02;
      expv[28] = 6'h02;
      expv[29] = 6'h02;
      expv[30] = 6'h02;
      expv[31] = 6'h02;
      expv[32] = 6'h02;
      expv[33] = 6'h02;
      expv[34] = 6'h02;
      expv[35] = 6'h02;
      expv[36] = 6'h02;
      expv[37] = 6'h02;
      expv[38] = 6'h02;
      expv[39] = 6'h02;
      expv[40] = 6'h02;
      expv[41] = 6'h02;
      expv[42] = 6'h02;
      expv[43] = 6'h02;
      expv[44] = 6'h02;
      expv[45] = 6'h02;
      expv[46] = 6'h02;
      expv[47] = 6'h02;
      expv[48] = 6'h02;
      expv[49] = 6'h02;
      expv[50] = 6'h02;
      expv[51] = 6'h02;
      expv[52] = 6'h02;
      expv[53] = 6'h02;
      expv[54] = 6'h02;
      expv[55] = 6'h02;
      expv[56] = 6'h02;
      expv[57] = 6'h02;
      expv[58] = 6'h02;
      expv[59] = 6'h02;
      expv[60] = 6'h02;
      expv[61] = 6'h02;
      expv[62] = 6'h02;
      expv[63] = 6'h02;
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
