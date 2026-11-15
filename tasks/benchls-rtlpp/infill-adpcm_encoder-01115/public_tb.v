// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01115 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[63:60]),
    .p_out(out_vec[59:44]),
    .p_underflow(out_vec[43:43]),
    .p_overflow(out_vec[42:42]),
    .i_out(out_vec[41:34]),
    .i_underflow(out_vec[33:33]),
    .i_overflow(out_vec[32:32]),
    .err(out_vec[31:16]),
    .sz_out(out_vec[15:1]),
    .s_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1ffc2;
    stim[1] = 17'h16ba6;
    stim[2] = 17'h0fb94;
    stim[3] = 17'h06083;
    stim[4] = 17'h0002a;
    stim[5] = 17'h01536;
    stim[6] = 17'h0cd46;
    stim[7] = 17'h080a1;
    stim[8] = 17'h0bbe2;
    stim[9] = 17'h0ea89;
    stim[10] = 17'h0f7cf;
    stim[11] = 17'h0c595;
    stim[12] = 17'h0fcb4;
    stim[13] = 17'h05cf9;
    stim[14] = 17'h19128;
    stim[15] = 17'h03588;
    stim[16] = 17'h00ca1;
    stim[17] = 17'h05e95;
    stim[18] = 17'h1c088;
    stim[19] = 17'h0dbd5;
    stim[20] = 17'h0c223;
    stim[21] = 17'h07b52;
    stim[22] = 17'h097a6;
    stim[23] = 17'h07610;
    stim[24] = 17'h0742d;
    stim[25] = 17'h0b0cf;
    stim[26] = 17'h0c2fa;
    stim[27] = 17'h0af8c;
    stim[28] = 17'h05290;
    stim[29] = 17'h0606d;
    stim[30] = 17'h0d3a9;
    stim[31] = 17'h0cfbe;
    stim[32] = 17'h00774;
    stim[33] = 17'h035fb;
    stim[34] = 17'h0b6cd;
    stim[35] = 17'h058f5;
    stim[36] = 17'h01731;
    stim[37] = 17'h06988;
    stim[38] = 17'h03122;
    stim[39] = 17'h0d6a9;
    stim[40] = 17'h0020c;
    stim[41] = 17'h0a1a2;
    stim[42] = 17'h001a3;
    stim[43] = 17'h04751;
    stim[44] = 17'h0a129;
    stim[45] = 17'h001e0;
    stim[46] = 17'h06015;
    stim[47] = 17'h0e390;
    stim[48] = 17'h0f20d;
    stim[49] = 17'h0b278;
    stim[50] = 17'h0045b;
    stim[51] = 17'h09cb1;
    stim[52] = 17'h02811;
    stim[53] = 17'h00396;
    stim[54] = 17'h07308;
    stim[55] = 17'h011a9;
    stim[56] = 17'h0299d;
    stim[57] = 17'h02169;
    stim[58] = 17'h072bf;
    stim[59] = 17'h090eb;
    stim[60] = 17'h074ee;
    stim[61] = 17'h0cca7;
    stim[62] = 17'h03f71;
    stim[63] = 17'h01a15;
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
      expv[0] = 64'h7000000000000000;
      expv[1] = 64'h7000000000000000;
      expv[2] = 64'h7000000000000000;
      expv[3] = 64'hf000002000000021;
      expv[4] = 64'h7ffe2040fbb20044;
      expv[5] = 64'h0002106060620092;
      expv[6] = 64'h7002a05c00000084;
      expv[7] = 64'hf00a507c1491011f;
      expv[8] = 64'hfff9b09ccdab0267;
      expv[9] = 64'hffd5d0bc83440525;
      expv[10] = 64'hff88c0dcc3560b07;
      expv[11] = 64'h3ee380fcfc5117a0;
      expv[12] = 64'hff88e0f8ff41157b;
      expv[13] = 64'h4e46d118e1282e0c;
      expv[14] = 64'h7000000000000000;
      expv[15] = 64'h7000000000000000;
      expv[16] = 64'h7000002000000020;
      expv[17] = 64'h7001e040356a0044;
      expv[18] = 64'h7000000000000000;
      expv[19] = 64'h7000000000000000;
      expv[20] = 64'hf000002000000021;
      expv[21] = 64'hfffe2040dbf30045;
      expv[22] = 64'h7ffa3060c2800092;
      expv[23] = 64'hf002b0807b27013b;
      expv[24] = 64'h7ff060a098a002a2;
      expv[25] = 64'h7017d0c0749305a8;
      expv[26] = 64'hf06ca0e06d630c21;
      expv[27] = 64'hffb6c100b56319ff;
      expv[28] = 64'hfe310120dfea37b9;
      expv[29] = 64'h7aed414000b87772;
      expv[30] = 64'h21ece16033c2fffe;
      expv[31] = 64'hd6ecc55df1a1e8c5;
      expv[32] = 64'hd7fff56153aaffff;
      expv[33] = 64'hb7fff1604fbfffff;
      expv[34] = 64'h1100215cf772e8c4;
      expv[35] = 64'hd3ba6559fa55d39d;
      expv[36] = 64'h97fff16036ceffff;
      expv[37] = 64'h9500115c08f4e8c5;
      expv[38] = 64'h2245d158f2d4d39c;
      expv[39] = 64'ha667d154030bc05f;
      expv[40] = 64'hb2a6115006c1aee3;
      expv[41] = 64'h1dddf14cf8ca9efc;
      expv[42] = 64'hcfbad148065f9089;
      expv[43] = 64'h3aa61150f741aee2;
      expv[44] = 64'h4f6e314c0ac09efc;
      expv[45] = 64'hf5050555f701c05f;
      expv[46] = 64'hb7fff160212affff;
      expv[47] = 64'h2100215cf1dee8c4;
      expv[48] = 64'hc58bf1580756d39d;
      expv[49] = 64'h0e1b816001d8fffe;
      expv[50] = 64'haf1b715c0056e8c5;
      expv[51] = 64'h3a8fa158097ed39c;
      expv[52] = 64'hc058d154fecec05f;
      expv[53] = 64'h4995995d0358e8c4;
      expv[54] = 64'h48000961a811fffe;
      expv[55] = 64'h780009618396fffe;
      expv[56] = 64'h48000961f308fffe;
      expv[57] = 64'h5800096191a9fffe;
      expv[58] = 64'h58000961a99dfffe;
      expv[59] = 64'h78000961a169fffe;
      expv[60] = 64'h08000160f2bffffe;
      expv[61] = 64'h78fff95d00ece8c4;
      expv[62] = 64'h28000160f4eefffe;
      expv[63] = 64'h3cffe15cfca9e8c4;
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
