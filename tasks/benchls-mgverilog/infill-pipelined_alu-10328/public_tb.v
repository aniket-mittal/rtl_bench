// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10328 dut (
    .clk(clk),
    .en(in_vec[100:100]),
    .op(in_vec[99:96]),
    .valA(in_vec[95:64]),
    .valB(in_vec[63:32]),
    .valC(in_vec[31:0]),
    .done(out_vec[32:32]),
    .valZ(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h1168186c793ad541a6531e4838;
    stim[1] = 101'h1b78ae76eadae727d53747e418;
    stim[2] = 101'h00f66287285fe18e96afbe49c0;
    stim[3] = 101'h0013a3b54513baa346d3321243;
    stim[4] = 101'h095cedb7bfcb32d64da33fc911;
    stim[5] = 101'h1f2efcb8884225605f8e9fc2ef;
    stim[6] = 101'h103bb712992aab47ad63239732;
    stim[7] = 101'h0c716ec7f7e84739a604a0c620;
    stim[8] = 101'h08703f1b63f77da926f30f3457;
    stim[9] = 101'h0e8663836df5b6cbba06c34306;
    stim[10] = 101'h0fdcf13d3291c297145da8b1c2;
    stim[11] = 101'h1e9415da015ffc7b1b8709866e;
    stim[12] = 101'h0a521c08f193e58325d9cb7f16;
    stim[13] = 101'h0a603140c1b58fc231db88c029;
    stim[14] = 101'h1723c078aee52e1e145a7ef61d;
    stim[15] = 101'h026d2afba4f7d2e831b67e0184;
    stim[16] = 101'h01164d263b3f71673e59ad5e49;
    stim[17] = 101'h1a5d86aec64c811da6ad0c0d4a;
    stim[18] = 101'h1be0e94ad79dcb13e5ad9ff655;
    stim[19] = 101'h0e6d6a26341c8a882c0eda0687;
    stim[20] = 101'h16dbda47b47520a48531a8568f;
    stim[21] = 101'h1934b314194fe967182e1bb28a;
    stim[22] = 101'h0decd9e3f6910ec90994b2adba;
    stim[23] = 101'h168431a765e74cf4e330e1bf1d;
    stim[24] = 101'h063c77bf961a77b3b762a89b90;
    stim[25] = 101'h18ca6ea5158f5275297ef88b4a;
    stim[26] = 101'h1763d4dd3e4a57fb8fa726881d;
    stim[27] = 101'h00d0f3cf89d7247137d2ce3cce;
    stim[28] = 101'h0cc241d529e31beea7b2d97ce5;
    stim[29] = 101'h1b736d9727bb65bad41f3a9a57;
    stim[30] = 101'h1411e7a6bc1393730c59cdf581;
    stim[31] = 101'h0fdc0be18dc6bd0e0e115b47d3;
    stim[32] = 101'h0f1e02ad0ef7d389b7d2477873;
    stim[33] = 101'h072f0839fc9cb9ca67df63fc78;
    stim[34] = 101'h0bf6e64615e737ec5089131ea7;
    stim[35] = 101'h0d64e5655083691179b42c8bdb;
    stim[36] = 101'h0f581fa019ff428764266207af;
    stim[37] = 101'h0e569dc59e4ee085911c72cf11;
    stim[38] = 101'h02ab21511a3744aa18ce5be49a;
    stim[39] = 101'h14e9267bf1f9486e6bf60e5105;
    stim[40] = 101'h1c974877e0b8c0cbbcd21100c9;
    stim[41] = 101'h1ba61e6911d5428c656df89506;
    stim[42] = 101'h0185b6398eeb25df1fe85ea3e3;
    stim[43] = 101'h12553a3982ba87af012b0bfa61;
    stim[44] = 101'h05b33ee2b944c13003a581a471;
    stim[45] = 101'h1999e2934232feb980d80bb732;
    stim[46] = 101'h199dfbcd042531be0b10ce8fd6;
    stim[47] = 101'h0f380bebd4d7601a2aca9809b8;
    stim[48] = 101'h0b23c00db0e497d2e236f3f278;
    stim[49] = 101'h03b024ed5c45541d2703ba1350;
    stim[50] = 101'h03109789076441592c17a0f09c;
    stim[51] = 101'h093e3a6ebd9f6028e8aee503a9;
    stim[52] = 101'h15a1371b4c2c67640cc9c8e93f;
    stim[53] = 101'h08bf16d6564bef3984ecf0c4e0;
    stim[54] = 101'h1e9c3cc96a669155e1f9b2da5c;
    stim[55] = 101'h0f0c516c5498d0d49e02adb999;
    stim[56] = 101'h1fda56e0a828ee66f1567d3d0c;
    stim[57] = 101'h1415f46cd7656234c90477681f;
    stim[58] = 101'h058814bca7f8d6bfe23725b9e2;
    stim[59] = 101'h0f42db91c93bc1ec996a7f36cf;
    stim[60] = 101'h01b082eef8a75def7c6a00d220;
    stim[61] = 101'h1091562bc27c797fd977bb5083;
    stim[62] = 101'h04602e6ace70384814cf98ae45;
    stim[63] = 101'h1c8dae48419247f92cc31569d3;
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
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'h15f582438;
      expv[5] = 33'h1afbe49c0;
      expv[6] = 33'h0afbe49c0;
      expv[7] = 33'h0afbe49c0;
      expv[8] = 33'h0afbe49c0;
      expv[9] = 33'h163239732;
      expv[10] = 33'h140601ddd;
      expv[11] = 33'h040601ddd;
      expv[12] = 33'h040601ddd;
      expv[13] = 33'h040601ddd;
      expv[14] = 33'h040601ddd;
      expv[15] = 33'h1xxxxxxxx;
      expv[16] = 33'h0xxxxxxxx;
      expv[17] = 33'h0xxxxxxxx;
      expv[18] = 33'h1b67e0184;
      expv[19] = 33'h0b67e0184;
      expv[20] = 33'h0b67e0184;
      expv[21] = 33'h1188c63fb;
      expv[22] = 33'h10eda0687;
      expv[23] = 33'h00eda0687;
      expv[24] = 33'h12e1bb28a;
      expv[25] = 33'h1c4c4bdbb;
      expv[26] = 33'h0c4c4bdbb;
      expv[27] = 33'h162a89b90;
      expv[28] = 33'h062a89b90;
      expv[29] = 33'h1a21637f4;
      expv[30] = 33'h1d2ce3cce;
      expv[31] = 33'h0d2ce3cce;
      expv[32] = 33'h0d2ce3cce;
      expv[33] = 33'h159cdf581;
      expv[34] = 33'h136d6619b;
      expv[35] = 33'h036d6619b;
      expv[36] = 33'h036d6619b;
      expv[37] = 33'h036d6619b;
      expv[38] = 33'h036d6619b;
      expv[39] = 33'h036d6619b;
      expv[40] = 33'h036d6619b;
      expv[41] = 33'h036d6619b;
      expv[42] = 33'h036d6619b;
      expv[43] = 33'h1b47feb25;
      expv[44] = 33'h14c80412a;
      expv[45] = 33'h1e85ea3e3;
      expv[46] = 33'h0e85ea3e3;
      expv[47] = 33'h1953f3af4;
      expv[48] = 33'h0953f3af4;
      expv[49] = 33'h199ce9218;
      expv[50] = 33'h163624abc;
      expv[51] = 33'h063624abc;
      expv[52] = 33'h063624abc;
      expv[53] = 33'h063624abc;
      expv[54] = 33'h063624abc;
      expv[55] = 33'h063624abc;
      expv[56] = 33'h10dc3bc70;
      expv[57] = 33'h00dc3bc70;
      expv[58] = 33'h1xxxxxxxx;
      expv[59] = 33'h0xxxxxxxx;
      expv[60] = 33'h10477681f;
      expv[61] = 33'h1b27c5b82;
      expv[62] = 33'h0b27c5b82;
      expv[63] = 33'h0b27c5b82;
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
