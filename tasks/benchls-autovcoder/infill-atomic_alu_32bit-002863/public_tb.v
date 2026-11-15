// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002863 dut (
    .readdata(in_vec[98:67]),
    .atomic_op(in_vec[66:64]),
    .operand0(in_vec[63:32]),
    .operand1(in_vec[31:0]),
    .atomic_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h6c89428f2cd3beac7888a30f5;
    stim[1] = 99'h1f403497f691ed33f8e8e9e99;
    stim[2] = 99'h71860457063140b9d378fdfba;
    stim[3] = 99'h30971a1ea9eb80f3130bdf832;
    stim[4] = 99'h361fe698eb85e466bafb9382e;
    stim[5] = 99'h7e4018382382ac3e4ce24b807;
    stim[6] = 99'h746cee6c1dee3886bd230f2aa;
    stim[7] = 99'h0a2ceb38d572c3e5b90bb0113;
    stim[8] = 99'h18d2c66d4a612a6a31147b0da;
    stim[9] = 99'h094700024523181f856d0c301;
    stim[10] = 99'h1e3f3c9a15f6cc55aa15b2ec0;
    stim[11] = 99'h75e42b7d7b5d2998a7cc4087f;
    stim[12] = 99'h4e82f3e1f9c096b9b96cd4168;
    stim[13] = 99'h225db1d318f9a87b0472492f2;
    stim[14] = 99'h624cc3918e8f011e0e4b5fe0b;
    stim[15] = 99'h350fae55a0f61b9686397c837;
    stim[16] = 99'h1de78d0662235d03c2357ebd8;
    stim[17] = 99'h102cf10b34dd966704ac7dcf7;
    stim[18] = 99'h67fa51716944f38e590d30961;
    stim[19] = 99'h44ba7589958b876761e7175c8;
    stim[20] = 99'h2c9f567b008df3319c56ee066;
    stim[21] = 99'h17bc067f00d944018e72144e3;
    stim[22] = 99'h232f97d515bfb790d203268cc;
    stim[23] = 99'h2064a986351f6c29968e5987e;
    stim[24] = 99'h18609b089710a80bc7ac9a0de;
    stim[25] = 99'h6a7e1de7f8d7b9e30bd3b3abd;
    stim[26] = 99'h50826b7d35b887a25ebbb581b;
    stim[27] = 99'h4bc500c82109cba7d77a84f83;
    stim[28] = 99'h3d20a5c327db9992ed343b5e9;
    stim[29] = 99'h6064b0fae879861b8a6d8e6f8;
    stim[30] = 99'h27252b00606ca0630bd1db2af;
    stim[31] = 99'h1a2678c3b0f517d51e81d527f;
    stim[32] = 99'h4082e3d3fcd91032e6d15deb3;
    stim[33] = 99'h7f6d659e881af624db65d96b9;
    stim[34] = 99'h4d8ad748336ccc2e7c8b00aed;
    stim[35] = 99'h002d3cb1116d78fda8c9c3f73;
    stim[36] = 99'h3717e7667a793ca1f59f3c8e5;
    stim[37] = 99'h43839fdf0e488a6a1a9cd2a8f;
    stim[38] = 99'h7206db97a62a3bdb39929d301;
    stim[39] = 99'h1edd9daa28ca68992f1d386cd;
    stim[40] = 99'h46f8df89d5c2050010f9bed96;
    stim[41] = 99'h42059e9cf38b4a2609998819b;
    stim[42] = 99'h2a312e7f048f8cbf4570da638;
    stim[43] = 99'h47d109cb8483fa5cb5d36e564;
    stim[44] = 99'h2b13670e9a963134e6ef9fa6a;
    stim[45] = 99'h47c2c63c474cea3f58265fbfb;
    stim[46] = 99'h217cd135792507f832371855b;
    stim[47] = 99'h4fd2d2f06a6cda86c2c0b17bc;
    stim[48] = 99'h7fd105a8001fe1bb493ff51b5;
    stim[49] = 99'h63fbec934f2268e3e9e8a3fab;
    stim[50] = 99'h5816157687ea3c7d8aa4d2f8a;
    stim[51] = 99'h0ed00ee66e94512673c36d244;
    stim[52] = 99'h23c554427bbb4a107e891db4c;
    stim[53] = 99'h09ce9cf6b694ff809a4b7bdb4;
    stim[54] = 99'h34346d9ab923d3f1bf50331e3;
    stim[55] = 99'h7a69503178eb332a76e0a3fd0;
    stim[56] = 99'h581b525206debc4e2de3067f7;
    stim[57] = 99'h5b7f8a5f64f7b535cec333779;
    stim[58] = 99'h698fb46332db36683e0d7ae5e;
    stim[59] = 99'h232aa11496525f2cd70e57082;
    stim[60] = 99'h330b7c8026918bc223d2597fa;
    stim[61] = 99'h38680b625b9838d7425c43ff3;
    stim[62] = 99'h7ef3f3ce172cd248b93ce3501;
    stim[63] = 99'h4dc6fc3150a22c515e94feadf;
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
      expv[0] = 32'h0000000x;
      expv[1] = 32'h0000000x;
      expv[2] = 32'h4620144b;
      expv[3] = 32'h0000000x;
      expv[4] = 32'h0000000x;
      expv[5] = 32'h0000000x;
      expv[6] = 32'h0000000x;
      expv[7] = 32'h0000000x;
      expv[8] = 32'h0000000x;
      expv[9] = 32'h0000000x;
      expv[10] = 32'h0000000x;
      expv[11] = 32'h0000000x;
      expv[12] = 32'h0000000x;
      expv[13] = 32'h0000000x;
      expv[14] = 32'had899903;
      expv[15] = 32'h0000000x;
      expv[16] = 32'h0000000x;
      expv[17] = 32'h0000000x;
      expv[18] = 32'h0000000x;
      expv[19] = 32'h0000000x;
      expv[20] = 32'h621de00f;
      expv[21] = 32'h3d0c4d16;
      expv[22] = 32'h0000000x;
      expv[23] = 32'h0000000x;
      expv[24] = 32'h0000000x;
      expv[25] = 32'h0000000x;
      expv[26] = 32'h0000000x;
      expv[27] = 32'h0000000x;
      expv[28] = 32'h0000000x;
      expv[29] = 32'h0000000x;
      expv[30] = 32'h0000000x;
      expv[31] = 32'h0000000x;
      expv[32] = 32'h0000000x;
      expv[33] = 32'h808a2d8a;
      expv[34] = 32'h0000000x;
      expv[35] = 32'h0000000x;
      expv[36] = 32'h0000000x;
      expv[37] = 32'h6b8fe65f;
      expv[38] = 32'h0000000x;
      expv[39] = 32'h0000000x;
      expv[40] = 32'h0000000x;
      expv[41] = 32'h0000000x;
      expv[42] = 32'h9d5b28f2;
      expv[43] = 32'hd7e1b962;
      expv[44] = 32'h0000000x;
      expv[45] = 32'h0000000x;
      expv[46] = 32'h0000000x;
      expv[47] = 32'h0000000x;
      expv[48] = 32'h01a02704;
      expv[49] = 32'h0000000x;
      expv[50] = 32'h2ecff2c5;
      expv[51] = 32'h0000000x;
      expv[52] = 32'h0000000x;
      expv[53] = 32'h0000000x;
      expv[54] = 32'h0000000x;
      expv[55] = 32'h0000000x;
      expv[56] = 32'h1e226986;
      expv[57] = 32'h0000000x;
      expv[58] = 32'h0000000x;
      expv[59] = 32'h0000000x;
      expv[60] = 32'h0000000x;
      expv[61] = 32'h0000000x;
      expv[62] = 32'h0000000x;
      expv[63] = 32'h0000000x;
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
