// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07191 dut (
    .clk(clk),
    .address(in_vec[9:0]),
    .instruction(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h280;
    stim[1] = 10'h073;
    stim[2] = 10'h2e8;
    stim[3] = 10'h0e3;
    stim[4] = 10'h150;
    stim[5] = 10'h3f0;
    stim[6] = 10'h09b;
    stim[7] = 10'h17b;
    stim[8] = 10'h040;
    stim[9] = 10'h350;
    stim[10] = 10'h21c;
    stim[11] = 10'h3b3;
    stim[12] = 10'h323;
    stim[13] = 10'h211;
    stim[14] = 10'h2c2;
    stim[15] = 10'h142;
    stim[16] = 10'h355;
    stim[17] = 10'h245;
    stim[18] = 10'h154;
    stim[19] = 10'h1dd;
    stim[20] = 10'h0a7;
    stim[21] = 10'h1d6;
    stim[22] = 10'h3d1;
    stim[23] = 10'h3bc;
    stim[24] = 10'h25a;
    stim[25] = 10'h10f;
    stim[26] = 10'h2b8;
    stim[27] = 10'h1ee;
    stim[28] = 10'h111;
    stim[29] = 10'h370;
    stim[30] = 10'h0fe;
    stim[31] = 10'h32e;
    stim[32] = 10'h0f8;
    stim[33] = 10'h1ef;
    stim[34] = 10'h1b3;
    stim[35] = 10'h145;
    stim[36] = 10'h2e5;
    stim[37] = 10'h1aa;
    stim[38] = 10'h2e9;
    stim[39] = 10'h1a5;
    stim[40] = 10'h310;
    stim[41] = 10'h252;
    stim[42] = 10'h239;
    stim[43] = 10'h3f0;
    stim[44] = 10'h2ae;
    stim[45] = 10'h147;
    stim[46] = 10'h030;
    stim[47] = 10'h254;
    stim[48] = 10'h02b;
    stim[49] = 10'h2b3;
    stim[50] = 10'h091;
    stim[51] = 10'h245;
    stim[52] = 10'h228;
    stim[53] = 10'h32e;
    stim[54] = 10'h14c;
    stim[55] = 10'h074;
    stim[56] = 10'h06d;
    stim[57] = 10'h2b3;
    stim[58] = 10'h3e0;
    stim[59] = 10'h331;
    stim[60] = 10'h017;
    stim[61] = 10'h195;
    stim[62] = 10'h3d7;
    stim[63] = 10'h20f;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'hxxxxx;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'hxxxxx;
      expv[17] = 18'hxxxxx;
      expv[18] = 18'hxxxxx;
      expv[19] = 18'hxxxxx;
      expv[20] = 18'hxxxxx;
      expv[21] = 18'hxxxxx;
      expv[22] = 18'hxxxxx;
      expv[23] = 18'hxxxxx;
      expv[24] = 18'hxxxxx;
      expv[25] = 18'hxxxxx;
      expv[26] = 18'hxxxxx;
      expv[27] = 18'hxxxxx;
      expv[28] = 18'hxxxxx;
      expv[29] = 18'hxxxxx;
      expv[30] = 18'hxxxxx;
      expv[31] = 18'hxxxxx;
      expv[32] = 18'hxxxxx;
      expv[33] = 18'hxxxxx;
      expv[34] = 18'hxxxxx;
      expv[35] = 18'hxxxxx;
      expv[36] = 18'hxxxxx;
      expv[37] = 18'hxxxxx;
      expv[38] = 18'hxxxxx;
      expv[39] = 18'hxxxxx;
      expv[40] = 18'hxxxxx;
      expv[41] = 18'hxxxxx;
      expv[42] = 18'hxxxxx;
      expv[43] = 18'hxxxxx;
      expv[44] = 18'hxxxxx;
      expv[45] = 18'hxxxxx;
      expv[46] = 18'hxxxxx;
      expv[47] = 18'hxxxxx;
      expv[48] = 18'hxxxxx;
      expv[49] = 18'hxxxxx;
      expv[50] = 18'hxxxxx;
      expv[51] = 18'hxxxxx;
      expv[52] = 18'hxxxxx;
      expv[53] = 18'hxxxxx;
      expv[54] = 18'hxxxxx;
      expv[55] = 18'hxxxxx;
      expv[56] = 18'hxxxxx;
      expv[57] = 18'hxxxxx;
      expv[58] = 18'hxxxxx;
      expv[59] = 18'hxxxxx;
      expv[60] = 18'hxxxxx;
      expv[61] = 18'h00494;
      expv[62] = 18'hxxxxx;
      expv[63] = 18'hxxxxx;
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
