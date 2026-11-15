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

  origen_102048 dut (
    .spiClk(clk),
    .data(in_vec[9:1]),
    .dataAvailable(in_vec[0:0]),
    .tft_sck(out_vec[4:4]),
    .tft_sdi(out_vec[3:3]),
    .tft_dc(out_vec[2:2]),
    .tft_cs(out_vec[1:1]),
    .idle(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h373;
    stim[1] = 10'h304;
    stim[2] = 10'h300;
    stim[3] = 10'h3d2;
    stim[4] = 10'h34e;
    stim[5] = 10'h157;
    stim[6] = 10'h089;
    stim[7] = 10'h1a0;
    stim[8] = 10'h1f7;
    stim[9] = 10'h044;
    stim[10] = 10'h35d;
    stim[11] = 10'h053;
    stim[12] = 10'h1af;
    stim[13] = 10'h144;
    stim[14] = 10'h2bb;
    stim[15] = 10'h34f;
    stim[16] = 10'h1b1;
    stim[17] = 10'h0ac;
    stim[18] = 10'h1a8;
    stim[19] = 10'h378;
    stim[20] = 10'h1c5;
    stim[21] = 10'h1a8;
    stim[22] = 10'h2b0;
    stim[23] = 10'h10a;
    stim[24] = 10'h1bc;
    stim[25] = 10'h2b9;
    stim[26] = 10'h331;
    stim[27] = 10'h0f1;
    stim[28] = 10'h139;
    stim[29] = 10'h099;
    stim[30] = 10'h0d8;
    stim[31] = 10'h173;
    stim[32] = 10'h154;
    stim[33] = 10'h20c;
    stim[34] = 10'h1d8;
    stim[35] = 10'h042;
    stim[36] = 10'h2cf;
    stim[37] = 10'h342;
    stim[38] = 10'h31d;
    stim[39] = 10'h34f;
    stim[40] = 10'h3d6;
    stim[41] = 10'h13e;
    stim[42] = 10'h34c;
    stim[43] = 10'h04e;
    stim[44] = 10'h3e7;
    stim[45] = 10'h3ee;
    stim[46] = 10'h281;
    stim[47] = 10'h0c0;
    stim[48] = 10'h37b;
    stim[49] = 10'h253;
    stim[50] = 10'h369;
    stim[51] = 10'h211;
    stim[52] = 10'h208;
    stim[53] = 10'h312;
    stim[54] = 10'h397;
    stim[55] = 10'h2ce;
    stim[56] = 10'h2a1;
    stim[57] = 10'h0e7;
    stim[58] = 10'h1a6;
    stim[59] = 10'h224;
    stim[60] = 10'h2a6;
    stim[61] = 10'h088;
    stim[62] = 10'h39a;
    stim[63] = 10'h0d4;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h0x;
      expv[2] = 5'h0x;
      expv[3] = 5'h0x;
      expv[4] = 5'h0x;
      expv[5] = 5'h0x;
      expv[6] = 5'h0x;
      expv[7] = 5'h0x;
      expv[8] = 5'h0x;
      expv[9] = 5'h0x;
      expv[10] = 5'h0x;
      expv[11] = 5'h0x;
      expv[12] = 5'h0x;
      expv[13] = 5'h0x;
      expv[14] = 5'h0x;
      expv[15] = 5'h0x;
      expv[16] = 5'h0x;
      expv[17] = 5'h0x;
      expv[18] = 5'h0x;
      expv[19] = 5'h0x;
      expv[20] = 5'h0x;
      expv[21] = 5'h0x;
      expv[22] = 5'h0x;
      expv[23] = 5'h0x;
      expv[24] = 5'h0x;
      expv[25] = 5'h0x;
      expv[26] = 5'h0x;
      expv[27] = 5'h0x;
      expv[28] = 5'h0x;
      expv[29] = 5'h0x;
      expv[30] = 5'h0x;
      expv[31] = 5'h0x;
      expv[32] = 5'h0x;
      expv[33] = 5'h0x;
      expv[34] = 5'h0x;
      expv[35] = 5'h0x;
      expv[36] = 5'h0x;
      expv[37] = 5'h0x;
      expv[38] = 5'h0x;
      expv[39] = 5'h0x;
      expv[40] = 5'h0x;
      expv[41] = 5'h0x;
      expv[42] = 5'h0x;
      expv[43] = 5'h0x;
      expv[44] = 5'h0x;
      expv[45] = 5'h0x;
      expv[46] = 5'h0x;
      expv[47] = 5'h0x;
      expv[48] = 5'h0x;
      expv[49] = 5'h0x;
      expv[50] = 5'h0x;
      expv[51] = 5'h0x;
      expv[52] = 5'h0x;
      expv[53] = 5'h0x;
      expv[54] = 5'h0x;
      expv[55] = 5'h0x;
      expv[56] = 5'h0x;
      expv[57] = 5'h0x;
      expv[58] = 5'h0x;
      expv[59] = 5'h0x;
      expv[60] = 5'h0x;
      expv[61] = 5'h0x;
      expv[62] = 5'h0x;
      expv[63] = 5'h0x;
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
