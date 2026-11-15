// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 146;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03179 dut (
    .clock(clk),
    .reset(in_vec[145:145]),
    .M_Flush(in_vec[144:144]),
    .M_Stall(in_vec[143:143]),
    .WB_Stall(in_vec[142:142]),
    .M_RegWrite(in_vec[141:141]),
    .M_MemtoReg(in_vec[140:140]),
    .M_ReadData(in_vec[139:108]),
    .M_ALU_Result(in_vec[107:76]),
    .M_RtRd(in_vec[75:71]),
    .WB_RegWrite(in_vec[70:70]),
    .WB_MemtoReg(in_vec[69:69]),
    .WB_ReadData(in_vec[68:37]),
    .WB_ALU_Result(in_vec[36:5]),
    .WB_RtRd(in_vec[4:0]),
    .vote_WB_RegWrite(out_vec[70:70]),
    .vote_WB_MemtoReg(out_vec[69:69]),
    .vote_WB_ReadData(out_vec[68:37]),
    .vote_WB_ALU_Result(out_vec[36:5]),
    .vote_WB_RtRd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 146'h36a6b3bebc60a282b02d860ec49caa397657a;
    stim[1] = 146'h2e5ee28ee0e5fd52042f8aad663d0258c534d;
    stim[2] = 146'h145e5a1afc76f5f929bab265bba64eb4bf1cc;
    stim[3] = 146'h0fa77296e16659d73ca709bcb82309f3c643c;
    stim[4] = 146'h152b1021b150d146c5d5fc9d52921d4ff9c94;
    stim[5] = 146'h01f79e5df59bafc431604fae3a7c63b82c26a;
    stim[6] = 146'h0ac61c691518f79f7e14f4202ff245aab6870;
    stim[7] = 146'h0fd1bcd1c7e3754c911c53458fe503e9e7457;
    stim[8] = 146'h02dc0e11548f3de4778f6ed3ec103d1762b41;
    stim[9] = 146'h183517c0378acfd8347b62597bb84a7f1a2fb;
    stim[10] = 146'h14f59bf9ec93c4ed6919e662c71eddcd15031;
    stim[11] = 146'h16c24917814612642cf78d93047baf27918e3;
    stim[12] = 146'h00ac2fb1bad86741f0de746dae8a90a0a220d;
    stim[13] = 146'h04b9746b6a5fee22e2701833033d84fe6e955;
    stim[14] = 146'h3f90bd037c5066a3c4f40977fb0309a4e3991;
    stim[15] = 146'h04d8f33975c681653ac41886543a80fea1a48;
    stim[16] = 146'h2749f8710572adb132d1e14b41769c05b0328;
    stim[17] = 146'h07f85e07cdb344b3a6badecb5b18c76fccfda;
    stim[18] = 146'h0e5a54d8c801bc14d612d2fc9cdc716286340;
    stim[19] = 146'h0d0898058cd0bdc299adacd1de0c3c1a53778;
    stim[20] = 146'h027eeb190054066f49c7ce1a5bfd447339e1b;
    stim[21] = 146'h0728f1217f2519e4c2ba5633cda08d49421c9;
    stim[22] = 146'h0102a0d5b4f2e6ef1c288abaa4e9ffd19ded6;
    stim[23] = 146'h117f19a880184ea3847c5bf75ade63e04097f;
    stim[24] = 146'h104b6515bc9db38eefd8d406a72b9301f7a04;
    stim[25] = 146'h18231b5339f114e2b7459b6d755452910f9fe;
    stim[26] = 146'h11919e1f567eccf41086d05a1ac67bc1a6b4c;
    stim[27] = 146'h1aaa82bcb017fdb864a9023b609324bf667f5;
    stim[28] = 146'h0cd1f5a5189cb80447bc0ad610d07dd1d46b8;
    stim[29] = 146'h1f5fec32879b6ca3d06786d2666b7130ab22c;
    stim[30] = 146'h040a4b1512f1bc9248f0210d1f42900f52386;
    stim[31] = 146'h13d70e465093303eb41597fe3b58a773ef495;
    stim[32] = 146'h035693139c60db3d8a1451730418a33698a28;
    stim[33] = 146'h160634712616a7c0f8cdd8aea7892b7fb281d;
    stim[34] = 146'h0decc558e9d42d75ed25c7efdeaf7ba4d90e3;
    stim[35] = 146'h1ab915c0956ef56618ae192db880b68c505a8;
    stim[36] = 146'h06da5a231898f6c9836d7d966e74b39db1879;
    stim[37] = 146'h1a176f8ea5d76dfb610c062061d5da689df68;
    stim[38] = 146'h12440a21b75fcc5bb21102d55ced748972a96;
    stim[39] = 146'h12ea002e74343dc46c3882bde71d215a52541;
    stim[40] = 146'h057d554db9386e5d769625703a30f6cb6b4e8;
    stim[41] = 146'h1660afef4f064987ef68f5a1c4bf628497e88;
    stim[42] = 146'h060c56ed4acb8d6146fa314f33bdb63b35b21;
    stim[43] = 146'h1d03b13e4e77c37bef8d00dd8760b6a300170;
    stim[44] = 146'h01d045d29179b2dcf84aaefc7e4f28cc9dd6e;
    stim[45] = 146'h16e1301062a38f7cfa92084551b49359aa943;
    stim[46] = 146'h12139cee08130ed29fd617e4c043e3555b0b9;
    stim[47] = 146'h05b9d45dbe3e9a7540ae1d3c553a99e8306a0;
    stim[48] = 146'h0db81447d1b374beea75811bcc728ec1e09d7;
    stim[49] = 146'h0bcb8f0b8183ff40f5f6fb4fb49dde066c42a;
    stim[50] = 146'h1a1d2016881ef2d79cb54bba74d280a058cd7;
    stim[51] = 146'h07fbe880b4274e15119d5244bc8668865bc15;
    stim[52] = 146'h0fb673636b7e85d75b92cb80c6a52ee470684;
    stim[53] = 146'h0f998818303179d2582531d7715794a252c74;
    stim[54] = 146'h0032cf567250c813838948e2b82ccf5d9f976;
    stim[55] = 146'h12daf5dae37615f9f4206ab1c168573b5db80;
    stim[56] = 146'h10e4a06296affb09482aa281881db18646a78;
    stim[57] = 146'h0a92aaa931ea423176c13ff41eea6ec7c4e7d;
    stim[58] = 146'h146f5ac82b152b9026567b4bfd97328cb6a90;
    stim[59] = 146'h02c2b2a79f405718a488b558310565e277fa8;
    stim[60] = 146'h1caefadbfd3bf8dcab3a8f82d5c2129ab71d2;
    stim[61] = 146'h37d30a3696d13dd75f0f06762e3100e02da70;
    stim[62] = 146'h14080e80cff463f4b62b152deb466380a5173;
    stim[63] = 146'h03025f266f262d49195184c1ec3a645d1a87b;
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
      expv[0] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h2b265bba64eb4bf1cc;
      expv[4] = 71'h709bcb82309f3c643c;
      expv[5] = 71'h5fc9d52921d4ff9c94;
      expv[6] = 71'h3ef3cbbeb375f8862c;
      expv[7] = 71'h18c38d22a31ef3efc2;
      expv[8] = 71'h453458fe503e9e7457;
      expv[9] = 71'h5b81c22a91e7bc8ef1;
      expv[10] = 71'h06a2f806f159fb068f;
      expv[11] = 71'h1e662c71eddcd15031;
      expv[12] = 71'h78d93047baf27918e3;
      expv[13] = 71'h1585f6375b0ce83e1b;
      expv[14] = 71'h01833033d84fe6e955;
      expv[15] = 71'h000000000000000000;
      expv[16] = 71'h41886543a80fea1a48;
      expv[17] = 71'h000000000000000000;
      expv[18] = 71'h2decb5b18c76fccfda;
      expv[19] = 71'h2d2fc9cdc716286340;
      expv[20] = 71'h5acd1de0c3c1a53778;
      expv[21] = 71'h4fdd63200a80cde938;
      expv[22] = 71'h25633cda08d49421c9;
      expv[23] = 71'h20541ab69e5cdde385;
      expv[24] = 71'h2fe335100309d4708f;
      expv[25] = 71'h096ca2b793b671ddfb;
      expv[26] = 71'h04636a673e229c56e8;
      expv[27] = 71'h3233c3eacfd99e8210;
      expv[28] = 71'h1550579602ffb70c95;
      expv[29] = 71'h40ad610d07dd1d46b8;
      expv[30] = 71'h786d2666b7130ab22c;
      expv[31] = 71'h0210d1f42900f52386;
      expv[32] = 71'h3ae1c8ca126607d682;
      expv[33] = 71'h6ad262738c1b67b142;
      expv[34] = 71'h5d8aea7892b7fb281d;
      expv[35] = 71'h5c7efdeaf7ba4d90e3;
      expv[36] = 71'h1722b812addeacc315;
      expv[37] = 71'h57d966e74b39db1879;
      expv[38] = 71'h02edf1d4baedbf6c21;
      expv[39] = 71'h08814436ebf98b7642;
      expv[40] = 71'h1d4005ce8687b88d87;
      expv[41] = 71'h625703a30f6cb6b4e8;
      expv[42] = 71'h0f5a1c4bf628497e88;
      expv[43] = 71'h2314f33bdb63b35b21;
      expv[44] = 71'h500dd8760b6a300170;
      expv[45] = 71'h3a08ba522f365b9f09;
      expv[46] = 71'h2084551b49359aa943;
      expv[47] = 71'h02739dc10261da53fa;
      expv[48] = 71'h61d3c553a99e8306a0;
      expv[49] = 71'h5811bcc728ec1e09d7;
      expv[50] = 71'h3971e170307fe81ebe;
      expv[51] = 71'h03a402d103de5af396;
      expv[52] = 71'h55244bc8668865bc15;
      expv[53] = 71'h2cb80c6a52ee470684;
      expv[54] = 71'h531d7715794a252c74;
      expv[55] = 71'h0659eace4a19027071;
      expv[56] = 71'h1b5ebb5c6ec2bf3e84;
      expv[57] = 71'h1c940c52d5ff612905;
      expv[58] = 71'h125555263d48462ed8;
      expv[59] = 71'h67b4bfd97328cb6a90;
      expv[60] = 71'h585654f3e80ae31491;
      expv[61] = 71'h28f82d5c2129ab71d2;
      expv[62] = 71'h000000000000000000;
      expv[63] = 71'h3152deb466380a5173;
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
