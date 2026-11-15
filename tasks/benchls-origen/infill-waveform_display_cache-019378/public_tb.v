// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019378 dut (
    .CLK_SMP(clk),
    .EN_H(in_vec[61:61]),
    .EN_V(in_vec[60:60]),
    .PIX_H(in_vec[59:50]),
    .PIX_V(in_vec[49:41]),
    .WAVE_DATA(in_vec[40:29]),
    .ZOOM_CNT(in_vec[28:13]),
    .WAV_COLOR(in_vec[12:1]),
    .PAUSE(in_vec[0:0]),
    .LAYER_WAV(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h01ea7b876c6bcbd0;
    stim[1] = 62'h0ef636e4f3e30103;
    stim[2] = 62'h173a6953773622b1;
    stim[3] = 62'h15558730673122bb;
    stim[4] = 62'h08f21eb7ea4aad1c;
    stim[5] = 62'h21261ed5068dbbbf;
    stim[6] = 62'h05ba63b9af196dc1;
    stim[7] = 62'h3292c2493946cc85;
    stim[8] = 62'h377947a263fd13dc;
    stim[9] = 62'h19d9c7ed83b49bcf;
    stim[10] = 62'h08cb84c15cb2c3e6;
    stim[11] = 62'h022a1bf051403722;
    stim[12] = 62'h0c29bbd40281f82d;
    stim[13] = 62'h2480714b635dcf7b;
    stim[14] = 62'h3ff376c943a7e411;
    stim[15] = 62'h074716862808b558;
    stim[16] = 62'h3f8636f8aab89fe7;
    stim[17] = 62'h3c6ec05541a61434;
    stim[18] = 62'h066c9170c0880c69;
    stim[19] = 62'h0e54913effe350d1;
    stim[20] = 62'h283a637c4c52d5f8;
    stim[21] = 62'h3553a5068d17e435;
    stim[22] = 62'h128952742889f2ff;
    stim[23] = 62'h2d4495198ed64b23;
    stim[24] = 62'h0d2ece5895bbfc6a;
    stim[25] = 62'h24fbba636b1d519f;
    stim[26] = 62'h2f0e651e7227645a;
    stim[27] = 62'h27d0d26e254fe637;
    stim[28] = 62'h22d85cb9c62c2baa;
    stim[29] = 62'h39460181dcf17053;
    stim[30] = 62'h3328f6d6266a0697;
    stim[31] = 62'h289f6073009f1fcd;
    stim[32] = 62'h18204dd495f9f5f2;
    stim[33] = 62'h1adbcbdac75bc3a0;
    stim[34] = 62'h3e7f362c3d4bcc59;
    stim[35] = 62'h3f52043bb141b9d0;
    stim[36] = 62'h1f51e5e75c68ff09;
    stim[37] = 62'h037e054c08b41de2;
    stim[38] = 62'h09d53cdd2931d008;
    stim[39] = 62'h322f0ac02e420373;
    stim[40] = 62'h1e01929dfe3a633d;
    stim[41] = 62'h3d58f3f8bd585202;
    stim[42] = 62'h24af4804cd4215df;
    stim[43] = 62'h264006c1bce4127d;
    stim[44] = 62'h034de8a44758c684;
    stim[45] = 62'h22ef02c7b2eec0b5;
    stim[46] = 62'h3731d5228969d6c6;
    stim[47] = 62'h3482a99c929a4b65;
    stim[48] = 62'h0cee27a886af5e48;
    stim[49] = 62'h12fe75c9c10367dc;
    stim[50] = 62'h1bcd57a9fa43eab9;
    stim[51] = 62'h2d3854701685d69f;
    stim[52] = 62'h04dd0127f6e9d25a;
    stim[53] = 62'h1b963fca5ee50477;
    stim[54] = 62'h0a3e6be3a17289a9;
    stim[55] = 62'h0adb263942cb8b11;
    stim[56] = 62'h18f89e6b26096a69;
    stim[57] = 62'h369279b3570a4673;
    stim[58] = 62'h1e525dd3b49f5d5a;
    stim[59] = 62'h3cfc3688a444bb29;
    stim[60] = 62'h1426dcbe9e0b6282;
    stim[61] = 62'h090fd84c59625c30;
    stim[62] = 62'h27a62eb7667a84ef;
    stim[63] = 62'h2198f118f618c2d8;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
