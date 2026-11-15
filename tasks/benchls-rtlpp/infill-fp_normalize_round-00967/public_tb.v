// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00967 dut (
    .clk_i(clk),
    .opa_i(in_vec[103:72]),
    .opb_i(in_vec[71:40]),
    .fract_28_i(in_vec[39:12]),
    .exp_i(in_vec[11:4]),
    .sign_i(in_vec[3:3]),
    .fpu_op_i(in_vec[2:2]),
    .rmode_i(in_vec[1:0]),
    .output_o(out_vec[32:1]),
    .ine_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'h25039876241d96936e5bcf7606;
    stim[1] = 104'h7415347bf7e4e218013cd955f1;
    stim[2] = 104'hc058a2c06ec8de7a0b4c0e4d08;
    stim[3] = 104'h8346dee7eaf02f496b0cd6d33b;
    stim[4] = 104'h818abb3c2d391811693ab0f222;
    stim[5] = 104'h8db45df739100bb6efc0b8ff44;
    stim[6] = 104'hfd3cab0a19a931c2f8db0de916;
    stim[7] = 104'hcebce6c5b6623572e776946093;
    stim[8] = 104'hf03c055c7619884c19ce198b77;
    stim[9] = 104'h87b51efde1ed99c4f1ec7005b1;
    stim[10] = 104'hdcf2af9d6ee5d16fa78fc44d38;
    stim[11] = 104'h704668afb04fe1043ff57c9d25;
    stim[12] = 104'h56b626a85e3bd25739237309ad;
    stim[13] = 104'hab5b34f98d429f09f015d3cfd5;
    stim[14] = 104'h94160bb1b9febedf5e07968763;
    stim[15] = 104'h55c9fb112a0ed288a99f5ed05f;
    stim[16] = 104'hb75ee1c02fae3eac44f6ccd2c3;
    stim[17] = 104'h5f1a387aa123a49c1fcf33c344;
    stim[18] = 104'h72124e343744c10c22d7725335;
    stim[19] = 104'h3eaf5fa4437fe66e30c5868830;
    stim[20] = 104'hfa78c2a129094bc855fcc47673;
    stim[21] = 104'hfdb6f44b2d6cdf3b161a7b759c;
    stim[22] = 104'h233585c88f8e58b14f652ff6e0;
    stim[23] = 104'h2691adb6563e4727c6782b7f4f;
    stim[24] = 104'h9095d4f53848085da5568d70d0;
    stim[25] = 104'h0f92c132651fa789da3550737b;
    stim[26] = 104'h9a7889d28cf9b70fabcfb312cc;
    stim[27] = 104'h35f1850afb945a795708cf3068;
    stim[28] = 104'hb401ec1ce32b85b1a912eb3c09;
    stim[29] = 104'h5f12bc9034e4a0291efd7015a9;
    stim[30] = 104'heaf81f695b77abc72004e3ca86;
    stim[31] = 104'ha9630e1def34753f92ca98a198;
    stim[32] = 104'h317128c8b8d83a54016dc7e9a7;
    stim[33] = 104'h6a4957ab6d064b8a957e2e911f;
    stim[34] = 104'h2c12ef71ca105af95873e6d7f4;
    stim[35] = 104'h9b8446e87b7770a51741482978;
    stim[36] = 104'h11c157776fc3e348f7230b5811;
    stim[37] = 104'h484edb7fbc8b9c0feeb7d75911;
    stim[38] = 104'h6aa38f2e8836037e2e00fd902f;
    stim[39] = 104'hd60598c9a215bf642dd43d04d7;
    stim[40] = 104'hfe2767aff6f0fa382e6b52fec5;
    stim[41] = 104'h8b555be29c50f6f6e0438a52dc;
    stim[42] = 104'h5ec6233a4991175569090a4d2c;
    stim[43] = 104'h1a135a1c850d02347c581a5653;
    stim[44] = 104'h9804b869020c597837ae382076;
    stim[45] = 104'h630d75ab3132a05c0b365b62b3;
    stim[46] = 104'h2900bf5e6cf442af3a40136bc3;
    stim[47] = 104'h4d958a71605049ad8b24558480;
    stim[48] = 104'h8c9b2e5c6e044ea939ac3cb5a4;
    stim[49] = 104'hf66df4e96f847d37f4c309b613;
    stim[50] = 104'hd37687912dd6b7550cc5d6b4fb;
    stim[51] = 104'hae756c8605cc4ed13f5c45d427;
    stim[52] = 104'hc9ef433ecdaac12b5380869e3e;
    stim[53] = 104'h18ad6be324bd29aee0c0b48d13;
    stim[54] = 104'h6c7d461023ec28fd25f815a4a3;
    stim[55] = 104'h88daa3a144c9297e7ae2da903b;
    stim[56] = 104'h2924a4e823a66dde1c00e082d3;
    stim[57] = 104'hb81a1f2dfb00e78426f5a8391d;
    stim[58] = 104'h08a75ac4493a450b6f7626eacf;
    stim[59] = 104'h25cc932d2b63bbdc5f6f0c6f59;
    stim[60] = 104'h7afa82a36ac8af337d93470d42;
    stim[61] = 104'h2ad7b864318c19424ac12b4bb0;
    stim[62] = 104'h27c7b0bfc854ae4910a0a2fd44;
    stim[63] = 104'h8b93cd8f34b0b32bdd50c822c6;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h0xxxxxxxx;
      expv[2] = 33'h0xxxxxxxx;
      expv[3] = 33'h15804f367;
      expv[4] = 33'h1cea60720;
      expv[5] = 33'h033619ada;
      expv[6] = 33'h022a4eac5;
      expv[7] = 33'h0f6df8173;
      expv[8] = 33'h092f1b61b;
      expv[9] = 33'h00aceed29;
      expv[10] = 33'h0b4339c33;
      expv[11] = 33'h15d8f6380;
      expv[12] = 33'h0d44f1f89;
      expv[13] = 33'h1d07feaf9;
      expv[14] = 33'h099c91b98;
      expv[15] = 33'h0ff000001;
      expv[16] = 33'h175bc0f2f;
      expv[17] = 33'h007533ebd;
      expv[18] = 33'h02b89ed9b;
      expv[19] = 33'h0317f3ccf;
      expv[20] = 33'h03316bb93;
      expv[21] = 33'h082862c34;
      expv[22] = 33'h16857f313;
      expv[23] = 33'h0565869ef;
      expv[24] = 33'h16df65301;
      expv[25] = 33'h0f68cf057;
      expv[26] = 33'h10e4aad1d;
      expv[27] = 33'h138b46aa1;
      expv[28] = 33'h12d579f67;
      expv[29] = 33'h105ae119f;
      expv[30] = 33'h1c25225d7;
      expv[31] = 33'h0573dfae0;
      expv[32] = 33'h1a800271e;
      expv[33] = 33'h0199654c5;
      expv[34] = 33'h19302db91;
      expv[35] = 33'h0127e2e91;
      expv[36] = 33'h17eb0e7cf;
      expv[37] = 33'h0945d0521;
      expv[38] = 33'h083b9185b;
      expv[39] = 33'h192dd6fb1;
      expv[40] = 33'h0005c01fb;
      expv[41] = 33'h04c6ea1e8;
      expv[42] = 33'h1eb735a99;
      expv[43] = 33'h12f810e29;
      expv[44] = 33'h0d1d21215;
      expv[45] = 33'h065f1606b;
      expv[46] = 33'h005deb8e1;
      expv[47] = 33'h02759b2db;
      expv[48] = 33'h0bca40136;
      expv[49] = 33'h0485922ad;
      expv[50] = 33'h058735879;
      expv[51] = 33'h163d30c27;
      expv[52] = 33'h04b198bad;
      expv[53] = 33'h142f5c45d;
      expv[54] = 33'h0e44e021b;
      expv[55] = 33'h0d3c18169;
      expv[56] = 33'h1484bf02d;
      expv[57] = 33'h004eb8b6b;
      expv[58] = 33'h12a700382;
      expv[59] = 33'h19137ad43;
      expv[60] = 33'h1adbdd89b;
      expv[61] = 33'h0f57dbc33;
      expv[62] = 33'h0d4f64d1c;
      expv[63] = 33'h0bb2b04ad;
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
