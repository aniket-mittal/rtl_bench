// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00321 dut (
    .clk(clk),
    .ce(in_vec[48:48]),
    .a(in_vec[47:20]),
    .b(in_vec[19:0]),
    .p(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h165d2cb012091;
    stim[1] = 49'h17f799d965ef6;
    stim[2] = 49'h187db06cd67f0;
    stim[3] = 49'h1b9f659008e2d;
    stim[4] = 49'h157e217d38746;
    stim[5] = 49'h1b4fd01b66883;
    stim[6] = 49'h16ad3863869fb;
    stim[7] = 49'h18146905a2308;
    stim[8] = 49'h1ece8aa83451e;
    stim[9] = 49'h01860d183f36c;
    stim[10] = 49'h0abd8025fa172;
    stim[11] = 49'h0b753e4309ef9;
    stim[12] = 49'h1f572f59e6b80;
    stim[13] = 49'h1c15e151dde68;
    stim[14] = 49'h1f058e9f15774;
    stim[15] = 49'h16dea1e27a83b;
    stim[16] = 49'h1ee8871f36c45;
    stim[17] = 49'h0ef042cf144e3;
    stim[18] = 49'h186d1b0331d7c;
    stim[19] = 49'h0b6b931f3ceb0;
    stim[20] = 49'h137ec08163cbc;
    stim[21] = 49'h0036622968b18;
    stim[22] = 49'h151ebe70e687b;
    stim[23] = 49'h17067b9d99b82;
    stim[24] = 49'h0b172c1692589;
    stim[25] = 49'h18ca97f560e83;
    stim[26] = 49'h07ae5e5ab0024;
    stim[27] = 49'h1de55e283106a;
    stim[28] = 49'h0d897af28a4f3;
    stim[29] = 49'h04e2aa23c7ca5;
    stim[30] = 49'h0e962628a5ad6;
    stim[31] = 49'h109875745ce86;
    stim[32] = 49'h148bc4d074abb;
    stim[33] = 49'h051b315d4e856;
    stim[34] = 49'h1b62cec31acae;
    stim[35] = 49'h189e1cc8d66b2;
    stim[36] = 49'h0976a8e6189fd;
    stim[37] = 49'h08f483bc93bc8;
    stim[38] = 49'h0cff69098a18c;
    stim[39] = 49'h1ae194e1dfdd6;
    stim[40] = 49'h124c085f695d0;
    stim[41] = 49'h0266d61d454b7;
    stim[42] = 49'h1888168aec097;
    stim[43] = 49'h1daeac9e9efaa;
    stim[44] = 49'h0ef98d08aede5;
    stim[45] = 49'h0e145f84b4a9f;
    stim[46] = 49'h0052eb330d024;
    stim[47] = 49'h130fbab06a087;
    stim[48] = 49'h16d1660bd0c28;
    stim[49] = 49'h1ad22ab28deca;
    stim[50] = 49'h07804c6366e5e;
    stim[51] = 49'h139beed39f98a;
    stim[52] = 49'h17aaaab5e9a6e;
    stim[53] = 49'h171cea88c12d0;
    stim[54] = 49'h17828ddcd013c;
    stim[55] = 49'h1b634df9cc472;
    stim[56] = 49'h0f136e42576e6;
    stim[57] = 49'h07d18c7e0719b;
    stim[58] = 49'h1866b25295fe4;
    stim[59] = 49'h135289f0c20f1;
    stim[60] = 49'h1bff9cdc74417;
    stim[61] = 49'h12f0d696e4b4e;
    stim[62] = 49'h1c7eee4ba3f89;
    stim[63] = 49'h1355eb0b968f1;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'h072c6d0c4fb0;
      expv[5] = 48'h32c22d818486;
      expv[6] = 48'h137a768cd940;
      expv[7] = 48'hfd91a55aba50;
      expv[8] = 48'h1361689d132e;
      expv[9] = 48'he1f4e70475d1;
      expv[10] = 48'he1f4e70475d1;
      expv[11] = 48'he1f4e70475d1;
      expv[12] = 48'he1f4e70475d1;
      expv[13] = 48'hcd59d4dee411;
      expv[14] = 48'h2e7014e0f728;
      expv[15] = 48'hfc19278b87b0;
      expv[16] = 48'h010abdafdf80;
      expv[17] = 48'h0857be54c6e8;
      expv[18] = 48'h0857be54c6e8;
      expv[19] = 48'hfeb0009ba90c;
      expv[20] = 48'hfeb0009ba90c;
      expv[21] = 48'h349a1cb99f16;
      expv[22] = 48'h349a1cb99f16;
      expv[23] = 48'hfc43630a7f5b;
      expv[24] = 48'he86801f16c74;
      expv[25] = 48'he86801f16c74;
      expv[26] = 48'h15ccc9399abc;
      expv[27] = 48'h15ccc9399abc;
      expv[28] = 48'hf7d97642ffd0;
      expv[29] = 48'hf7d97642ffd0;
      expv[30] = 48'hf7d97642ffd0;
      expv[31] = 48'hf7d97642ffd0;
      expv[32] = 48'hd3171cd7d4ba;
      expv[33] = 48'hd456f3b9285f;
      expv[34] = 48'hd456f3b9285f;
      expv[35] = 48'hf98d91537c90;
      expv[36] = 48'h03754994d2b8;
      expv[37] = 48'h03754994d2b8;
      expv[38] = 48'h03754994d2b8;
      expv[39] = 48'h03754994d2b8;
      expv[40] = 48'h21261aace3f0;
      expv[41] = 48'hf8460ed68c8a;
      expv[42] = 48'hf8460ed68c8a;
      expv[43] = 48'h132f870fb310;
      expv[44] = 48'h0a47ea11d116;
      expv[45] = 48'h0a47ea11d116;
      expv[46] = 48'h0a47ea11d116;
      expv[47] = 48'h0a47ea11d116;
      expv[48] = 48'h0f2050e01830;
      expv[49] = 48'h09517c18cb66;
      expv[50] = 48'h0e0dd0d422ec;
      expv[51] = 48'h0e0dd0d422ec;
      expv[52] = 48'h1449d21972d0;
      expv[53] = 48'hebdeaf5f75b8;
      expv[54] = 48'h24ecd54c0c74;
      expv[55] = 48'hea411594f8be;
      expv[56] = 48'hf54aa09c3bc6;
      expv[57] = 48'hf54aa09c3bc6;
      expv[58] = 48'hf54aa09c3bc6;
      expv[59] = 48'he41225dc1e80;
      expv[60] = 48'he9819b931b90;
      expv[61] = 48'h0ee8c2075ce2;
      expv[62] = 48'h325877653f08;
      expv[63] = 48'hf3234a31daf0;
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
