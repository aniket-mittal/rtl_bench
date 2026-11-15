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

  autovcoder_064949 dut (
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
    stim[0] = 12'h96d;
    stim[1] = 12'h914;
    stim[2] = 12'h05c;
    stim[3] = 12'h293;
    stim[4] = 12'h3c0;
    stim[5] = 12'h30c;
    stim[6] = 12'h3e7;
    stim[7] = 12'h3c7;
    stim[8] = 12'h1c0;
    stim[9] = 12'h562;
    stim[10] = 12'h084;
    stim[11] = 12'h350;
    stim[12] = 12'h434;
    stim[13] = 12'h319;
    stim[14] = 12'h7f0;
    stim[15] = 12'h47d;
    stim[16] = 12'h4cd;
    stim[17] = 12'h042;
    stim[18] = 12'h55c;
    stim[19] = 12'h56d;
    stim[20] = 12'h074;
    stim[21] = 12'h390;
    stim[22] = 12'h40c;
    stim[23] = 12'h0cf;
    stim[24] = 12'h671;
    stim[25] = 12'h741;
    stim[26] = 12'h331;
    stim[27] = 12'h777;
    stim[28] = 12'h249;
    stim[29] = 12'h037;
    stim[30] = 12'h400;
    stim[31] = 12'h52b;
    stim[32] = 12'h27a;
    stim[33] = 12'h384;
    stim[34] = 12'h1b5;
    stim[35] = 12'h427;
    stim[36] = 12'h594;
    stim[37] = 12'h276;
    stim[38] = 12'h2d6;
    stim[39] = 12'h226;
    stim[40] = 12'h5a8;
    stim[41] = 12'h7b6;
    stim[42] = 12'h6e5;
    stim[43] = 12'h61e;
    stim[44] = 12'h4bf;
    stim[45] = 12'h2d4;
    stim[46] = 12'h086;
    stim[47] = 12'h4f8;
    stim[48] = 12'h1bb;
    stim[49] = 12'h3f3;
    stim[50] = 12'h7a3;
    stim[51] = 12'h0dc;
    stim[52] = 12'h7e9;
    stim[53] = 12'h7cc;
    stim[54] = 12'h3f2;
    stim[55] = 12'h3a5;
    stim[56] = 12'h46c;
    stim[57] = 12'h037;
    stim[58] = 12'h7bf;
    stim[59] = 12'h66d;
    stim[60] = 12'h7de;
    stim[61] = 12'h7df;
    stim[62] = 12'h5a5;
    stim[63] = 12'h42e;
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
      expv[7] = 10'h100;
      expv[8] = 10'h100;
      expv[9] = 10'h100;
      expv[10] = 10'h1xx;
      expv[11] = 10'h1xx;
      expv[12] = 10'h1xx;
      expv[13] = 10'h362;
      expv[14] = 10'h362;
      expv[15] = 10'h162;
      expv[16] = 10'h3f0;
      expv[17] = 10'h3f0;
      expv[18] = 10'h3f0;
      expv[19] = 10'h3f0;
      expv[20] = 10'h3f0;
      expv[21] = 10'h3f0;
      expv[22] = 10'h3f0;
      expv[23] = 10'h3f0;
      expv[24] = 10'h3f0;
      expv[25] = 10'h35c;
      expv[26] = 10'h36d;
      expv[27] = 10'h36d;
      expv[28] = 10'h341;
      expv[29] = 10'h341;
      expv[30] = 10'h341;
      expv[31] = 10'h341;
      expv[32] = 10'h341;
      expv[33] = 10'h341;
      expv[34] = 10'h341;
      expv[35] = 10'h341;
      expv[36] = 10'h341;
      expv[37] = 10'h341;
      expv[38] = 10'h341;
      expv[39] = 10'h341;
      expv[40] = 10'h341;
      expv[41] = 10'h341;
      expv[42] = 10'h377;
      expv[43] = 10'h32b;
      expv[44] = 10'h394;
      expv[45] = 10'h394;
      expv[46] = 10'h394;
      expv[47] = 10'h394;
      expv[48] = 10'h394;
      expv[49] = 10'h394;
      expv[50] = 10'h394;
      expv[51] = 10'h3a8;
      expv[52] = 10'h3a8;
      expv[53] = 10'h3b6;
      expv[54] = 10'h3a3;
      expv[55] = 10'h3a3;
      expv[56] = 10'h3a3;
      expv[57] = 10'h3a3;
      expv[58] = 10'h3a3;
      expv[59] = 10'h3e9;
      expv[60] = 10'h3cc;
      expv[61] = 10'h3bf;
      expv[62] = 10'h3de;
      expv[63] = 10'h3de;
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
