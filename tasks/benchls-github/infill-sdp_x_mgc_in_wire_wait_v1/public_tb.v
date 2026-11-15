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

  SDP_X_mgc_in_wire_wait_v1 dut (
    .ld(in_vec[9:9]),
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .d(out_vec[8:1]),
    .lz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h02c;
    stim[1] = 10'h037;
    stim[2] = 10'h08f;
    stim[3] = 10'h074;
    stim[4] = 10'h199;
    stim[5] = 10'h1c8;
    stim[6] = 10'h0e8;
    stim[7] = 10'h33d;
    stim[8] = 10'h379;
    stim[9] = 10'h060;
    stim[10] = 10'h1b5;
    stim[11] = 10'h296;
    stim[12] = 10'h042;
    stim[13] = 10'h26f;
    stim[14] = 10'h172;
    stim[15] = 10'h3db;
    stim[16] = 10'h1d9;
    stim[17] = 10'h079;
    stim[18] = 10'h0f7;
    stim[19] = 10'h069;
    stim[20] = 10'h24e;
    stim[21] = 10'h315;
    stim[22] = 10'h130;
    stim[23] = 10'h1d6;
    stim[24] = 10'h33c;
    stim[25] = 10'h0aa;
    stim[26] = 10'h0de;
    stim[27] = 10'h039;
    stim[28] = 10'h23d;
    stim[29] = 10'h1b9;
    stim[30] = 10'h3c6;
    stim[31] = 10'h11e;
    stim[32] = 10'h2e0;
    stim[33] = 10'h0f4;
    stim[34] = 10'h037;
    stim[35] = 10'h1d7;
    stim[36] = 10'h160;
    stim[37] = 10'h1a4;
    stim[38] = 10'h0cd;
    stim[39] = 10'h0c3;
    stim[40] = 10'h01b;
    stim[41] = 10'h0f7;
    stim[42] = 10'h21d;
    stim[43] = 10'h1e2;
    stim[44] = 10'h274;
    stim[45] = 10'h36f;
    stim[46] = 10'h35e;
    stim[47] = 10'h194;
    stim[48] = 10'h2b2;
    stim[49] = 10'h11b;
    stim[50] = 10'h132;
    stim[51] = 10'h249;
    stim[52] = 10'h0b6;
    stim[53] = 10'h043;
    stim[54] = 10'h032;
    stim[55] = 10'h128;
    stim[56] = 10'h24f;
    stim[57] = 10'h084;
    stim[58] = 10'h2dd;
    stim[59] = 10'h183;
    stim[60] = 10'h34c;
    stim[61] = 10'h0ff;
    stim[62] = 10'h0b4;
    stim[63] = 10'h29b;
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
      expv[0] = 10'h058;
      expv[1] = 10'h06e;
      expv[2] = 10'h11e;
      expv[3] = 10'h0e8;
      expv[4] = 10'h332;
      expv[5] = 10'h390;
      expv[6] = 10'h1d0;
      expv[7] = 10'h27b;
      expv[8] = 10'h2f3;
      expv[9] = 10'h0c0;
      expv[10] = 10'h36a;
      expv[11] = 10'h12d;
      expv[12] = 10'h084;
      expv[13] = 10'h0df;
      expv[14] = 10'h2e4;
      expv[15] = 10'h3b7;
      expv[16] = 10'h3b2;
      expv[17] = 10'h0f2;
      expv[18] = 10'h1ee;
      expv[19] = 10'h0d2;
      expv[20] = 10'h09d;
      expv[21] = 10'h22b;
      expv[22] = 10'h260;
      expv[23] = 10'h3ac;
      expv[24] = 10'h279;
      expv[25] = 10'h154;
      expv[26] = 10'h1bc;
      expv[27] = 10'h072;
      expv[28] = 10'h07b;
      expv[29] = 10'h372;
      expv[30] = 10'h38d;
      expv[31] = 10'h23c;
      expv[32] = 10'h1c1;
      expv[33] = 10'h1e8;
      expv[34] = 10'h06e;
      expv[35] = 10'h3ae;
      expv[36] = 10'h2c0;
      expv[37] = 10'h348;
      expv[38] = 10'h19a;
      expv[39] = 10'h186;
      expv[40] = 10'h036;
      expv[41] = 10'h1ee;
      expv[42] = 10'h03b;
      expv[43] = 10'h3c4;
      expv[44] = 10'h0e9;
      expv[45] = 10'h2df;
      expv[46] = 10'h2bd;
      expv[47] = 10'h328;
      expv[48] = 10'h165;
      expv[49] = 10'h236;
      expv[50] = 10'h264;
      expv[51] = 10'h093;
      expv[52] = 10'h16c;
      expv[53] = 10'h086;
      expv[54] = 10'h064;
      expv[55] = 10'h250;
      expv[56] = 10'h09f;
      expv[57] = 10'h108;
      expv[58] = 10'h1bb;
      expv[59] = 10'h306;
      expv[60] = 10'h299;
      expv[61] = 10'h1fe;
      expv[62] = 10'h168;
      expv[63] = 10'h137;
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
