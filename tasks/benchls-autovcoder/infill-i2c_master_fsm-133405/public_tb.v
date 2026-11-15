// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_133405 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .start(in_vec[15:15]),
    .address(in_vec[14:8]),
    .data_in(in_vec[7:0]),
    .scl(out_vec[1:1]),
    .sda(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1f6fb;
    stim[1] = 17'h1501f;
    stim[2] = 17'h05cbf;
    stim[3] = 17'h04015;
    stim[4] = 17'h0e5d2;
    stim[5] = 17'h0b443;
    stim[6] = 17'h07d98;
    stim[7] = 17'h0da6b;
    stim[8] = 17'h0e387;
    stim[9] = 17'h0898e;
    stim[10] = 17'h0a6c9;
    stim[11] = 17'h009dd;
    stim[12] = 17'h07c2c;
    stim[13] = 17'h0cf39;
    stim[14] = 17'h00e6e;
    stim[15] = 17'h073a2;
    stim[16] = 17'h026e4;
    stim[17] = 17'h0ac32;
    stim[18] = 17'h063c1;
    stim[19] = 17'h00fc6;
    stim[20] = 17'h082a9;
    stim[21] = 17'h0e34b;
    stim[22] = 17'h0f052;
    stim[23] = 17'h0e4f2;
    stim[24] = 17'h0caf6;
    stim[25] = 17'h0d2dd;
    stim[26] = 17'h0d81a;
    stim[27] = 17'h0d7a5;
    stim[28] = 17'h0e658;
    stim[29] = 17'h003e9;
    stim[30] = 17'h0e4c8;
    stim[31] = 17'h06b16;
    stim[32] = 17'h03abd;
    stim[33] = 17'h0b7ec;
    stim[34] = 17'h06257;
    stim[35] = 17'h0663c;
    stim[36] = 17'h01d99;
    stim[37] = 17'h0276c;
    stim[38] = 17'h0e9e0;
    stim[39] = 17'h02e9c;
    stim[40] = 17'h0d60c;
    stim[41] = 17'h052b8;
    stim[42] = 17'h0cdfb;
    stim[43] = 17'h01023;
    stim[44] = 17'h03f89;
    stim[45] = 17'h04d1d;
    stim[46] = 17'h1f552;
    stim[47] = 17'h120dc;
    stim[48] = 17'h02c2f;
    stim[49] = 17'h0473f;
    stim[50] = 17'h00442;
    stim[51] = 17'h00b75;
    stim[52] = 17'h0ccb1;
    stim[53] = 17'h03eed;
    stim[54] = 17'h09604;
    stim[55] = 17'h04310;
    stim[56] = 17'h08a0a;
    stim[57] = 17'h0dd62;
    stim[58] = 17'h0a8fa;
    stim[59] = 17'h0009d;
    stim[60] = 17'h1d7ea;
    stim[61] = 17'h06c8c;
    stim[62] = 17'h0a829;
    stim[63] = 17'h0469a;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h3;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h2;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h0;
      expv[9] = 2'h3;
      expv[10] = 2'h2;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h3;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h2;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h1;
      expv[22] = 2'h3;
      expv[23] = 2'h2;
      expv[24] = 2'h0;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h3;
      expv[28] = 2'h2;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h1;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h2;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h3;
      expv[39] = 2'h2;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h2;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h3;
      expv[58] = 2'h2;
      expv[59] = 2'h0;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h3;
      expv[63] = 2'h2;
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
