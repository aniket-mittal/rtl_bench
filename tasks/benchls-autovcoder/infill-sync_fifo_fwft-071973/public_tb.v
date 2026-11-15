// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071973 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf8c;
    stim[1] = 12'hd9d;
    stim[2] = 12'h3a9;
    stim[3] = 12'h325;
    stim[4] = 12'h40f;
    stim[5] = 12'h38f;
    stim[6] = 12'h42a;
    stim[7] = 12'h659;
    stim[8] = 12'h228;
    stim[9] = 12'h3a2;
    stim[10] = 12'h27c;
    stim[11] = 12'h5df;
    stim[12] = 12'h3b6;
    stim[13] = 12'h370;
    stim[14] = 12'h0d5;
    stim[15] = 12'h53e;
    stim[16] = 12'h11b;
    stim[17] = 12'hed1;
    stim[18] = 12'h1ae;
    stim[19] = 12'h49b;
    stim[20] = 12'h600;
    stim[21] = 12'h71b;
    stim[22] = 12'h1b7;
    stim[23] = 12'h0e5;
    stim[24] = 12'hfd1;
    stim[25] = 12'h569;
    stim[26] = 12'h4ff;
    stim[27] = 12'h40e;
    stim[28] = 12'hffa;
    stim[29] = 12'h570;
    stim[30] = 12'h544;
    stim[31] = 12'h6f1;
    stim[32] = 12'h4ed;
    stim[33] = 12'h089;
    stim[34] = 12'h7d0;
    stim[35] = 12'h228;
    stim[36] = 12'h523;
    stim[37] = 12'h014;
    stim[38] = 12'h5aa;
    stim[39] = 12'h3ce;
    stim[40] = 12'h2a0;
    stim[41] = 12'h7ea;
    stim[42] = 12'h23b;
    stim[43] = 12'h0d6;
    stim[44] = 12'h6a8;
    stim[45] = 12'h159;
    stim[46] = 12'h93c;
    stim[47] = 12'h2e9;
    stim[48] = 12'h153;
    stim[49] = 12'h517;
    stim[50] = 12'h303;
    stim[51] = 12'h3e7;
    stim[52] = 12'h794;
    stim[53] = 12'hc3d;
    stim[54] = 12'h7d6;
    stim[55] = 12'h6f6;
    stim[56] = 12'h05e;
    stim[57] = 12'h4fb;
    stim[58] = 12'h12e;
    stim[59] = 12'h60e;
    stim[60] = 12'h135;
    stim[61] = 12'h5d5;
    stim[62] = 12'h0b0;
    stim[63] = 12'h7f7;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h19d;
      expv[6] = 10'h19d;
      expv[7] = 10'h19d;
      expv[8] = 10'h19d;
      expv[9] = 10'h19d;
      expv[10] = 10'h19d;
      expv[11] = 10'h19d;
      expv[12] = 10'h19d;
      expv[13] = 10'h19d;
      expv[14] = 10'h19d;
      expv[15] = 10'h19d;
      expv[16] = 10'h3df;
      expv[17] = 10'h3df;
      expv[18] = 10'h100;
      expv[19] = 10'h100;
      expv[20] = 10'h13e;
      expv[21] = 10'h13e;
      expv[22] = 10'h13e;
      expv[23] = 10'h13e;
      expv[24] = 10'h13e;
      expv[25] = 10'h100;
      expv[26] = 10'h1d1;
      expv[27] = 10'h369;
      expv[28] = 10'h369;
      expv[29] = 10'h100;
      expv[30] = 10'h1fa;
      expv[31] = 10'h370;
      expv[32] = 10'h344;
      expv[33] = 10'h344;
      expv[34] = 10'h344;
      expv[35] = 10'h144;
      expv[36] = 10'h144;
      expv[37] = 10'h3d0;
      expv[38] = 10'h3d0;
      expv[39] = 10'h3d0;
      expv[40] = 10'h3d0;
      expv[41] = 10'h3d0;
      expv[42] = 10'h323;
      expv[43] = 10'h323;
      expv[44] = 10'h323;
      expv[45] = 10'h3aa;
      expv[46] = 10'h3aa;
      expv[47] = 10'h100;
      expv[48] = 10'h100;
      expv[49] = 10'h100;
      expv[50] = 10'h1ea;
      expv[51] = 10'h1ea;
      expv[52] = 10'h1ea;
      expv[53] = 10'h317;
      expv[54] = 10'h100;
      expv[55] = 10'h194;
      expv[56] = 10'h3d6;
      expv[57] = 10'h3d6;
      expv[58] = 10'h3d6;
      expv[59] = 10'h3d6;
      expv[60] = 10'h1d6;
      expv[61] = 10'h1d6;
      expv[62] = 10'h1d6;
      expv[63] = 10'h1d6;
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
