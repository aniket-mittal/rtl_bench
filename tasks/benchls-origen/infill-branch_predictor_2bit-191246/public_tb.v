// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_191246 dut (
    .clk(clk),
    .rst(in_vec[97:97]),
    .BranchTaken_i(in_vec[96:96]),
    .WriteAddr_i(in_vec[95:64]),
    .WriteTarget_i(in_vec[63:32]),
    .ReadAddr_i(in_vec[31:0]),
    .ReadTarget_o(out_vec[32:1]),
    .Hit_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h3d12498a13a2b44bc74146390;
    stim[1] = 98'h3db1c9973dc7381d58b38c176;
    stim[2] = 98'h02617ddc877e64b8127ad187a;
    stim[3] = 98'h11eb282249f3548ef7f4e209d;
    stim[4] = 98'h1af7a491f66fb0c94f399bea6;
    stim[5] = 98'h0e54c6aa8a6df8307135fb7f2;
    stim[6] = 98'h07fbb3c5b0d4d96a703c05f64;
    stim[7] = 98'h1e0a05153ebbeebad90474e28;
    stim[8] = 98'h02ae50b7e92dfb1e33f4c7964;
    stim[9] = 98'h1e1203a3a30ce67122e671585;
    stim[10] = 98'h055b233bd6b1cb2f7149948cf;
    stim[11] = 98'h15029b8ed9cd102511678d408;
    stim[12] = 98'h1a3f35861b16f8e0994229452;
    stim[13] = 98'h1a1f6567cdda7bb1f4b2192f5;
    stim[14] = 98'h0a2136b7e9ea4b066db8cfa55;
    stim[15] = 98'h1b9c1835ead8c99662ddaadbc;
    stim[16] = 98'h0d5ffd87be04807d204c831b4;
    stim[17] = 98'h0c7eb52f6a588d43fe0a83efc;
    stim[18] = 98'h19996fd3d4898b4bdb4132825;
    stim[19] = 98'h134e1ff044a96513073e96c68;
    stim[20] = 98'h0e530137638fac1335edb5b87;
    stim[21] = 98'h130a793814bb74128322fb1b9;
    stim[22] = 98'h0e3214b9b357031f9120a8b81;
    stim[23] = 98'h188d6fefd0d10dba5a832fb65;
    stim[24] = 98'h137f3c42a7234ec068b6941c8;
    stim[25] = 98'h0b425f005aa54438dd45f7dff;
    stim[26] = 98'h1b0a1a5f239e2f99d3d76d539;
    stim[27] = 98'h17bfdc00eec83e7ce44920188;
    stim[28] = 98'h021420b2c88e4aff2a3a210f5;
    stim[29] = 98'h15bf54c08c74e8f9023c598bb;
    stim[30] = 98'h1bcd1a6ba88a8990204e658f6;
    stim[31] = 98'h1af812b49b45fd0d98b61efe6;
    stim[32] = 98'h0ea20bedb4a62c5e87d4aa806;
    stim[33] = 98'h117811254186a1619465516c3;
    stim[34] = 98'h230774f4c26c8a10692999e17;
    stim[35] = 98'h0f4681337939fd2b969636273;
    stim[36] = 98'h00657b97e18956751756abd62;
    stim[37] = 98'h143c8afad576695d38533aaca;
    stim[38] = 98'h17af1a7d9ab7fbde4b44fc198;
    stim[39] = 98'h04406afcc63acfc0f4e35d9c3;
    stim[40] = 98'h19399614b427d789713811eec;
    stim[41] = 98'h24fa347459d23edd31f7f4fbb;
    stim[42] = 98'h19cc59c56944ee16a748d7818;
    stim[43] = 98'h0b12b7e3647b26ef64652395a;
    stim[44] = 98'h10555e76e9f6ffa617178da2f;
    stim[45] = 98'h1f7a560046975a10ecf9c36c5;
    stim[46] = 98'h07645448896f6b7d916a72b87;
    stim[47] = 98'h19a3ab97e0aed61b6c3e5d8ec;
    stim[48] = 98'h05f77b3bf1413e7191bba8c29;
    stim[49] = 98'h0a462dd3c184f067ec3cb8c3f;
    stim[50] = 98'h178540d985466149f16c0a7bc;
    stim[51] = 98'h11ac087c60381999c4e4adb19;
    stim[52] = 98'h0bb0f04963bfa433b6e227af0;
    stim[53] = 98'h0ade1bbf0aa56d99f87ab0ef0;
    stim[54] = 98'h1617ce6e6b63ab0a7644c92fa;
    stim[55] = 98'h0c58d07b5879859c59fba4713;
    stim[56] = 98'h17ce1eed78d485e371e075204;
    stim[57] = 98'h06025ffb253cb7a6c57a4cb39;
    stim[58] = 98'h19f40bbb17ecea12160625f55;
    stim[59] = 98'h167a28dabe579b98b9b807ac6;
    stim[60] = 98'h2cadfbf6a8fdd2cbe191f83dd;
    stim[61] = 98'h128ee4be7b5ae1cbde1402321;
    stim[62] = 98'h175a6483030bb6186cf2cfc57;
    stim[63] = 98'h1017441a9191823efff076268;
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
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'h04f5a30fc;
      expv[4] = 33'h0fe9c4142;
      expv[5] = 33'h1e7337d54;
      expv[6] = 33'h026bf6fec;
      expv[7] = 33'h00780bed0;
      expv[8] = 33'h1208e9c58;
      expv[9] = 33'h07e98f2d0;
      expv[10] = 33'h05cce2b12;
      expv[11] = 33'h0293291a6;
      expv[12] = 33'h02cf1a818;
      expv[13] = 33'h1284528ac;
      expv[14] = 33'h0964325f2;
      expv[15] = 33'h1b719f4b2;
      expv[16] = 33'h05bb55b80;
      expv[17] = 33'h009906370;
      expv[18] = 33'h1c1507e00;
      expv[19] = 33'h168265052;
      expv[20] = 33'h0e7d2d8d8;
      expv[21] = 33'h0bdb6b716;
      expv[22] = 33'h0645f637a;
      expv[23] = 33'h06ae063f3;
      expv[24] = 33'h15065f6d2;
      expv[25] = 33'h116d28398;
      expv[26] = 33'h1xxxxxxxx;
      expv[27] = 33'h07aedaa7a;
      expv[28] = 33'h089240318;
      expv[29] = 33'h1474421f2;
      expv[30] = 33'h0478b317e;
      expv[31] = 33'h009ccb1f4;
      expv[32] = 33'h116c3dfd4;
      expv[33] = 33'h0fa955014;
      expv[34] = 33'h030d42c33;
      expv[35] = 33'h030d42c33;
      expv[36] = 33'h0d2c6c4ee;
      expv[37] = 33'h0ead57acc;
      expv[38] = 33'h10a67559c;
      expv[39] = 33'h1689f8338;
      expv[40] = 33'h09c6bb38e;
      expv[41] = 33'h084faf12f;
      expv[42] = 33'h084faf12f;
      expv[43] = 33'h0e91af038;
      expv[44] = 33'h08ca472bc;
      expv[45] = 33'h0e2f1b466;
      expv[46] = 33'h19f386d92;
      expv[47] = 33'h02d4e5716;
      expv[48] = 33'h187cbb1e0;
      expv[49] = 33'h03775185a;
      expv[50] = 33'hxxx9xxxxx;
      expv[51] = 33'h02d814f80;
      expv[52] = 33'h09c95b63a;
      expv[53] = 33'h0dc44f5e8;
      expv[54] = 33'h10f561de8;
      expv[55] = 33'h0c89925fc;
      expv[56] = 33'h13f748e2e;
      expv[57] = 33'h03c0ea410;
      expv[58] = 33'h0af49967a;
      expv[59] = 33'h0fd9d4243;
      expv[60] = 33'h1caf37317;
      expv[61] = 33'h1caf37317;
      expv[62] = 33'h1c280464a;
      expv[63] = 33'h19e59f8b6;
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
