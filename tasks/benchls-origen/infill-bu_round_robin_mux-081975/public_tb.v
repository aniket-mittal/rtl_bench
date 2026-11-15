// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081975 dut (
    .clock(clk),
    .areset(in_vec[129:129]),
    .diag_done(in_vec[128:128]),
    .bu1(in_vec[127:96]),
    .bu2(in_vec[95:64]),
    .bu3(in_vec[63:32]),
    .bu4(in_vec[31:0]),
    .ndiag_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h3f47d7889b6811ee2a36444105ac8a987;
    stim[1] = 130'h25b28f005bbc28816ea7fe5a0383e7262;
    stim[2] = 130'h1dc400efa2eae6d2d20bc3d74aae56916;
    stim[3] = 130'h14bb775c4f07a038245d585883afeb088;
    stim[4] = 130'h08c1f6e2268355f310c9e78056c66e1a8;
    stim[5] = 130'h165e5409f37bec001c4d5644d63aaccad;
    stim[6] = 130'h20a3eee6b76976fc20edae57ab2021271;
    stim[7] = 130'h14c812d24ebd6eafbf7cf86be734de929;
    stim[8] = 130'h1079216b4aa5a6aacd37f478c4f764d72;
    stim[9] = 130'h16f19fba44bb095fb3326c27cc8e93a15;
    stim[10] = 130'h1bb5afb4540870cbbb6541d4380d8bd91;
    stim[11] = 130'h19ee214038553cf088abecdd30b87f67d;
    stim[12] = 130'h0507652af363a5abfc539bb99526a6498;
    stim[13] = 130'h0b77cfac4044e602e441da51868a97213;
    stim[14] = 130'h069bcf055fa272ceeb96ecb1bc0dee5a9;
    stim[15] = 130'h0a07ced7e6c1f680d7d73ab420e404e73;
    stim[16] = 130'h09776889db4d951de470dcd5131621f43;
    stim[17] = 130'h02b3dc570474b387eca4a6fdb9dbb2844;
    stim[18] = 130'h18f0f3ad9a500edc6d9b9eb1430b03fdb;
    stim[19] = 130'h16c61cc9f8a9efe2f05d713c705c3a0e7;
    stim[20] = 130'h151c7b86530296f0146bb730988b48715;
    stim[21] = 130'h0697a9e3eae7c9f30c7d1b91083308e7d;
    stim[22] = 130'h19da1a89e68cd09eeaadccc8de7b24895;
    stim[23] = 130'h01c347af66402b9db5deae11aa88fbb82;
    stim[24] = 130'h1b3b92e99987e651cabdee5d79beda8e7;
    stim[25] = 130'h13dcadc7b1cdd10a39901396470cbc2d3;
    stim[26] = 130'h1ba014378e0890c189ba547328524d5f5;
    stim[27] = 130'h0ae2271d8a382b032f369ee36960c6a74;
    stim[28] = 130'h1137bf2b0493ab04532e3e106ca501843;
    stim[29] = 130'h0b9125b369f3c6dbc5ca45e80cd6d5ea1;
    stim[30] = 130'h066074263c92dc739cc8b5911196b20a5;
    stim[31] = 130'h0148bb0320d67d101f3a1dee60b1d7fe8;
    stim[32] = 130'h0715bed310799ca3f7638052b2e959ab9;
    stim[33] = 130'h0882cb7a4cc94089f4e1dcae9f30b8386;
    stim[34] = 130'h017b3f4af708b6ba2e523569676f45a63;
    stim[35] = 130'h00110554ca5e1f65f9fd035290052b38f;
    stim[36] = 130'h1c19f4fbd3eaf35a27fa634ac2e1f73f0;
    stim[37] = 130'h125a952785e4d2138988bbfa60e0b7661;
    stim[38] = 130'h1bfbbc23c76e4b85d02aafbbba3d4f0ca;
    stim[39] = 130'h08bdc76b4e34bfbc38c8782a3851eff86;
    stim[40] = 130'h05e91183e0866447c1935d7896bc96da2;
    stim[41] = 130'h00f89947b1efc2b527151625a26c92e57;
    stim[42] = 130'h04f50bef593e06dd58d6a393bb1e3923b;
    stim[43] = 130'h06242c73ec86b3e74edda5bb1ffd453bf;
    stim[44] = 130'h0834cbe06c59af580265a7a67f8f0e071;
    stim[45] = 130'h0ebdb12211f4e0df44358fce31d1a8908;
    stim[46] = 130'h04dbcfbdb75ba34e083b66d25b63ed41d;
    stim[47] = 130'h05e9bfdda4a42720e6b239d6a3ff5acb1;
    stim[48] = 130'h182f183823809c0acc60a8ff59ecc5fcd;
    stim[49] = 130'h0ce7a6f9f6428037691803d170c737040;
    stim[50] = 130'h1d020a1dcd49df3b8336f3ea085e141aa;
    stim[51] = 130'h0627d7fd54717e1cc3f39ff9020f88c94;
    stim[52] = 130'h06e93afbcd62a9cd0ff4331aaa77acf5d;
    stim[53] = 130'h008693b2f8555030fc7189cc09108ef1b;
    stim[54] = 130'h0d3f558d516a2f135ac5d833a81d144b2;
    stim[55] = 130'h002733a68f40e7e75d6defbf1d8b92a31;
    stim[56] = 130'h15b2579cfb8f3b006746c99be94e2873d;
    stim[57] = 130'h0f78dcd9472672122dc75561a1cc85e88;
    stim[58] = 130'h1cee2d44c38d85a03cad270b9acb6dea1;
    stim[59] = 130'h0ce8f90e919942f86a2cd4743c1fe9acc;
    stim[60] = 130'h06c5b1d20779eb70b36cb43f137851df2;
    stim[61] = 130'h00504c2f1a04b99cf05aec99017e62b50;
    stim[62] = 130'h114c399cd4c7fbca86c7d06e0bbe6e88c;
    stim[63] = 130'h0e8a2df0a154bf86af58ec23b1bc93be8;
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
      expv[0] = 32'hf47d7889;
      expv[1] = 32'h5b28f005;
      expv[2] = 32'hdc400efa;
      expv[3] = 32'hf07a0382;
      expv[4] = 32'h0c9e7805;
      expv[5] = 32'hc4d5644d;
      expv[6] = 32'h0a3eee6b;
      expv[7] = 32'h4c812d24;
      expv[8] = 32'haa5a6aac;
      expv[9] = 32'h3326c27c;
      expv[10] = 32'h80d8bd91;
      expv[11] = 32'h9ee21403;
      expv[12] = 32'h363a5abf;
      expv[13] = 32'h044e602e;
      expv[14] = 32'hfa272cee;
      expv[15] = 32'h6c1f680d;
      expv[16] = 32'hb4d951de;
      expv[17] = 32'h474b387e;
      expv[18] = 32'ha500edc6;
      expv[19] = 32'h05d713c7;
      expv[20] = 32'h88b48715;
      expv[21] = 32'h697a9e3e;
      expv[22] = 32'h9da1a89e;
      expv[23] = 32'h6402b9db;
      expv[24] = 32'h987e651c;
      expv[25] = 32'h99013964;
      expv[26] = 32'h8524d5f5;
      expv[27] = 32'hae2271d8;
      expv[28] = 32'h137bf2b0;
      expv[29] = 32'h9f3c6dbc;
      expv[30] = 32'hc92dc739;
      expv[31] = 32'h0d67d101;
      expv[32] = 32'h0799ca3f;
      expv[33] = 32'hcc94089f;
      expv[34] = 32'h708b6ba2;
      expv[35] = 32'ha5e1f65f;
      expv[36] = 32'h3eaf35a2;
      expv[37] = 32'h988bbfa6;
      expv[38] = 32'ha3d4f0ca;
      expv[39] = 32'h8bdc76b4;
      expv[40] = 32'h5e91183e;
      expv[41] = 32'h0f89947b;
      expv[42] = 32'h4f50bef5;
      expv[43] = 32'h6242c73e;
      expv[44] = 32'h834cbe06;
      expv[45] = 32'hebdb1221;
      expv[46] = 32'h4dbcfbdb;
      expv[47] = 32'h5e9bfdda;
      expv[48] = 32'h82f18382;
      expv[49] = 32'h64280376;
      expv[50] = 32'hd49df3b8;
      expv[51] = 32'h3f39ff90;
      expv[52] = 32'hff4331aa;
      expv[53] = 32'hc7189cc0;
      expv[54] = 32'hac5d833a;
      expv[55] = 32'hd6defbf1;
      expv[56] = 32'h746c99be;
      expv[57] = 32'h1cc85e88;
      expv[58] = 32'hacb6dea1;
      expv[59] = 32'hce8f90e9;
      expv[60] = 32'h6c5b1d20;
      expv[61] = 32'h0504c2f1;
      expv[62] = 32'h14c399cd;
      expv[63] = 32'h154bf86a;
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
