// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[102:102]),
    .ena(in_vec[101:100]),
    .data(in_vec[99:0]),
    .q(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h4942fd69880cecdf9c768b9192;
    stim[1] = 103'h73c2cb3acd312f93fdb75780c3;
    stim[2] = 103'h488ea09bde148b211bb3cd5df3;
    stim[3] = 103'h45f59259cdcb6dbdb3f55d3959;
    stim[4] = 103'h535fa3437ac0b1601191380788;
    stim[5] = 103'h4cf853c8b36a179f625d85d199;
    stim[6] = 103'h794f9d4e6da2b9c66f5feba823;
    stim[7] = 103'h45ffb818e0e53692c952c2a6cf;
    stim[8] = 103'h65c675c6ee18fc8ccef1bbc4dd;
    stim[9] = 103'h16f77284baf3d392283ce074df;
    stim[10] = 103'h537a9e3696fc7bf564bfb2d02e;
    stim[11] = 103'h1ad277097bb0ee7585c7634d5b;
    stim[12] = 103'h61f7ce08f76307a01c1b5b6129;
    stim[13] = 103'h7fe50c1cd43bd9ce0efdea5ded;
    stim[14] = 103'h12fdf21e7c6c07434e200214d1;
    stim[15] = 103'h627e1ac0a8ad4bc0ff8d667a02;
    stim[16] = 103'h0e1c5921b9f3058706c5dd56fe;
    stim[17] = 103'h2889338cadd9f94116e7e600a5;
    stim[18] = 103'h31c5dc3fa4db7c95f4ca51e3db;
    stim[19] = 103'h144d151c052606f7bb2c09d20b;
    stim[20] = 103'h4078109283b02998f3a8eaa77a;
    stim[21] = 103'h505bf31021fa796b85eebd301f;
    stim[22] = 103'h71a986dad63122aa40dae82a20;
    stim[23] = 103'h43c732bb2e1efa9e66af70db7d;
    stim[24] = 103'h39b3f45728407d54b8fe11300a;
    stim[25] = 103'h317302e0ddf972b5670e599304;
    stim[26] = 103'h210ab91a51b476f4fb1db9660f;
    stim[27] = 103'h7cc4e5ff80ceb37e6bb00e52fa;
    stim[28] = 103'h67b7ab95d8e395d498c72e2e59;
    stim[29] = 103'h29d15a15128d6393c06bb39d71;
    stim[30] = 103'h25f742b333fb1f9c5348a52f2f;
    stim[31] = 103'h37985feffc29ed10211a969485;
    stim[32] = 103'h5e0c6d84b66c689d773e873247;
    stim[33] = 103'h7ae2c3a526067e3c75bc4dea78;
    stim[34] = 103'h73901827330a8fd3d226775c39;
    stim[35] = 103'h319883f122b53c77910be8b54b;
    stim[36] = 103'h01b7e00c9e53d29d45d14c7afa;
    stim[37] = 103'h05365a0f3b25ae920c94fcda66;
    stim[38] = 103'h7cbebbdc4227d7a8326e33b1df;
    stim[39] = 103'h081a30cd9e98e1bc0083ad0dd2;
    stim[40] = 103'h65ea752c8ad203876b3773508c;
    stim[41] = 103'h55c13799721fb72c9266449ad0;
    stim[42] = 103'h5af8833fec6c00bf53d8c43e05;
    stim[43] = 103'h25e2e5c590430b96adde2a38b1;
    stim[44] = 103'h4e8daad0a0b0ab6d1d397e497c;
    stim[45] = 103'h1840e4178f0d5c8da2caa2467a;
    stim[46] = 103'h3138b10954aae72cffbae8ed67;
    stim[47] = 103'h6b62023c6e711a3b799a25a9aa;
    stim[48] = 103'h6822b6c0f0c38703b41e1fac32;
    stim[49] = 103'h0906f18daf000ba18af44b9df5;
    stim[50] = 103'h72180290a7f5326f71d0dfbda1;
    stim[51] = 103'h7b2652795ec76a901f05629636;
    stim[52] = 103'h76d355bf3b2ca5be5cd5bbb349;
    stim[53] = 103'h4fa24819b2c23be76cf04b5410;
    stim[54] = 103'h476de02eff4882ff025abe9d6f;
    stim[55] = 103'h22cf3bb92e9197e23a5142bd38;
    stim[56] = 103'h03e5da1ff3b48e513f94bc1907;
    stim[57] = 103'h3044f5b327cf7331fe2144f262;
    stim[58] = 103'h0c8bc799e5ed91d9b3fb09ba81;
    stim[59] = 103'h668c0a96fa4f12c9349a831b93;
    stim[60] = 103'h11539ba51870813a5e5a1a5d53;
    stim[61] = 103'h18dee9d4013e58f96ae7db35e4;
    stim[62] = 103'h796c1e260d4be836ec845cf8ab;
    stim[63] = 103'h6e440eef45e3702b857a8dff04;
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
      expv[0] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 100'h942fd69880cecdf9c768b9192;
      expv[2] = 100'h3c2cb3acd312f93fdb75780c3;
      expv[3] = 100'h88ea09bde148b211bb3cd5df3;
      expv[4] = 100'h5f59259cdcb6dbdb3f55d3959;
      expv[5] = 100'h35fa3437ac0b1601191380788;
      expv[6] = 100'hcf853c8b36a179f625d85d199;
      expv[7] = 100'h94f9d4e6da2b9c66f5feba823;
      expv[8] = 100'h5ffb818e0e53692c952c2a6cf;
      expv[9] = 100'h5c675c6ee18fc8ccef1bbc4dd;
      expv[10] = 100'hae33ae3770c7e466778dde26e;
      expv[11] = 100'h37a9e3696fc7bf564bfb2d02e;
      expv[12] = 100'h1bd4f1b4b7e3dfab25fd96817;
      expv[13] = 100'h1f7ce08f76307a01c1b5b6129;
      expv[14] = 100'hfe50c1cd43bd9ce0efdea5ded;
      expv[15] = 100'hff2860e6a1dece7077ef52ef6;
      expv[16] = 100'h27e1ac0a8ad4bc0ff8d667a02;
      expv[17] = 100'h27e1ac0a8ad4bc0ff8d667a02;
      expv[18] = 100'h4fc3581515a9781ff1accf404;
      expv[19] = 100'h4fc3581515a9781ff1accf404;
      expv[20] = 100'h27e1ac0a8ad4bc0ff8d667a02;
      expv[21] = 100'h078109283b02998f3a8eaa77a;
      expv[22] = 100'h05bf31021fa796b85eebd301f;
      expv[23] = 100'h1a986dad63122aa40dae82a20;
      expv[24] = 100'h3c732bb2e1efa9e66af70db7d;
      expv[25] = 100'h3c732bb2e1efa9e66af70db7d;
      expv[26] = 100'h3c732bb2e1efa9e66af70db7d;
      expv[27] = 100'h78e65765c3df53ccd5ee1b6fa;
      expv[28] = 100'hcc4e5ff80ceb37e6bb00e52fa;
      expv[29] = 100'h7b7ab95d8e395d498c72e2e59;
      expv[30] = 100'hf6f572bb1c72ba9318e5c5cb2;
      expv[31] = 100'hedeae57638e5752631cb8b965;
      expv[32] = 100'hedeae57638e5752631cb8b965;
      expv[33] = 100'he0c6d84b66c689d773e873247;
      expv[34] = 100'hae2c3a526067e3c75bc4dea78;
      expv[35] = 100'h3901827330a8fd3d226775c39;
      expv[36] = 100'h3901827330a8fd3d226775c39;
      expv[37] = 100'h3901827330a8fd3d226775c39;
      expv[38] = 100'h3901827330a8fd3d226775c39;
      expv[39] = 100'hcbebbdc4227d7a8326e33b1df;
      expv[40] = 100'hcbebbdc4227d7a8326e33b1df;
      expv[41] = 100'h5ea752c8ad203876b3773508c;
      expv[42] = 100'h5c13799721fb72c9266449ad0;
      expv[43] = 100'haf8833fec6c00bf53d8c43e05;
      expv[44] = 100'h5f1067fd8d8017ea7b1887c0b;
      expv[45] = 100'he8daad0a0b0ab6d1d397e497c;
      expv[46] = 100'h746d568505855b68e9cbf24be;
      expv[47] = 100'h746d568505855b68e9cbf24be;
      expv[48] = 100'hb62023c6e711a3b799a25a9aa;
      expv[49] = 100'h822b6c0f0c38703b41e1fac32;
      expv[50] = 100'h822b6c0f0c38703b41e1fac32;
      expv[51] = 100'h2180290a7f5326f71d0dfbda1;
      expv[52] = 100'hb2652795ec76a901f05629636;
      expv[53] = 100'h6d355bf3b2ca5be5cd5bbb349;
      expv[54] = 100'hfa24819b2c23be76cf04b5410;
      expv[55] = 100'h76de02eff4882ff025abe9d6f;
      expv[56] = 100'hedbc05dfe9105fe04b57d3ade;
      expv[57] = 100'hedbc05dfe9105fe04b57d3ade;
      expv[58] = 100'hedbc05dfe9105fe04b57d3ade;
      expv[59] = 100'hedbc05dfe9105fe04b57d3ade;
      expv[60] = 100'h68c0a96fa4f12c9349a831b93;
      expv[61] = 100'hb46054b7d2789649a4d418dc9;
      expv[62] = 100'hda302a5be93c4b24d26a0c6e4;
      expv[63] = 100'h96c1e260d4be836ec845cf8ab;
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
