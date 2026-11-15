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

  CDMA_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h0b6;
    stim[1] = 10'h271;
    stim[2] = 10'h396;
    stim[3] = 10'h028;
    stim[4] = 10'h292;
    stim[5] = 10'h069;
    stim[6] = 10'h211;
    stim[7] = 10'h1d9;
    stim[8] = 10'h26e;
    stim[9] = 10'h28e;
    stim[10] = 10'h092;
    stim[11] = 10'h055;
    stim[12] = 10'h162;
    stim[13] = 10'h229;
    stim[14] = 10'h20d;
    stim[15] = 10'h3ee;
    stim[16] = 10'h39e;
    stim[17] = 10'h0ab;
    stim[18] = 10'h31b;
    stim[19] = 10'h3f4;
    stim[20] = 10'h16b;
    stim[21] = 10'h1ef;
    stim[22] = 10'h264;
    stim[23] = 10'h1b4;
    stim[24] = 10'h138;
    stim[25] = 10'h1a3;
    stim[26] = 10'h0b6;
    stim[27] = 10'h06d;
    stim[28] = 10'h33f;
    stim[29] = 10'h2d6;
    stim[30] = 10'h1b5;
    stim[31] = 10'h390;
    stim[32] = 10'h389;
    stim[33] = 10'h026;
    stim[34] = 10'h30e;
    stim[35] = 10'h19d;
    stim[36] = 10'h220;
    stim[37] = 10'h133;
    stim[38] = 10'h265;
    stim[39] = 10'h34d;
    stim[40] = 10'h03e;
    stim[41] = 10'h1be;
    stim[42] = 10'h017;
    stim[43] = 10'h23d;
    stim[44] = 10'h03d;
    stim[45] = 10'h2b4;
    stim[46] = 10'h23c;
    stim[47] = 10'h35c;
    stim[48] = 10'h334;
    stim[49] = 10'h201;
    stim[50] = 10'h31d;
    stim[51] = 10'h107;
    stim[52] = 10'h3bd;
    stim[53] = 10'h137;
    stim[54] = 10'h175;
    stim[55] = 10'h036;
    stim[56] = 10'h10e;
    stim[57] = 10'h041;
    stim[58] = 10'h320;
    stim[59] = 10'h384;
    stim[60] = 10'h3da;
    stim[61] = 10'h00a;
    stim[62] = 10'h290;
    stim[63] = 10'h20a;
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
      expv[0] = 10'h05b;
      expv[1] = 10'h338;
      expv[2] = 10'h1cb;
      expv[3] = 10'h014;
      expv[4] = 10'h149;
      expv[5] = 10'h234;
      expv[6] = 10'h308;
      expv[7] = 10'h2ec;
      expv[8] = 10'h137;
      expv[9] = 10'h147;
      expv[10] = 10'h049;
      expv[11] = 10'h22a;
      expv[12] = 10'h0b1;
      expv[13] = 10'h314;
      expv[14] = 10'h306;
      expv[15] = 10'h1f7;
      expv[16] = 10'h1cf;
      expv[17] = 10'h255;
      expv[18] = 10'h38d;
      expv[19] = 10'h1fa;
      expv[20] = 10'h2b5;
      expv[21] = 10'h2f7;
      expv[22] = 10'h132;
      expv[23] = 10'h0da;
      expv[24] = 10'h09c;
      expv[25] = 10'h2d1;
      expv[26] = 10'h05b;
      expv[27] = 10'h236;
      expv[28] = 10'h39f;
      expv[29] = 10'h16b;
      expv[30] = 10'h2da;
      expv[31] = 10'h1c8;
      expv[32] = 10'h3c4;
      expv[33] = 10'h013;
      expv[34] = 10'h187;
      expv[35] = 10'h2ce;
      expv[36] = 10'h110;
      expv[37] = 10'h299;
      expv[38] = 10'h332;
      expv[39] = 10'h3a6;
      expv[40] = 10'h01f;
      expv[41] = 10'h0df;
      expv[42] = 10'h20b;
      expv[43] = 10'h31e;
      expv[44] = 10'h21e;
      expv[45] = 10'h15a;
      expv[46] = 10'h11e;
      expv[47] = 10'h1ae;
      expv[48] = 10'h19a;
      expv[49] = 10'h300;
      expv[50] = 10'h38e;
      expv[51] = 10'h283;
      expv[52] = 10'h3de;
      expv[53] = 10'h29b;
      expv[54] = 10'h2ba;
      expv[55] = 10'h01b;
      expv[56] = 10'h087;
      expv[57] = 10'h220;
      expv[58] = 10'h190;
      expv[59] = 10'h1c2;
      expv[60] = 10'h1ed;
      expv[61] = 10'h005;
      expv[62] = 10'h148;
      expv[63] = 10'h105;
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
