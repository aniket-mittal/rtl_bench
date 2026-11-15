// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 112;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03889 dut (
    .i_0(in_vec[111:84]),
    .i_1(in_vec[83:56]),
    .i_2(in_vec[55:28]),
    .i_3(in_vec[27:0]),
    .o_0(out_vec[111:84]),
    .o_1(out_vec[83:56]),
    .o_2(out_vec[55:28]),
    .o_3(out_vec[27:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 112'hd0c170519b3b4d437ce0caf5b7ea;
    stim[1] = 112'hd9cb531a7af46acad2deca5ff3fe;
    stim[2] = 112'h25c424317f253f4396240202c9c6;
    stim[3] = 112'hf4c8e3434d36b9ec041c4b8790a1;
    stim[4] = 112'ha208c192e546b1d3d77fa10243a4;
    stim[5] = 112'hfcea87cfd68cbf51948dc61d1862;
    stim[6] = 112'hb01f7496dd148584d135e9af172e;
    stim[7] = 112'hc2dbe802c331b91839521987ff82;
    stim[8] = 112'hb5d99db7231ec42844f6f02f951f;
    stim[9] = 112'hc5258d253c8b293b0e53d6c0d3db;
    stim[10] = 112'h02affe923e1a0921ff6b48610a4b;
    stim[11] = 112'h4322cd9a075aad76eb625661358c;
    stim[12] = 112'hed5abce50965319f49dac7eaa71a;
    stim[13] = 112'h7265bd28d9043d9b859d58108104;
    stim[14] = 112'he2bbae6c0bd7ebf7076509089c95;
    stim[15] = 112'hd63f03a6a29d83d95930ba7a7cba;
    stim[16] = 112'h311d4e792fdb0ff4e1ae5763baeb;
    stim[17] = 112'h5d7a26c0c491289a063958062def;
    stim[18] = 112'h31c5a264bcdaed2c53806fa3d958;
    stim[19] = 112'hb000efffb1e7f6442606140c5f9e;
    stim[20] = 112'h12ada310770f46d2586029da17f2;
    stim[21] = 112'h98b3e1ab086d973e1eec6a7659de;
    stim[22] = 112'h1ba4dc62c12a7ff0cfe851f3eea4;
    stim[23] = 112'ha1c31c23927b4d97f1368622557b;
    stim[24] = 112'h010b9da38ee56b1178f5e757a699;
    stim[25] = 112'hb4fd4ab7b29fed963f9817866e2b;
    stim[26] = 112'h0caca8f7408f3e162de5dc8143c4;
    stim[27] = 112'h8cbd2ab9d5f6a48daf58e7d6d47f;
    stim[28] = 112'h5be1b2c1bbe6d8b4985bf8b2d37b;
    stim[29] = 112'hf8f95214ec72fb3ef734d9915de0;
    stim[30] = 112'h2a358a7df2f123d4e9d160ca19b7;
    stim[31] = 112'haa46d4c0791d964e5b0927869300;
    stim[32] = 112'heef60213de13b06ec2d660bd2cee;
    stim[33] = 112'h272cf6cba2ee278f8d883968f1c9;
    stim[34] = 112'h1ad3ec500e3706e574748498e12d;
    stim[35] = 112'hdb4d9f9df61b800cbd7bef425879;
    stim[36] = 112'h86ceaff49a3363316d4fb6f2f3c4;
    stim[37] = 112'h685fc4e8f7d1ce64da4bf7cff1b8;
    stim[38] = 112'hcb6f223630797365f486c534c58a;
    stim[39] = 112'h2b0ecc4e6919402275415eb62c77;
    stim[40] = 112'h72949c5531ed052314acf148916f;
    stim[41] = 112'h9f16f97c2f42a556186b796724a2;
    stim[42] = 112'ha20b80489efccc719674a3150ace;
    stim[43] = 112'h45d93efcd3464197de824e1deb35;
    stim[44] = 112'hf035c16e7a10fdfeed40b148b736;
    stim[45] = 112'h517090a05f7bdd6ded250deb1cc4;
    stim[46] = 112'hd9a350c444b6beaf2a48045493fd;
    stim[47] = 112'h1ff5452ba6adcc5cf1b0b0ef34bc;
    stim[48] = 112'h5edcf1404db0e8153385b50a6c28;
    stim[49] = 112'h3823d9d1ba3243bb34ca7bf6af3d;
    stim[50] = 112'h78b59863dd7eaf9adb18de976560;
    stim[51] = 112'h28cc0cd099df96707b88461d5cb7;
    stim[52] = 112'h0acf2ff29462c3d6bbddde01c678;
    stim[53] = 112'h90cd3e3c1c4001d288f63806910e;
    stim[54] = 112'h5db6155f60674b5c7a7b90ca6197;
    stim[55] = 112'h9e982a9f172765bc2f8fa3fa7fd3;
    stim[56] = 112'he8ba7683ad9a6860b2cde3d3cf95;
    stim[57] = 112'h8da0610df16cb84b2204ebd54c67;
    stim[58] = 112'he2d472a30354792f7bd1f04f25cd;
    stim[59] = 112'h499eb2a128c0f14ef54991c730f9;
    stim[60] = 112'haf9855e57b3fb4d7ceca6cc3f562;
    stim[61] = 112'hdb602e91821731a47a825ad404e3;
    stim[62] = 112'ha4afb000838af99dc1d250217425;
    stim[63] = 112'h4f3e31eaec81dd718492625727a0;
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
      expv[0] = 112'hd0c1705437ce0c19b3b4daf5b7ea;
      expv[1] = 112'hd9cb531cad2deca7af46aa5ff3fe;
      expv[2] = 112'h25c4243439624017f253f202c9c6;
      expv[3] = 112'hf4c8e34ec041c434d36b9b8790a1;
      expv[4] = 112'ha208c19d3d77fa2e546b110243a4;
      expv[5] = 112'hfcea87c51948dcfd68cbf61d1862;
      expv[6] = 112'hb01f74984d135e6dd14859af172e;
      expv[7] = 112'hc2dbe8018395212c331b9987ff82;
      expv[8] = 112'hb5d99db2844f6f7231ec402f951f;
      expv[9] = 112'hc5258d23b0e53d53c8b296c0d3db;
      expv[10] = 112'h02affe921ff6b423e1a098610a4b;
      expv[11] = 112'h4322cd976eb625a075aad661358c;
      expv[12] = 112'hed5abce9f49dac50965317eaa71a;
      expv[13] = 112'h7265bd29b859d58d9043d8108104;
      expv[14] = 112'he2bbae6f707650c0bd7eb9089c95;
      expv[15] = 112'hd63f03ad95930b6a29d83a7a7cba;
      expv[16] = 112'h311d4e7f4e1ae592fdb0f763baeb;
      expv[17] = 112'h5d7a26c9a063950c491288062def;
      expv[18] = 112'h31c5a262c538064bcdaedfa3d958;
      expv[19] = 112'hb000eff4426061fb1e7f640c5f9e;
      expv[20] = 112'h12ada31d2586020770f469da17f2;
      expv[21] = 112'h98b3e1a3e1eec6b086d97a7659de;
      expv[22] = 112'h1ba4dc6f0cfe852c12a7f1f3eea4;
      expv[23] = 112'ha1c31c297f13683927b4d622557b;
      expv[24] = 112'h010b9da1178f5e38ee56b757a699;
      expv[25] = 112'hb4fd4ab963f9817b29fed7866e2b;
      expv[26] = 112'h0caca8f162de5d7408f3ec8143c4;
      expv[27] = 112'h8cbd2ab8daf58e9d5f6a47d6d47f;
      expv[28] = 112'h5be1b2cb4985bf1bbe6d88b2d37b;
      expv[29] = 112'hf8f95213ef734d4ec72fb9915de0;
      expv[30] = 112'h2a358a7d4e9d16df2f1230ca19b7;
      expv[31] = 112'haa46d4c4e5b0920791d967869300;
      expv[32] = 112'heef60216ec2d663de13b00bd2cee;
      expv[33] = 112'h272cf6c8f8d883ba2ee27968f1c9;
      expv[34] = 112'h1ad3ec5e57474800e3706498e12d;
      expv[35] = 112'hdb4d9f90cbd7bedf61b80f425879;
      expv[36] = 112'h86ceaff316d4fb49a33636f2f3c4;
      expv[37] = 112'h685fc4e64da4bf8f7d1ce7cff1b8;
      expv[38] = 112'hcb6f22365f486c6307973534c58a;
      expv[39] = 112'h2b0ecc42275415e691940eb62c77;
      expv[40] = 112'h72949c52314acf531ed05148916f;
      expv[41] = 112'h9f16f9756186b7c2f42a596724a2;
      expv[42] = 112'ha20b804719674a89efccc3150ace;
      expv[43] = 112'h45d93ef97de824cd34641e1deb35;
      expv[44] = 112'hf035c16feed40be7a10fd148b736;
      expv[45] = 112'h517090a6ded25005f7bdddeb1cc4;
      expv[46] = 112'hd9a350caf2a480444b6be45493fd;
      expv[47] = 112'h1ff54525cf1b0bba6adcc0ef34bc;
      expv[48] = 112'h5edcf14153385b04db0e850a6c28;
      expv[49] = 112'h3823d9dbb34ca71ba3243bf6af3d;
      expv[50] = 112'h78b59869adb18d3dd7eafe976560;
      expv[51] = 112'h28cc0cd707b884099df9661d5cb7;
      expv[52] = 112'h0acf2ffd6bbddd29462c3e01c678;
      expv[53] = 112'h90cd3e3d288f63c1c4001806910e;
      expv[54] = 112'h5db61555c7a7b9f60674b0ca6197;
      expv[55] = 112'h9e982a9bc2f8faf1727653fa7fd3;
      expv[56] = 112'he8ba76860b2cde3ad9a683d3cf95;
      expv[57] = 112'h8da06104b2204edf16cb8bd54c67;
      expv[58] = 112'he2d472a2f7bd1f303547904f25cd;
      expv[59] = 112'h499eb2a4ef5499128c0f11c730f9;
      expv[60] = 112'haf9855ed7ceca657b3fb4cc3f562;
      expv[61] = 112'hdb602e9a47a8251821731ad404e3;
      expv[62] = 112'ha4afb009dc1d250838af90217425;
      expv[63] = 112'h4f3e31e7184926aec81dd25727a0;
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
