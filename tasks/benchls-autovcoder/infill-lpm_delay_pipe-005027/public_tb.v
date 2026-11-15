// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005027 dut (
    .clock(clk),
    .d(in_vec[64:1]),
    .aclr(in_vec[0:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h147cb828f16060183;
    stim[1] = 65'h01f2ff860d3533ae7;
    stim[2] = 65'h0d0883cf820cbf070;
    stim[3] = 65'h11e2856682fd257e6;
    stim[4] = 65'h1be8301898a2f7bb8;
    stim[5] = 65'h1f9f212dc813834bc;
    stim[6] = 65'h0a5f7cc83c6cdc556;
    stim[7] = 65'h03e0bd8a7110a7480;
    stim[8] = 65'h19807cdc99e3af016;
    stim[9] = 65'h16754b7f0655aa316;
    stim[10] = 65'h16d9932a3dfd5cefe;
    stim[11] = 65'h05d0d66c7a1c17d14;
    stim[12] = 65'h0d98b284d80a15454;
    stim[13] = 65'h07caf68b8de71482a;
    stim[14] = 65'h1de088a3e688f24d0;
    stim[15] = 65'h0970f16c90969e6aa;
    stim[16] = 65'h051d9eac019adb7ce;
    stim[17] = 65'h1dec88bc1fdde6788;
    stim[18] = 65'h1230f02795d7c6004;
    stim[19] = 65'h0e75e3aa4afd38ac0;
    stim[20] = 65'h16c2d69be133427e8;
    stim[21] = 65'h108761850aa4db956;
    stim[22] = 65'h0e9c484ee3e9d3e1e;
    stim[23] = 65'h0648e27d777252b1e;
    stim[24] = 65'h1092a7c6688d50fe0;
    stim[25] = 65'h16a46af8ff4002478;
    stim[26] = 65'h167802dffa1b50946;
    stim[27] = 65'h10f07ccae8140aab0;
    stim[28] = 65'h124a63a9475ab94a8;
    stim[29] = 65'h1624a86c0508f3e26;
    stim[30] = 65'h0ee589d7266cfd0be;
    stim[31] = 65'h115ac5a3f99e273fa;
    stim[32] = 65'h16ef3864ad83630a4;
    stim[33] = 65'h062a3c3a500443f34;
    stim[34] = 65'h00461c278ac57787e;
    stim[35] = 65'h00c8125dc97c5245e;
    stim[36] = 65'h05ad0974b3a46ccf8;
    stim[37] = 65'h1c8f5bf3554c3420c;
    stim[38] = 65'h05931a1b93e31f218;
    stim[39] = 65'h0520f2d49d32ec92e;
    stim[40] = 65'h0be8df08034b6cc2a;
    stim[41] = 65'h132e3044d65cd2412;
    stim[42] = 65'h19f86747e6c33a2a8;
    stim[43] = 65'h12f7ddb3f69e2cde6;
    stim[44] = 65'h1089e46c16b564bb2;
    stim[45] = 65'h057dcb44f85019996;
    stim[46] = 65'h102f5587653bb0c70;
    stim[47] = 65'h0d0c6dae8946467ce;
    stim[48] = 65'h12271401def4db478;
    stim[49] = 65'h01d168a6face7f0bc;
    stim[50] = 65'h1e1047e5594e4f246;
    stim[51] = 65'h02c4f097663d502d0;
    stim[52] = 65'h01366b295031fa95a;
    stim[53] = 65'h1b47e378e5f8f8ba8;
    stim[54] = 65'h08fe5668c7d1c77e2;
    stim[55] = 65'h057aa2948c3e78160;
    stim[56] = 65'h1dcd8f041b40b3828;
    stim[57] = 65'h1f9dcfb87fc136316;
    stim[58] = 65'h1ac50c9e2be99b3f6;
    stim[59] = 65'h19f94044aa1601f60;
    stim[60] = 65'h0f5a05592c415a182;
    stim[61] = 65'h196d7837ee4ac3b9a;
    stim[62] = 65'h05d3a13426ed9288a;
    stim[63] = 65'h10972f6d6ffcb0fa0;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h68441e7c1065f838;
      expv[4] = 64'h8f142b3417e92bf3;
      expv[5] = 64'hdf4180c4c517bddc;
      expv[6] = 64'hfcf9096e409c1a5e;
      expv[7] = 64'h52fbe641e366e2ab;
      expv[8] = 64'h1f05ec5388853a40;
      expv[9] = 64'hcc03e6e4cf1d780b;
      expv[10] = 64'hb3aa5bf832ad518b;
      expv[11] = 64'hb6cc9951efeae77f;
      expv[12] = 64'h2e86b363d0e0be8a;
      expv[13] = 64'h6cc59426c050aa2a;
      expv[14] = 64'h3e57b45c6f38a415;
      expv[15] = 64'hef04451f34479268;
      expv[16] = 64'h4b878b6484b4f355;
      expv[17] = 64'h28ecf5600cd6dbe7;
      expv[18] = 64'hef6445e0feef33c4;
      expv[19] = 64'h9187813caebe3002;
      expv[20] = 64'h73af1d5257e9c560;
      expv[21] = 64'hb616b4df099a13f4;
      expv[22] = 64'h843b0c285526dcab;
      expv[23] = 64'h74e242771f4e9f0f;
      expv[24] = 64'h324713ebbb92958f;
      expv[25] = 64'h84953e33446a87f0;
      expv[26] = 64'hb52357c7fa00123c;
      expv[27] = 64'hb3c016ffd0da84a3;
      expv[28] = 64'h8783e65740a05558;
      expv[29] = 64'h92531d4a3ad5ca54;
      expv[30] = 64'hb125436028479f13;
      expv[31] = 64'h772c4eb93367e85f;
      expv[32] = 64'h8ad62d1fccf139fd;
      expv[33] = 64'hb779c3256c1b1852;
      expv[34] = 64'h3151e1d280221f9a;
      expv[35] = 64'h0230e13c562bbc3f;
      expv[36] = 64'h064092ee4be2922f;
      expv[37] = 64'h2d684ba59d23667c;
      expv[38] = 64'he47adf9aaa61a106;
      expv[39] = 64'h2c98d0dc9f18f90c;
      expv[40] = 64'h290796a4e9976497;
      expv[41] = 64'h5f46f8401a5b6615;
      expv[42] = 64'h99718226b2e69209;
      expv[43] = 64'hcfc33a3f3619d154;
      expv[44] = 64'h97beed9fb4f166f3;
      expv[45] = 64'h844f2360b5ab25d9;
      expv[46] = 64'h2bee5a27c280cccb;
      expv[47] = 64'h817aac3b29dd8638;
      expv[48] = 64'h68636d744a3233e7;
      expv[49] = 64'h9138a00ef7a6da3c;
      expv[50] = 64'h0e8b4537d673f85e;
      expv[51] = 64'hf0823f2aca727923;
      expv[52] = 64'h162784bb31ea8168;
      expv[53] = 64'h09b3594a818fd4ad;
      expv[54] = 64'hda3f1bc72fc7c5d4;
      expv[55] = 64'h47f2b3463e8e3bf1;
      expv[56] = 64'h2bd514a461f3c0b0;
      expv[57] = 64'hee6c7820da059c14;
      expv[58] = 64'hfcee7dc3fe09b18b;
      expv[59] = 64'hd62864f15f4cd9fb;
      expv[60] = 64'hcfca022550b00fb0;
      expv[61] = 64'h7ad02ac9620ad0c1;
      expv[62] = 64'hcb6bc1bf72561dcd;
      expv[63] = 64'h2e9d09a1376c9445;
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
