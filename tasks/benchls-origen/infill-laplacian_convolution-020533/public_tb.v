// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020533 dut (
    .i_clk(clk),
    .i_pixel_data(in_vec[72:1]),
    .i_pixel_data_valid(in_vec[0:0]),
    .o_convolved_data(out_vec[8:1]),
    .o_convolved_data_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h0b01d9c58fd41263486;
    stim[1] = 73'h03c25a306480b550fdc;
    stim[2] = 73'h18c9b540551f5e18bf0;
    stim[3] = 73'h1b35fdfdef5bae192ce;
    stim[4] = 73'h052708cce98d5f24f5d;
    stim[5] = 73'h0319dd1fb855a56fb50;
    stim[6] = 73'h01815685cf2fb6d553f;
    stim[7] = 73'h16d443a64ef31d888be;
    stim[8] = 73'h089d56a2f0986cdfc48;
    stim[9] = 73'h1eb554d16af9abd6b75;
    stim[10] = 73'h1130145cbcda2762815;
    stim[11] = 73'h145f0eec92852c55728;
    stim[12] = 73'h07a6a5720ceb650ceb1;
    stim[13] = 73'h1adc32ac3e2ec36ba0e;
    stim[14] = 73'h145f7b8aba085e11c16;
    stim[15] = 73'h13ebec18b50c9627ff5;
    stim[16] = 73'h162aefe2077c15fa151;
    stim[17] = 73'h0f0ed5519ad9eae80d2;
    stim[18] = 73'h0aaadce036688464432;
    stim[19] = 73'h12ad2a53484728180c4;
    stim[20] = 73'h1c54074a927e47997f0;
    stim[21] = 73'h12283191ad6d3c3a48c;
    stim[22] = 73'h035096b8546abe75f2f;
    stim[23] = 73'h198be2c50da01cf2a78;
    stim[24] = 73'h0a79646667b7bd36812;
    stim[25] = 73'h18bef90067285eb0fde;
    stim[26] = 73'h17854a912e68250ff10;
    stim[27] = 73'h00dd8acd8fa895117d6;
    stim[28] = 73'h140aa6cf400c3b31d21;
    stim[29] = 73'h185d2b771851a2670c9;
    stim[30] = 73'h0d465e848eceafe11b5;
    stim[31] = 73'h0a4658f1a8e5a3ecb3c;
    stim[32] = 73'h10a6c3f2ec18343efab;
    stim[33] = 73'h07c2bc5937e69b1d165;
    stim[34] = 73'h0548ccea9ac977ff684;
    stim[35] = 73'h1c963ab3adea59ea342;
    stim[36] = 73'h1e8f9122b3e48f719c2;
    stim[37] = 73'h0840f946009aaa328ed;
    stim[38] = 73'h0806da45afde50bdd72;
    stim[39] = 73'h05a3b31a14e6dcbff57;
    stim[40] = 73'h0c45d4456abb5ce5464;
    stim[41] = 73'h1a7b139ed700f2750fd;
    stim[42] = 73'h07e95a70ddda5843b28;
    stim[43] = 73'h1c400a7c1ab489096a3;
    stim[44] = 73'h185c9a709b6a993d7f1;
    stim[45] = 73'h19ab4f16e04ab951211;
    stim[46] = 73'h1f2d11af063b5098e85;
    stim[47] = 73'h0d31ae98776ccacf0e0;
    stim[48] = 73'h08a1a72310fa2995349;
    stim[49] = 73'h1867709c2bfc9c70fcc;
    stim[50] = 73'h1cf1b9f34256e060632;
    stim[51] = 73'h1e49f6c0b038f32ca64;
    stim[52] = 73'h0f6e89a209bd7b38374;
    stim[53] = 73'h1cef9236575ee572f9d;
    stim[54] = 73'h0d091f390809ee676a5;
    stim[55] = 73'h12677a0e8f8063b151e;
    stim[56] = 73'h05884cb5a6b4ad18798;
    stim[57] = 73'h1369e5cc4cd7141e8ac;
    stim[58] = 73'h189c9ddf5c0689bf3eb;
    stim[59] = 73'h06b651697dbb0cb722a;
    stim[60] = 73'h0d111d85c6ce025163d;
    stim[61] = 73'h18a0517b370591d896e;
    stim[62] = 73'h09496ef34286229b7e4;
    stim[63] = 73'h0ed614e040db15f7e79;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'h1fe;
      expv[6] = 9'h1fe;
      expv[7] = 9'h1fe;
      expv[8] = 9'h1ff;
      expv[9] = 9'h1fe;
      expv[10] = 9'h1ff;
      expv[11] = 9'h1fe;
      expv[12] = 9'h1fe;
      expv[13] = 9'h1ff;
      expv[14] = 9'h1ff;
      expv[15] = 9'h1fe;
      expv[16] = 9'h1ff;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1fe;
      expv[19] = 9'h1ff;
      expv[20] = 9'h1ff;
      expv[21] = 9'h1fe;
      expv[22] = 9'h1fe;
      expv[23] = 9'h1fe;
      expv[24] = 9'h1fe;
      expv[25] = 9'h1fe;
      expv[26] = 9'h1ff;
      expv[27] = 9'h1fe;
      expv[28] = 9'h1fe;
      expv[29] = 9'h1fe;
      expv[30] = 9'h1fe;
      expv[31] = 9'h1fe;
      expv[32] = 9'h1ff;
      expv[33] = 9'h001;
      expv[34] = 9'h1ff;
      expv[35] = 9'h1fe;
      expv[36] = 9'h1ff;
      expv[37] = 9'h1ff;
      expv[38] = 9'h1fe;
      expv[39] = 9'h1fe;
      expv[40] = 9'h1fe;
      expv[41] = 9'h1ff;
      expv[42] = 9'h1fe;
      expv[43] = 9'h1ff;
      expv[44] = 9'h1fe;
      expv[45] = 9'h1ff;
      expv[46] = 9'h1fe;
      expv[47] = 9'h1ff;
      expv[48] = 9'h1ff;
      expv[49] = 9'h1ff;
      expv[50] = 9'h001;
      expv[51] = 9'h1fe;
      expv[52] = 9'h1ff;
      expv[53] = 9'h1fe;
      expv[54] = 9'h1fe;
      expv[55] = 9'h1fe;
      expv[56] = 9'h1fe;
      expv[57] = 9'h1ff;
      expv[58] = 9'h1ff;
      expv[59] = 9'h1fe;
      expv[60] = 9'h1fe;
      expv[61] = 9'h1fe;
      expv[62] = 9'h1ff;
      expv[63] = 9'h1fe;
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
