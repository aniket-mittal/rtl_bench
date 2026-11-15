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

  origen_134143 dut (
    .BAUD_CLK(clk),
    .RESET_N(in_vec[16:16]),
    .TX_START(in_vec[15:15]),
    .TX_STOP(in_vec[14:14]),
    .TX_WORD(in_vec[13:12]),
    .TX_PAR_DIS(in_vec[11:11]),
    .TX_PARITY(in_vec[10:9]),
    .CTS(in_vec[8:8]),
    .TX_BUFFER(in_vec[7:0]),
    .TX_DATA(out_vec[1:1]),
    .TX_DONE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0ec13;
    stim[1] = 17'h0ed92;
    stim[2] = 17'h1c147;
    stim[3] = 17'h1a5f4;
    stim[4] = 17'h14cca;
    stim[5] = 17'h156dc;
    stim[6] = 17'h1d287;
    stim[7] = 17'h10ca7;
    stim[8] = 17'h18ae0;
    stim[9] = 17'h1a193;
    stim[10] = 17'h1796f;
    stim[11] = 17'h16118;
    stim[12] = 17'h1dbcb;
    stim[13] = 17'h1931b;
    stim[14] = 17'h0daf8;
    stim[15] = 17'h1d6d5;
    stim[16] = 17'h15948;
    stim[17] = 17'h1d462;
    stim[18] = 17'h1d9d3;
    stim[19] = 17'h1a31b;
    stim[20] = 17'h181cd;
    stim[21] = 17'h12077;
    stim[22] = 17'h15313;
    stim[23] = 17'h14fd4;
    stim[24] = 17'h1c369;
    stim[25] = 17'h10e37;
    stim[26] = 17'h1309e;
    stim[27] = 17'h1e001;
    stim[28] = 17'h1a033;
    stim[29] = 17'h11da9;
    stim[30] = 17'h1a69f;
    stim[31] = 17'h14fd3;
    stim[32] = 17'h1c9c6;
    stim[33] = 17'h1b0a9;
    stim[34] = 17'h1f125;
    stim[35] = 17'h1aa8c;
    stim[36] = 17'h1748e;
    stim[37] = 17'h15730;
    stim[38] = 17'h1470e;
    stim[39] = 17'h1202e;
    stim[40] = 17'h146ad;
    stim[41] = 17'h1ad23;
    stim[42] = 17'h1db0f;
    stim[43] = 17'h1e7e4;
    stim[44] = 17'h19332;
    stim[45] = 17'h17b38;
    stim[46] = 17'h1aee1;
    stim[47] = 17'h11d94;
    stim[48] = 17'h1966d;
    stim[49] = 17'h1052b;
    stim[50] = 17'h1a404;
    stim[51] = 17'h1cd2e;
    stim[52] = 17'h1edc5;
    stim[53] = 17'h004ad;
    stim[54] = 17'h1312a;
    stim[55] = 17'h1b077;
    stim[56] = 17'h1d762;
    stim[57] = 17'h15282;
    stim[58] = 17'h19b47;
    stim[59] = 17'h1854a;
    stim[60] = 17'h1bbe2;
    stim[61] = 17'h1f7df;
    stim[62] = 17'h1f59a;
    stim[63] = 17'h142ab;
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
      expv[0] = 2'h2;
      expv[1] = 2'h2;
      expv[2] = 2'h2;
      expv[3] = 2'h2;
      expv[4] = 2'h0;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h2;
      expv[12] = 2'h3;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h0;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h2;
      expv[26] = 2'h0;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h3;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h3;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h2;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h2;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
