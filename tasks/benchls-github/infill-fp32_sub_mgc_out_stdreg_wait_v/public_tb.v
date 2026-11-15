// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  FP32_SUB_mgc_out_stdreg_wait_v1 dut (
    .ld(in_vec[9:9]),
    .d(in_vec[8:1]),
    .vz(in_vec[0:0]),
    .vd(out_vec[9:9]),
    .lz(out_vec[8:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h122;
    stim[1] = 10'h001;
    stim[2] = 10'h1d5;
    stim[3] = 10'h199;
    stim[4] = 10'h1d2;
    stim[5] = 10'h078;
    stim[6] = 10'h19d;
    stim[7] = 10'h319;
    stim[8] = 10'h094;
    stim[9] = 10'h284;
    stim[10] = 10'h010;
    stim[11] = 10'h00b;
    stim[12] = 10'h271;
    stim[13] = 10'h0e8;
    stim[14] = 10'h1ac;
    stim[15] = 10'h049;
    stim[16] = 10'h286;
    stim[17] = 10'h2e4;
    stim[18] = 10'h38d;
    stim[19] = 10'h073;
    stim[20] = 10'h101;
    stim[21] = 10'h26b;
    stim[22] = 10'h08e;
    stim[23] = 10'h2df;
    stim[24] = 10'h287;
    stim[25] = 10'h18b;
    stim[26] = 10'h229;
    stim[27] = 10'h1f7;
    stim[28] = 10'h1d2;
    stim[29] = 10'h1c8;
    stim[30] = 10'h380;
    stim[31] = 10'h2f1;
    stim[32] = 10'h3b0;
    stim[33] = 10'h035;
    stim[34] = 10'h061;
    stim[35] = 10'h2de;
    stim[36] = 10'h3d0;
    stim[37] = 10'h1c5;
    stim[38] = 10'h05e;
    stim[39] = 10'h3f1;
    stim[40] = 10'h1d9;
    stim[41] = 10'h35b;
    stim[42] = 10'h083;
    stim[43] = 10'h2c9;
    stim[44] = 10'h0ff;
    stim[45] = 10'h1e8;
    stim[46] = 10'h22a;
    stim[47] = 10'h2e6;
    stim[48] = 10'h1ce;
    stim[49] = 10'h0d8;
    stim[50] = 10'h05c;
    stim[51] = 10'h144;
    stim[52] = 10'h1df;
    stim[53] = 10'h31f;
    stim[54] = 10'h0b9;
    stim[55] = 10'h297;
    stim[56] = 10'h125;
    stim[57] = 10'h2a7;
    stim[58] = 10'h145;
    stim[59] = 10'h0cf;
    stim[60] = 10'h377;
    stim[61] = 10'h072;
    stim[62] = 10'h16b;
    stim[63] = 10'h1d7;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'h091;
      expv[1] = 10'h200;
      expv[2] = 10'h2ea;
      expv[3] = 10'h2cc;
      expv[4] = 10'h0e9;
      expv[5] = 10'h03c;
      expv[6] = 10'h2ce;
      expv[7] = 10'h38c;
      expv[8] = 10'h04a;
      expv[9] = 10'h142;
      expv[10] = 10'h008;
      expv[11] = 10'h205;
      expv[12] = 10'h338;
      expv[13] = 10'h074;
      expv[14] = 10'h0d6;
      expv[15] = 10'h224;
      expv[16] = 10'h143;
      expv[17] = 10'h172;
      expv[18] = 10'h3c6;
      expv[19] = 10'h239;
      expv[20] = 10'h280;
      expv[21] = 10'h335;
      expv[22] = 10'h047;
      expv[23] = 10'h36f;
      expv[24] = 10'h343;
      expv[25] = 10'h2c5;
      expv[26] = 10'h314;
      expv[27] = 10'h2fb;
      expv[28] = 10'h0e9;
      expv[29] = 10'h0e4;
      expv[30] = 10'h1c0;
      expv[31] = 10'h378;
      expv[32] = 10'h1d8;
      expv[33] = 10'h21a;
      expv[34] = 10'h230;
      expv[35] = 10'h16f;
      expv[36] = 10'h1e8;
      expv[37] = 10'h2e2;
      expv[38] = 10'h02f;
      expv[39] = 10'h3f8;
      expv[40] = 10'h2ec;
      expv[41] = 10'h3ad;
      expv[42] = 10'h241;
      expv[43] = 10'h364;
      expv[44] = 10'h27f;
      expv[45] = 10'h0f4;
      expv[46] = 10'h115;
      expv[47] = 10'h173;
      expv[48] = 10'h0e7;
      expv[49] = 10'h06c;
      expv[50] = 10'h02e;
      expv[51] = 10'h0a2;
      expv[52] = 10'h2ef;
      expv[53] = 10'h38f;
      expv[54] = 10'h25c;
      expv[55] = 10'h34b;
      expv[56] = 10'h292;
      expv[57] = 10'h353;
      expv[58] = 10'h2a2;
      expv[59] = 10'h267;
      expv[60] = 10'h3bb;
      expv[61] = 10'h039;
      expv[62] = 10'h2b5;
      expv[63] = 10'h2eb;
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
