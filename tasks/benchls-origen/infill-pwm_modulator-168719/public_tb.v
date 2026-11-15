// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168719 dut (
    .i_clk(clk),
    .i_rst_n(in_vec[48:48]),
    .i_freq_cnt(in_vec[47:16]),
    .i_amp_H(in_vec[15:8]),
    .i_amp_L(in_vec[7:0]),
    .o_mod_out(out_vec[8:1]),
    .o_status(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0891b970bbb8e;
    stim[1] = 49'h0b573fec1f688;
    stim[2] = 49'h139d118385c68;
    stim[3] = 49'h16c55aa591dcd;
    stim[4] = 49'h1823b159a8820;
    stim[5] = 49'h18dfa7e4fb7e7;
    stim[6] = 49'h17c857737acfd;
    stim[7] = 49'h13bcca97a4053;
    stim[8] = 49'h11298a92444a0;
    stim[9] = 49'h1d9ebca8f05f8;
    stim[10] = 49'h099ae433a6419;
    stim[11] = 49'h1f46de6cbdb73;
    stim[12] = 49'h154b66ea4fb02;
    stim[13] = 49'h127a802fcb172;
    stim[14] = 49'h1b8ad12e9d34a;
    stim[15] = 49'h1fb9f9132b8d0;
    stim[16] = 49'h18fd3f2de6e74;
    stim[17] = 49'h1e070489667fd;
    stim[18] = 49'h1b4b2b8ed0a3c;
    stim[19] = 49'h1845fa055cb13;
    stim[20] = 49'h16b3e0016421b;
    stim[21] = 49'h127ed979ac7fe;
    stim[22] = 49'h1beaae8b5828e;
    stim[23] = 49'h121deb6a499b6;
    stim[24] = 49'h1118d5bc540cd;
    stim[25] = 49'h131589fef6d8e;
    stim[26] = 49'h1e0cf88e11332;
    stim[27] = 49'h1093910e8bcbd;
    stim[28] = 49'h140ee415906cc;
    stim[29] = 49'h120f0bc308f8a;
    stim[30] = 49'h1bfdccb4db12e;
    stim[31] = 49'h14ced966eb75b;
    stim[32] = 49'h173829969b8fb;
    stim[33] = 49'h1a23e2b090561;
    stim[34] = 49'h13c674eda8f69;
    stim[35] = 49'h1c905697290b3;
    stim[36] = 49'h1e929b1f7cbb0;
    stim[37] = 49'h158454ddec7b3;
    stim[38] = 49'h1cd88768cf215;
    stim[39] = 49'h12cedf5efa91c;
    stim[40] = 49'h1d9db3e52c857;
    stim[41] = 49'h13602c94d7303;
    stim[42] = 49'h19de0519db392;
    stim[43] = 49'h18761ff53f3e4;
    stim[44] = 49'h11d0bb141f708;
    stim[45] = 49'h1ca091872eb7f;
    stim[46] = 49'h1ec4b168d17ab;
    stim[47] = 49'h1f02a53627e21;
    stim[48] = 49'h1c060b39e96f2;
    stim[49] = 49'h1fea398da8af5;
    stim[50] = 49'h1a721ca7e0447;
    stim[51] = 49'h1d9f411837835;
    stim[52] = 49'h16c5d15154f77;
    stim[53] = 49'h1e86224ccf797;
    stim[54] = 49'h1e270575215b9;
    stim[55] = 49'h116816b8b4e08;
    stim[56] = 49'h12d0a0b758985;
    stim[57] = 49'h1a3215ed066a0;
    stim[58] = 49'h11934e441ffd7;
    stim[59] = 49'h1337e7662b158;
    stim[60] = 49'h16f97b3d84f59;
    stim[61] = 49'h193a9fefc9d55;
    stim[62] = 49'h1b06419e69e52;
    stim[63] = 49'h1aca3bcf46c9e;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h0d0;
      expv[4] = 9'h19a;
      expv[5] = 9'h040;
      expv[6] = 9'h1ce;
      expv[7] = 9'h1fa;
      expv[8] = 9'h0a6;
      expv[9] = 9'h140;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h0e6;
      expv[13] = 9'h004;
      expv[14] = 9'h0e4;
      expv[15] = 9'h094;
      expv[16] = 9'h1a0;
      expv[17] = 9'h0e8;
      expv[18] = 9'h1fa;
      expv[19] = 9'h078;
      expv[20] = 9'h026;
      expv[21] = 9'h036;
      expv[22] = 9'h1fc;
      expv[23] = 9'h11c;
      expv[24] = 9'h16c;
      expv[25] = 9'h19a;
      expv[26] = 9'h11c;
      expv[27] = 9'h064;
      expv[28] = 9'h17a;
      expv[29] = 9'h198;
      expv[30] = 9'h114;
      expv[31] = 9'h05c;
      expv[32] = 9'h0b6;
      expv[33] = 9'h1f6;
      expv[34] = 9'h0c2;
      expv[35] = 9'h0d2;
      expv[36] = 9'h166;
      expv[37] = 9'h160;
      expv[38] = 9'h166;
      expv[39] = 9'h02a;
      expv[40] = 9'h038;
      expv[41] = 9'h0ae;
      expv[42] = 9'h006;
      expv[43] = 9'h124;
      expv[44] = 9'h1c8;
      expv[45] = 9'h010;
      expv[46] = 9'h0fe;
      expv[47] = 9'h156;
      expv[48] = 9'h042;
      expv[49] = 9'h1e4;
      expv[50] = 9'h1ea;
      expv[51] = 9'h08e;
      expv[52] = 9'h06a;
      expv[53] = 9'h0ee;
      expv[54] = 9'h12e;
      expv[55] = 9'h172;
      expv[56] = 9'h010;
      expv[57] = 9'h10a;
      expv[58] = 9'h140;
      expv[59] = 9'h1ae;
      expv[60] = 9'h0b0;
      expv[61] = 9'h0b2;
      expv[62] = 9'h0aa;
      expv[63] = 9'h0a4;
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
