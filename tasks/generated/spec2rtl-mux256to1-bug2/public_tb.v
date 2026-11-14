// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[263:8]),
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
    stim[0] = 264'hb2bfc650dbc7013763d3aff57347837167c833c9e652bbb5a1dc6eaada1a65b873;
    stim[1] = 264'h4968ef90b97741596db2c3fab30eee4c10c1410340c75731c6a657058114ea0c21;
    stim[2] = 264'hdf681b826c6127b3ad91a2021cbcfa0eb1cf0643c12d112e857c02a6edafc7313a;
    stim[3] = 264'ha556e910eb73b8b753e7def4b5d2adec0f54127c1cd13537512e37afa76a1b5675;
    stim[4] = 264'hab24ece47ca7a0d2cf77b1f421aa4de02d9e92c586b71799f067f9a7190f99f4da;
    stim[5] = 264'h94b42c99fc9882b5baffa7d88027e89cc556976d9919df36cab6622f696b47dfd4;
    stim[6] = 264'h30220f8afaa7ca2906d68c9f04d4bc543c1213b78007d9a21105f8917c7cdd7c8d;
    stim[7] = 264'h15eaf12600f9297955cec66b19edecdce6324a732c2bed2955fdd614ab8f410d35;
    stim[8] = 264'hdf0867773f0746ae32f338c61853158a9e13daeba56ad3a199898e34bf38159dab;
    stim[9] = 264'he735be4d913df967af1069418336eb3477170bb727de0a8e568bd78cd5021cec12;
    stim[10] = 264'h3150f31fc14a9e185bf29c07e6dff2cfbd805f78f9d06ea237884210c54cb11c81;
    stim[11] = 264'h74cc2e0101ee1880fad39f522a15cb67708dacf93fb5f56bcfec4df7ce634e865a;
    stim[12] = 264'h51abeb9ec508f253a775d07232cc1985d6139eac4052b7a2095b84aafa017f3129;
    stim[13] = 264'hb6edbc00bb2e8e2fe3b9f627c296505f7b98a25abc61a2e85c2c47183eabe4f0dc;
    stim[14] = 264'h8f8aea2082daf1ef50b7fced34b372fe93a0b0ba2dda91ba42b1e82c9531844672;
    stim[15] = 264'h80b09dae0f9d2bfa037eb37e4f570a8eae57f137490382118ad65b491711b1c72c;
    stim[16] = 264'hb13b93ec5db08033839f0e6ea13b85bf53df028c041d3b58ce5bc0395ccc184783;
    stim[17] = 264'h6e18b240683e20eafbdb3370be7676ca46861c8e4dcdd57f49f8f2aa43a423bffe;
    stim[18] = 264'hf1c8b16cc5ae2b746e299426d772d39ad0def45bf6448a4336f911e6e5ca1d22d6;
    stim[19] = 264'h0463258e42350d1381afc893816367fdc55ec571bcc18866141a918720fba48134;
    stim[20] = 264'h770a3d69eb2e8925b6115494bb92e59efa8d48a0434993f9f3cafb7ad0e931ac0f;
    stim[21] = 264'h5edfefd526859f4c3e0f09cec77969258311b799c535e39fc8b9c8b70fbab45e4b;
    stim[22] = 264'h1ac82ca527553d10247025fcf3b852d94c8be0a06001a1578a6d4917f8601c669f;
    stim[23] = 264'hf1bb2528d07929a0820aeb5841041947194dcad4de54c9b673849eae6b1e1c042f;
    stim[24] = 264'h74fafb7ed8e36c266c783d62a43c318eccbd98d5f6ab58b296e063a1fd57945d08;
    stim[25] = 264'hbba9e96bf014363e9bb84a6f86bf2c5611f45a5cf98f17bf7e73b28752605859cb;
    stim[26] = 264'hfa110d0d9cbb53b912d3eeeda61d2cb6f7edda89311c6ce447a205978b4dfb42f1;
    stim[27] = 264'hbca3dde7eb4608d6ed53081767129ae6b540bd6f29b58fbdf69cdff8c8e8800991;
    stim[28] = 264'h0727a760f8b0456f9c9821eb18f046da83438ffe4ac35654c4d0973f4c12f619f1;
    stim[29] = 264'he0b976359e5a03a83990379c0b074ad9f81e99025fc2bad20f76f624e85c91a9f2;
    stim[30] = 264'h33784b03319621414eb6c4848f93c22779dbe1e59927fde94903a430a0572cf739;
    stim[31] = 264'h02275e1862113884e288d2cab94afd0ca590bb6ca9e095799f859168707b8af3da;
    stim[32] = 264'hb9763c9a976e750a5c609d9ac00e79a3c9e03b0b01c8ff282c8262042d9b9b101f;
    stim[33] = 264'hfec78635463d7117bf669df7dc6d19ad452c945a9de2e651738a9bc6bd0b0cf8d7;
    stim[34] = 264'h574ef0ef6dc664f33db7be6702ad6189665a8aea055f9a3d7e62d8fdeca4b7a744;
    stim[35] = 264'h41434be8104c6ca8c6bb2521a5d109b5057568a3ea8e7321f9ce59de52e322dc54;
    stim[36] = 264'hece16e3fa4818256c4a407caa42f375ef7a87c9b79087ae4ba6fb6d4962f784784;
    stim[37] = 264'hb2193bd62b5d57b34877e68cdf306972382e7678f955bb1727d8329c744ae57493;
    stim[38] = 264'h2989accd3947379bcc251911d911d112e029acc857d8dbf09cecff902a096c9116;
    stim[39] = 264'hc1f22f3cf53dedda9c6f8ba25c3fee25b393421f90920cec875dcac5abafdc2ca3;
    stim[40] = 264'h15c73876c56164f986736c30b23226a19268b5b5e5665fba20605aff71ffae89c5;
    stim[41] = 264'hfda94a16d37b547dd572057dd479c9756367a5519c28d64985c095ad28bed8101f;
    stim[42] = 264'h172534d95ac304deac7d761b7aba6aa2e69325488d3dcc79a3c18e70f331eccee8;
    stim[43] = 264'hfffa2c5862c3efd4b044d6d31b46e45f0e20a4199ef3e8b245be7435814d1d3780;
    stim[44] = 264'h0870513b80ce305b1bd3735645bdb9e90d7986edb2bd08053eb0c1fd831bd503f4;
    stim[45] = 264'h9464ec4c1d1e3a67aa236ee0051529bf57a8fdd1712d5ea431f34f985796fc3eed;
    stim[46] = 264'hd6270c14da29a81187dd0d6f60f74e06f98116b983ab0560d9e2ec0bd321c28230;
    stim[47] = 264'h23172f899c9afc96daad6169e5783a79f134aa608bf2bf6fbbc604d1d1fe6fc7b9;
    stim[48] = 264'h7d28bf2e3734e98f47a0f331adacb92112f8ef26d37272c79ece5451449cb13f84;
    stim[49] = 264'h9cf590c8e0bf81e2889a2538f17a0ed52f5087d9228b8271885eb30cc710ae06ca;
    stim[50] = 264'h9ced7923a1f5e588fa4926555c4a9226d5349ca9fb5324a7bada96c76b4666033c;
    stim[51] = 264'hfe6104e37f837907b43dd96ac8d1357c05725ce7c6b6d64936016993a27e39bc5a;
    stim[52] = 264'he6e2010a8e8835ec3af4117c64536eac085e00001e76ebc919260ed940e129e44c;
    stim[53] = 264'h91b60ebc11321ce78c5f57fe9a79270f021a7906083119aad57f452f08f534442a;
    stim[54] = 264'hbab81a7d248a000c1cbed46e903c894781ef3f4ecd0b7f913756ae0c515b8c7271;
    stim[55] = 264'hf99a1bb831623007ffeeeb0f04952e83548951067a6198311e26df128a89c932c9;
    stim[56] = 264'hf260fac89c3d1e1eeedfefb64eb9a3f46157593ed2fbeaf53e334a603652c5de7f;
    stim[57] = 264'hc381b588a1e054e2fe486fa74c1d830fb6fbeb0fb3810b2e6551a23f7b2526ea39;
    stim[58] = 264'h60cc6fbd4278078b9e138f0ed6981437b9c5ac2f0eee18cd9788bf483daaf0c0a2;
    stim[59] = 264'heab32177f9e7f09fa4e703ce97f660be87c968c859cc733294c9a15c037380ec4f;
    stim[60] = 264'h005f7496fa47af314ee03cac2659727d4ba34a88df2087e25401e288e0ebb849ad;
    stim[61] = 264'h65e677e3ca45548282f384b0bbeb9bcaff307f5515232cf8f1fa12a3af0d10106d;
    stim[62] = 264'h8732f40bf1b92e317a1bfbd35b49b3ccbf183a5465bec906ca760f11d89317fe6c;
    stim[63] = 264'hb72eb3558653dd24af105c2baafb49c30a1127ce7dedd0c5855f1417c1ab0b05dc;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
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
