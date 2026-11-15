// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183669 dut (
    .exmem_branch(in_vec[69:69]),
    .exmem_condition(in_vec[68:66]),
    .exmem_target(in_vec[65:34]),
    .exmem_pc_4(in_vec[33:2]),
    .exmem_lf(in_vec[1:1]),
    .exmem_zf(in_vec[0:0]),
    .final_target(out_vec[32:1]),
    .branch_state(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h0ef525896baba3945a;
    stim[1] = 70'h2b0cac6e9d6ccae8e3;
    stim[2] = 70'h19eba696ef0f00c06b;
    stim[3] = 70'h1f4f43be95465ac0b6;
    stim[4] = 70'h0db4fc42d53033fbdb;
    stim[5] = 70'h014c5beec02bee48c9;
    stim[6] = 70'h2632b6e2e16e8b1b9b;
    stim[7] = 70'h2507f74a7063567fa7;
    stim[8] = 70'h114e40124a1f79a270;
    stim[9] = 70'h024eb5a537da56d4a0;
    stim[10] = 70'h3aaf4f5054037b5ed5;
    stim[11] = 70'h24355a36fc6d685213;
    stim[12] = 70'h2e353ea0f74d266cd6;
    stim[13] = 70'h28c4e283f49c39c57a;
    stim[14] = 70'h31df3fdc52de623a14;
    stim[15] = 70'h14175db280ca4d7a5c;
    stim[16] = 70'h11c4c3a49696111582;
    stim[17] = 70'h1e388e9571ba40190b;
    stim[18] = 70'h185b17249d0bd8c17f;
    stim[19] = 70'h263f1ffa2d23b38bb4;
    stim[20] = 70'h0c9c3f18b8dd2b1ce8;
    stim[21] = 70'h308430710be4f126ad;
    stim[22] = 70'h05157a5abc1348c35a;
    stim[23] = 70'h3d446247debde4a060;
    stim[24] = 70'h3780c5cbc7e1d6d0c9;
    stim[25] = 70'h3ca8de886c2f811cb2;
    stim[26] = 70'h036eb1f9831c6e32ad;
    stim[27] = 70'h2731db858b927de931;
    stim[28] = 70'h0b036c23e27809e8b3;
    stim[29] = 70'h043efcc5268be29de3;
    stim[30] = 70'h3deb99c1fb03c27cde;
    stim[31] = 70'h0ac849421de24ac089;
    stim[32] = 70'h0fdeb07435f1f50368;
    stim[33] = 70'h25e1e7533ccbd77d68;
    stim[34] = 70'h10001fda53501381a1;
    stim[35] = 70'h136e488aa0efd70459;
    stim[36] = 70'h2de9ecf823ddc2f8d2;
    stim[37] = 70'h2fed76f13372e0380a;
    stim[38] = 70'h31469fd6a74e6c6724;
    stim[39] = 70'h1ebc585bac95c54e12;
    stim[40] = 70'h3f99bd0096cf2b50c3;
    stim[41] = 70'h14d71a48a96ce818e6;
    stim[42] = 70'h1a8e13571e1479007e;
    stim[43] = 70'h12d0827072f03d128c;
    stim[44] = 70'h296e700009a5c735a9;
    stim[45] = 70'h259f74abc462f172f1;
    stim[46] = 70'h3355412cfac8dca16f;
    stim[47] = 70'h33f7c6f59d683922c5;
    stim[48] = 70'h3fb226764ab4f77a60;
    stim[49] = 70'h2de22a795dc0d312d8;
    stim[50] = 70'h1e7b86a6c9b963e0a7;
    stim[51] = 70'h1e638be8249275c342;
    stim[52] = 70'h2f9ce8e762588133f9;
    stim[53] = 70'h3da5c24e04653f0030;
    stim[54] = 70'h1afddc5b89f50baa81;
    stim[55] = 70'h0fc2dc9df234f68615;
    stim[56] = 70'h22c971d7d9f78a81fc;
    stim[57] = 70'h1bd3a9412a44950fb4;
    stim[58] = 70'h293e17ba9db9fe50fc;
    stim[59] = 70'h15eb5851133750470b;
    stim[60] = 70'h0c5e0747c7a07fc46c;
    stim[61] = 70'h07bf151025b5cb44c9;
    stim[62] = 70'h1efef045b9c0d1896d;
    stim[63] = 70'h054e7b8888f982b652;
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
      expv[0] = 33'h1d5d1ca2c;
      expv[1] = 33'h0b6657478;
      expv[2] = 33'h187806034;
      expv[3] = 33'h0a32d605a;
      expv[4] = 33'h09819fdec;
      expv[5] = 33'h015f72464;
      expv[6] = 33'h1195b7171;
      expv[7] = 33'h083fba539;
      expv[8] = 33'h10fbcd138;
      expv[9] = 33'h1ed2b6a50;
      expv[10] = 33'h001bdaf72;
      expv[11] = 33'h01aad1b7f;
      expv[12] = 33'h1a6933672;
      expv[13] = 33'h0627141fb;
      expv[14] = 33'h0ef9fee29;
      expv[15] = 33'h06526bd2e;
      expv[16] = 33'h14b088ac0;
      expv[17] = 33'h0dd200c84;
      expv[18] = 33'h085ec60be;
      expv[19] = 33'h091d9c5e2;
      expv[20] = 33'h06e958e74;
      expv[21] = 33'h1f278935e;
      expv[22] = 33'h009a461ac;
      expv[23] = 33'h0a23123ef;
      expv[24] = 33'h1c062e5e3;
      expv[25] = 33'h0546f4437;
      expv[26] = 33'h18e371956;
      expv[27] = 33'h198edc2c5;
      expv[28] = 33'h13c04f458;
      expv[29] = 33'h145f14ef0;
      expv[30] = 33'h0f5cce0fd;
      expv[31] = 33'h0f1256044;
      expv[32] = 33'h0f8fa81b4;
      expv[33] = 33'h065ebbebc;
      expv[34] = 33'h1a809c0d0;
      expv[35] = 33'h077eb822c;
      expv[36] = 33'h1eee17c70;
      expv[37] = 33'h1b9701c0c;
      expv[38] = 33'h0a34feb53;
      expv[39] = 33'h04ae2a708;
      expv[40] = 33'h1ccde804b;
      expv[41] = 33'h0b6740c72;
      expv[42] = 33'h10a3c803e;
      expv[43] = 33'h1781e8946;
      expv[44] = 33'h0d2e39adc;
      expv[45] = 33'h0cfba55e3;
      expv[46] = 33'h1646e50be;
      expv[47] = 33'h0b41c916a;
      expv[48] = 33'h1d9133b25;
      expv[49] = 33'h0f1153caf;
      expv[50] = 33'h0dcb1f052;
      expv[51] = 33'h0493ae1a0;
      expv[52] = 33'h1ce7473b1;
      expv[53] = 33'h0d2e12703;
      expv[54] = 33'h0fa85d540;
      expv[55] = 33'h11a7b430a;
      expv[56] = 33'h164b8ebed;
      expv[57] = 33'h1224a87da;
      expv[58] = 33'h09f0bdd4f;
      expv[59] = 33'h19ba82384;
      expv[60] = 33'h1d03fe236;
      expv[61] = 33'h0dae5a264;
      expv[62] = 33'h0e068c4b6;
      expv[63] = 33'h07cc15b28;
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
