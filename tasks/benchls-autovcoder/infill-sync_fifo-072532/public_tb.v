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

  autovcoder_072532 dut (
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
    stim[0] = 12'h9f1;
    stim[1] = 12'haba;
    stim[2] = 12'h200;
    stim[3] = 12'h169;
    stim[4] = 12'h3fc;
    stim[5] = 12'h1f9;
    stim[6] = 12'h573;
    stim[7] = 12'h3ed;
    stim[8] = 12'h6a9;
    stim[9] = 12'h72b;
    stim[10] = 12'h6c0;
    stim[11] = 12'h266;
    stim[12] = 12'h5f4;
    stim[13] = 12'h7f3;
    stim[14] = 12'h5ad;
    stim[15] = 12'h09c;
    stim[16] = 12'h6ed;
    stim[17] = 12'h69b;
    stim[18] = 12'h7dc;
    stim[19] = 12'h303;
    stim[20] = 12'h58d;
    stim[21] = 12'h0d2;
    stim[22] = 12'h538;
    stim[23] = 12'h633;
    stim[24] = 12'h2a0;
    stim[25] = 12'hf6e;
    stim[26] = 12'h6e8;
    stim[27] = 12'h0e8;
    stim[28] = 12'h455;
    stim[29] = 12'h300;
    stim[30] = 12'h689;
    stim[31] = 12'h68c;
    stim[32] = 12'h68b;
    stim[33] = 12'h2bf;
    stim[34] = 12'h68e;
    stim[35] = 12'h4a4;
    stim[36] = 12'h3a8;
    stim[37] = 12'h30b;
    stim[38] = 12'h104;
    stim[39] = 12'h3b8;
    stim[40] = 12'h778;
    stim[41] = 12'h664;
    stim[42] = 12'h691;
    stim[43] = 12'h4dc;
    stim[44] = 12'h3e5;
    stim[45] = 12'h301;
    stim[46] = 12'h17c;
    stim[47] = 12'h104;
    stim[48] = 12'h6a4;
    stim[49] = 12'h320;
    stim[50] = 12'h02c;
    stim[51] = 12'h5e8;
    stim[52] = 12'h7dd;
    stim[53] = 12'h1a2;
    stim[54] = 12'h7dc;
    stim[55] = 12'h634;
    stim[56] = 12'h1cd;
    stim[57] = 12'h570;
    stim[58] = 12'h433;
    stim[59] = 12'h1c9;
    stim[60] = 12'h339;
    stim[61] = 12'h62b;
    stim[62] = 12'h21c;
    stim[63] = 12'h05a;
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
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h373;
      expv[10] = 10'h173;
      expv[11] = 10'h32b;
      expv[12] = 10'h32b;
      expv[13] = 10'h32b;
      expv[14] = 10'h3f4;
      expv[15] = 10'h3f4;
      expv[16] = 10'h3f4;
      expv[17] = 10'h3f3;
      expv[18] = 10'h3ad;
      expv[19] = 10'h1ad;
      expv[20] = 10'h1ad;
      expv[21] = 10'h3dc;
      expv[22] = 10'h3dc;
      expv[23] = 10'h3dc;
      expv[24] = 10'h38d;
      expv[25] = 10'h38d;
      expv[26] = 10'h100;
      expv[27] = 10'h16e;
      expv[28] = 10'h16e;
      expv[29] = 10'h16e;
      expv[30] = 10'h16e;
      expv[31] = 10'h16e;
      expv[32] = 10'h16e;
      expv[33] = 10'h16e;
      expv[34] = 10'h16e;
      expv[35] = 10'h16e;
      expv[36] = 10'h16e;
      expv[37] = 10'h16e;
      expv[38] = 10'h16e;
      expv[39] = 10'h16e;
      expv[40] = 10'h16e;
      expv[41] = 10'h16e;
      expv[42] = 10'h378;
      expv[43] = 10'h178;
      expv[44] = 10'h178;
      expv[45] = 10'h178;
      expv[46] = 10'h178;
      expv[47] = 10'h178;
      expv[48] = 10'h178;
      expv[49] = 10'h178;
      expv[50] = 10'h178;
      expv[51] = 10'h178;
      expv[52] = 10'h178;
      expv[53] = 10'h3e8;
      expv[54] = 10'h3e8;
      expv[55] = 10'h3dd;
      expv[56] = 10'h3dc;
      expv[57] = 10'h3dc;
      expv[58] = 10'h3dc;
      expv[59] = 10'h3dc;
      expv[60] = 10'h3dc;
      expv[61] = 10'h3dc;
      expv[62] = 10'h370;
      expv[63] = 10'h370;
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
