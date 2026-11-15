// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_071329 dut (
    .clk(clk),
    .reset(in_vec[74:74]),
    .pa_idexmemwr(in_vec[73:73]),
    .ex_regwr(in_vec[72:72]),
    .ex_memtoreg(in_vec[71:71]),
    .ex_memwr(in_vec[70:70]),
    .ex_dmen(in_vec[69:69]),
    .ex_result(in_vec[68:37]),
    .ex_b(in_vec[36:5]),
    .ex_regdst_addr(in_vec[4:0]),
    .mem_regwr(out_vec[72:72]),
    .mem_dmen(out_vec[71:71]),
    .mem_memtoreg(out_vec[70:70]),
    .mem_memwr(out_vec[69:69]),
    .mem_result(out_vec[68:37]),
    .mem_rt(out_vec[36:5]),
    .mem_regdst_addr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h52e14940b1edb838116;
    stim[1] = 75'h5c8653c3814836b864d;
    stim[2] = 75'h0b28b5fbc53dd9a7a82;
    stim[3] = 75'h2587161fbd1301e647b;
    stim[4] = 75'h3f2f97f42629fa45a9e;
    stim[5] = 75'h18129d37f522bb1c1db;
    stim[6] = 75'h58c0dce92cfadb45e98;
    stim[7] = 75'h39f6f96384e8a5e97ea;
    stim[8] = 75'h3876caee70d968515c9;
    stim[9] = 75'h31bef1e6223e25633ac;
    stim[10] = 75'h103f0885c53e875eb1f;
    stim[11] = 75'h29e71ed51abc8f7c01f;
    stim[12] = 75'h16a519e991aafe9ed62;
    stim[13] = 75'h302422cf18720ed376b;
    stim[14] = 75'h3290e0f4e13a944bcda;
    stim[15] = 75'h2d4b5aa796b4dc05006;
    stim[16] = 75'h005d878b388889684ba;
    stim[17] = 75'h3d65c2adfc4c8d85d7c;
    stim[18] = 75'h161d0ac9f08ee8d3f69;
    stim[19] = 75'h05db91dcb1d61545122;
    stim[20] = 75'h30cac44c28b54327ecf;
    stim[21] = 75'h30ce95b1bf7c6681f40;
    stim[22] = 75'h12fa111506f8990f930;
    stim[23] = 75'h2880d4ec5445da3c5b3;
    stim[24] = 75'h4623840b50ad324dc01;
    stim[25] = 75'h119917c22b9de7ed813;
    stim[26] = 75'h325e190a2ab164ae495;
    stim[27] = 75'h26084d231dbad8098fe;
    stim[28] = 75'h3e63f922c749e1822f5;
    stim[29] = 75'h168b88b7e7af2c3b606;
    stim[30] = 75'h1eaa973e2877e657285;
    stim[31] = 75'h23b7065e99185860855;
    stim[32] = 75'h138f6fa136e41f6807a;
    stim[33] = 75'h29a075d9ed4a3d556e6;
    stim[34] = 75'h3f22a66345ca711553e;
    stim[35] = 75'h0f9d2beae54a7751031;
    stim[36] = 75'h34d2859821d3d080288;
    stim[37] = 75'h3b6324c388fc2c1909f;
    stim[38] = 75'h06b322e39b260fffe8b;
    stim[39] = 75'h368c370075e6d3c3b45;
    stim[40] = 75'h25aad067be98dfc1330;
    stim[41] = 75'h2d3da3c65d03405328a;
    stim[42] = 75'h341cdeda9b779334896;
    stim[43] = 75'h25793a1c4b5ec0d4373;
    stim[44] = 75'h25d3152b2726aee7213;
    stim[45] = 75'h19408e3139df17e0a4e;
    stim[46] = 75'h07e9ffaf41195fa54a2;
    stim[47] = 75'h318880ad266bd9beffc;
    stim[48] = 75'h06ed3aa4c0802673041;
    stim[49] = 75'h358e681304f72dcf4be;
    stim[50] = 75'h38a04e5932697c50d28;
    stim[51] = 75'h3ed737c6c2246bc911a;
    stim[52] = 75'h1191c30216559c3b7c8;
    stim[53] = 75'h0919fd837263970ec5b;
    stim[54] = 75'h345a36f9cc22ebafb1e;
    stim[55] = 75'h21fa67295ddd8ede749;
    stim[56] = 75'h368ffbb96856eb73720;
    stim[57] = 75'h365562ed14ad4a13c14;
    stim[58] = 75'h0ac718b785e3fdaa6d7;
    stim[59] = 75'h110350853d6a9d363a9;
    stim[60] = 75'h06c6d65ea1abf2958c5;
    stim[61] = 75'h3565df8a95cb0d39bf3;
    stim[62] = 75'h5e990d754cd8693760e;
    stim[63] = 75'h1b3e4b3f2ac8cf88389;
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
      expv[0] = 73'h0000000000000000000;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h0d28b5fbc53dd9a7a82;
      expv[4] = 73'h0d28b5fbc53dd9a7a82;
      expv[5] = 73'h0d28b5fbc53dd9a7a82;
      expv[6] = 73'h0000000000000000000;
      expv[7] = 73'h0000000000000000000;
      expv[8] = 73'h0000000000000000000;
      expv[9] = 73'h0000000000000000000;
      expv[10] = 73'h0000000000000000000;
      expv[11] = 73'h103f0885c53e875eb1f;
      expv[12] = 73'h103f0885c53e875eb1f;
      expv[13] = 73'h1aa519e991aafe9ed62;
      expv[14] = 73'h1aa519e991aafe9ed62;
      expv[15] = 73'h1aa519e991aafe9ed62;
      expv[16] = 73'h1aa519e991aafe9ed62;
      expv[17] = 73'h005d878b388889684ba;
      expv[18] = 73'h005d878b388889684ba;
      expv[19] = 73'h1a1d0ac9f08ee8d3f69;
      expv[20] = 73'h03db91dcb1d61545122;
      expv[21] = 73'h03db91dcb1d61545122;
      expv[22] = 73'h03db91dcb1d61545122;
      expv[23] = 73'h18fa111506f8990f930;
      expv[24] = 73'h0000000000000000000;
      expv[25] = 73'h0000000000000000000;
      expv[26] = 73'h119917c22b9de7ed813;
      expv[27] = 73'h119917c22b9de7ed813;
      expv[28] = 73'h119917c22b9de7ed813;
      expv[29] = 73'h119917c22b9de7ed813;
      expv[30] = 73'h1a8b88b7e7af2c3b606;
      expv[31] = 73'h1eaa973e2877e657285;
      expv[32] = 73'h1eaa973e2877e657285;
      expv[33] = 73'h198f6fa136e41f6807a;
      expv[34] = 73'h198f6fa136e41f6807a;
      expv[35] = 73'h198f6fa136e41f6807a;
      expv[36] = 73'h0f9d2beae54a7751031;
      expv[37] = 73'h0f9d2beae54a7751031;
      expv[38] = 73'h0f9d2beae54a7751031;
      expv[39] = 73'h0ab322e39b260fffe8b;
      expv[40] = 73'h0ab322e39b260fffe8b;
      expv[41] = 73'h0ab322e39b260fffe8b;
      expv[42] = 73'h0ab322e39b260fffe8b;
      expv[43] = 73'h0ab322e39b260fffe8b;
      expv[44] = 73'h0ab322e39b260fffe8b;
      expv[45] = 73'h0ab322e39b260fffe8b;
      expv[46] = 73'h15408e3139df17e0a4e;
      expv[47] = 73'h0be9ffaf41195fa54a2;
      expv[48] = 73'h0be9ffaf41195fa54a2;
      expv[49] = 73'h0aed3aa4c0802673041;
      expv[50] = 73'h0aed3aa4c0802673041;
      expv[51] = 73'h0aed3aa4c0802673041;
      expv[52] = 73'h0aed3aa4c0802673041;
      expv[53] = 73'h1191c30216559c3b7c8;
      expv[54] = 73'h0519fd837263970ec5b;
      expv[55] = 73'h0519fd837263970ec5b;
      expv[56] = 73'h0519fd837263970ec5b;
      expv[57] = 73'h0519fd837263970ec5b;
      expv[58] = 73'h0519fd837263970ec5b;
      expv[59] = 73'h0cc718b785e3fdaa6d7;
      expv[60] = 73'h110350853d6a9d363a9;
      expv[61] = 73'h0ac6d65ea1abf2958c5;
      expv[62] = 73'h0000000000000000000;
      expv[63] = 73'h0000000000000000000;
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
