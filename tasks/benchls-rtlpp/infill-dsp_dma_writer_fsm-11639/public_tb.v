// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11639 dut (
    .clk(clk),
    .resetn(in_vec[173:173]),
    .phase(in_vec[172:141]),
    .phase_valid(in_vec[140:140]),
    .data(in_vec[139:116]),
    .data_valid(in_vec[115:115]),
    .data_filtered(in_vec[114:83]),
    .data_filtered_valid(in_vec[82:82]),
    .i_q(in_vec[81:50]),
    .i_q_valid(in_vec[49:49]),
    .i_q_filtered(in_vec[48:17]),
    .i_q_filtered_valid(in_vec[16:16]),
    .dma_wr_overflow(in_vec[15:15]),
    .dma_wr_xfer_req(in_vec[14:14]),
    .channel_enable(in_vec[13:0]),
    .phase_ready(out_vec[40:40]),
    .data_ready(out_vec[39:39]),
    .data_filtered_ready(out_vec[38:38]),
    .i_q_ready(out_vec[37:37]),
    .i_q_filtered_ready(out_vec[36:36]),
    .overflow(out_vec[35:35]),
    .dma_wr_data(out_vec[34:3]),
    .dma_wr_en(out_vec[2:2]),
    .dma_wr_sync(out_vec[1:1]),
    .processing_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h1e059bc6ae6363deb42bdc1c3e2087fadba731813935;
    stim[1] = 174'h1143caf354978bd87e5ee47d0ab45480cb0157ba5442;
    stim[2] = 174'h2154ea40a6fae6fdaab250b2fedb3b1d2f0885b4fe16;
    stim[3] = 174'h3b4ca7e0e0d17df6f71ce91efb854a288731a0d3f565;
    stim[4] = 174'h23455889fbd71a4147368308c2dc831d857cf3162529;
    stim[5] = 174'h3b3a6d0b62ac6d9265cd249ec018e5a0875ecdf1614b;
    stim[6] = 174'h3176b8c66311824401a416d5e219d7ca8ba865a5cc61;
    stim[7] = 174'h35087809462ccd9f263355147d4e56a721b0486592db;
    stim[8] = 174'h23bb554ccce15c6c0e509a9b72c0ee065833feed51cc;
    stim[9] = 174'h30bfdedc31790c0fcc5a1d9b7cce7455cbae67b365cf;
    stim[10] = 174'h22c0a0dce169e8fc2d5124d03e77723c6329d65e7934;
    stim[11] = 174'h35f4df4d2793ab00ac0dae792a9a3e32478ce55d5ba7;
    stim[12] = 174'h3eb647afe93f75bd5f67443c65c159b43a448a56a038;
    stim[13] = 174'h381352a7bf8dd090008c5243add34d3be47afcb4c0f2;
    stim[14] = 174'h2f7ef24aaf963ed51826f3a44b119683fd3240804039;
    stim[15] = 174'h2d4a3da3f40d65f31a33661f580f61dc48a1d758f6e0;
    stim[16] = 174'h36e1ca27f1364879181a862c0ce0d35cc045cd18b66f;
    stim[17] = 174'h2f313489c3e5c43d6e4ae15b4f860664dc1841c0cebe;
    stim[18] = 174'h3003de55fa3c231378ab31e27fb7bc3e77de1b26916d;
    stim[19] = 174'h3f7d1971869e7e8ff0c51f1d87603fbf8e3f766282da;
    stim[20] = 174'h362f93ab80fc29934f5888cc91e01dc51fa131d76e32;
    stim[21] = 174'h3236f4ef0f1bb7747aa7ddec201254d8385c2f1b3c94;
    stim[22] = 174'h2915fe3133b40bf3299d7f3ab1863f19227f6ef91eee;
    stim[23] = 174'h204e8ff734fd907463ccd71ede5f38a9aa29e494818f;
    stim[24] = 174'h24fa8e8181daedddf07e7e01fbc172733eb95c834e0a;
    stim[25] = 174'h2c4c789a92c97c10f1c347a95427ba55f9c918fa60b7;
    stim[26] = 174'h2904e75a40b4d7f2e975333bf6fa9799d7573b6f5293;
    stim[27] = 174'h3c117ff901a7ec23af6265077d9201e832d59059422a;
    stim[28] = 174'h2a4121ce2dfff5df70bd6c83e1ec6897fddedbc4e22a;
    stim[29] = 174'h2dc1403cc72bde87cd7542c93d8b89f6016d4258523a;
    stim[30] = 174'h21bb870761bad4cb7d818bb0de6bb4b80ee943ce9b8d;
    stim[31] = 174'h31c7359e2cd611ff77d38dc082d6dfc46088596ae051;
    stim[32] = 174'h28c7e0d762e093e9a20b01c579b298e9e4c509904c0e;
    stim[33] = 174'h2ed1daaeec9a43529077084e5fc55ffba36daf526ed7;
    stim[34] = 174'h2b4cc220aeecab6066217997c4582e7f7aa38152aebc;
    stim[35] = 174'h3f2e488c60676287f6997a9345d262611cb11e44f901;
    stim[36] = 174'h3d3af685e154ced4ee448214d546f4190209e975cf9e;
    stim[37] = 174'h3aab2d1800c04d1466f401214b8f19503ef599a17c37;
    stim[38] = 174'h353a764545e3ff7c631e211e114fb4f7fcc4fb8f8901;
    stim[39] = 174'h38ca1d53ce8e8f56e3d1a581603c78c7f89b2d67e351;
    stim[40] = 174'h2046a8fabdc7d75d71f85820fc76b77e373b0627bbc4;
    stim[41] = 174'h2a9e6fa73c68c81768ebcae77879f7b0b6657be32b2e;
    stim[42] = 174'h3bd3bfd851321831f0309dc8e3dc328abce255713e8f;
    stim[43] = 174'h2cf4298e20e3d7191bcca0a2fcd00e530e3ca3c73fa1;
    stim[44] = 174'h36e6a2f3602d2717d5d538c74a2e9975f771f69a1b02;
    stim[45] = 174'h255dc700030c126b8d76f2c03a0d9af9e03d59da9ecf;
    stim[46] = 174'h312eb6992ee5dbfc2ab89c4b3c4ce3a06c11c380209d;
    stim[47] = 174'h2ba0e18e9b4a890a6c8306bc4e91124aced975b8f4c1;
    stim[48] = 174'h3c5d30eb51864841a73b518e95103b1c0a4d25cd4054;
    stim[49] = 174'h382b11ac03885e789f7a0cf179508be104ba0b8b440b;
    stim[50] = 174'h27224a76420db611669d56714a25ab92429d55b2ca1c;
    stim[51] = 174'h2a2a9dec0ef24a05c0416f4d4fc700c22224d84b1813;
    stim[52] = 174'h351dbb0136e1e1f0c90eba7327eca40b385e50dc3326;
    stim[53] = 174'h3c0079fbe0315b50b728e9499606960b8d82183397b9;
    stim[54] = 174'h3fa875666eb2052b4b8ac1af8b1324875e5381f9f61b;
    stim[55] = 174'h37089e8f214d575f5a7045b0d7ef5934f7c70ffa1d15;
    stim[56] = 174'h31b3843dd8eddcee054daabc856555caddf27f3243c8;
    stim[57] = 174'h3619552a70709e73b8b76fcc0b48b002c5ae32a93f8c;
    stim[58] = 174'h33ec44351a8256e1faa3be299293d3a5ee8821afa622;
    stim[59] = 174'h346e7ebeac395758a1f58f9b3b2a7be7d526788c6bb6;
    stim[60] = 174'h379145515fd67e8d0bcfdc297ef5150a533b3a160dcd;
    stim[61] = 174'h2cbdffc0189abf380e482ddf9ffa991f55ba33b55d4f;
    stim[62] = 174'h3a804ec1bbce5ac9994ea5507bfa0c310cba20dfdd50;
    stim[63] = 174'h367dc62b900185d560020064b3db464b2c889c3f4ab8;
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
      expv[0] = 41'h10xxxxxxxxx;
      expv[1] = 41'h1078166f1ab;
      expv[2] = 41'h10c50f2bcd3;
      expv[3] = 41'h108553a902b;
      expv[4] = 41'h106d329f83a;
      expv[5] = 41'h100d156227b;
      expv[6] = 41'h10ece9b42db;
      expv[7] = 41'h10c5dae319a;
      expv[8] = 41'h105421e0253;
      expv[9] = 41'h100eed55333;
      expv[10] = 41'h0842ff7b70f;
      expv[11] = 41'h04000b4f479;
      expv[12] = 41'h048ac0dae78;
      expv[13] = 41'h10d5f674439;
      expv[14] = 41'h08604d4a9eb;
      expv[15] = 41'h08807cb1f6b;
      expv[16] = 41'h0880206b2fa;
      expv[17] = 41'h108009b243b;
      expv[18] = 41'h10bcc4d2272;
      expv[19] = 41'h10c00f7957a;
      expv[20] = 41'h107df465c63;
      expv[21] = 41'h1058be4eae2;
      expv[22] = 41'h1048dbd3bc2;
      expv[23] = 41'h10a457f8c4a;
      expv[24] = 41'h10013a3fdcb;
      expv[25] = 41'h1013ea3a063;
      expv[26] = 41'h083131e26a7;
      expv[27] = 41'h080005a6bf9;
      expv[28] = 41'h08800d3f611;
      expv[29] = 41'h04006fffaed;
      expv[30] = 41'h04fcd7542c8;
      expv[31] = 41'h10b7d818bb1;
      expv[32] = 41'h10471cd678b;
      expv[33] = 41'h10231f835db;
      expv[34] = 41'h10bb476abba;
      expv[35] = 41'h10ad330882b;
      expv[36] = 41'h10fcb92231b;
      expv[37] = 41'h1074ebda17b;
      expv[38] = 41'h10eaacb4602;
      expv[39] = 41'h10d4e9d9153;
      expv[40] = 41'h10e328754f2;
      expv[41] = 41'h10011aa3eaa;
      expv[42] = 41'h102a79be9ca;
      expv[43] = 41'h106f4eff612;
      expv[44] = 41'h1033d0a638a;
      expv[45] = 41'h10db9a8bcda;
      expv[46] = 41'h1015771c002;
      expv[47] = 41'h10c4bada64b;
      expv[48] = 41'h082e83863a7;
      expv[49] = 41'h08000c32421;
      expv[50] = 41'h04801c42f3d;
      expv[51] = 41'h041669d5670;
      expv[52] = 41'h105c0416f48;
      expv[53] = 41'h10d476ec04a;
      expv[54] = 41'h10f001e7efb;
      expv[55] = 41'h107ea1d599a;
      expv[56] = 41'h105c227a3cb;
      expv[57] = 41'h0846ce10f72;
      expv[58] = 41'h10800384f3a;
      expv[59] = 41'h104fb110d43;
      expv[60] = 41'h1051b9fafaa;
      expv[61] = 41'h105e4515453;
      expv[62] = 41'h08b2f7ff007;
      expv[63] = 41'h04005e72d61;
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
