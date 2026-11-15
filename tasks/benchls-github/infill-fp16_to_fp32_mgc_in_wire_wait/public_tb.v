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

  FP16_TO_FP32_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h2ba;
    stim[1] = 10'h0fb;
    stim[2] = 10'h058;
    stim[3] = 10'h0c4;
    stim[4] = 10'h294;
    stim[5] = 10'h3f4;
    stim[6] = 10'h30a;
    stim[7] = 10'h148;
    stim[8] = 10'h0e0;
    stim[9] = 10'h0bb;
    stim[10] = 10'h049;
    stim[11] = 10'h01a;
    stim[12] = 10'h1b1;
    stim[13] = 10'h130;
    stim[14] = 10'h326;
    stim[15] = 10'h21f;
    stim[16] = 10'h270;
    stim[17] = 10'h24c;
    stim[18] = 10'h3bc;
    stim[19] = 10'h02f;
    stim[20] = 10'h22e;
    stim[21] = 10'h360;
    stim[22] = 10'h008;
    stim[23] = 10'h300;
    stim[24] = 10'h28a;
    stim[25] = 10'h386;
    stim[26] = 10'h014;
    stim[27] = 10'h1a0;
    stim[28] = 10'h22c;
    stim[29] = 10'h126;
    stim[30] = 10'h075;
    stim[31] = 10'h3e3;
    stim[32] = 10'h1f9;
    stim[33] = 10'h2bc;
    stim[34] = 10'h302;
    stim[35] = 10'h1c9;
    stim[36] = 10'h3bd;
    stim[37] = 10'h225;
    stim[38] = 10'h3c6;
    stim[39] = 10'h249;
    stim[40] = 10'h256;
    stim[41] = 10'h2e2;
    stim[42] = 10'h082;
    stim[43] = 10'h363;
    stim[44] = 10'h346;
    stim[45] = 10'h150;
    stim[46] = 10'h2fb;
    stim[47] = 10'h3bf;
    stim[48] = 10'h389;
    stim[49] = 10'h2d7;
    stim[50] = 10'h3f0;
    stim[51] = 10'h31c;
    stim[52] = 10'h182;
    stim[53] = 10'h3ab;
    stim[54] = 10'h0e6;
    stim[55] = 10'h321;
    stim[56] = 10'h03a;
    stim[57] = 10'h1fc;
    stim[58] = 10'h35a;
    stim[59] = 10'h359;
    stim[60] = 10'h294;
    stim[61] = 10'h142;
    stim[62] = 10'h20e;
    stim[63] = 10'h31c;
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
      expv[0] = 10'h175;
      expv[1] = 10'h1f6;
      expv[2] = 10'h0b0;
      expv[3] = 10'h188;
      expv[4] = 10'h129;
      expv[5] = 10'h3e9;
      expv[6] = 10'h215;
      expv[7] = 10'h290;
      expv[8] = 10'h1c0;
      expv[9] = 10'h176;
      expv[10] = 10'h092;
      expv[11] = 10'h034;
      expv[12] = 10'h362;
      expv[13] = 10'h260;
      expv[14] = 10'h24d;
      expv[15] = 10'h03f;
      expv[16] = 10'h0e1;
      expv[17] = 10'h099;
      expv[18] = 10'h379;
      expv[19] = 10'h05e;
      expv[20] = 10'h05d;
      expv[21] = 10'h2c1;
      expv[22] = 10'h010;
      expv[23] = 10'h201;
      expv[24] = 10'h115;
      expv[25] = 10'h30d;
      expv[26] = 10'h028;
      expv[27] = 10'h340;
      expv[28] = 10'h059;
      expv[29] = 10'h24c;
      expv[30] = 10'h0ea;
      expv[31] = 10'h3c7;
      expv[32] = 10'h3f2;
      expv[33] = 10'h179;
      expv[34] = 10'h205;
      expv[35] = 10'h392;
      expv[36] = 10'h37b;
      expv[37] = 10'h04b;
      expv[38] = 10'h38d;
      expv[39] = 10'h093;
      expv[40] = 10'h0ad;
      expv[41] = 10'h1c5;
      expv[42] = 10'h104;
      expv[43] = 10'h2c7;
      expv[44] = 10'h28d;
      expv[45] = 10'h2a0;
      expv[46] = 10'h1f7;
      expv[47] = 10'h37f;
      expv[48] = 10'h313;
      expv[49] = 10'h1af;
      expv[50] = 10'h3e1;
      expv[51] = 10'h239;
      expv[52] = 10'h304;
      expv[53] = 10'h357;
      expv[54] = 10'h1cc;
      expv[55] = 10'h243;
      expv[56] = 10'h074;
      expv[57] = 10'h3f8;
      expv[58] = 10'h2b5;
      expv[59] = 10'h2b3;
      expv[60] = 10'h129;
      expv[61] = 10'h284;
      expv[62] = 10'h01d;
      expv[63] = 10'h239;
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
