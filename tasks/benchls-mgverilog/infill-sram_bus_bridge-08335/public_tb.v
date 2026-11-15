// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08335 dut (
    .clk_i(clk),
    .reset_i(in_vec[56:56]),
    .cyc_i(in_vec[55:55]),
    .stb_i(in_vec[54:54]),
    .we_i(in_vec[53:53]),
    .sel_i(in_vec[52:51]),
    .adr_i(in_vec[50:32]),
    .dat_i(in_vec[31:16]),
    .sram_d_in(in_vec[15:0]),
    .ack_o(out_vec[57:57]),
    .dat_o(out_vec[56:41]),
    .stall_o(out_vec[40:40]),
    ._sram_ce(out_vec[39:39]),
    ._sram_we(out_vec[38:38]),
    ._sram_oe(out_vec[37:37]),
    ._sram_ub(out_vec[36:36]),
    ._sram_lb(out_vec[35:35]),
    .sram_a(out_vec[34:16]),
    .sram_d_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h112ddd6f975d86c;
    stim[1] = 57'h1cf4d880c2668f3;
    stim[2] = 57'h091d3cc105d2249;
    stim[3] = 57'h0bc27843d90c17e;
    stim[4] = 57'h0245545181df653;
    stim[5] = 57'h0aab181f9d7694c;
    stim[6] = 57'h0e0bb8e7debd1b5;
    stim[7] = 57'h02c9b4b54931eb7;
    stim[8] = 57'h009d04e2b48b9b9;
    stim[9] = 57'h0cb4a910c47ee15;
    stim[10] = 57'h0ec2922ffafe2e8;
    stim[11] = 57'h055e0abeaeeef30;
    stim[12] = 57'h0a01d6691e3dea1;
    stim[13] = 57'h0a2ce275cb01aa8;
    stim[14] = 57'h0d75923630695a1;
    stim[15] = 57'h037d7c978fe0e22;
    stim[16] = 57'h018afda6931e345;
    stim[17] = 57'h0aef057c633339f;
    stim[18] = 57'h0d2dfff8e8d85ae;
    stim[19] = 57'h0c8c3acb6cc99f1;
    stim[20] = 57'h014c5d19af9bc3e;
    stim[21] = 57'h03d912ee4843d1e;
    stim[22] = 57'h068a12759160af8;
    stim[23] = 57'h1fadd5b6d2dc864;
    stim[24] = 57'h0f7a8a56e5a4090;
    stim[25] = 57'h038d2fa25dc1090;
    stim[26] = 57'h01882d402c6e1ae;
    stim[27] = 57'h0175a1f9a844361;
    stim[28] = 57'h03ed7abf2591cc7;
    stim[29] = 57'h07d26bed1f4078e;
    stim[30] = 57'h01aad0558f4562b;
    stim[31] = 57'h0bd6f00545164ff;
    stim[32] = 57'h0c8c9a250155e8a;
    stim[33] = 57'h0af5e84c32a2ff5;
    stim[34] = 57'h04afcf484c577e0;
    stim[35] = 57'h0ab1991c69bd830;
    stim[36] = 57'h0f44ef932746de0;
    stim[37] = 57'h0bd241a38f0aa4d;
    stim[38] = 57'h05771527715c72d;
    stim[39] = 57'h0368c8c1075f0ab;
    stim[40] = 57'h06908bf8c0acf53;
    stim[41] = 57'h07d9dda35e1a15b;
    stim[42] = 57'h0a0385195ebee37;
    stim[43] = 57'h0906a44fe9fab40;
    stim[44] = 57'h0c7a7557ec2c96e;
    stim[45] = 57'h05996ff25829b9a;
    stim[46] = 57'h0bc6805ad49a346;
    stim[47] = 57'h0b2f5484c08f8d1;
    stim[48] = 57'h157281bee67c60e;
    stim[49] = 57'h0458ff64defc58e;
    stim[50] = 57'h05b635107cc71d1;
    stim[51] = 57'h06fbd655ee73f17;
    stim[52] = 57'h0adee5cbab06a09;
    stim[53] = 57'h04e8fcb8877856c;
    stim[54] = 57'h012dd23ed5843a6;
    stim[55] = 57'h0c30ff252683c8e;
    stim[56] = 57'h05f84c3bb909d99;
    stim[57] = 57'h0821094abca41e7;
    stim[58] = 57'h066c60e4ffbe1ac;
    stim[59] = 57'h048fa68ca49214a;
    stim[60] = 57'h05444abc864eeb4;
    stim[61] = 57'h0c3dfd7676f5db4;
    stim[62] = 57'h0dc29207269eeb5;
    stim[63] = 57'h0f4acc75fe9690f;
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
      expv[0] = 58'hxx0xxxxxxxxxxxx;
      expv[1] = 58'h000006addd6f975;
      expv[2] = 58'h24492574d880c26;
      expv[3] = 58'h0000069d3cc105d;
      expv[4] = 58'h000006427843d90;
      expv[5] = 58'h000007c5545181d;
      expv[6] = 58'h0000072b181f9d7;
      expv[7] = 58'h2000038bb8e7deb;
      expv[8] = 58'h00000749b4b5493;
      expv[9] = 58'h0000071d04e2b48;
      expv[10] = 58'h3c5d0534a910c47;
      expv[11] = 58'h20000342922ffaf;
      expv[12] = 58'h000006de0abeaee;
      expv[13] = 58'h00000781d6691e3;
      expv[14] = 58'h000007ace275cb0;
      expv[15] = 58'h21c444f59236306;
      expv[16] = 58'h000006fd7c978fe;
      expv[17] = 58'h0000060afda6931;
      expv[18] = 58'h0000076f057c633;
      expv[19] = 58'h333e24adfff8e8d;
      expv[20] = 58'h3787c50c3acb6cc;
      expv[21] = 58'h000006cc5d19af9;
      expv[22] = 58'h0000065912ee484;
      expv[23] = 58'h0000070a1275916;
      expv[24] = 58'h2000022dd5b6d2d;
      expv[25] = 58'h200002fa8a56e5a;
      expv[26] = 58'h0000060d2fa25dc;
      expv[27] = 58'h000006082d402c6;
      expv[28] = 58'h000006f5a1f9a84;
      expv[29] = 58'h0000066d7abf259;
      expv[30] = 58'h000006526bed1f4;
      expv[31] = 58'h0000062ad0558f4;
      expv[32] = 58'h00000656f005451;
      expv[33] = 58'h25fea50c9a25015;
      expv[34] = 58'h00000775e84c32a;
      expv[35] = 58'h0000072fcf484c5;
      expv[36] = 58'h00000731991c69b;
      expv[37] = 58'h200002c4ef93274;
      expv[38] = 58'h0000065241a38f0;
      expv[39] = 58'h000006f71527715;
      expv[40] = 58'h000006e8c8c1075;
      expv[41] = 58'h000007108bf8c0a;
      expv[42] = 58'h00000659dda35e1;
      expv[43] = 58'h0000078385195eb;
      expv[44] = 58'h00000686a44fe9f;
      expv[45] = 58'h337345fa7557ec2;
      expv[46] = 58'h000006196ff2582;
      expv[47] = 58'h00000646805ad49;
      expv[48] = 58'h000006af5484c08;
      expv[49] = 58'h000006f281bee67;
      expv[50] = 58'h000007d8ff64def;
      expv[51] = 58'h0000063635107cc;
      expv[52] = 58'h0000077bd655ee7;
      expv[53] = 58'h0000075ee5cbab0;
      expv[54] = 58'h00000768fcb8877;
      expv[55] = 58'h000006add23ed58;
      expv[56] = 58'h33b325b0ff25268;
      expv[57] = 58'h000006784c3bb90;
      expv[58] = 58'h000007a1094abca;
      expv[59] = 58'h000007ec60e4ffb;
      expv[60] = 58'h0000070fa68ca49;
      expv[61] = 58'h000006c44abc864;
      expv[62] = 58'h3dd6a5bdfd7676f;
      expv[63] = 58'h2d21e4429207269;
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
