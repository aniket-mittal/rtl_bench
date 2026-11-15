// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00206 dut (
    .sclk(clk),
    .wen(in_vec[20:20]),
    .di(in_vec[19:4]),
    .frame_sync(in_vec[3:3]),
    .is_compressing(in_vec[2:2]),
    .compressor_done(in_vec[1:1]),
    .fifo_empty(in_vec[0:0]),
    .irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1fbe25;
    stim[1] = 21'h0e8357;
    stim[2] = 21'h0ed152;
    stim[3] = 21'h155c48;
    stim[4] = 21'h109074;
    stim[5] = 21'h0b06fa;
    stim[6] = 21'h110443;
    stim[7] = 21'h18e8d5;
    stim[8] = 21'h0c8a4e;
    stim[9] = 21'h1cd62b;
    stim[10] = 21'h164482;
    stim[11] = 21'h1dbabd;
    stim[12] = 21'h140d6b;
    stim[13] = 21'h18398a;
    stim[14] = 21'h083b04;
    stim[15] = 21'h09fe07;
    stim[16] = 21'h095ff2;
    stim[17] = 21'h19e9ec;
    stim[18] = 21'h0bc166;
    stim[19] = 21'h13f340;
    stim[20] = 21'h1b0d53;
    stim[21] = 21'h0227b8;
    stim[22] = 21'h004731;
    stim[23] = 21'h0c9022;
    stim[24] = 21'h199ade;
    stim[25] = 21'h1403c3;
    stim[26] = 21'h15a3da;
    stim[27] = 21'h0a451f;
    stim[28] = 21'h03136d;
    stim[29] = 21'h1c267c;
    stim[30] = 21'h089450;
    stim[31] = 21'h1e99ec;
    stim[32] = 21'h0d056d;
    stim[33] = 21'h1f0fbf;
    stim[34] = 21'h02728a;
    stim[35] = 21'h1bac94;
    stim[36] = 21'h0716f5;
    stim[37] = 21'h0535e8;
    stim[38] = 21'h06d3cf;
    stim[39] = 21'h11782f;
    stim[40] = 21'h0320e3;
    stim[41] = 21'h07f54d;
    stim[42] = 21'h15bd75;
    stim[43] = 21'h180d88;
    stim[44] = 21'h07bff9;
    stim[45] = 21'h17e523;
    stim[46] = 21'h1a8a1f;
    stim[47] = 21'h141c6f;
    stim[48] = 21'h017f83;
    stim[49] = 21'h0f884a;
    stim[50] = 21'h099431;
    stim[51] = 21'h08037c;
    stim[52] = 21'h1d53a2;
    stim[53] = 21'h172977;
    stim[54] = 21'h0dc9c6;
    stim[55] = 21'h1ba5de;
    stim[56] = 21'h0574a3;
    stim[57] = 21'h164dad;
    stim[58] = 21'h052831;
    stim[59] = 21'h15c08f;
    stim[60] = 21'h04a824;
    stim[61] = 21'h11270d;
    stim[62] = 21'h0e3398;
    stim[63] = 21'h05c08e;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'hx;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'hx;
      expv[8] = 1'hx;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
