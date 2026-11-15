// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11550 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h21bbe2ff37d;
    stim[1] = 42'h11b32349ea4;
    stim[2] = 42'h16b8d74a767;
    stim[3] = 42'h2e09ce05e18;
    stim[4] = 42'h0d27743d412;
    stim[5] = 42'h3b896a14513;
    stim[6] = 42'h08e55c0d07a;
    stim[7] = 42'h34452726515;
    stim[8] = 42'h2e60a59e2b5;
    stim[9] = 42'h04b27c85e29;
    stim[10] = 42'h26180cb1d2d;
    stim[11] = 42'h1bb9e7035b7;
    stim[12] = 42'h0194485cb53;
    stim[13] = 42'h35a8dd5cbfd;
    stim[14] = 42'h1cb0333fea0;
    stim[15] = 42'h13ca3649990;
    stim[16] = 42'h2e2f2f27048;
    stim[17] = 42'h09beef81110;
    stim[18] = 42'h02175ba940c;
    stim[19] = 42'h328a0fa8473;
    stim[20] = 42'h3b9d27907b9;
    stim[21] = 42'h0af27c0a27d;
    stim[22] = 42'h395e40e6423;
    stim[23] = 42'h1791572583b;
    stim[24] = 42'h297ae01e5ba;
    stim[25] = 42'h14e0b9b0600;
    stim[26] = 42'h036246cbc9b;
    stim[27] = 42'h05649174f77;
    stim[28] = 42'h39159894fc3;
    stim[29] = 42'h0566b4f0e14;
    stim[30] = 42'h24dabe3c802;
    stim[31] = 42'h34e15395df5;
    stim[32] = 42'h329c1ec6cda;
    stim[33] = 42'h1ce7b36bc97;
    stim[34] = 42'h2101a6bef63;
    stim[35] = 42'h24e0fe95b78;
    stim[36] = 42'h0d332698d84;
    stim[37] = 42'h1262c2b1e5a;
    stim[38] = 42'h22f7631b8b6;
    stim[39] = 42'h2f9a24b9227;
    stim[40] = 42'h2de16c96ad3;
    stim[41] = 42'h38d8e79aa76;
    stim[42] = 42'h3e683433a42;
    stim[43] = 42'h1ee704f30bd;
    stim[44] = 42'h172090d59cc;
    stim[45] = 42'h04cbb75ba86;
    stim[46] = 42'h1d5b18a26e3;
    stim[47] = 42'h2053561813e;
    stim[48] = 42'h2d341fee560;
    stim[49] = 42'h06b71147d3c;
    stim[50] = 42'h07a077d5c32;
    stim[51] = 42'h0eca4a984e3;
    stim[52] = 42'h1eeb40fee4c;
    stim[53] = 42'h0a9eb133b0a;
    stim[54] = 42'h0811da1bdec;
    stim[55] = 42'h0a58aebde0b;
    stim[56] = 42'h12ab43e9056;
    stim[57] = 42'h1513f694e5c;
    stim[58] = 42'h33b9476d53d;
    stim[59] = 42'h22eedb931dc;
    stim[60] = 42'h3541903d7e5;
    stim[61] = 42'h0fec8d524a7;
    stim[62] = 42'h25957887449;
    stim[63] = 42'h04f141f603b;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'h5c4b50a288000;
      expv[7] = 51'h5c4b50a288000;
      expv[8] = 51'h222939328a080;
      expv[9] = 51'h222939328a000;
      expv[10] = 51'h222939328a000;
      expv[11] = 51'h222939328a000;
      expv[12] = 51'h222939328a000;
      expv[13] = 51'h222939328a000;
      expv[14] = 51'h222939328a000;
      expv[15] = 51'h658199ff50800;
      expv[16] = 51'h658199ff50000;
      expv[17] = 51'h658199ff50000;
      expv[18] = 51'h658199ff50000;
      expv[19] = 51'h658199ff50000;
      expv[20] = 51'h658199ff50000;
      expv[21] = 51'h658199ff50000;
      expv[22] = 51'h658199ff50000;
      expv[23] = 51'h4af2073210080;
      expv[24] = 51'h4af2073210000;
      expv[25] = 51'h4af2073210000;
      expv[26] = 51'h2705cd8300080;
      expv[27] = 51'h2705cd8300000;
      expv[28] = 51'h2705cd8300000;
      expv[29] = 51'h2705cd8300000;
      expv[30] = 51'h2b35a7870a200;
      expv[31] = 51'h2b35a7870a000;
      expv[32] = 51'h2b35a7870a000;
      expv[33] = 51'h2b35a7870a000;
      expv[34] = 51'h673d9b5e4a002;
      expv[35] = 51'h673d9b5e4a000;
      expv[36] = 51'h2707f4adbc008;
      expv[37] = 51'h2707f4adbc000;
      expv[38] = 51'h2707f4adbc000;
      expv[39] = 51'h2707f4adbc000;
      expv[40] = 51'h2707f4adbc000;
      expv[41] = 51'h6f0b64b568200;
      expv[42] = 51'h6f0b64b568000;
      expv[43] = 51'h6f0b64b568000;
      expv[44] = 51'h6f0b64b568000;
      expv[45] = 51'h6f0b64b568000;
      expv[46] = 51'h6f0b64b568000;
      expv[47] = 51'h6f0b64b568000;
      expv[48] = 51'h6f0b64b568000;
      expv[49] = 51'h69a0ff72b0020;
      expv[50] = 51'h69a0ff72b0000;
      expv[51] = 51'h69a0ff72b0000;
      expv[52] = 51'h69a0ff72b0000;
      expv[53] = 51'h69a0ff72b0000;
      expv[54] = 51'h54f5899d84100;
      expv[55] = 51'h54f5899d84000;
      expv[56] = 51'h54f5899d84000;
      expv[57] = 51'h155a1f482a100;
      expv[58] = 51'h155a1f482a000;
      expv[59] = 51'h1dca3b6a9e080;
      expv[60] = 51'h1dca3b6a9e000;
      expv[61] = 51'h1dca3b6a9e000;
      expv[62] = 51'h1dca3b6a9e000;
      expv[63] = 51'h1dca3b6a9e000;
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
