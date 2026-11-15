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

  FP32_ADD_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h191;
    stim[1] = 10'h0c3;
    stim[2] = 10'h19a;
    stim[3] = 10'h0ff;
    stim[4] = 10'h121;
    stim[5] = 10'h249;
    stim[6] = 10'h0a0;
    stim[7] = 10'h26e;
    stim[8] = 10'h0d4;
    stim[9] = 10'h27d;
    stim[10] = 10'h184;
    stim[11] = 10'h37f;
    stim[12] = 10'h3ae;
    stim[13] = 10'h336;
    stim[14] = 10'h0e3;
    stim[15] = 10'h290;
    stim[16] = 10'h0b2;
    stim[17] = 10'h0a0;
    stim[18] = 10'h210;
    stim[19] = 10'h07e;
    stim[20] = 10'h159;
    stim[21] = 10'h2ac;
    stim[22] = 10'h274;
    stim[23] = 10'h34d;
    stim[24] = 10'h1a7;
    stim[25] = 10'h2cc;
    stim[26] = 10'h075;
    stim[27] = 10'h2da;
    stim[28] = 10'h193;
    stim[29] = 10'h3f7;
    stim[30] = 10'h08f;
    stim[31] = 10'h0b2;
    stim[32] = 10'h078;
    stim[33] = 10'h34b;
    stim[34] = 10'h3b0;
    stim[35] = 10'h11c;
    stim[36] = 10'h20f;
    stim[37] = 10'h022;
    stim[38] = 10'h0d7;
    stim[39] = 10'h0f7;
    stim[40] = 10'h32b;
    stim[41] = 10'h10a;
    stim[42] = 10'h1a4;
    stim[43] = 10'h0ef;
    stim[44] = 10'h269;
    stim[45] = 10'h2d5;
    stim[46] = 10'h056;
    stim[47] = 10'h21c;
    stim[48] = 10'h360;
    stim[49] = 10'h0b7;
    stim[50] = 10'h181;
    stim[51] = 10'h099;
    stim[52] = 10'h1a2;
    stim[53] = 10'h3f7;
    stim[54] = 10'h265;
    stim[55] = 10'h0b2;
    stim[56] = 10'h1f3;
    stim[57] = 10'h172;
    stim[58] = 10'h11f;
    stim[59] = 10'h043;
    stim[60] = 10'h02d;
    stim[61] = 10'h2ad;
    stim[62] = 10'h25d;
    stim[63] = 10'h050;
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
      expv[0] = 10'h2c8;
      expv[1] = 10'h261;
      expv[2] = 10'h0cd;
      expv[3] = 10'h27f;
      expv[4] = 10'h290;
      expv[5] = 10'h324;
      expv[6] = 10'h050;
      expv[7] = 10'h137;
      expv[8] = 10'h06a;
      expv[9] = 10'h33e;
      expv[10] = 10'h0c2;
      expv[11] = 10'h3bf;
      expv[12] = 10'h1d7;
      expv[13] = 10'h19b;
      expv[14] = 10'h271;
      expv[15] = 10'h148;
      expv[16] = 10'h059;
      expv[17] = 10'h050;
      expv[18] = 10'h108;
      expv[19] = 10'h03f;
      expv[20] = 10'h2ac;
      expv[21] = 10'h156;
      expv[22] = 10'h13a;
      expv[23] = 10'h3a6;
      expv[24] = 10'h2d3;
      expv[25] = 10'h166;
      expv[26] = 10'h23a;
      expv[27] = 10'h16d;
      expv[28] = 10'h2c9;
      expv[29] = 10'h3fb;
      expv[30] = 10'h247;
      expv[31] = 10'h059;
      expv[32] = 10'h03c;
      expv[33] = 10'h3a5;
      expv[34] = 10'h1d8;
      expv[35] = 10'h08e;
      expv[36] = 10'h307;
      expv[37] = 10'h011;
      expv[38] = 10'h26b;
      expv[39] = 10'h27b;
      expv[40] = 10'h395;
      expv[41] = 10'h085;
      expv[42] = 10'h0d2;
      expv[43] = 10'h277;
      expv[44] = 10'h334;
      expv[45] = 10'h36a;
      expv[46] = 10'h02b;
      expv[47] = 10'h10e;
      expv[48] = 10'h1b0;
      expv[49] = 10'h25b;
      expv[50] = 10'h2c0;
      expv[51] = 10'h24c;
      expv[52] = 10'h0d1;
      expv[53] = 10'h3fb;
      expv[54] = 10'h332;
      expv[55] = 10'h059;
      expv[56] = 10'h2f9;
      expv[57] = 10'h0b9;
      expv[58] = 10'h28f;
      expv[59] = 10'h221;
      expv[60] = 10'h216;
      expv[61] = 10'h356;
      expv[62] = 10'h32e;
      expv[63] = 10'h028;
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
