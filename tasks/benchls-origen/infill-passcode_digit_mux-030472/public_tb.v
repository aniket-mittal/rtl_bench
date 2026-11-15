// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 141;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_030472 dut (
    .state(in_vec[140:138]),
    .button_increase(in_vec[137:137]),
    .insertdata_digit1(in_vec[136:133]),
    .insertdata_digit2(in_vec[132:129]),
    .insertdata_digit3(in_vec[128:125]),
    .insertdata_digit4(in_vec[124:121]),
    .insertdata_digit5(in_vec[120:117]),
    .insertdata_digit6(in_vec[116:113]),
    .insertdata_digit7(in_vec[112:109]),
    .insertdata_digit8(in_vec[108:105]),
    .insertdata_position_pointer(in_vec[104:102]),
    .insertnewpass_digit1(in_vec[101:98]),
    .insertnewpass_digit2(in_vec[97:94]),
    .insertnewpass_digit3(in_vec[93:90]),
    .insertnewpass_digit4(in_vec[89:86]),
    .insertnewpass_digit5(in_vec[85:82]),
    .insertnewpass_digit6(in_vec[81:78]),
    .insertnewpass_digit7(in_vec[77:74]),
    .insertnewpass_digit8(in_vec[73:70]),
    .insertnewpass_position_pointer(in_vec[69:67]),
    .insertpass_digit1(in_vec[66:63]),
    .insertpass_digit2(in_vec[62:59]),
    .insertpass_digit3(in_vec[58:55]),
    .insertpass_digit4(in_vec[54:51]),
    .insertpass_digit5(in_vec[50:47]),
    .insertpass_digit6(in_vec[46:43]),
    .insertpass_digit7(in_vec[42:39]),
    .insertpass_digit8(in_vec[38:35]),
    .insertpass_position_pointer(in_vec[34:32]),
    .data_digit1(in_vec[31:28]),
    .data_digit2(in_vec[27:24]),
    .data_digit3(in_vec[23:20]),
    .data_digit4(in_vec[19:16]),
    .data_digit5(in_vec[15:12]),
    .data_digit6(in_vec[11:8]),
    .data_digit7(in_vec[7:4]),
    .data_digit8(in_vec[3:0]),
    .position_pointer(out_vec[34:32]),
    .digit1(out_vec[31:28]),
    .digit2(out_vec[27:24]),
    .digit3(out_vec[23:20]),
    .digit4(out_vec[19:16]),
    .digit5(out_vec[15:12]),
    .digit6(out_vec[11:8]),
    .digit7(out_vec[7:4]),
    .digit8(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 141'h0aebb0740c2161af739d36f9135637eec754;
    stim[1] = 141'h012fba43d1c3d791c1e9d5813e6ad2f48e5f;
    stim[2] = 141'h0d1b3f6aa03015103e7ef9f93bc16591d2ad;
    stim[3] = 141'h0d70133229a136d9b79a53f36c2e7ac73833;
    stim[4] = 141'h062577f1e374aecb7290bd745273cc2d88b0;
    stim[5] = 141'h04db988b6760c6acba2ed03e63e9d0e55d8e;
    stim[6] = 141'h1786a0afccd9dde1a4a9241ebd645dc59c77;
    stim[7] = 141'h0576c7a2f7a79a3f18e6c4b1ed1cf401011a;
    stim[8] = 141'h052ab3964e8f80baf34623b3e3fa82744724;
    stim[9] = 141'h03cb9ab61b3ab4e140d4dce90ce40eb47054;
    stim[10] = 141'h1350b5d5f226ff65deefbb47e8dd6c8cf5f1;
    stim[11] = 141'h0d079f89abe85f1a81e4e2f9f3c0ed6b1dff;
    stim[12] = 141'h0f5ceae1b608455372bc88a740bbfd07a398;
    stim[13] = 141'h0e47b0bd90686014089c4bfcdc9adebbc29d;
    stim[14] = 141'h09d93ed08e28a97736a1ec21471db18a4ea7;
    stim[15] = 141'h1dd55da004e3722db83b73d5fa47ea54a045;
    stim[16] = 141'h150f1551b5c6d25c8cb9a916d8c1e244ab12;
    stim[17] = 141'h1cba26e4d11e34cbab688aced703cff31707;
    stim[18] = 141'h1daa3a1afc2d81ea21120c3b540d58129753;
    stim[19] = 141'h0933d6f3d15557c3b2e962376f2719732c0c;
    stim[20] = 141'h1087f15c687c4c7029fc21a95fee9f7ac89c;
    stim[21] = 141'h0f38f0b2b212c096bb52cd543f6bca6f1de2;
    stim[22] = 141'h10fcc28fc99622e55261b7ee799ba5840ba3;
    stim[23] = 141'h1ab6b75c9a51327222fece25c9fc29022092;
    stim[24] = 141'h033d5dd1c4b90cb8f3602310de28adde687d;
    stim[25] = 141'h1e06dea6c1d57132be1c03c732bd42eaaf32;
    stim[26] = 141'h024c500fe91f8bbe91e33c980e58d81f85bd;
    stim[27] = 141'h14f07b8cfd6b35ef0a07e13b6787d7618adb;
    stim[28] = 141'h0456ed4e49ca838a81b1ee6a08aafce798b1;
    stim[29] = 141'h075244700d394fc540852c19711b8ef97698;
    stim[30] = 141'h0b857d5a96518919fd9217262d6d1b3a28ee;
    stim[31] = 141'h130e016b948538513667c6e055dcf549448b;
    stim[32] = 141'h1cc48326e3279c97b171925b563fcdb2bf4f;
    stim[33] = 141'h1dbe548aadcbbbba99c89b3f241def6683ea;
    stim[34] = 141'h16138ba6002c28909d0676b30a79a6fec40e;
    stim[35] = 141'h09be60cd2f3e252e2d2dd58d972a69f87835;
    stim[36] = 141'h05117a9dbdba49c9ca98f4887d573a3112b2;
    stim[37] = 141'h0cb6547fb88c66d9525852f42846064d8213;
    stim[38] = 141'h0d8a3e1a39ba202da2f6de0f822c78fb00da;
    stim[39] = 141'h053d21106a0cdec6e59404b0215a14832adb;
    stim[40] = 141'h1b1e2c08c4aaf701ec41d2260be869f4a5a4;
    stim[41] = 141'h1e76725b4eb8a13e2407f25c4ae75ec6b2bf;
    stim[42] = 141'h13955fab97d3d1497993142cdc80dc9b7794;
    stim[43] = 141'h0be1b5bf9d4a86cc443f6687730cb9268334;
    stim[44] = 141'h0aabcdac204ee6e4ad7cf52f94d36d325499;
    stim[45] = 141'h160d2d624744c1c02691408d26d0649f58ee;
    stim[46] = 141'h08770f660faa46fa10ec13e9c2ae3e920237;
    stim[47] = 141'h0e313d28b7b0942f4e1b9957f130a50622fd;
    stim[48] = 141'h00dcc3a9e945b2b30f901b8b6889542dcafe;
    stim[49] = 141'h082f7a8ee986372eb00e6c8cc99bf6e0a358;
    stim[50] = 141'h0e0841e28744687936f572270f4cb4df3a09;
    stim[51] = 141'h0d77bf2f685e80c2129801c79d835a653fa7;
    stim[52] = 141'h09e55a6c93df833bdb8c5fd2520df299a992;
    stim[53] = 141'h18988ba8f5d71fd43524e5e1dc5ad1bd280f;
    stim[54] = 141'h0935de0cf98ff973924cfe98437ce15f50f4;
    stim[55] = 141'h114506db4dd7d0c7ca162dc6381c79db9e00;
    stim[56] = 141'h0e5f913480fe23648dd7fb3150380b6ee1e9;
    stim[57] = 141'h1fcabcdb94131443cb1645ee8209866992c4;
    stim[58] = 141'h1f0be70c221e59530a06ce17040f8568eba7;
    stim[59] = 141'h0bc1e786d06ed5c67c4a2f1b39606caf2dc4;
    stim[60] = 141'h06aaef4d9102fc7ee93a6ae73348f86151a1;
    stim[61] = 141'h07415f95f8f46c7e2a717c979e17c028e694;
    stim[62] = 141'h0fd1decb095ef7031bc3f586f1ab4958720d;
    stim[63] = 141'h0829de48372536460c4f699a9333ac5897ad;
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
      expv[0] = 35'hx8586bdce;
      expv[1] = 35'h797dd21e8;
      expv[2] = 35'h1df3f2778;
      expv[3] = 35'h1df3f2778;
      expv[4] = 35'h2d2bb2dca;
      expv[5] = 35'h5831ab2e8;
      expv[6] = 35'h000000000;
      expv[7] = 35'h49e68fc63;
      expv[8] = 35'h49e68fc63;
      expv[9] = 35'h4e5cd5b0d;
      expv[10] = 35'h46c8cf5f1;
      expv[11] = 35'h09c5f3e78;
      expv[12] = 35'h39114e817;
      expv[13] = 35'h39114e817;
      expv[14] = 35'h3a2a5dcda;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h000000000;
      expv[19] = 35'h0555f0ecb;
      expv[20] = 35'h09f7ac89c;
      expv[21] = 35'h359aa87ed;
      expv[22] = 35'h3a5840ba3;
      expv[23] = 35'h000000000;
      expv[24] = 35'h29eaee8e2;
      expv[25] = 35'h000000000;
      expv[26] = 35'h4262807f4;
      expv[27] = 35'h000000000;
      expv[28] = 35'h62a0e2a06;
      expv[29] = 35'h0e53f1502;
      expv[30] = 35'h0462467f6;
      expv[31] = 35'h0f549448b;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h0f894b8b4;
      expv[36] = 35'h3e927272a;
      expv[37] = 35'h60a5e8508;
      expv[38] = 35'h60a5e8508;
      expv[39] = 35'h2337b1b96;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h0dc9b7794;
      expv[43] = 35'h02a1b3110;
      expv[44] = 35'h02a1b3110;
      expv[45] = 35'h000000000;
      expv[46] = 35'h0a91be843;
      expv[47] = 35'h0732afe26;
      expv[48] = 35'h56e61d4f4;
      expv[49] = 35'h518dcbac0;
      expv[50] = 35'h4ae44e1e9;
      expv[51] = 35'h30038f3b0;
      expv[52] = 35'h37e0cef6e;
      expv[53] = 35'h000000000;
      expv[54] = 35'h03fe5ce49;
      expv[55] = 35'h079db9e00;
      expv[56] = 35'h0ff662a07;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h0bb5719f1;
      expv[60] = 35'h70bf1fba4;
      expv[61] = 35'h70bf1fba4;
      expv[62] = 35'h37eb0de35;
      expv[63] = 35'h394d91831;
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
