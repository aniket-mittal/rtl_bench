// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062003 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h5a8dfc428d8fab;
    stim[1] = 55'h4da9ef45a8fb27;
    stim[2] = 55'h6dc2c4541496fb;
    stim[3] = 55'h0a018238de1eff;
    stim[4] = 55'h740823b43d672a;
    stim[5] = 55'h52f40d262fa829;
    stim[6] = 55'h6cf3b158425d24;
    stim[7] = 55'h2b0adb132ac23d;
    stim[8] = 55'h73c04b1cbbdeb1;
    stim[9] = 55'h1ecbd3577488bc;
    stim[10] = 55'h3a0ceddb234807;
    stim[11] = 55'h0e9e58620c211d;
    stim[12] = 55'h3855881c650b6f;
    stim[13] = 55'h4e7ff85cfd4b08;
    stim[14] = 55'h2b28b8da2e09dd;
    stim[15] = 55'h6e494fbc73560e;
    stim[16] = 55'h2c4c621dd75997;
    stim[17] = 55'h0cfda79da54a75;
    stim[18] = 55'h3d8e8973c8dd49;
    stim[19] = 55'h6088502da7aeca;
    stim[20] = 55'h68ffb25b71a589;
    stim[21] = 55'h3eb96ba7a729b6;
    stim[22] = 55'h22a808c8e0c396;
    stim[23] = 55'h3d9d5c16018e25;
    stim[24] = 55'h0bf9561e16cbd7;
    stim[25] = 55'h778f4c1095dea3;
    stim[26] = 55'h66f4768209d074;
    stim[27] = 55'h24fa3902feb132;
    stim[28] = 55'h656ed3bb6d73ff;
    stim[29] = 55'h18b0a6edbe1e5e;
    stim[30] = 55'h7d0e6870f8de41;
    stim[31] = 55'h7e1950d2410388;
    stim[32] = 55'h36272e20f3c987;
    stim[33] = 55'h6fee841db05bb3;
    stim[34] = 55'h741f5e2ddf5a10;
    stim[35] = 55'h62fdb240168887;
    stim[36] = 55'h3690b804ddd8d9;
    stim[37] = 55'h3e8ead0d25ac11;
    stim[38] = 55'h2285d25bf544de;
    stim[39] = 55'h410162b61968f1;
    stim[40] = 55'h72dba96731f74a;
    stim[41] = 55'h6fe259e8716d28;
    stim[42] = 55'h1c8de40f4c47b9;
    stim[43] = 55'h7fc60bf4f688ed;
    stim[44] = 55'h3c91b0033cfbdb;
    stim[45] = 55'h49cf74705c365e;
    stim[46] = 55'h7dbbec34295c58;
    stim[47] = 55'h09c5cfc45510e5;
    stim[48] = 55'h2e3162993e28ab;
    stim[49] = 55'h3ecdfbeec8653a;
    stim[50] = 55'h1ee63f791245a1;
    stim[51] = 55'h11c6e8a38e7068;
    stim[52] = 55'h26c3ecd59db629;
    stim[53] = 55'h6db7688e086260;
    stim[54] = 55'h59b67baff456c3;
    stim[55] = 55'h730860444c3be5;
    stim[56] = 55'h005faf556e4551;
    stim[57] = 55'h3b1372854051dc;
    stim[58] = 55'h36ba35f7585ddd;
    stim[59] = 55'h40d6660ea82849;
    stim[60] = 55'h190a7b81259ad9;
    stim[61] = 55'h294a0aab8e77a4;
    stim[62] = 55'h49d2631ab5541a;
    stim[63] = 55'h4e2f40dc9c590b;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h5a8dfc428d8fab;
      expv[2] = 55'h4da9ef45a8fb27;
      expv[3] = 55'h6dc2c4541496fb;
      expv[4] = 55'h0a018238de1eff;
      expv[5] = 55'h740823b43d672a;
      expv[6] = 55'h52f40d262fa829;
      expv[7] = 55'h6cf3b158425d24;
      expv[8] = 55'h2b0adb132ac23d;
      expv[9] = 55'h73c04b1cbbdeb1;
      expv[10] = 55'h1ecbd3577488bc;
      expv[11] = 55'h3a0ceddb234807;
      expv[12] = 55'h0e9e58620c211d;
      expv[13] = 55'h3855881c650b6f;
      expv[14] = 55'h4e7ff85cfd4b08;
      expv[15] = 55'h2b28b8da2e09dd;
      expv[16] = 55'h6e494fbc73560e;
      expv[17] = 55'h2c4c621dd75997;
      expv[18] = 55'h0cfda79da54a75;
      expv[19] = 55'h3d8e8973c8dd49;
      expv[20] = 55'h6088502da7aeca;
      expv[21] = 55'h68ffb25b71a589;
      expv[22] = 55'h3eb96ba7a729b6;
      expv[23] = 55'h22a808c8e0c396;
      expv[24] = 55'h3d9d5c16018e25;
      expv[25] = 55'h0bf9561e16cbd7;
      expv[26] = 55'h778f4c1095dea3;
      expv[27] = 55'h66f4768209d074;
      expv[28] = 55'h24fa3902feb132;
      expv[29] = 55'h656ed3bb6d73ff;
      expv[30] = 55'h18b0a6edbe1e5e;
      expv[31] = 55'h7d0e6870f8de41;
      expv[32] = 55'h7e1950d2410388;
      expv[33] = 55'h36272e20f3c987;
      expv[34] = 55'h6fee841db05bb3;
      expv[35] = 55'h741f5e2ddf5a10;
      expv[36] = 55'h62fdb240168887;
      expv[37] = 55'h3690b804ddd8d9;
      expv[38] = 55'h3e8ead0d25ac11;
      expv[39] = 55'h2285d25bf544de;
      expv[40] = 55'h410162b61968f1;
      expv[41] = 55'h72dba96731f74a;
      expv[42] = 55'h6fe259e8716d28;
      expv[43] = 55'h1c8de40f4c47b9;
      expv[44] = 55'h7fc60bf4f688ed;
      expv[45] = 55'h3c91b0033cfbdb;
      expv[46] = 55'h49cf74705c365e;
      expv[47] = 55'h7dbbec34295c58;
      expv[48] = 55'h09c5cfc45510e5;
      expv[49] = 55'h2e3162993e28ab;
      expv[50] = 55'h3ecdfbeec8653a;
      expv[51] = 55'h1ee63f791245a1;
      expv[52] = 55'h11c6e8a38e7068;
      expv[53] = 55'h26c3ecd59db629;
      expv[54] = 55'h6db7688e086260;
      expv[55] = 55'h59b67baff456c3;
      expv[56] = 55'h730860444c3be5;
      expv[57] = 55'h005faf556e4551;
      expv[58] = 55'h3b1372854051dc;
      expv[59] = 55'h36ba35f7585ddd;
      expv[60] = 55'h40d6660ea82849;
      expv[61] = 55'h190a7b81259ad9;
      expv[62] = 55'h294a0aab8e77a4;
      expv[63] = 55'h49d2631ab5541a;
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
