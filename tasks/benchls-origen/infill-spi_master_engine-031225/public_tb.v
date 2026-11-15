// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_031225 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .start(in_vec[9:9]),
    .miso(in_vec[8:8]),
    .addr(in_vec[7:0]),
    .sclk(out_vec[11:11]),
    .busy(out_vec[10:10]),
    .finish(out_vec[9:9]),
    .mosi(out_vec[8:8]),
    .data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h741;
    stim[1] = 11'h665;
    stim[2] = 11'h2a5;
    stim[3] = 11'h0c5;
    stim[4] = 11'h168;
    stim[5] = 11'h338;
    stim[6] = 11'h269;
    stim[7] = 11'h28e;
    stim[8] = 11'h258;
    stim[9] = 11'h215;
    stim[10] = 11'h1b0;
    stim[11] = 11'h3a5;
    stim[12] = 11'h241;
    stim[13] = 11'h05f;
    stim[14] = 11'h1c9;
    stim[15] = 11'h3b8;
    stim[16] = 11'h06f;
    stim[17] = 11'h390;
    stim[18] = 11'h037;
    stim[19] = 11'h345;
    stim[20] = 11'h1de;
    stim[21] = 11'h122;
    stim[22] = 11'h1c3;
    stim[23] = 11'h2f3;
    stim[24] = 11'h342;
    stim[25] = 11'h0d3;
    stim[26] = 11'h0a8;
    stim[27] = 11'h305;
    stim[28] = 11'h085;
    stim[29] = 11'h09d;
    stim[30] = 11'h370;
    stim[31] = 11'h17b;
    stim[32] = 11'h03f;
    stim[33] = 11'h17c;
    stim[34] = 11'h282;
    stim[35] = 11'h313;
    stim[36] = 11'h33a;
    stim[37] = 11'h1b9;
    stim[38] = 11'h1e0;
    stim[39] = 11'h04d;
    stim[40] = 11'h049;
    stim[41] = 11'h03b;
    stim[42] = 11'h41f;
    stim[43] = 11'h2a7;
    stim[44] = 11'h060;
    stim[45] = 11'h392;
    stim[46] = 11'h0a8;
    stim[47] = 11'h157;
    stim[48] = 11'h0dd;
    stim[49] = 11'h315;
    stim[50] = 11'h144;
    stim[51] = 11'h0fc;
    stim[52] = 11'h0df;
    stim[53] = 11'h3bd;
    stim[54] = 11'h3db;
    stim[55] = 11'h2fc;
    stim[56] = 11'h0ef;
    stim[57] = 11'h382;
    stim[58] = 11'h32f;
    stim[59] = 11'h393;
    stim[60] = 11'h16b;
    stim[61] = 11'h24e;
    stim[62] = 11'h265;
    stim[63] = 11'h291;
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
      expv[0] = 12'h100;
      expv[1] = 12'h100;
      expv[2] = 12'h100;
      expv[3] = 12'h500;
      expv[4] = 12'h500;
      expv[5] = 12'h500;
      expv[6] = 12'h500;
      expv[7] = 12'h500;
      expv[8] = 12'h500;
      expv[9] = 12'h500;
      expv[10] = 12'h500;
      expv[11] = 12'h500;
      expv[12] = 12'h500;
      expv[13] = 12'h500;
      expv[14] = 12'h500;
      expv[15] = 12'h500;
      expv[16] = 12'h500;
      expv[17] = 12'h500;
      expv[18] = 12'h500;
      expv[19] = 12'hd00;
      expv[20] = 12'hd00;
      expv[21] = 12'hd00;
      expv[22] = 12'hd00;
      expv[23] = 12'hd00;
      expv[24] = 12'hd00;
      expv[25] = 12'hd00;
      expv[26] = 12'hd00;
      expv[27] = 12'h500;
      expv[28] = 12'h500;
      expv[29] = 12'h500;
      expv[30] = 12'h500;
      expv[31] = 12'h500;
      expv[32] = 12'h500;
      expv[33] = 12'h500;
      expv[34] = 12'h500;
      expv[35] = 12'hc00;
      expv[36] = 12'hc00;
      expv[37] = 12'hc00;
      expv[38] = 12'hc00;
      expv[39] = 12'hc00;
      expv[40] = 12'hc00;
      expv[41] = 12'hc00;
      expv[42] = 12'h100;
      expv[43] = 12'h100;
      expv[44] = 12'h500;
      expv[45] = 12'h500;
      expv[46] = 12'h500;
      expv[47] = 12'h500;
      expv[48] = 12'h500;
      expv[49] = 12'h500;
      expv[50] = 12'h500;
      expv[51] = 12'h500;
      expv[52] = 12'h500;
      expv[53] = 12'h500;
      expv[54] = 12'h500;
      expv[55] = 12'h500;
      expv[56] = 12'h500;
      expv[57] = 12'h500;
      expv[58] = 12'h500;
      expv[59] = 12'h500;
      expv[60] = 12'hd00;
      expv[61] = 12'hd00;
      expv[62] = 12'hd00;
      expv[63] = 12'hd00;
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
