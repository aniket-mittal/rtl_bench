// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  shift_rows dut (
    .in(in_vec[127:0]),
    .out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'he20acafe0ce3c7bc0681416f1b86f0f1;
    stim[1] = 128'h3e548ed11460b9ec788cd346de4246cc;
    stim[2] = 128'haffdcae952ef95dc70563a1c6125568e;
    stim[3] = 128'hf972bc2808e517c98922b1dcf023f2de;
    stim[4] = 128'h85cdff9f80f615c8174378014e052ded;
    stim[5] = 128'h5beb7190a87e82f64011ef7c6cd61cde;
    stim[6] = 128'h4dfafb1d43b141dd1a8493c93492f73d;
    stim[7] = 128'hb1d8c61a257b797ffa38d472848d96f2;
    stim[8] = 128'h5b35baf58fa7e2547017549aad5c83c5;
    stim[9] = 128'hac01d0d624552582fd0c841d07e734f3;
    stim[10] = 128'h8091443297d4abf113f55f29f4be89f0;
    stim[11] = 128'h6ddc8f7a0e35a093b814b849dfbaac13;
    stim[12] = 128'he388c1523a180d79a93fa65775c1d507;
    stim[13] = 128'h6a23201308063a2e672f4dacbe9277e8;
    stim[14] = 128'h3e1715e8ec075e55648057b9d27bb466;
    stim[15] = 128'h063efd9257d1ebae2b50d6583f0ad4a5;
    stim[16] = 128'hc87843400710da73defc01d076a37df1;
    stim[17] = 128'ha55280a0d6470ffadecb0957c234dd48;
    stim[18] = 128'h1ed4dfc04817b20141e051d4f2f21b7c;
    stim[19] = 128'h25a5b47e0fef71151834aff75fc19ef9;
    stim[20] = 128'h7eee7ca2dbe9ba8df3ba2c373b44002a;
    stim[21] = 128'h6555a07f7876c632ab3db3b297a771e9;
    stim[22] = 128'hb37aa0779764b85e5b7a74ae0bff7c5d;
    stim[23] = 128'heb5a86a2dc97af9532211e9e43ac0428;
    stim[24] = 128'hb1a53ba88e3c1f88540169a1ab10552e;
    stim[25] = 128'hee81581751ea84fdbbf1057887ba5007;
    stim[26] = 128'hb04e4a9531d06a027b1674cb74c0dde9;
    stim[27] = 128'hdbd398ceb864bc90187de10945144540;
    stim[28] = 128'hc772f86797f1e5fe5127b56ba8882ecc;
    stim[29] = 128'h2031c0867c6bb7523478b04049a69296;
    stim[30] = 128'hb0fd50d0c80a160a6a2a41c817f20342;
    stim[31] = 128'hc95ac8fa276305f2b7e8b7ac03b295b4;
    stim[32] = 128'h55fb76898677cecc12468f59d77daa02;
    stim[33] = 128'h8929f677593b16bd7a76a43148f95296;
    stim[34] = 128'ha05274fd5fbff47390947c29eccdd604;
    stim[35] = 128'h720b0a42cc7b921b3fa3ccca0791f7e9;
    stim[36] = 128'h2477abacc5acf3c3a759dad2d4e5ed8b;
    stim[37] = 128'hcbc81c73588b81f7d4cf9af7002e7f80;
    stim[38] = 128'hb8f14aeb4e1b9039f500c8dc468110a5;
    stim[39] = 128'h7c9a7f5ca954824e3b349dd76e3f8e9d;
    stim[40] = 128'h780556d6d824ec603204cf51dc0803f8;
    stim[41] = 128'h3f63b5c57d1b34baa00c46571b497a2a;
    stim[42] = 128'h5587e41b91787d99b0db6282f93fec87;
    stim[43] = 128'h1e46343236c0189c00ed543c92743a29;
    stim[44] = 128'h757cf9c96ecedd6920230a5f047b3f92;
    stim[45] = 128'h16183739d58a5600cf2eee62f01183e0;
    stim[46] = 128'h40378d20172dbf8108f75ee83a141c90;
    stim[47] = 128'hd31520923f165227bb4ba4246f142459;
    stim[48] = 128'h60c8ffc2651d1772758ef01836604de1;
    stim[49] = 128'h0e2b727cda9e2217aebb2ea671497d42;
    stim[50] = 128'h7d3694bd236c806e70508f3069e87544;
    stim[51] = 128'hdcdef2544453d50125fc3621d799c1b1;
    stim[52] = 128'h69820447b782a3bcc7ab359780f6e6ed;
    stim[53] = 128'h3048f06465589624afbcc168398dcee5;
    stim[54] = 128'h7f88a647cd8fee5e632007d39a9227d0;
    stim[55] = 128'hc558e4de2d46ce62d2b175881e92a2fd;
    stim[56] = 128'haefea600299afc8d5383de23af1ee97d;
    stim[57] = 128'hccde5359fd63f47c2f3d7bdba6127c98;
    stim[58] = 128'h4f6afb7852b5c5c160ffc5470d046648;
    stim[59] = 128'h36ab05af024bb1432c26e767e538a6fa;
    stim[60] = 128'h441d880ea3ac10d4d2797bce397b7a01;
    stim[61] = 128'hc7347cebd689578fe350776d5add52ea;
    stim[62] = 128'h2e154931734090adb7b8555b97351703;
    stim[63] = 128'hed18a7344254d1369a154adfa382101d;
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
      expv[0] = 128'he2e341f10c81f0fe0686cabc1b0ac76f;
      expv[1] = 128'h3e60d3cc148c46d178428eecde54b946;
      expv[2] = 128'hafef3a8e525656e97025cadc61fd951c;
      expv[3] = 128'hf9e5b1de0822f2288923bcc9f07217dc;
      expv[4] = 128'h85f678ed80432d9f1705ffc84ecd1501;
      expv[5] = 128'h5b7eefdea8111c9040d671f66ceb827c;
      expv[6] = 128'h4db1933d4384f71d1a92fbdd34fa41c9;
      expv[7] = 128'hb17bd4f22538961afa8dc67f84d87972;
      expv[8] = 128'h5ba754c58f1783f5705cba54ad35e29a;
      expv[9] = 128'hac5584f3240c34d6fde7d0820701251d;
      expv[10] = 128'h80d45ff097f5893213be44f1f491ab29;
      expv[11] = 128'h6d35b8130e14ac7ab8ba8f93dfdca049;
      expv[12] = 128'he318a6073a3fd552a9c1c17975880d57;
      expv[13] = 128'h6a064de8082f77136792202ebe233aac;
      expv[14] = 128'h3e075766ec80b4e8647b1555d2175eb9;
      expv[15] = 128'h06d1d6a55750d4922b0afdae3f3eeb58;
      expv[16] = 128'hc81001f107fc7d40dea343737678dad0;
      expv[17] = 128'ha5470948d6cbdda0de3480fac2520f57;
      expv[18] = 128'h1e17517c48e01bc041f2df01f2d4b2d4;
      expv[19] = 128'h25efaff90f349e7e18c1b4155fa571f7;
      expv[20] = 128'h7ee92c2adbba00a2f3447c8d3beeba37;
      expv[21] = 128'h6576b3e9783d717faba7a0329755c6b2;
      expv[22] = 128'hb364745d977a7c775bffa05e0b7ab8ae;
      expv[23] = 128'heb971e28dc2104a232ac8695435aaf9e;
      expv[24] = 128'hb13c692e8e0155a854103b88aba51fa1;
      expv[25] = 128'heeea050751f15017bbba58fd87818478;
      expv[26] = 128'hb0d074e93116dd957bc04a02744e6acb;
      expv[27] = 128'hdb64e140b87d45ce1814989045d3bc09;
      expv[28] = 128'hc7f1b5cc97272e675188f8fea872e56b;
      expv[29] = 128'h206bb0967c78928634a6c0524931b740;
      expv[30] = 128'hb00a4142c82a03d06af2500a17fd16c8;
      expv[31] = 128'hc963b7b427e895fab7b2c8f2035a05ac;
      expv[32] = 128'h55778f028646aa89127d76ccd7fbce59;
      expv[33] = 128'h893ba496597652777af9f6bd48291631;
      expv[34] = 128'ha0bf7c045f94d6fd90cd7473ec52f429;
      expv[35] = 128'h727bcce9cca3f7423f910a1b070b92ca;
      expv[36] = 128'h24acda8bc559edaca7e5abc3d477f3d2;
      expv[37] = 128'hcb8b9a8058cf7f73d42e1cf700c881f7;
      expv[38] = 128'hb81bc8a54e0010ebf5814a3946f190dc;
      expv[39] = 128'h7c549d9da9348e5c3b3f7f4e6e9a82d7;
      expv[40] = 128'h7824cff8d80403d632085660dc05ec51;
      expv[41] = 128'h3f1b462a7d0c7ac5a049b5ba1b633457;
      expv[42] = 128'h5578628791dbec1bb03fe499f9877d82;
      expv[43] = 128'h1ec0542936ed3a320074349c9246183c;
      expv[44] = 128'h75ce0a926e233fc9207bf969047cdd5f;
      expv[45] = 128'h168aeee0d52e8339cf113700f0185662;
      expv[46] = 128'h402d5e9017f71c2008148d813a37bfe8;
      expv[47] = 128'hd316a4593f4b2492bb1420276f155224;
      expv[48] = 128'h601df0e1658e4dc27560ff7236c81718;
      expv[49] = 128'h0e9e2e42dabb7d7cae497217712b22a6;
      expv[50] = 128'h7d6c8f44235075bd70e8946e69368030;
      expv[51] = 128'hdc5336b144fcc1542599f201d7ded521;
      expv[52] = 128'h698235edb7abe647c7f604bc8082a397;
      expv[53] = 128'h3058c1e565bcce64af8df02439489668;
      expv[54] = 128'h7f8f07d0cd2027476392a65e9a88eed3;
      expv[55] = 128'hc54675fd2db1a2ded292e4621e58ce88;
      expv[56] = 128'hae9ade7d2983e900531ea68daffefc23;
      expv[57] = 128'hcc637b98fd3d7c592f12537ca6def4db;
      expv[58] = 128'h4fb5c54852ff66786004fbc10d6ac547;
      expv[59] = 128'h364be7fa0226a6af2c380543e5abb167;
      expv[60] = 128'h44ac7b01a3797a0ed27b88d4391d10ce;
      expv[61] = 128'hc78977ead65052ebe3dd7c8f5a34576d;
      expv[62] = 128'h2e40550373b81731b73549ad9715905b;
      expv[63] = 128'hed544a1d421510349a82a736a318d1df;
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
