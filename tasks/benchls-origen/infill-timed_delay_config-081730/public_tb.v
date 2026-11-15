// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081730 dut (
    .clock(clk),
    .reset(in_vec[9:9]),
    .parameter_selector(in_vec[8:7]),
    .time_value(in_vec[6:3]),
    .reprogram(in_vec[2:2]),
    .interval(in_vec[1:0]),
    .value(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3cf;
    stim[1] = 10'h2d0;
    stim[2] = 10'h076;
    stim[3] = 10'h268;
    stim[4] = 10'h142;
    stim[5] = 10'h04c;
    stim[6] = 10'h0f8;
    stim[7] = 10'h19f;
    stim[8] = 10'h053;
    stim[9] = 10'h1b6;
    stim[10] = 10'h1ff;
    stim[11] = 10'h10b;
    stim[12] = 10'h0b9;
    stim[13] = 10'h02b;
    stim[14] = 10'h1f3;
    stim[15] = 10'h1d2;
    stim[16] = 10'h1d4;
    stim[17] = 10'h1a9;
    stim[18] = 10'h007;
    stim[19] = 10'h1f7;
    stim[20] = 10'h027;
    stim[21] = 10'h1a1;
    stim[22] = 10'h03b;
    stim[23] = 10'h135;
    stim[24] = 10'h00b;
    stim[25] = 10'h034;
    stim[26] = 10'h1b3;
    stim[27] = 10'h046;
    stim[28] = 10'h115;
    stim[29] = 10'h070;
    stim[30] = 10'h1fb;
    stim[31] = 10'h190;
    stim[32] = 10'h11c;
    stim[33] = 10'h161;
    stim[34] = 10'h0e9;
    stim[35] = 10'h05c;
    stim[36] = 10'h116;
    stim[37] = 10'h04b;
    stim[38] = 10'h04f;
    stim[39] = 10'h140;
    stim[40] = 10'h018;
    stim[41] = 10'h099;
    stim[42] = 10'h117;
    stim[43] = 10'h019;
    stim[44] = 10'h00f;
    stim[45] = 10'h0df;
    stim[46] = 10'h073;
    stim[47] = 10'h02d;
    stim[48] = 10'h125;
    stim[49] = 10'h05f;
    stim[50] = 10'h1f3;
    stim[51] = 10'h16f;
    stim[52] = 10'h1ea;
    stim[53] = 10'h055;
    stim[54] = 10'h1dc;
    stim[55] = 10'h095;
    stim[56] = 10'h18f;
    stim[57] = 10'h1e0;
    stim[58] = 10'h1ef;
    stim[59] = 10'h07f;
    stim[60] = 10'h056;
    stim[61] = 10'h2dc;
    stim[62] = 10'h14b;
    stim[63] = 10'h15e;
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
      expv[0] = 5'h06;
      expv[1] = 5'h06;
      expv[2] = 5'h06;
      expv[3] = 5'h06;
      expv[4] = 5'h06;
      expv[5] = 5'h0f;
      expv[6] = 5'h06;
      expv[7] = 5'h09;
      expv[8] = 5'h0a;
      expv[9] = 5'h03;
      expv[10] = 5'h0f;
      expv[11] = 5'h06;
      expv[12] = 5'h0f;
      expv[13] = 5'h08;
      expv[14] = 5'h0f;
      expv[15] = 5'h0f;
      expv[16] = 5'h0f;
      expv[17] = 5'h09;
      expv[18] = 5'h08;
      expv[19] = 5'h0a;
      expv[20] = 5'h0a;
      expv[21] = 5'h0e;
      expv[22] = 5'h08;
      expv[23] = 5'h0e;
      expv[24] = 5'h08;
      expv[25] = 5'h0e;
      expv[26] = 5'h04;
      expv[27] = 5'h0e;
      expv[28] = 5'h06;
      expv[29] = 5'h08;
      expv[30] = 5'h08;
      expv[31] = 5'h0e;
      expv[32] = 5'h08;
      expv[33] = 5'h08;
      expv[34] = 5'h08;
      expv[35] = 5'h08;
      expv[36] = 5'h08;
      expv[37] = 5'h03;
      expv[38] = 5'h0e;
      expv[39] = 5'h0e;
      expv[40] = 5'h09;
      expv[41] = 5'h09;
      expv[42] = 5'h08;
      expv[43] = 5'h0e;
      expv[44] = 5'h08;
      expv[45] = 5'h0e;
      expv[46] = 5'h0e;
      expv[47] = 5'h0e;
      expv[48] = 5'h0b;
      expv[49] = 5'h0b;
      expv[50] = 5'h0e;
      expv[51] = 5'h0e;
      expv[52] = 5'h0e;
      expv[53] = 5'h0d;
      expv[54] = 5'h0b;
      expv[55] = 5'h0a;
      expv[56] = 5'h0b;
      expv[57] = 5'h0b;
      expv[58] = 5'h0a;
      expv[59] = 5'h01;
      expv[60] = 5'h0d;
      expv[61] = 5'h06;
      expv[62] = 5'h06;
      expv[63] = 5'h0a;
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
