// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01448 dut (
    .clk(clk),
    .rst(in_vec[58:58]),
    .enable(in_vec[57:57]),
    .ready(in_vec[56:56]),
    .size(in_vec[55:32]),
    .data(in_vec[31:0]),
    .busy(out_vec[27:27]),
    .error(out_vec[26:26]),
    .activate(out_vec[25:25]),
    .strobe(out_vec[24:24]),
    .total_count(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h6c7608a81146feb;
    stim[1] = 59'h6262bb2f0fbcdc3;
    stim[2] = 59'h20c1df6d9e7ec73;
    stim[3] = 59'h3d17251c0216d74;
    stim[4] = 59'h1852f55272a97a4;
    stim[5] = 59'h2bc60e2d90bc2aa;
    stim[6] = 59'h0d5916b8f87fce2;
    stim[7] = 59'h0a43b5019b077b3;
    stim[8] = 59'h3cf76aad3df6bdb;
    stim[9] = 59'h3af21c102265efc;
    stim[10] = 59'h31c8e3da165f144;
    stim[11] = 59'h340218ce983430b;
    stim[12] = 59'h2c25b40a95f3002;
    stim[13] = 59'h2bc759a19f8702e;
    stim[14] = 59'h05072b3e2fe8edd;
    stim[15] = 59'h2c5e9f7f6fc2be7;
    stim[16] = 59'h44421217ef7a97e;
    stim[17] = 59'h2bdc603ba76243f;
    stim[18] = 59'h362ccd37beacdb9;
    stim[19] = 59'h0a8bbd0af2abe3b;
    stim[20] = 59'h0412c8d0e530794;
    stim[21] = 59'h358d8b3001cea63;
    stim[22] = 59'h1d84bf24fc35cae;
    stim[23] = 59'h2d4c9ce2a5a276c;
    stim[24] = 59'h1a17d0962025213;
    stim[25] = 59'h040e85bbde62baf;
    stim[26] = 59'h18bf11818656a1e;
    stim[27] = 59'h0f996b82f260cae;
    stim[28] = 59'h1bd1f8569b2e416;
    stim[29] = 59'h2f93d8462fab590;
    stim[30] = 59'h273e0f2ff834484;
    stim[31] = 59'h10a0b52abe56dbd;
    stim[32] = 59'h0dc5246baaefde2;
    stim[33] = 59'h2c84684f4e60ee4;
    stim[34] = 59'h34f86855941a2f7;
    stim[35] = 59'h193d20192800f9d;
    stim[36] = 59'h32cace33b40f1ee;
    stim[37] = 59'h1619d5d60d97e7f;
    stim[38] = 59'h3404ac471c8d95b;
    stim[39] = 59'h22ae828051f2931;
    stim[40] = 59'h0a7929701debc2c;
    stim[41] = 59'h0b90bf4bd55aa02;
    stim[42] = 59'h0183e6513036772;
    stim[43] = 59'h220d3c05456149f;
    stim[44] = 59'h0a6338609e8a80a;
    stim[45] = 59'h2a476c57ddeb911;
    stim[46] = 59'h00a89e6408266d1;
    stim[47] = 59'h0318e9b13adcc9a;
    stim[48] = 59'h25156b6de28909a;
    stim[49] = 59'h2d21b9915d984cf;
    stim[50] = 59'h33b6f755033b2bb;
    stim[51] = 59'h3dc6b32f8d17c56;
    stim[52] = 59'h2a5662c9e6441ce;
    stim[53] = 59'h31be63e067d1c16;
    stim[54] = 59'h2b4303273c1f108;
    stim[55] = 59'h0848028f3842cb5;
    stim[56] = 59'h1f8408790a0cba0;
    stim[57] = 59'h35dce18da8e9697;
    stim[58] = 59'h1a737022b7b0eac;
    stim[59] = 59'h01554f61400c137;
    stim[60] = 59'h16f6354e7815e04;
    stim[61] = 59'h27a1a15af668b08;
    stim[62] = 59'h0034e7633fd8067;
    stim[63] = 59'h01abfb8426d743b;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h0000000;
      expv[4] = 28'h2000000;
      expv[5] = 28'hb000001;
      expv[6] = 28'hf000002;
      expv[7] = 28'hb000003;
      expv[8] = 28'hb000004;
      expv[9] = 28'hf000005;
      expv[10] = 28'hf000006;
      expv[11] = 28'hf000007;
      expv[12] = 28'hf000008;
      expv[13] = 28'hf000009;
      expv[14] = 28'hf00000a;
      expv[15] = 28'hb00000b;
      expv[16] = 28'hf00000c;
      expv[17] = 28'h0000000;
      expv[18] = 28'h0000000;
      expv[19] = 28'h2000000;
      expv[20] = 28'hb000001;
      expv[21] = 28'hb000002;
      expv[22] = 28'hf000003;
      expv[23] = 28'hb000004;
      expv[24] = 28'hf000005;
      expv[25] = 28'hb000006;
      expv[26] = 28'hb000007;
      expv[27] = 28'hb000008;
      expv[28] = 28'hb000009;
      expv[29] = 28'hb00000a;
      expv[30] = 28'hf00000b;
      expv[31] = 28'hf00000c;
      expv[32] = 28'hb00000d;
      expv[33] = 28'hb00000e;
      expv[34] = 28'hf00000f;
      expv[35] = 28'hf000010;
      expv[36] = 28'hb000011;
      expv[37] = 28'hf000012;
      expv[38] = 28'hb000013;
      expv[39] = 28'hf000014;
      expv[40] = 28'hf000015;
      expv[41] = 28'hb000016;
      expv[42] = 28'hb000017;
      expv[43] = 28'hb000018;
      expv[44] = 28'hf000019;
      expv[45] = 28'hb00001a;
      expv[46] = 28'hf00001b;
      expv[47] = 28'hb00001c;
      expv[48] = 28'hb00001d;
      expv[49] = 28'hf00001e;
      expv[50] = 28'hf00001f;
      expv[51] = 28'hf000020;
      expv[52] = 28'hf000021;
      expv[53] = 28'hf000022;
      expv[54] = 28'hf000023;
      expv[55] = 28'hf000024;
      expv[56] = 28'hb000025;
      expv[57] = 28'hb000026;
      expv[58] = 28'hf000027;
      expv[59] = 28'hb000028;
      expv[60] = 28'hb000029;
      expv[61] = 28'hb00002a;
      expv[62] = 28'hf00002b;
      expv[63] = 28'hb00002c;
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
