// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  memterceptor dut (
    .ADR(in_vec[24:17]),
    .FFT_DATA(in_vec[16:9]),
    .MEM_DATA(in_vec[8:1]),
    .WRITE(in_vec[0:0]),
    .ADR_IS_FFT(out_vec[11:11]),
    .ADR_IS_MEM(out_vec[10:10]),
    .FFT_WRITE(out_vec[9:9]),
    .MEM_WRITE(out_vec[8:8]),
    .READ_DATA(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1e9dab2;
    stim[1] = 25'h07980a4;
    stim[2] = 25'h0f6e715;
    stim[3] = 25'h15b5caa;
    stim[4] = 25'h0e18769;
    stim[5] = 25'h0b87ba5;
    stim[6] = 25'h11c6e60;
    stim[7] = 25'h09b8367;
    stim[8] = 25'h0d04c2a;
    stim[9] = 25'h134d774;
    stim[10] = 25'h1d7477f;
    stim[11] = 25'h0025f0b;
    stim[12] = 25'h0278149;
    stim[13] = 25'h02a1b46;
    stim[14] = 25'h09e8dff;
    stim[15] = 25'h1a2d7b7;
    stim[16] = 25'h1f37f81;
    stim[17] = 25'h009ca85;
    stim[18] = 25'h056d12c;
    stim[19] = 25'h19ca2e0;
    stim[20] = 25'h045cb22;
    stim[21] = 25'h1df88c7;
    stim[22] = 25'h05502b9;
    stim[23] = 25'h05e7f68;
    stim[24] = 25'h0ea1400;
    stim[25] = 25'h0e191b7;
    stim[26] = 25'h0a55538;
    stim[27] = 25'h0eda61d;
    stim[28] = 25'h1dea88b;
    stim[29] = 25'h130ada8;
    stim[30] = 25'h09705ee;
    stim[31] = 25'h186139c;
    stim[32] = 25'h08393f4;
    stim[33] = 25'h03ff3ad;
    stim[34] = 25'h0a8b0a6;
    stim[35] = 25'h17dadf5;
    stim[36] = 25'h068e6df;
    stim[37] = 25'h122975f;
    stim[38] = 25'h0540341;
    stim[39] = 25'h09d5794;
    stim[40] = 25'h11ea074;
    stim[41] = 25'h110075d;
    stim[42] = 25'h02685fd;
    stim[43] = 25'h1d482f3;
    stim[44] = 25'h022e33c;
    stim[45] = 25'h17c6b32;
    stim[46] = 25'h113dd1c;
    stim[47] = 25'h096a44a;
    stim[48] = 25'h06a1918;
    stim[49] = 25'h1b5cf81;
    stim[50] = 25'h0eb9054;
    stim[51] = 25'h0ca9520;
    stim[52] = 25'h09d15b3;
    stim[53] = 25'h0bd4efe;
    stim[54] = 25'h0e0a6bc;
    stim[55] = 25'h0702961;
    stim[56] = 25'h18e6f30;
    stim[57] = 25'h05b1264;
    stim[58] = 25'h1c916e6;
    stim[59] = 25'h1bcb596;
    stim[60] = 25'h123050d;
    stim[61] = 25'h0728caf;
    stim[62] = 25'h16d5ba7;
    stim[63] = 25'h06f4eb5;
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
      expv[0] = 12'h459;
      expv[1] = 12'h452;
      expv[2] = 12'h58a;
      expv[3] = 12'h455;
      expv[4] = 12'h5b4;
      expv[5] = 12'h5d2;
      expv[6] = 12'h430;
      expv[7] = 12'h5b3;
      expv[8] = 12'h415;
      expv[9] = 12'h4ba;
      expv[10] = 12'h5bf;
      expv[11] = 12'h585;
      expv[12] = 12'h5a4;
      expv[13] = 12'h4a3;
      expv[14] = 12'h5ff;
      expv[15] = 12'h5db;
      expv[16] = 12'habf;
      expv[17] = 12'h542;
      expv[18] = 12'h496;
      expv[19] = 12'h470;
      expv[20] = 12'h491;
      expv[21] = 12'h563;
      expv[22] = 12'h55c;
      expv[23] = 12'h4b4;
      expv[24] = 12'h400;
      expv[25] = 12'h5db;
      expv[26] = 12'h49c;
      expv[27] = 12'h50e;
      expv[28] = 12'h545;
      expv[29] = 12'h4d4;
      expv[30] = 12'h4f7;
      expv[31] = 12'h4ce;
      expv[32] = 12'h4fa;
      expv[33] = 12'h5d6;
      expv[34] = 12'h453;
      expv[35] = 12'h5fa;
      expv[36] = 12'h56f;
      expv[37] = 12'h5af;
      expv[38] = 12'h5a0;
      expv[39] = 12'h4ca;
      expv[40] = 12'h43a;
      expv[41] = 12'h5ae;
      expv[42] = 12'h5fe;
      expv[43] = 12'h579;
      expv[44] = 12'h49e;
      expv[45] = 12'h499;
      expv[46] = 12'h48e;
      expv[47] = 12'h425;
      expv[48] = 12'h48c;
      expv[49] = 12'h5c0;
      expv[50] = 12'h42a;
      expv[51] = 12'h490;
      expv[52] = 12'h5d9;
      expv[53] = 12'h47f;
      expv[54] = 12'h45e;
      expv[55] = 12'h5b0;
      expv[56] = 12'h498;
      expv[57] = 12'h432;
      expv[58] = 12'h473;
      expv[59] = 12'h4cb;
      expv[60] = 12'h586;
      expv[61] = 12'h557;
      expv[62] = 12'h5d3;
      expv[63] = 12'h55a;
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
