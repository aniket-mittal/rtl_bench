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

  autovcoder_095291 dut (
    .BoardSignals_Clock(clk),
    .BoardSignals_Reset(in_vec[9:9]),
    .BoardSignals_Running(in_vec[8:8]),
    .BoardSignals_Starting(in_vec[7:7]),
    .BoardSignals_Started(in_vec[6:6]),
    .CurrentState(in_vec[5:4]),
    .Waiting_NextState(in_vec[3:2]),
    .Dispatching_NextState(in_vec[1:0]),
    .NextState(out_vec[4:3]),
    .Waiting_IsIn(out_vec[2:2]),
    .Dispatching_IsIn(out_vec[1:1]),
    .Dispatching_To_Waiting(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2e2;
    stim[1] = 10'h226;
    stim[2] = 10'h04e;
    stim[3] = 10'h1dd;
    stim[4] = 10'h139;
    stim[5] = 10'h0b7;
    stim[6] = 10'h1c4;
    stim[7] = 10'h04b;
    stim[8] = 10'h175;
    stim[9] = 10'h1a4;
    stim[10] = 10'h091;
    stim[11] = 10'h110;
    stim[12] = 10'h1da;
    stim[13] = 10'h1e2;
    stim[14] = 10'h18f;
    stim[15] = 10'h1b2;
    stim[16] = 10'h0c0;
    stim[17] = 10'h0f0;
    stim[18] = 10'h157;
    stim[19] = 10'h062;
    stim[20] = 10'h25b;
    stim[21] = 10'h059;
    stim[22] = 10'h0c9;
    stim[23] = 10'h04c;
    stim[24] = 10'h19c;
    stim[25] = 10'h0e2;
    stim[26] = 10'h0cd;
    stim[27] = 10'h140;
    stim[28] = 10'h017;
    stim[29] = 10'h00b;
    stim[30] = 10'h155;
    stim[31] = 10'h0ba;
    stim[32] = 10'h1e0;
    stim[33] = 10'h163;
    stim[34] = 10'h008;
    stim[35] = 10'h109;
    stim[36] = 10'h178;
    stim[37] = 10'h154;
    stim[38] = 10'h1d2;
    stim[39] = 10'h1cc;
    stim[40] = 10'h132;
    stim[41] = 10'h1fc;
    stim[42] = 10'h17d;
    stim[43] = 10'h0ef;
    stim[44] = 10'h3ec;
    stim[45] = 10'h12a;
    stim[46] = 10'h0b3;
    stim[47] = 10'h0d9;
    stim[48] = 10'h10c;
    stim[49] = 10'h1c4;
    stim[50] = 10'h1f6;
    stim[51] = 10'h066;
    stim[52] = 10'h1ac;
    stim[53] = 10'h008;
    stim[54] = 10'h1d8;
    stim[55] = 10'h199;
    stim[56] = 10'h17b;
    stim[57] = 10'h083;
    stim[58] = 10'h09e;
    stim[59] = 10'h077;
    stim[60] = 10'h1b6;
    stim[61] = 10'h1ab;
    stim[62] = 10'h09d;
    stim[63] = 10'h17f;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h18;
      expv[3] = 5'h0a;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h0c;
      expv[7] = 5'h10;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h08;
      expv[11] = 5'h03;
      expv[12] = 5'h12;
      expv[13] = 5'h00;
      expv[14] = 5'h1c;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h1a;
      expv[19] = 5'h00;
      expv[20] = 5'h18;
      expv[21] = 5'h08;
      expv[22] = 5'h10;
      expv[23] = 5'h18;
      expv[24] = 5'h03;
      expv[25] = 5'h00;
      expv[26] = 5'h18;
      expv[27] = 5'h04;
      expv[28] = 5'h18;
      expv[29] = 5'h10;
      expv[30] = 5'h0a;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h10;
      expv[35] = 5'h14;
      expv[36] = 5'h00;
      expv[37] = 5'h03;
      expv[38] = 5'h12;
      expv[39] = 5'h1c;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h08;
      expv[48] = 5'h1c;
      expv[49] = 5'h0c;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h10;
      expv[54] = 5'h03;
      expv[55] = 5'h0a;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h10;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h08;
      expv[63] = 5'h00;
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
