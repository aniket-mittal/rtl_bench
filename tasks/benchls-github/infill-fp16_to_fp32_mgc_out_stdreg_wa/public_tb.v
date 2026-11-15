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

  FP16_TO_FP32_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h003;
    stim[1] = 10'h3f1;
    stim[2] = 10'h220;
    stim[3] = 10'h1ad;
    stim[4] = 10'h294;
    stim[5] = 10'h277;
    stim[6] = 10'h044;
    stim[7] = 10'h33e;
    stim[8] = 10'h0eb;
    stim[9] = 10'h048;
    stim[10] = 10'h24b;
    stim[11] = 10'h01d;
    stim[12] = 10'h1f8;
    stim[13] = 10'h26d;
    stim[14] = 10'h15a;
    stim[15] = 10'h171;
    stim[16] = 10'h1aa;
    stim[17] = 10'h2cc;
    stim[18] = 10'h029;
    stim[19] = 10'h2ff;
    stim[20] = 10'h0a6;
    stim[21] = 10'h30a;
    stim[22] = 10'h054;
    stim[23] = 10'h23d;
    stim[24] = 10'h098;
    stim[25] = 10'h2c1;
    stim[26] = 10'h2b8;
    stim[27] = 10'h0a2;
    stim[28] = 10'h294;
    stim[29] = 10'h21f;
    stim[30] = 10'h17c;
    stim[31] = 10'h0e5;
    stim[32] = 10'h1c1;
    stim[33] = 10'h189;
    stim[34] = 10'h0b0;
    stim[35] = 10'h386;
    stim[36] = 10'h305;
    stim[37] = 10'h3bf;
    stim[38] = 10'h0dd;
    stim[39] = 10'h020;
    stim[40] = 10'h0b7;
    stim[41] = 10'h3d9;
    stim[42] = 10'h378;
    stim[43] = 10'h339;
    stim[44] = 10'h137;
    stim[45] = 10'h2ff;
    stim[46] = 10'h0e9;
    stim[47] = 10'h2a4;
    stim[48] = 10'h1a5;
    stim[49] = 10'h0e0;
    stim[50] = 10'h0c9;
    stim[51] = 10'h2bf;
    stim[52] = 10'h254;
    stim[53] = 10'h3fb;
    stim[54] = 10'h3fb;
    stim[55] = 10'h231;
    stim[56] = 10'h225;
    stim[57] = 10'h0bd;
    stim[58] = 10'h351;
    stim[59] = 10'h2ff;
    stim[60] = 10'h150;
    stim[61] = 10'h0b5;
    stim[62] = 10'h10d;
    stim[63] = 10'h370;
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
      expv[0] = 10'h201;
      expv[1] = 10'h3f8;
      expv[2] = 10'h110;
      expv[3] = 10'h2d6;
      expv[4] = 10'h14a;
      expv[5] = 10'h33b;
      expv[6] = 10'h022;
      expv[7] = 10'h19f;
      expv[8] = 10'h275;
      expv[9] = 10'h024;
      expv[10] = 10'h325;
      expv[11] = 10'h20e;
      expv[12] = 10'h0fc;
      expv[13] = 10'h336;
      expv[14] = 10'h0ad;
      expv[15] = 10'h2b8;
      expv[16] = 10'h0d5;
      expv[17] = 10'h166;
      expv[18] = 10'h214;
      expv[19] = 10'h37f;
      expv[20] = 10'h053;
      expv[21] = 10'h185;
      expv[22] = 10'h02a;
      expv[23] = 10'h31e;
      expv[24] = 10'h04c;
      expv[25] = 10'h360;
      expv[26] = 10'h15c;
      expv[27] = 10'h051;
      expv[28] = 10'h14a;
      expv[29] = 10'h30f;
      expv[30] = 10'h0be;
      expv[31] = 10'h272;
      expv[32] = 10'h2e0;
      expv[33] = 10'h2c4;
      expv[34] = 10'h058;
      expv[35] = 10'h1c3;
      expv[36] = 10'h382;
      expv[37] = 10'h3df;
      expv[38] = 10'h26e;
      expv[39] = 10'h010;
      expv[40] = 10'h25b;
      expv[41] = 10'h3ec;
      expv[42] = 10'h1bc;
      expv[43] = 10'h39c;
      expv[44] = 10'h29b;
      expv[45] = 10'h37f;
      expv[46] = 10'h274;
      expv[47] = 10'h152;
      expv[48] = 10'h2d2;
      expv[49] = 10'h070;
      expv[50] = 10'h264;
      expv[51] = 10'h35f;
      expv[52] = 10'h12a;
      expv[53] = 10'h3fd;
      expv[54] = 10'h3fd;
      expv[55] = 10'h318;
      expv[56] = 10'h312;
      expv[57] = 10'h25e;
      expv[58] = 10'h3a8;
      expv[59] = 10'h37f;
      expv[60] = 10'h0a8;
      expv[61] = 10'h25a;
      expv[62] = 10'h286;
      expv[63] = 10'h1b8;
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
