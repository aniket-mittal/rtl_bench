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

  SDP_Y_CORE_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h375;
    stim[1] = 10'h05f;
    stim[2] = 10'h20b;
    stim[3] = 10'h145;
    stim[4] = 10'h345;
    stim[5] = 10'h0f0;
    stim[6] = 10'h188;
    stim[7] = 10'h3b6;
    stim[8] = 10'h0d1;
    stim[9] = 10'h2d6;
    stim[10] = 10'h2e1;
    stim[11] = 10'h1d0;
    stim[12] = 10'h22c;
    stim[13] = 10'h37d;
    stim[14] = 10'h3ed;
    stim[15] = 10'h1ee;
    stim[16] = 10'h050;
    stim[17] = 10'h162;
    stim[18] = 10'h2dd;
    stim[19] = 10'h227;
    stim[20] = 10'h323;
    stim[21] = 10'h0a5;
    stim[22] = 10'h22a;
    stim[23] = 10'h255;
    stim[24] = 10'h0cf;
    stim[25] = 10'h3b0;
    stim[26] = 10'h0e0;
    stim[27] = 10'h2e4;
    stim[28] = 10'h3c0;
    stim[29] = 10'h242;
    stim[30] = 10'h2a0;
    stim[31] = 10'h35b;
    stim[32] = 10'h03b;
    stim[33] = 10'h2c2;
    stim[34] = 10'h1db;
    stim[35] = 10'h32d;
    stim[36] = 10'h268;
    stim[37] = 10'h2e2;
    stim[38] = 10'h2db;
    stim[39] = 10'h019;
    stim[40] = 10'h1f0;
    stim[41] = 10'h0aa;
    stim[42] = 10'h06c;
    stim[43] = 10'h1dc;
    stim[44] = 10'h0bf;
    stim[45] = 10'h3f9;
    stim[46] = 10'h129;
    stim[47] = 10'h349;
    stim[48] = 10'h347;
    stim[49] = 10'h105;
    stim[50] = 10'h26e;
    stim[51] = 10'h199;
    stim[52] = 10'h173;
    stim[53] = 10'h3c1;
    stim[54] = 10'h10b;
    stim[55] = 10'h234;
    stim[56] = 10'h11b;
    stim[57] = 10'h2f1;
    stim[58] = 10'h149;
    stim[59] = 10'h26b;
    stim[60] = 10'h192;
    stim[61] = 10'h0f7;
    stim[62] = 10'h3d2;
    stim[63] = 10'h291;
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
      expv[0] = 10'h2eb;
      expv[1] = 10'h0be;
      expv[2] = 10'h017;
      expv[3] = 10'h28a;
      expv[4] = 10'h28b;
      expv[5] = 10'h1e0;
      expv[6] = 10'h310;
      expv[7] = 10'h36d;
      expv[8] = 10'h1a2;
      expv[9] = 10'h1ad;
      expv[10] = 10'h1c3;
      expv[11] = 10'h3a0;
      expv[12] = 10'h059;
      expv[13] = 10'h2fb;
      expv[14] = 10'h3db;
      expv[15] = 10'h3dc;
      expv[16] = 10'h0a0;
      expv[17] = 10'h2c4;
      expv[18] = 10'h1bb;
      expv[19] = 10'h04f;
      expv[20] = 10'h247;
      expv[21] = 10'h14a;
      expv[22] = 10'h055;
      expv[23] = 10'h0ab;
      expv[24] = 10'h19e;
      expv[25] = 10'h361;
      expv[26] = 10'h1c0;
      expv[27] = 10'h1c9;
      expv[28] = 10'h381;
      expv[29] = 10'h085;
      expv[30] = 10'h141;
      expv[31] = 10'h2b7;
      expv[32] = 10'h076;
      expv[33] = 10'h185;
      expv[34] = 10'h3b6;
      expv[35] = 10'h25b;
      expv[36] = 10'h0d1;
      expv[37] = 10'h1c5;
      expv[38] = 10'h1b7;
      expv[39] = 10'h032;
      expv[40] = 10'h3e0;
      expv[41] = 10'h154;
      expv[42] = 10'h0d8;
      expv[43] = 10'h3b8;
      expv[44] = 10'h17e;
      expv[45] = 10'h3f3;
      expv[46] = 10'h252;
      expv[47] = 10'h293;
      expv[48] = 10'h28f;
      expv[49] = 10'h20a;
      expv[50] = 10'h0dd;
      expv[51] = 10'h332;
      expv[52] = 10'h2e6;
      expv[53] = 10'h383;
      expv[54] = 10'h216;
      expv[55] = 10'h069;
      expv[56] = 10'h236;
      expv[57] = 10'h1e3;
      expv[58] = 10'h292;
      expv[59] = 10'h0d7;
      expv[60] = 10'h324;
      expv[61] = 10'h1ee;
      expv[62] = 10'h3a5;
      expv[63] = 10'h123;
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
