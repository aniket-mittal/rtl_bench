// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 94;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153830 dut (
    .clk(clk),
    .rst(in_vec[93:93]),
    .pu_en(in_vec[92:92]),
    .pu_data(in_vec[91:52]),
    .po_en(in_vec[51:51]),
    .sr_en(in_vec[50:50]),
    .sr_key(in_vec[49:42]),
    .wr_en(in_vec[41:41]),
    .wr_data(in_vec[40:1]),
    .wr_invalidate(in_vec[0:0]),
    .ready(out_vec[69:69]),
    .full(out_vec[68:68]),
    .empty(out_vec[67:67]),
    .po_data(out_vec[66:35]),
    .po_vld(out_vec[34:34]),
    .sr_data(out_vec[33:2]),
    .sr_vld(out_vec[1:1]),
    .sr_mhe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 94'h3584676ff73a946a7346beba;
    stim[1] = 94'h31e216a55e4a00e479b06f23;
    stim[2] = 94'h1fcd9573a1d7a215970dc05f;
    stim[3] = 94'h0d8b9387b0370f79076a949d;
    stim[4] = 94'h1222a3a24cac3f750d494310;
    stim[5] = 94'h1b6fcbdb2916aa27b593d7a4;
    stim[6] = 94'h022440b3be78dd5bf966b2b9;
    stim[7] = 94'h1e2c60fc3326480b7b26cf68;
    stim[8] = 94'h0f5d220644635f23dc284576;
    stim[9] = 94'h042aadcaf0ddb245ede3b316;
    stim[10] = 94'h1bfe72c7a9979f6ed46bcd5a;
    stim[11] = 94'h0af9dc04f04dcf3f447dfb7c;
    stim[12] = 94'h0deabce62f99d42856441a83;
    stim[13] = 94'h0f7e814f352d2555241066b5;
    stim[14] = 94'h0bc3b2df33a6df2ab1e97d4e;
    stim[15] = 94'h09ddfe80d9bffe195d9a3aeb;
    stim[16] = 94'h1c8e550cc0cf27531a707b4e;
    stim[17] = 94'h18589ce1fd875332f541fef1;
    stim[18] = 94'h0d09250b7da248c4ae8814ce;
    stim[19] = 94'h1512d4ce492cdfa57f4e3a40;
    stim[20] = 94'h10344993ff1daff7375ad9df;
    stim[21] = 94'h1f7fe1efded6ec1382f637e1;
    stim[22] = 94'h0a46b5764939b868f423b929;
    stim[23] = 94'h0b3d9ec859eb87eb4ebfd69e;
    stim[24] = 94'h1fcb56a7898962bfe8898700;
    stim[25] = 94'h0b91c1e84fbe8763facdad09;
    stim[26] = 94'h16193d27982c0ed37cab77e2;
    stim[27] = 94'h15e775551edd1c319b2d466d;
    stim[28] = 94'h1d193a2387d408e706be50b6;
    stim[29] = 94'h0f9533e337890c27368625fb;
    stim[30] = 94'h11d5d4181f1251e3efbe8599;
    stim[31] = 94'h1b35d3de60e3fd98e12911f5;
    stim[32] = 94'h1e4a024f8ac1bb39406eb7bd;
    stim[33] = 94'h0a8cbb583408c9dc04ffcd1b;
    stim[34] = 94'h197db5e96872cd1d3051ea49;
    stim[35] = 94'h16a6b170c4e1e9ec6c8ab70d;
    stim[36] = 94'h1de370c79f9001fe91d55559;
    stim[37] = 94'h0d6822495de91145cfd917ab;
    stim[38] = 94'h1a5b5f99015f9ebdc68ebce9;
    stim[39] = 94'h0b1a84657066b27a698995a9;
    stim[40] = 94'h10a390e64f1b354797f67c96;
    stim[41] = 94'h384a58742dcd19b3b532e72b;
    stim[42] = 94'h0f8d9850e6459e5cf9531387;
    stim[43] = 94'h1175992aadfcbd1c9afcc23d;
    stim[44] = 94'h01a486e8aededdc2e47049cd;
    stim[45] = 94'h0703e26f6468c42fedc980b8;
    stim[46] = 94'h11de73d2b563d6690ff475d8;
    stim[47] = 94'h13a46279d8f3e128c591ed48;
    stim[48] = 94'h193ed96c5117b3b59765b95c;
    stim[49] = 94'h0e02d711237558bcb0dbf4b4;
    stim[50] = 94'h2a9491a74d9f658b31270415;
    stim[51] = 94'h12c9dccc24aac3890f85294d;
    stim[52] = 94'h13794eb85c86306cfbaaec83;
    stim[53] = 94'h19410b72ce17f5e2df19aff8;
    stim[54] = 94'h017dc0cf4e22b9440102d4c3;
    stim[55] = 94'h141995cb1d7978cc046cb117;
    stim[56] = 94'h0689f1bfa6faa246a7ac113d;
    stim[57] = 94'h1ef74f53041c567b9edcd413;
    stim[58] = 94'h024fdee14908a92fa38d1799;
    stim[59] = 94'h0f353d5e3eb881780c07b584;
    stim[60] = 94'h0d9c8b750d79e984790b27dd;
    stim[61] = 94'h173cbd2f8ab45beb3d8440a1;
    stim[62] = 94'h1534c785a1528f74fd2ad4e3;
    stim[63] = 94'h30c3c08d028bccf76d18b8c2;
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
      expv[0] = 70'h2xxxxxxxxx00000000;
      expv[1] = 70'h2xxxxxxxxx00000000;
      expv[2] = 70'h2xxxxxxxxx00000000;
      expv[3] = 70'h26cab9d0ec00000000;
      expv[4] = 70'h26cab9d0ec00000000;
      expv[5] = 70'h2951d1265000000000;
      expv[6] = 70'h2151d1265400000000;
      expv[7] = 70'h2fe5ed948800000000;
      expv[8] = 70'h27e5ed948c00000000;
      expv[9] = 70'h27e5ed948c00000000;
      expv[10] = 70'h2e307e199000000000;
      expv[11] = 70'h26307e199400000000;
      expv[12] = 70'h2f3963d4c800000000;
      expv[13] = 70'h2f3963d4c800000000;
      expv[14] = 70'h2f3963d4c800000000;
      expv[15] = 70'h2f3963d4c800000000;
      expv[16] = 70'h2f3963d4c800000000;
      expv[17] = 70'h273963d4cc00000000;
      expv[18] = 70'h273963d4cc00000000;
      expv[19] = 70'h273963d4cc00000000;
      expv[20] = 70'h272a86606400000000;
      expv[21] = 70'h2c4e70fec000000000;
      expv[22] = 70'h244e70fec400000000;
      expv[23] = 70'h296a67249000000000;
      expv[24] = 70'h296a67249000000000;
      expv[25] = 70'h216a67249400000000;
      expv[26] = 70'h2a24c9ff8800000000;
      expv[27] = 70'h25f2addf8c00000000;
      expv[28] = 70'h2ff0f7ef6800000000;
      expv[29] = 70'h27f0f7ef6c00000000;
      expv[30] = 70'h2dab53c4c000000000;
      expv[31] = 70'h25ab53c4c400000000;
      expv[32] = 70'h25ab53c4c400000000;
      expv[33] = 70'h25ab53c4c400000000;
      expv[34] = 70'h249e93cc1400000000;
      expv[35] = 70'h249e93cc1400000000;
      expv[36] = 70'h249e93cc1400000000;
      expv[37] = 70'h249e93cc1400000000;
      expv[38] = 70'h23baaa8f6c00000000;
      expv[39] = 70'h249d11c3ec00000000;
      expv[40] = 70'h249d11c3ef928093e2;
      expv[41] = 70'h2d0127c56000000000;
      expv[42] = 70'h2d0127c56000000000;
      expv[43] = 70'h2d0127c56000000000;
      expv[44] = 70'h22cc9556fc00000000;
      expv[45] = 70'h2edaf4b43800000000;
      expv[46] = 70'h2edaf4b43800000000;
      expv[47] = 70'h2739e95ab400000000;
      expv[48] = 70'h2739e95ab400000000;
      expv[49] = 70'h2739e95ab400000000;
      expv[50] = 70'h2acc9556f800000000;
      expv[51] = 70'h2acc9556f800000000;
      expv[52] = 70'h24ee66125400000000;
      expv[53] = 70'h24ee66125400000000;
      expv[54] = 70'h24ee66125400000000;
      expv[55] = 70'h24ee66125400000000;
      expv[56] = 70'h24a75c2e4400000000;
      expv[57] = 70'h2085b9670c00000000;
      expv[58] = 70'h2ccae58eba96d7e642;
      expv[59] = 70'h2ccae58eba96d7e642;
      expv[60] = 70'h2ccae58eba96d7e642;
      expv[61] = 70'h2ccae58eba96d7e642;
      expv[62] = 70'h24cae58ebc00000000;
      expv[63] = 70'h2cee66125000000000;
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
