// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07037 dut (
    .clock(clk),
    .reset(in_vec[37:37]),
    .start(in_vec[36:36]),
    .A(in_vec[35:18]),
    .B(in_vec[17:0]),
    .ready(out_vec[36:36]),
    .R(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2f36b019cc;
    stim[1] = 38'h2f778eff42;
    stim[2] = 38'h0c5ff1bcdf;
    stim[3] = 38'h01db2e2773;
    stim[4] = 38'h1797812e70;
    stim[5] = 38'h1dc8ac3c93;
    stim[6] = 38'h03bdf942ed;
    stim[7] = 38'h08aba113c2;
    stim[8] = 38'h18f5946adc;
    stim[9] = 38'h11cace0d59;
    stim[10] = 38'h1118994aea;
    stim[11] = 38'h052985c8c0;
    stim[12] = 38'h0a64376b53;
    stim[13] = 38'h0039020a16;
    stim[14] = 38'h085d41e5f1;
    stim[15] = 38'h1743e17cf0;
    stim[16] = 38'h154255e994;
    stim[17] = 38'h07ffb4fe04;
    stim[18] = 38'h10f8ced3c6;
    stim[19] = 38'h0e299229dc;
    stim[20] = 38'h0badfc7326;
    stim[21] = 38'h08f6e60784;
    stim[22] = 38'h1d543a2963;
    stim[23] = 38'h1cf6bccf36;
    stim[24] = 38'h0dd38a72a2;
    stim[25] = 38'h14be682633;
    stim[26] = 38'h0e1f662cb8;
    stim[27] = 38'h05ad8330b1;
    stim[28] = 38'h00e476f82c;
    stim[29] = 38'h0b741118cd;
    stim[30] = 38'h1a474edd6d;
    stim[31] = 38'h1b65952397;
    stim[32] = 38'h0157cb0e6f;
    stim[33] = 38'h1fa1248224;
    stim[34] = 38'h19b3dd8cc2;
    stim[35] = 38'h1232a00a1f;
    stim[36] = 38'h081dc3a889;
    stim[37] = 38'h04666b7130;
    stim[38] = 38'h1d5b6b851e;
    stim[39] = 38'h12fa6e698b;
    stim[40] = 38'h14aaf568a7;
    stim[41] = 38'h1e1377dd41;
    stim[42] = 38'h0afbe626b9;
    stim[43] = 38'h196b6cd270;
    stim[44] = 38'h1c5b9e8f18;
    stim[45] = 38'h184a38cef8;
    stim[46] = 38'h012b8ffcab;
    stim[47] = 38'h00dd3e9580;
    stim[48] = 38'h10d6dc6d27;
    stim[49] = 38'h02b0456020;
    stim[50] = 38'h06b7ac9717;
    stim[51] = 38'h124c586d2b;
    stim[52] = 38'h1d60162dd3;
    stim[53] = 38'h01bbdc3240;
    stim[54] = 38'h0ad01d0a2a;
    stim[55] = 38'h046153a5ff;
    stim[56] = 38'h0d1a6477cc;
    stim[57] = 38'h0f48656fa9;
    stim[58] = 38'h1d81574b68;
    stim[59] = 38'h000c6d416e;
    stim[60] = 38'h19c27c4701;
    stim[61] = 38'h1d6f3cb7ae;
    stim[62] = 38'h17a01603e6;
    stim[63] = 38'h1e59456d54;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'h1000000000;
      expv[2] = 37'h1000000000;
      expv[3] = 37'h1000000000;
      expv[4] = 37'h1000000000;
      expv[5] = 37'h0000000000;
      expv[6] = 37'h0000012e70;
      expv[7] = 37'h0000009738;
      expv[8] = 37'h0000004b9c;
      expv[9] = 37'h00000025ce;
      expv[10] = 37'h00000012e7;
      expv[11] = 37'h03cbc00973;
      expv[12] = 37'h05b1a004b9;
      expv[13] = 37'h06a490025c;
      expv[14] = 37'h035248012e;
      expv[15] = 37'h01a9240097;
      expv[16] = 37'h04a052004b;
      expv[17] = 37'h061be90025;
      expv[18] = 37'h06d9b48012;
      expv[19] = 37'h036cda4009;
      expv[20] = 37'h05822d2004;
      expv[21] = 37'h02c1169002;
      expv[22] = 37'h01608b4801;
      expv[23] = 37'h047c05a400;
      expv[24] = 37'h123e02d200;
      expv[25] = 37'h123e02d200;
      expv[26] = 37'h023e02d200;
      expv[27] = 37'h0000002633;
      expv[28] = 37'h025f341319;
      expv[29] = 37'h038ece098c;
      expv[30] = 37'h01c76704c6;
      expv[31] = 37'h00e3b38263;
      expv[32] = 37'h02d10dc131;
      expv[33] = 37'h03c7bae098;
      expv[34] = 37'h01e3dd704c;
      expv[35] = 37'h00f1eeb826;
      expv[36] = 37'h0078f75c13;
      expv[37] = 37'h029bafae09;
      expv[38] = 37'h03ad0bd704;
      expv[39] = 37'h01d685eb82;
      expv[40] = 37'h00eb42f5c1;
      expv[41] = 37'h02d4d57ae0;
      expv[42] = 37'h016a6abd70;
      expv[43] = 37'h00b5355eb8;
      expv[44] = 37'h005a9aaf5c;
      expv[45] = 37'h102d4d57ae;
      expv[46] = 37'h002d4d57ae;
      expv[47] = 37'h000000cef8;
      expv[48] = 37'h000000677c;
      expv[49] = 37'h00000033be;
      expv[50] = 37'h00000019df;
      expv[51] = 37'h0c251c0cef;
      expv[52] = 37'h0a37aa0677;
      expv[53] = 37'h0940f1033b;
      expv[54] = 37'h08c594819d;
      expv[55] = 37'h0887e640ce;
      expv[56] = 37'h0c43f32067;
      expv[57] = 37'h0a47159033;
      expv[58] = 37'h0948a6c819;
      expv[59] = 37'h08c96f640c;
      expv[60] = 37'h0c64b7b206;
      expv[61] = 37'h0e325bd903;
      expv[62] = 37'h0b3e49ec81;
      expv[63] = 37'h09c440f640;
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
