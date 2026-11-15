// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10457 dut (
    .clk(clk),
    .A_mul_src1(in_vec[64:33]),
    .A_mul_src2(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .A_mul_cell_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0f46c1abe2352592a;
    stim[1] = 65'h1db3edf76728221a6;
    stim[2] = 65'h0a8dbc3f09c3ffee1;
    stim[3] = 65'h18ec82fc2d1a6563d;
    stim[4] = 65'h0bcd3b4bc6717421f;
    stim[5] = 65'h047fba38bac48e92d;
    stim[6] = 65'h0d988eed321d014a9;
    stim[7] = 65'h0065c227c7ecf4fef;
    stim[8] = 65'h12b210df38d1a62dd;
    stim[9] = 65'h043db51b0507db323;
    stim[10] = 65'h16e17b40dd29a8c21;
    stim[11] = 65'h16a07461a45740e2b;
    stim[12] = 65'h1d8fe05bfa1a2651f;
    stim[13] = 65'h078d451cc906608ef;
    stim[14] = 65'h1670391c62d6ed415;
    stim[15] = 65'h1055094707415d657;
    stim[16] = 65'h0685c95eeeb98ff1f;
    stim[17] = 65'h12f8b258261801881;
    stim[18] = 65'h1fab7cfa4431703c7;
    stim[19] = 65'h0639f9a420ef0d6c5;
    stim[20] = 65'h19eac530240fa8ec3;
    stim[21] = 65'h0966ade60fdb20fc3;
    stim[22] = 65'h0f58150b2baf5d293;
    stim[23] = 65'h1eb7b47df6107bdd3;
    stim[24] = 65'h05ed1afc6497ab56d;
    stim[25] = 65'h16a3a52bd8f67fdaf;
    stim[26] = 65'h0da0aad8bd67b4673;
    stim[27] = 65'h1be0020e4415e98ef;
    stim[28] = 65'h06a537520e9464ccf;
    stim[29] = 65'h1b6903cdc371d6843;
    stim[30] = 65'h0a2b3d7990ac9c41f;
    stim[31] = 65'h09f25ae3900c1bd39;
    stim[32] = 65'h07a53e116cfc6be85;
    stim[33] = 65'h1b58c2ae7a09abe6b;
    stim[34] = 65'h1f5e0ca9f295288ab;
    stim[35] = 65'h1baeb238294cffec5;
    stim[36] = 65'h1fc227cb2e859491f;
    stim[37] = 65'h1bf1c08c93e65193b;
    stim[38] = 65'h16862b1c5c67c4e07;
    stim[39] = 65'h05bedf7b92e761809;
    stim[40] = 65'h0d18b8917634b952f;
    stim[41] = 65'h0ce70988c08eccd2b;
    stim[42] = 65'h0153d0547fe226a5d;
    stim[43] = 65'h031d28197354544f7;
    stim[44] = 65'h1006478b4edd99025;
    stim[45] = 65'h07d129892d9820985;
    stim[46] = 65'h0e849eb637b832071;
    stim[47] = 65'h1f15af5e3fca85ead;
    stim[48] = 65'h1e2be8143d64d6033;
    stim[49] = 65'h01915dcf4a715dff1;
    stim[50] = 65'h07685af73e998fb3d;
    stim[51] = 65'h1a1a10e562a730a99;
    stim[52] = 65'h14ea46b3b2e1c5fab;
    stim[53] = 65'h12e7a522596c6f3a1;
    stim[54] = 65'h19113bd23838e4297;
    stim[55] = 65'h17e019db7a7baa299;
    stim[56] = 65'h072580fd0a9bc232d;
    stim[57] = 65'h074fe5d30be57f2c1;
    stim[58] = 65'h0d1f5153ea4df8ddd;
    stim[59] = 65'h0011c815bbc445df5;
    stim[60] = 65'h10a89de982ee48b1f;
    stim[61] = 65'h0dc4797dea1b19895;
    stim[62] = 65'h184585696d1024b41;
    stim[63] = 65'h1e295e9a999633551;
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
      expv[0] = 32'h6bc21c4b;
      expv[1] = 32'hd164c721;
      expv[2] = 32'h6428e480;
      expv[3] = 32'h2dbd975e;
      expv[4] = 32'h1a88e982;
      expv[5] = 32'h19c62d6e;
      expv[6] = 32'h5d214874;
      expv[7] = 32'h1eb214d2;
      expv[8] = 32'hedefa7fe;
      expv[9] = 32'habbbba58;
      expv[10] = 32'hae5b4460;
      expv[11] = 32'hf2c1bb11;
      expv[12] = 32'he9822891;
      expv[13] = 32'hbdfc9aea;
      expv[14] = 32'hc03fd6de;
      expv[15] = 32'h6e65df68;
      expv[16] = 32'h1d0c68f9;
      expv[17] = 32'h3445bc40;
      expv[18] = 32'hf84f6136;
      expv[19] = 32'hec4951a2;
      expv[20] = 32'h752880e1;
      expv[21] = 32'h90010930;
      expv[22] = 32'h5a290261;
      expv[23] = 32'h1dc37687;
      expv[24] = 32'h906f4962;
      expv[25] = 32'h0a8901f2;
      expv[26] = 32'hac6fc0dd;
      expv[27] = 32'hade97cfe;
      expv[28] = 32'h957b6ff0;
      expv[29] = 32'hf9b1442e;
      expv[30] = 32'h266ee8f4;
      expv[31] = 32'hd4055d10;
      expv[32] = 32'h551398d6;
      expv[33] = 32'hccf81dcf;
      expv[34] = 32'h2cba9f3b;
      expv[35] = 32'he3310ae2;
      expv[36] = 32'hf792d7b7;
      expv[37] = 32'hc47f6154;
      expv[38] = 32'ha11e78a6;
      expv[39] = 32'h4baa3f70;
      expv[40] = 32'hd9bc9bfd;
      expv[41] = 32'h822848be;
      expv[42] = 32'hb987384a;
      expv[43] = 32'h93129789;
      expv[44] = 32'h42ae8e54;
      expv[45] = 32'h893cf352;
      expv[46] = 32'h32494eb8;
      expv[47] = 32'h63d98bf6;
      expv[48] = 32'h0ebbffb9;
      expv[49] = 32'hdb3aec30;
      expv[50] = 32'h3696792e;
      expv[51] = 32'h542177c4;
      expv[52] = 32'h4f3e6ea1;
      expv[53] = 32'hca1ae0a0;
      expv[54] = 32'h8614e57b;
      expv[55] = 32'hf5b0b404;
      expv[56] = 32'h6c5309f0;
      expv[57] = 32'ha4035100;
      expv[58] = 32'h6023d9d2;
      expv[59] = 32'h1a8a3ef2;
      expv[60] = 32'h06012774;
      expv[61] = 32'h5cdb6716;
      expv[62] = 32'hbddce5e0;
      expv[63] = 32'h70783320;
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
