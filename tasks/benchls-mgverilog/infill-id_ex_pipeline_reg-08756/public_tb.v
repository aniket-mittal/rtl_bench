// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 178;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08756 dut (
    .clk(clk),
    .rst(in_vec[177:177]),
    .ID_stall(in_vec[176:176]),
    .ID_flush(in_vec[175:175]),
    .EX_stall(in_vec[174:174]),
    .ID_reg_dst(in_vec[173:169]),
    .ID_data_a(in_vec[168:137]),
    .ID_data_b(in_vec[136:105]),
    .ID_data_c(in_vec[104:73]),
    .ID_aluc(in_vec[72:52]),
    .ID_sign(in_vec[51:51]),
    .ID_memread(in_vec[50:50]),
    .ID_memwrite(in_vec[49:49]),
    .ID_memaddr(in_vec[48:17]),
    .ID_load_op(in_vec[16:8]),
    .ID_store_op(in_vec[7:2]),
    .ID_memtoreg(in_vec[1:1]),
    .ID_regwrite(in_vec[0:0]),
    .EX_data_a(out_vec[168:137]),
    .EX_data_b(out_vec[136:105]),
    .EX_data_c(out_vec[104:73]),
    .EX_aluc(out_vec[72:52]),
    .EX_sign(out_vec[51:51]),
    .EX_memread(out_vec[50:50]),
    .EX_memwrite(out_vec[49:49]),
    .EX_memaddr(out_vec[48:17]),
    .EX_load_op(out_vec[16:8]),
    .EX_store_op(out_vec[7:2]),
    .EX_memtoreg(out_vec[1:1]),
    .EX_regwrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 178'h3a242493616cc6bfc6e9cdeed2f6c8e68a97102021322;
    stim[1] = 178'h337c50ad9222c0edbdceb59f4c00cfdd680ede2de0197;
    stim[2] = 178'h0ffce1a4d38dd0b91bfd1ab3d96628b463fe69d8e6b12;
    stim[3] = 178'h00c48afd6b5bd01d55b593229ee3f4e81d4a2360f123f;
    stim[4] = 178'h083147c79ae1d27cc0a24730fd4f8093e39c511f44874;
    stim[5] = 178'h0bd26aca46bb39e4860ed6671314a2a8ed70b12cb8ecb;
    stim[6] = 178'h1cba92155a224174cc894a38c112bdafc2fdfbd98e3b8;
    stim[7] = 178'h0551fef2c2b66cf7e1b0b3c0788a41a60ca33c7da2f39;
    stim[8] = 178'h014b31ed021459b7cd0c9c7e971d1cef5006553bbb96e;
    stim[9] = 178'h08f93b9c6a04580e2838d738352011b6ce57d27d91adb;
    stim[10] = 178'h198a1be15e6f90e43a7905606e19aab0552d56ac0d27c;
    stim[11] = 178'h07ab51b4a75e3719ad41de386d4a352a95bb986137f82;
    stim[12] = 178'h134dbf07c4e35a062de16feb344171c9727c2c5560086;
    stim[13] = 178'h0767dab6865a6f25856af18a3cf48d665ec4ce34f00da;
    stim[14] = 178'h11416498818f5f839e2ba5cbfa7e0440b726dd832e848;
    stim[15] = 178'h112d04bab4f45d75c0622c9d2da547212121edea4d71b;
    stim[16] = 178'h08db7e5139b426368a1a11a82661984b77cf563cab5c6;
    stim[17] = 178'h09c6a62910e45463c0eeeef1fafc2ac12e8a3e8a55611;
    stim[18] = 178'h19cff830c7bb227acace92e748dfdf5bc303175b326b7;
    stim[19] = 178'h16e3a98366b7c1c29dfee661d0711060eb9fb8ae3241c;
    stim[20] = 178'h15309ef48c3293f08025438da2ba9bf939ab8ec5eccd0;
    stim[21] = 178'h231f81d2ba246ae3c35f1188285430a654df74437e4fb;
    stim[22] = 178'h0a3fc07d1f2dae58b9639a5f1f7a1dae47ba4f283933d;
    stim[23] = 178'h16744e9ec7d1ee9501a1ec977d0be6f2e2e7c4fe5d903;
    stim[24] = 178'h1694675d68113f0845350392de1b3109e23cc214c7a1e;
    stim[25] = 178'h15da366ddf707b228c459de58ef49f3420d7297d1707f;
    stim[26] = 178'h1b6f9e2e6040f006e1698a9f1d1e481061ff50a5c3768;
    stim[27] = 178'h00c0843745432c70c5ecb97a987264a70293c087ad631;
    stim[28] = 178'h0efc09c9da802c7ac877e1a0fa28dd19866361b036c20;
    stim[29] = 178'h079f5bbdeb7598933fda8a60a3b89307cf0dca075104c;
    stim[30] = 178'h1eb628c1a1217a7c45c114fdc88eca24c6632effd2c1d;
    stim[31] = 178'h00c00f9756e7f4f1d72ba14aea25c2bb570afc9c37fa3;
    stim[32] = 178'h1cc273bc75f2b36b6f18a59373d9bd2c3f5d457bbcf68;
    stim[33] = 178'h196fd044ea8de9fe0321a60529eebc1dc691f50b6f6a1;
    stim[34] = 178'h0fc5e1c760778abe5986b923d4f6cb803d2fdd71401bb;
    stim[35] = 178'h0d3c2ff55d5f1280b8f5a316dacbabb8ba4269172a6ff;
    stim[36] = 178'h162d0cd82a924993535fe1a02158454d917ed7fccaf5c;
    stim[37] = 178'h06d008c53b48fb35a35bf8ce19ee82f373bcb229579ed;
    stim[38] = 178'h1c24ed485b912e33072d7b86a7e1f735555ee6eb43ece;
    stim[39] = 178'h177258c8093cd4a3d0ab1bc1c995b3baee14656eb421f;
    stim[40] = 178'h0afd1a48d4b36c02dc1abb587042427b44d25f96f0650;
    stim[41] = 178'h1324d28bbe09ccdcf7b591059712e577337d9792b7578;
    stim[42] = 178'h195fc4ea2e9711c23bf082ef70980b1f33369bbb9aa2f;
    stim[43] = 178'h016ec2346bb2050c0d36eda61e84f1b76660ab6809d15;
    stim[44] = 178'h16657f5eed7c635f7a8951bf815ae0d2771631aab3140;
    stim[45] = 178'h1cbb57241a8ffb189c3eba543addd3b8e42999164de07;
    stim[46] = 178'h111ca3deb010b2fd73c606e4875e6378f69be42e4cbd7;
    stim[47] = 178'h0b3dd84fb18bbf95ad3598f88250ae313d3481857a597;
    stim[48] = 178'h15080892de5021816f66b37e61ad6cc59fb010392d109;
    stim[49] = 178'h14599b1b40fa0fa5977276a52dc364294ed7f82c5aee1;
    stim[50] = 178'h09bcbc8bb04244f9ff31465539c94801446ec19475a86;
    stim[51] = 178'h1252f573d729e6800d5980524a29d6a718ab6f36a9238;
    stim[52] = 178'h1e3dff1530048c47d8eac3b44dbde75840e3babec85c1;
    stim[53] = 178'h10f0c8c94c977c5f133c5cb1c264018301b029efc9ee4;
    stim[54] = 178'h02f0ef92cbf3f3790020bc160c1cda397bb5a2091aca3;
    stim[55] = 178'h0b15722f540d5065d06ae6a0c2b2f10ae0c6015a2995b;
    stim[56] = 178'h0350bf7f4dbb66b8511f2a987237bfc02744bf07e056c;
    stim[57] = 178'h08451ab7e2c666deb8894ca3feb5f8971df9d61176f4b;
    stim[58] = 178'h1ae3da25c8583e823a30c5d1ccfb6f718f32c49ae5035;
    stim[59] = 178'h03b14bdc869ca00a52587212f3d867ab48321c7aeea54;
    stim[60] = 178'h1841e78a8ce04ec91dcf201fdb542aa2f7a4f48bcdee0;
    stim[61] = 178'h08a65d38af73549d29167752f2ad1b30a39e6396e9aaa;
    stim[62] = 178'h0a938697f9b1c677a0c5d5b241cf9e20d4707f976c017;
    stim[63] = 178'h0805d7a57f7bfdce63a40469d51ae247ee1d0c2ddceb3;
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
      expv[0] = 169'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 169'h0000000000000000000000000000000000000000000;
      expv[2] = 169'h0000000000000000000000000000000000000000000;
      expv[3] = 169'h0000000000000000000000000000000000000000000;
      expv[4] = 169'h048afd6b5bd01d55b593229ee3f4e81d4a2360f123f;
      expv[5] = 169'h1147c79ae1d27cc0a24730fd4000008000000004874;
      expv[6] = 169'h126aca46bb39e4860ed667130000008000000018eca;
      expv[7] = 169'h126aca46bb39e4860ed667130000008000000018eca;
      expv[8] = 169'h126aca46bb39e4860ed667130000008000000018eca;
      expv[9] = 169'h0b31ed021459b7cd0c9c7e971d1cef5006553bbb96e;
      expv[10] = 169'h193b9c6a04580e2838d738352000008000000011ada;
      expv[11] = 169'h0a1be15e6f90e43a7905606e000000000000000d27c;
      expv[12] = 169'h0a1be15e6f90e43a7905606e000000000000000d27c;
      expv[13] = 169'h0dbf07c4e35a062de16feb344000000000000000086;
      expv[14] = 169'h0dbf07c4e35a062de16feb344000000000000000086;
      expv[15] = 169'h016498818f5f839e2ba5cbfa600000800000000e848;
      expv[16] = 169'h0d04bab4f45d75c0622c9d2da00000000000000d71a;
      expv[17] = 169'h1b7e5139b426368a1a11a826600000000000000b5c6;
      expv[18] = 169'h06a62910e45463c0eeeef1fae000000000000015610;
      expv[19] = 169'h0ff830c7bb227acace92e748c0000080000000126b6;
      expv[20] = 169'h0ff830c7bb227acace92e748c0000080000000126b6;
      expv[21] = 169'h0ff830c7bb227acace92e748c0000080000000126b6;
      expv[22] = 169'h0000000000000000000000000000000000000000000;
      expv[23] = 169'h1fc07d1f2dae58b9639a5f1f600000000000001933c;
      expv[24] = 169'h1fc07d1f2dae58b9639a5f1f600000000000001933c;
      expv[25] = 169'h1fc07d1f2dae58b9639a5f1f600000000000001933c;
      expv[26] = 169'h1fc07d1f2dae58b9639a5f1f600000000000001933c;
      expv[27] = 169'h0f9e2e6040f006e1698a9f1d0000000000000003768;
      expv[28] = 169'h00843745432c70c5ecb97a987264a70293c087ad631;
      expv[29] = 169'h00843745432c70c5ecb97a987264a70293c087ad631;
      expv[30] = 169'h00843745432c70c5ecb97a987264a70293c087ad631;
      expv[31] = 169'h00843745432c70c5ecb97a987264a70293c087ad631;
      expv[32] = 169'h000f9756e7f4f1d72ba14aea25c2bb570afc9c37fa3;
      expv[33] = 169'h000f9756e7f4f1d72ba14aea25c2bb570afc9c37fa3;
      expv[34] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[35] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[36] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[37] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[38] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[39] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[40] = 169'h0fd044ea8de9fe0321a60529e00000800000000f6a0;
      expv[41] = 169'h1d1a48d4b36c02dc1abb58704000000000000010650;
      expv[42] = 169'h04d28bbe09ccdcf7b59105970000000000000017578;
      expv[43] = 169'h1fc4ea2e9711c23bf082ef70800000000000001aa2e;
      expv[44] = 169'h0ec2346bb2050c0d36eda61e84f1b76660ab6809d15;
      expv[45] = 169'h0ec2346bb2050c0d36eda61e84f1b76660ab6809d15;
      expv[46] = 169'h0ec2346bb2050c0d36eda61e84f1b76660ab6809d15;
      expv[47] = 169'h1ca3deb010b2fd73c606e487400000800000000cbd6;
      expv[48] = 169'h1dd84fb18bbf95ad3598f882400000000000001a596;
      expv[49] = 169'h1dd84fb18bbf95ad3598f882400000000000001a596;
      expv[50] = 169'h1dd84fb18bbf95ad3598f882400000000000001a596;
      expv[51] = 169'h1cbc8bb04244f9ff31465539c000000000000015a86;
      expv[52] = 169'h12f573d729e6800d5980524a2000000000000009238;
      expv[53] = 169'h12f573d729e6800d5980524a2000000000000009238;
      expv[54] = 169'h10c8c94c977c5f133c5cb1c26000000000000009ee4;
      expv[55] = 169'h10ef92cbf3f3790020bc160c1cda397bb5a2091aca3;
      expv[56] = 169'h15722f540d5065d06ae6a0c2a00000800000000995a;
      expv[57] = 169'h10bf7f4dbb66b8511f2a987237bfc02744bf07e056c;
      expv[58] = 169'h051ab7e2c666deb8894ca3fea000000000000016f4a;
      expv[59] = 169'h03da25c8583e823a30c5d1cce000008000000005034;
      expv[60] = 169'h114bdc869ca00a52587212f3d867ab48321c7aeea54;
      expv[61] = 169'h01e78a8ce04ec91dcf201fdb400000800000000dee0;
      expv[62] = 169'h065d38af73549d29167752f2a000008000000009aaa;
      expv[63] = 169'h138697f9b1c677a0c5d5b241c00000800000000c016;
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
