// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_fcnvt_htos_sh dut (
    .htos_sh_src(in_vec[9:0]),
    .htos_sh_cnt(out_vec[16:11]),
    .htos_sh_f_v(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h211;
    stim[1] = 10'h128;
    stim[2] = 10'h1e1;
    stim[3] = 10'h080;
    stim[4] = 10'h323;
    stim[5] = 10'h0a7;
    stim[6] = 10'h284;
    stim[7] = 10'h15d;
    stim[8] = 10'h39f;
    stim[9] = 10'h39e;
    stim[10] = 10'h29c;
    stim[11] = 10'h0f7;
    stim[12] = 10'h07b;
    stim[13] = 10'h3ac;
    stim[14] = 10'h229;
    stim[15] = 10'h060;
    stim[16] = 10'h18c;
    stim[17] = 10'h313;
    stim[18] = 10'h195;
    stim[19] = 10'h38d;
    stim[20] = 10'h101;
    stim[21] = 10'h1a1;
    stim[22] = 10'h140;
    stim[23] = 10'h1a9;
    stim[24] = 10'h1c5;
    stim[25] = 10'h28e;
    stim[26] = 10'h0a9;
    stim[27] = 10'h1f0;
    stim[28] = 10'h06d;
    stim[29] = 10'h172;
    stim[30] = 10'h13a;
    stim[31] = 10'h2f1;
    stim[32] = 10'h15d;
    stim[33] = 10'h2f2;
    stim[34] = 10'h1e8;
    stim[35] = 10'h074;
    stim[36] = 10'h129;
    stim[37] = 10'h1d7;
    stim[38] = 10'h246;
    stim[39] = 10'h23b;
    stim[40] = 10'h2d0;
    stim[41] = 10'h305;
    stim[42] = 10'h144;
    stim[43] = 10'h350;
    stim[44] = 10'h02a;
    stim[45] = 10'h308;
    stim[46] = 10'h232;
    stim[47] = 10'h05e;
    stim[48] = 10'h3b9;
    stim[49] = 10'h3b4;
    stim[50] = 10'h2f2;
    stim[51] = 10'h02a;
    stim[52] = 10'h14e;
    stim[53] = 10'h123;
    stim[54] = 10'h2aa;
    stim[55] = 10'h05f;
    stim[56] = 10'h241;
    stim[57] = 10'h104;
    stim[58] = 10'h113;
    stim[59] = 10'h254;
    stim[60] = 10'h209;
    stim[61] = 10'h259;
    stim[62] = 10'h134;
    stim[63] = 10'h020;
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
      expv[0] = 17'h18c22;
      expv[1] = 17'h184a0;
      expv[2] = 17'h18784;
      expv[3] = 17'h17c00;
      expv[4] = 17'h18e46;
      expv[5] = 17'h17d38;
      expv[6] = 17'h18d08;
      expv[7] = 17'h18574;
      expv[8] = 17'h18f3e;
      expv[9] = 17'h18f3c;
      expv[10] = 17'h18d38;
      expv[11] = 17'h17fb8;
      expv[12] = 17'h177b0;
      expv[13] = 17'h18f58;
      expv[14] = 17'h18c52;
      expv[15] = 17'h17600;
      expv[16] = 17'h18630;
      expv[17] = 17'h18e26;
      expv[18] = 17'h18654;
      expv[19] = 17'h18f1a;
      expv[20] = 17'h18404;
      expv[21] = 17'h18684;
      expv[22] = 17'h18500;
      expv[23] = 17'h186a4;
      expv[24] = 17'h18714;
      expv[25] = 17'h18d1c;
      expv[26] = 17'h17d48;
      expv[27] = 17'h187c0;
      expv[28] = 17'h176d0;
      expv[29] = 17'h185c8;
      expv[30] = 17'h184e8;
      expv[31] = 17'h18de2;
      expv[32] = 17'h18574;
      expv[33] = 17'h18de4;
      expv[34] = 17'h187a0;
      expv[35] = 17'h17740;
      expv[36] = 17'h184a4;
      expv[37] = 17'h1875c;
      expv[38] = 17'h18c8c;
      expv[39] = 17'h18c76;
      expv[40] = 17'h18da0;
      expv[41] = 17'h18e0a;
      expv[42] = 17'h18510;
      expv[43] = 17'h18ea0;
      expv[44] = 17'h16d40;
      expv[45] = 17'h18e10;
      expv[46] = 17'h18c64;
      expv[47] = 17'h175e0;
      expv[48] = 17'h18f72;
      expv[49] = 17'h18f68;
      expv[50] = 17'h18de4;
      expv[51] = 17'h16d40;
      expv[52] = 17'h18538;
      expv[53] = 17'h1848c;
      expv[54] = 17'h18d54;
      expv[55] = 17'h175f0;
      expv[56] = 17'h18c82;
      expv[57] = 17'h18410;
      expv[58] = 17'h1844c;
      expv[59] = 17'h18ca8;
      expv[60] = 17'h18c12;
      expv[61] = 17'h18cb2;
      expv[62] = 17'h184d0;
      expv[63] = 17'h16c00;
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
