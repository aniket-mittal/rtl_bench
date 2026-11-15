// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 139;
  localparam OW = 138;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062589 dut (
    .clk(clk),
    .rst_n(in_vec[138:138]),
    .EX_rf_we(in_vec[137:137]),
    .EX_wd_sel(in_vec[136:135]),
    .EX_dram_we(in_vec[134:134]),
    .EX_ALUC(in_vec[133:102]),
    .EX_rD2(in_vec[101:70]),
    .EX_pc4(in_vec[69:38]),
    .EX_wR(in_vec[37:33]),
    .EX_PC(in_vec[32:1]),
    .ex_have_inst(in_vec[0:0]),
    .MEM_rf_we(out_vec[137:137]),
    .MEM_wd_sel(out_vec[136:135]),
    .MEM_dram_we(out_vec[134:134]),
    .MEM_ALUC(out_vec[133:102]),
    .MEM_rD2(out_vec[101:70]),
    .MEM_pc4(out_vec[69:38]),
    .MEM_wR(out_vec[37:33]),
    .MEM_PC(out_vec[32:1]),
    .mem_have_inst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 139'h21f9c9e1037db667ef3e14db8ed4afd8942;
    stim[1] = 139'h3aa9e85a0883e7c0a3e9aea65050821a53a;
    stim[2] = 139'h74e56d141b154952951f09d86343ba10261;
    stim[3] = 139'h4b22c26a282cecb0e7dda1d6fb9699b850a;
    stim[4] = 139'h58fe40a67910dd925151d473746804b06e9;
    stim[5] = 139'h689f8ab63cdf6f247b45cac3f566b7ec785;
    stim[6] = 139'h565e468487d83cf4e70191d19816cad77f1;
    stim[7] = 139'h703c4ed9f72e1f2ae43f6bdfb6aa3cfba9c;
    stim[8] = 139'h4cfe19f46c51a1f02a20ee8e8a3002fb6a5;
    stim[9] = 139'h725f18ae8a5a018ebc734bbe20a415e3b6a;
    stim[10] = 139'h7359133c1688ca4fbe788dd351624fcabae;
    stim[11] = 139'h4301891faf880477b2a8de4403967d97537;
    stim[12] = 139'h27861ef46f117db734d11ff0b0b335ece78;
    stim[13] = 139'h6099bb15422258d4f5e678a6f328c9571c6;
    stim[14] = 139'h5832d3f991db4c90a4331e818e959472e98;
    stim[15] = 139'h5ba13d55608727fdca964510c8bf7560c8d;
    stim[16] = 139'h40f090d2fd8447897cff6989f774e6a5fa4;
    stim[17] = 139'h7b7e68ab162ff5b400d64cdf8e8e82f3a80;
    stim[18] = 139'h77adcb0e9636a32cfb4fde64c810b27450b;
    stim[19] = 139'h401b8e442a5a337e8cf071b8ae41273f907;
    stim[20] = 139'h4165abde8c3e0d851381d997c009938dd4d;
    stim[21] = 139'h536480236de16b2f5ea2446c38c4c11a0a7;
    stim[22] = 139'h42313884e9c50c6d5d6cd6aaa5e2686b09a;
    stim[23] = 139'h7b5aaa24873ee537686b7c8b1b5d2c79e87;
    stim[24] = 139'h6be8b6b2582bbecb81003ad02e981ebc079;
    stim[25] = 139'h44c97de25d7c956e7bbd4e61123f335ccec;
    stim[26] = 139'h70cbac1ed65489fcd1504164f92ccdb9152;
    stim[27] = 139'h76f83055bb4fbfd35e83d5d1ea0b35a2d0e;
    stim[28] = 139'h5799ceb7be35ef576baadde1035f968c1b4;
    stim[29] = 139'h53caf023fc4a8d05e1b51d73b0513f1adb4;
    stim[30] = 139'h547d7322a17fa860c9b3e8e5ee5daca4a6d;
    stim[31] = 139'h72a4b08cc995b76830dfad9927fdc2b5ba6;
    stim[32] = 139'h7ebd93d0b0bcccf881121abe4283e7dc50c;
    stim[33] = 139'h64f59ad45cf7fc25a5edcaaf24c011a5762;
    stim[34] = 139'h625bbc7140c9025c6967a9646d9c1488896;
    stim[35] = 139'h65c31840f69c3d7713df0df7f3556013d55;
    stim[36] = 139'h721ebdb7b12424173e7be73b98dc79f3fca;
    stim[37] = 139'h6cdae8e68765257ffe735abd7979ab169b0;
    stim[38] = 139'h4f2b41d5e40b5dcbc4ad5856d8cf61e3286;
    stim[39] = 139'h7e076d2497dd7fc0c5d032d8068db148fc5;
    stim[40] = 139'h5917a804485595a7b9525d038538c2fd035;
    stim[41] = 139'h6d3002ad8c4ddfb184db5d00ff4bdaf3666;
    stim[42] = 139'h5cf6d048573f283020c751681e6473519fd;
    stim[43] = 139'h6c9bf9feb9bebc27a6cfb11b72702fd6177;
    stim[44] = 139'h7c8a40102fbf7ece214dde0e6caeb08c48c;
    stim[45] = 139'h4103b72e51476ff62731dc8176a77b836a7;
    stim[46] = 139'h43740c8ed3ab35ca5600c02f15ef8ed7350;
    stim[47] = 139'h698712591cba8dacf47990e077d1dedbf9d;
    stim[48] = 139'h511df589d5dd64206f1b3771c237d61b515;
    stim[49] = 139'h4877cfb5d5f4c38ff2158e712e657e8385e;
    stim[50] = 139'h4832212540b491a475b1edb69f75f674d2b;
    stim[51] = 139'h4bdb221c3e01186ce3534d5e8a14829baa0;
    stim[52] = 139'h4b50818b9ae84f7811081da54c37f0b69ad;
    stim[53] = 139'h7c0b600148d2ed8340fe51913c16e0a5f5b;
    stim[54] = 139'h4ce8b0eb8828ef7cbeb78c2077d02f90713;
    stim[55] = 139'h4807494fa0cf3ff86a7d99acd1ba6e9013a;
    stim[56] = 139'h401e46144eed0a83ba4d249526a2f65f529;
    stim[57] = 139'h7a85153518ce3863f571a4a404f5afb1b1f;
    stim[58] = 139'h4289124a4fd35ffe31f1e0824dd6891ed8a;
    stim[59] = 139'h7f4d46d0fd72677b4e90630b1efc8d360c0;
    stim[60] = 139'h42ccf0fd74eb0ba497f596a6140f895f8e7;
    stim[61] = 139'h5eda9e5605096a864c866efe75f7cd7264e;
    stim[62] = 139'h71ccb3ec4981d34389b11f6d3ea72b206a2;
    stim[63] = 139'h4d8023b9b148d3e8a3a49dd466a921f9e22;
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
      expv[0] = 138'h00000000000000000000000000000000000;
      expv[1] = 138'h00000000000000000000000000000000000;
      expv[2] = 138'h00000000000000000000000000000000000;
      expv[3] = 138'h34e56d141b154952951f09d86343ba10261;
      expv[4] = 138'h0b22c26a282cecb0e7dda1d6fb9699b850a;
      expv[5] = 138'h18fe40a67910dd925151d473746804b06e9;
      expv[6] = 138'h289f8ab63cdf6f247b45cac3f566b7ec785;
      expv[7] = 138'h165e468487d83cf4e70191d19816cad77f1;
      expv[8] = 138'h303c4ed9f72e1f2ae43f6bdfb6aa3cfba9c;
      expv[9] = 138'h0cfe19f46c51a1f02a20ee8e8a3002fb6a5;
      expv[10] = 138'h325f18ae8a5a018ebc734bbe20a415e3b6a;
      expv[11] = 138'h3359133c1688ca4fbe788dd351624fcabae;
      expv[12] = 138'h00000000000000000000000000000000000;
      expv[13] = 138'h00000000000000000000000000000000000;
      expv[14] = 138'h2099bb15422258d4f5e678a6f328c9571c6;
      expv[15] = 138'h1832d3f991db4c90a4331e818e959472e98;
      expv[16] = 138'h1ba13d55608727fdca964510c8bf7560c8d;
      expv[17] = 138'h00f090d2fd8447897cff6989f774e6a5fa4;
      expv[18] = 138'h3b7e68ab162ff5b400d64cdf8e8e82f3a80;
      expv[19] = 138'h37adcb0e9636a32cfb4fde64c810b27450b;
      expv[20] = 138'h001b8e442a5a337e8cf071b8ae41273f907;
      expv[21] = 138'h0165abde8c3e0d851381d997c009938dd4d;
      expv[22] = 138'h136480236de16b2f5ea2446c38c4c11a0a7;
      expv[23] = 138'h02313884e9c50c6d5d6cd6aaa5e2686b09a;
      expv[24] = 138'h3b5aaa24873ee537686b7c8b1b5d2c79e87;
      expv[25] = 138'h2be8b6b2582bbecb81003ad02e981ebc079;
      expv[26] = 138'h04c97de25d7c956e7bbd4e61123f335ccec;
      expv[27] = 138'h30cbac1ed65489fcd1504164f92ccdb9152;
      expv[28] = 138'h36f83055bb4fbfd35e83d5d1ea0b35a2d0e;
      expv[29] = 138'h1799ceb7be35ef576baadde1035f968c1b4;
      expv[30] = 138'h13caf023fc4a8d05e1b51d73b0513f1adb4;
      expv[31] = 138'h147d7322a17fa860c9b3e8e5ee5daca4a6d;
      expv[32] = 138'h32a4b08cc995b76830dfad9927fdc2b5ba6;
      expv[33] = 138'h3ebd93d0b0bcccf881121abe4283e7dc50c;
      expv[34] = 138'h24f59ad45cf7fc25a5edcaaf24c011a5762;
      expv[35] = 138'h225bbc7140c9025c6967a9646d9c1488896;
      expv[36] = 138'h25c31840f69c3d7713df0df7f3556013d55;
      expv[37] = 138'h321ebdb7b12424173e7be73b98dc79f3fca;
      expv[38] = 138'h2cdae8e68765257ffe735abd7979ab169b0;
      expv[39] = 138'h0f2b41d5e40b5dcbc4ad5856d8cf61e3286;
      expv[40] = 138'h3e076d2497dd7fc0c5d032d8068db148fc5;
      expv[41] = 138'h1917a804485595a7b9525d038538c2fd035;
      expv[42] = 138'h2d3002ad8c4ddfb184db5d00ff4bdaf3666;
      expv[43] = 138'h1cf6d048573f283020c751681e6473519fd;
      expv[44] = 138'h2c9bf9feb9bebc27a6cfb11b72702fd6177;
      expv[45] = 138'h3c8a40102fbf7ece214dde0e6caeb08c48c;
      expv[46] = 138'h0103b72e51476ff62731dc8176a77b836a7;
      expv[47] = 138'h03740c8ed3ab35ca5600c02f15ef8ed7350;
      expv[48] = 138'h298712591cba8dacf47990e077d1dedbf9d;
      expv[49] = 138'h111df589d5dd64206f1b3771c237d61b515;
      expv[50] = 138'h0877cfb5d5f4c38ff2158e712e657e8385e;
      expv[51] = 138'h0832212540b491a475b1edb69f75f674d2b;
      expv[52] = 138'h0bdb221c3e01186ce3534d5e8a14829baa0;
      expv[53] = 138'h0b50818b9ae84f7811081da54c37f0b69ad;
      expv[54] = 138'h3c0b600148d2ed8340fe51913c16e0a5f5b;
      expv[55] = 138'h0ce8b0eb8828ef7cbeb78c2077d02f90713;
      expv[56] = 138'h0807494fa0cf3ff86a7d99acd1ba6e9013a;
      expv[57] = 138'h001e46144eed0a83ba4d249526a2f65f529;
      expv[58] = 138'h3a85153518ce3863f571a4a404f5afb1b1f;
      expv[59] = 138'h0289124a4fd35ffe31f1e0824dd6891ed8a;
      expv[60] = 138'h3f4d46d0fd72677b4e90630b1efc8d360c0;
      expv[61] = 138'h02ccf0fd74eb0ba497f596a6140f895f8e7;
      expv[62] = 138'h1eda9e5605096a864c866efe75f7cd7264e;
      expv[63] = 138'h31ccb3ec4981d34389b11f6d3ea72b206a2;
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
