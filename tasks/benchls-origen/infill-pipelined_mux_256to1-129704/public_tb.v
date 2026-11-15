// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 265;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129704 dut (
    .clk(clk),
    .rst(in_vec[264:264]),
    .data_in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 265'h1d9297292bddfe83363dbc662ea1dce12273ad1f04f2522de93892d04db792baeda;
    stim[1] = 265'h1091989a4b677637fdd827fc0c2b95defde46f8519ff10ca25df985866fab18579c;
    stim[2] = 265'h0443de7f14ab229214487bf6a202373cd7081ee2842a6206681dd2722eeb81ce22c;
    stim[3] = 265'h0a39a8672bb38df9091d99b6869044b19cffafeca48328e8612617e5eda0e5f91b0;
    stim[4] = 265'h017aaf11edf602273ca961eef1fe3e8d3ed607f42935918baacd0e8544f5557418c;
    stim[5] = 265'h0024bfc38fa7d671b5871cab9d3fb22eb673c5a399bbecbf3c33df51badc963b0ec;
    stim[6] = 265'h01093d6ed18f88f7aef3cee4aa9f32a3565821873ff20f86729e0333eee8076002c;
    stim[7] = 265'h1aef41e89347748e82695a8ef644b0e184e4adecbf020b082f7d07583cd5d535269;
    stim[8] = 265'h05dca6f80e197e8630bb3eef14fe1fd666ec98f7aed6077e5770dc43b250f5bcf86;
    stim[9] = 265'h0eaa0a6a96156fde4ac50c51928bd2872efc6f722aa3c20a5a3087ce26fc47796ff;
    stim[10] = 265'h097d1a44d87658702981896967e2656acb2250c88b7aeecaccadbb6a251a2e5349e;
    stim[11] = 265'h023e62189dd4c59a5f11f825f28cbe89433fcedb1f6b501ca41aff618c87aaf4d19;
    stim[12] = 265'h0002746d79a4f872ee4001645e5f5498c083cff1482f0dbd025476a8064b7a20f17;
    stim[13] = 265'h0b0e2148e171d8fe2274fe4657a7ff5fc8f2c1a2ec9879d0b1808ed2f06c6d8d8e7;
    stim[14] = 265'h061c0ccada0e2ee6a22a5adbe25278d86cd6e56097fb49e1cf4df33ffb88727b717;
    stim[15] = 265'h07f11f6a1661b0717fc92ca8a48dc2d4c62165747d3e52a76381f64ca4514788d56;
    stim[16] = 265'h0c3f9b5ec1f5a6a539a9719f0a3be7a1ccdda34f65cf70864d173ba30eca1551c9b;
    stim[17] = 265'h034d67963ed0a88ecb8bf35718b093db165a844a2321e931d6d18629dada38e35e1;
    stim[18] = 265'h02c72e4591e0d524263065c9ef803c91e4af9b7d9bb8d325509fe7811a352145748;
    stim[19] = 265'h06f1ae65a436e9bdafa498a930909fe1aceb872d365cf42d4cf6e658f449ab125f4;
    stim[20] = 265'h0edff975d0aa95f7292d4a59621975ba370ebe5e0b473a68ed06e20394efac9e5c2;
    stim[21] = 265'h045758efd485e661eeb359527dab7e4fa727415c1702db1fb30970da7b5651d081c;
    stim[22] = 265'h0942b3210d5859e6e9fdeb033df3697bf20f57cab7e7411001b4be6d9e5dced0771;
    stim[23] = 265'h04050d8a0febb53bb3c162ea55f58fd7da11f3bec0f8a3a141cb58557eaba63e476;
    stim[24] = 265'h0e466112f7d35f0384495236723c83bf78e0a641549f811807d58e0d635113a0bc5;
    stim[25] = 265'h0d14f62c6282b038fe90f2a74966447ea18c7d32c41909878249ef8c7c77b04daed;
    stim[26] = 265'h1de57e01570d1dc86fba8ff116c0724fe0a7a9c012d8f11cf5f36c594c4459631a6;
    stim[27] = 265'h0f569a2eab1c30dbbf8d80c3b78bb0bfa17d1182031745c23e70f84812462532456;
    stim[28] = 265'h00b042770cbd2d947e70131393ada08c16ca3e32b342ab10ea3f53a2918115ccf47;
    stim[29] = 265'h0411aa80aa44412b7e46785af120fe9418a07362ce2701c18899025759f344e1247;
    stim[30] = 265'h07229776a9d64ee6edfa0961ab2104ad9ddea4bb2c90710cbee9fdded17908858b5;
    stim[31] = 265'h09ceaa388b9c927660d8f38efbcc64da092d7daba9a4d89b4e1267cdf2964d16070;
    stim[32] = 265'h0af6704860949ce5f98f145d451b0acc5fbb120c5b837dbcc7975fb8f91241c73f3;
    stim[33] = 265'h0f7eaff8ead339f5d57d83f49768cc6bcf232b17359b97f14abc781a9cdcb11408d;
    stim[34] = 265'h0c8190ebd02476107a58a7a78eead6c2bba5105764277735deb8178194105edd2aa;
    stim[35] = 265'h0f9a476dd0e511ab02bfd2bf9f10f73792b4fd8c15632a75a4f369be4d693a23f8e;
    stim[36] = 265'h0a6d0dc8770f0db4c8b5a42349999849a6f2c5c76390f0902e21cc82b3789fcb0ef;
    stim[37] = 265'h05c1bbaecab7cc8785b692c940e848ecc1a7506b007e17616c7e6759725f49777c4;
    stim[38] = 265'h0b25c32915bbbc2bb0a8b99bf7f57605f483b4c8fc784719a38f46f63827a0c53cd;
    stim[39] = 265'h0abc8be0a568e646babc95a11656c71e20fef1248520fd2abdbb5b7be46330d0523;
    stim[40] = 265'h0fd142f4bdfe3c838f2d80796d308ebfd2d90e0a9d723c07c1172299e8bef581c2e;
    stim[41] = 265'h0284f07bd84d74859fd22a417b1b6bbe809ddd193abeb9fc3ab72d4fab57a180894;
    stim[42] = 265'h0204b3091291a63f72f8b86becc9a98fb207836ac85d41dec77b070fcc6ac1fa7bb;
    stim[43] = 265'h0ec3f32e7eb0acc511e5f5c55dab0a017ba1bdd3e88f693bd95805c736327b51559;
    stim[44] = 265'h03eb4ba7fef60b9627ba1ce6a824866e7f2cf4c0186f3e20cbc7b73e9d04fd93fb6;
    stim[45] = 265'h004affcba70346e6f95e349ab917af3b7533c49f9fb8355f5f0bdd99671da71f63c;
    stim[46] = 265'h0abda1ca59632985d67ad8e90f668946001e30c5e04c70e15429287dc707a916628;
    stim[47] = 265'h024a7ff0f2583a1aa56bf28f257f1ca0b217cfe38ea98ce5a00c6174ea4e205a798;
    stim[48] = 265'h0cc1a6f82efa04de3c0dea4eb5d2ca88aaed8ba517ffb2e311b3d9db66f53c33ca2;
    stim[49] = 265'h0b66980b7ce7fb85d633697bdb26ede78b497b17ff064a5573c5660a66ecb0b594b;
    stim[50] = 265'h094311da921a58ee10b71a7693e062328b231da822460a768716bd42857fb0b1481;
    stim[51] = 265'h0388dccaea997b560d679f380ea389cedf4942796edc4577690b40f19fb5433a1f0;
    stim[52] = 265'h072fc60308744a194283b62834fb8a8383f88bc8c31160666dd1a5c3621cf2ac2bf;
    stim[53] = 265'h0781e047a410d250f8f43d106f3592ebac0e74e20244b879ac1c7ecb223f952fce1;
    stim[54] = 265'h083ef99ad3fd79505241961876dd13ec1d96ee57d1c4792c3065ce6c8c50fa36081;
    stim[55] = 265'h077e29c8bff471106546a64c414134d006df09501a703586d1e73ab4523e7c80b98;
    stim[56] = 265'h074906c2e2c28a1345c1b2d3a46bf1aacd179b8a8bcb16d1d324281aff607fd9d8e;
    stim[57] = 265'h0a5847bf5f2e71f4d3dd40729a01ff04e7a2df4bbcee30bc2b2a7f89d2dc9818ce4;
    stim[58] = 265'h0562f7be071b204583ed68d4e516dfc3421cd18e8d43a9d11f6020b9e18da4dbb01;
    stim[59] = 265'h0ad7d9296d8c1e883923d2ac963849ed26a9817167ade432d6d3a67b6f26a7afb7b;
    stim[60] = 265'h07b68e3773e29e3e685c2140460f5a8d6e39ade54386f52fc994accbe6df20f6993;
    stim[61] = 265'h0466b6564ee2ede57f5f71b6003a52a5708d380092ba46275a8cec2ffcc84a602d9;
    stim[62] = 265'h0d2c6546d3f2f337f10f64be3b909b4894d3f1d7d33557d3284095d4f8ed61a7a94;
    stim[63] = 265'h0ca880e3c91e136d35128b02f9089f85ba392e943de454b82bd0c899d01f31bc559;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
