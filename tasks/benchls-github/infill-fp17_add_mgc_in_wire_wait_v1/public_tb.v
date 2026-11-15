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

  FP17_ADD_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h189;
    stim[1] = 10'h220;
    stim[2] = 10'h089;
    stim[3] = 10'h34c;
    stim[4] = 10'h093;
    stim[5] = 10'h38d;
    stim[6] = 10'h105;
    stim[7] = 10'h064;
    stim[8] = 10'h0fa;
    stim[9] = 10'h2b9;
    stim[10] = 10'h2b2;
    stim[11] = 10'h1db;
    stim[12] = 10'h126;
    stim[13] = 10'h279;
    stim[14] = 10'h337;
    stim[15] = 10'h3c5;
    stim[16] = 10'h0fb;
    stim[17] = 10'h0f8;
    stim[18] = 10'h1e7;
    stim[19] = 10'h083;
    stim[20] = 10'h17a;
    stim[21] = 10'h2b5;
    stim[22] = 10'h217;
    stim[23] = 10'h0d5;
    stim[24] = 10'h10b;
    stim[25] = 10'h3aa;
    stim[26] = 10'h16c;
    stim[27] = 10'h03a;
    stim[28] = 10'h266;
    stim[29] = 10'h1bd;
    stim[30] = 10'h057;
    stim[31] = 10'h0ec;
    stim[32] = 10'h144;
    stim[33] = 10'h36a;
    stim[34] = 10'h042;
    stim[35] = 10'h26d;
    stim[36] = 10'h2d4;
    stim[37] = 10'h131;
    stim[38] = 10'h0de;
    stim[39] = 10'h322;
    stim[40] = 10'h0a5;
    stim[41] = 10'h0d2;
    stim[42] = 10'h10a;
    stim[43] = 10'h29f;
    stim[44] = 10'h01a;
    stim[45] = 10'h1f7;
    stim[46] = 10'h247;
    stim[47] = 10'h3ec;
    stim[48] = 10'h0ab;
    stim[49] = 10'h2e9;
    stim[50] = 10'h08c;
    stim[51] = 10'h017;
    stim[52] = 10'h059;
    stim[53] = 10'h0cb;
    stim[54] = 10'h3ef;
    stim[55] = 10'h1da;
    stim[56] = 10'h3f0;
    stim[57] = 10'h266;
    stim[58] = 10'h1d3;
    stim[59] = 10'h004;
    stim[60] = 10'h0e7;
    stim[61] = 10'h357;
    stim[62] = 10'h189;
    stim[63] = 10'h0a4;
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
      expv[0] = 10'h312;
      expv[1] = 10'h041;
      expv[2] = 10'h112;
      expv[3] = 10'h299;
      expv[4] = 10'h126;
      expv[5] = 10'h31b;
      expv[6] = 10'h20a;
      expv[7] = 10'h0c8;
      expv[8] = 10'h1f4;
      expv[9] = 10'h173;
      expv[10] = 10'h165;
      expv[11] = 10'h3b6;
      expv[12] = 10'h24c;
      expv[13] = 10'h0f3;
      expv[14] = 10'h26f;
      expv[15] = 10'h38b;
      expv[16] = 10'h1f6;
      expv[17] = 10'h1f0;
      expv[18] = 10'h3ce;
      expv[19] = 10'h106;
      expv[20] = 10'h2f4;
      expv[21] = 10'h16b;
      expv[22] = 10'h02f;
      expv[23] = 10'h1aa;
      expv[24] = 10'h216;
      expv[25] = 10'h355;
      expv[26] = 10'h2d8;
      expv[27] = 10'h074;
      expv[28] = 10'h0cd;
      expv[29] = 10'h37a;
      expv[30] = 10'h0ae;
      expv[31] = 10'h1d8;
      expv[32] = 10'h288;
      expv[33] = 10'h2d5;
      expv[34] = 10'h084;
      expv[35] = 10'h0db;
      expv[36] = 10'h1a9;
      expv[37] = 10'h262;
      expv[38] = 10'h1bc;
      expv[39] = 10'h245;
      expv[40] = 10'h14a;
      expv[41] = 10'h1a4;
      expv[42] = 10'h214;
      expv[43] = 10'h13f;
      expv[44] = 10'h034;
      expv[45] = 10'h3ee;
      expv[46] = 10'h08f;
      expv[47] = 10'h3d9;
      expv[48] = 10'h156;
      expv[49] = 10'h1d3;
      expv[50] = 10'h118;
      expv[51] = 10'h02e;
      expv[52] = 10'h0b2;
      expv[53] = 10'h196;
      expv[54] = 10'h3df;
      expv[55] = 10'h3b4;
      expv[56] = 10'h3e1;
      expv[57] = 10'h0cd;
      expv[58] = 10'h3a6;
      expv[59] = 10'h008;
      expv[60] = 10'h1ce;
      expv[61] = 10'h2af;
      expv[62] = 10'h312;
      expv[63] = 10'h148;
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
