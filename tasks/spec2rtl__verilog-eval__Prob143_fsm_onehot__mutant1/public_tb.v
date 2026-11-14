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

  dut dut (
    .in(in_vec[10:10]),
    .state(in_vec[9:0]),
    .next_state(out_vec[11:2]),
    .out1(out_vec[1:1]),
    .out2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1bf;
    stim[1] = 11'h0d6;
    stim[2] = 11'h410;
    stim[3] = 11'h769;
    stim[4] = 11'h3fc;
    stim[5] = 11'h662;
    stim[6] = 11'h30f;
    stim[7] = 11'h253;
    stim[8] = 11'h25a;
    stim[9] = 11'h78d;
    stim[10] = 11'h05f;
    stim[11] = 11'h737;
    stim[12] = 11'h4ce;
    stim[13] = 11'h1bb;
    stim[14] = 11'h053;
    stim[15] = 11'h053;
    stim[16] = 11'h529;
    stim[17] = 11'h609;
    stim[18] = 11'h0c9;
    stim[19] = 11'h6cb;
    stim[20] = 11'h20b;
    stim[21] = 11'h388;
    stim[22] = 11'h190;
    stim[23] = 11'h019;
    stim[24] = 11'h52e;
    stim[25] = 11'h16e;
    stim[26] = 11'h748;
    stim[27] = 11'h284;
    stim[28] = 11'h524;
    stim[29] = 11'h56b;
    stim[30] = 11'h34d;
    stim[31] = 11'h490;
    stim[32] = 11'h66d;
    stim[33] = 11'h741;
    stim[34] = 11'h5cd;
    stim[35] = 11'h494;
    stim[36] = 11'h54b;
    stim[37] = 11'h259;
    stim[38] = 11'h79d;
    stim[39] = 11'h27b;
    stim[40] = 11'h18a;
    stim[41] = 11'h74b;
    stim[42] = 11'h1b0;
    stim[43] = 11'h1f7;
    stim[44] = 11'h36a;
    stim[45] = 11'h21a;
    stim[46] = 11'h33d;
    stim[47] = 11'h59c;
    stim[48] = 11'h406;
    stim[49] = 11'h3b9;
    stim[50] = 11'h394;
    stim[51] = 11'h097;
    stim[52] = 11'h50e;
    stim[53] = 11'h757;
    stim[54] = 11'h1ef;
    stim[55] = 11'h2b4;
    stim[56] = 11'h57c;
    stim[57] = 11'h1b9;
    stim[58] = 11'h288;
    stim[59] = 11'h0e4;
    stim[60] = 11'h710;
    stim[61] = 11'h4ed;
    stim[62] = 11'h1a4;
    stim[63] = 11'h5c3;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 12'h407;
      expv[1] = 12'h805;
      expv[2] = 12'h080;
      expv[3] = 12'h34b;
      expv[4] = 12'hc07;
      expv[5] = 12'h319;
      expv[6] = 12'h007;
      expv[7] = 12'h805;
      expv[8] = 12'h805;
      expv[9] = 12'h26b;
      expv[10] = 12'h804;
      expv[11] = 12'h1bb;
      expv[12] = 12'h271;
      expv[13] = 12'h407;
      expv[14] = 12'h804;
      expv[15] = 12'h804;
      expv[16] = 12'h14a;
      expv[17] = 12'h049;
      expv[18] = 12'h805;
      expv[19] = 12'h259;
      expv[20] = 12'h005;
      expv[21] = 12'h007;
      expv[22] = 12'h007;
      expv[23] = 12'h004;
      expv[24] = 12'h17a;
      expv[25] = 12'hc06;
      expv[26] = 12'h24b;
      expv[27] = 12'h005;
      expv[28] = 12'h12a;
      expv[29] = 12'h35a;
      expv[30] = 12'h807;
      expv[31] = 12'h281;
      expv[32] = 12'h369;
      expv[33] = 12'h20b;
      expv[34] = 12'h26b;
      expv[35] = 12'h2a1;
      expv[36] = 12'h25a;
      expv[37] = 12'h805;
      expv[38] = 12'h2eb;
      expv[39] = 12'hc05;
      expv[40] = 12'h007;
      expv[41] = 12'h25b;
      expv[42] = 12'h407;
      expv[43] = 12'hc07;
      expv[44] = 12'hc07;
      expv[45] = 12'h005;
      expv[46] = 12'h407;
      expv[47] = 12'h2eb;
      expv[48] = 12'h030;
      expv[49] = 12'h407;
      expv[50] = 12'h007;
      expv[51] = 12'h005;
      expv[52] = 12'h07a;
      expv[53] = 12'h2bb;
      expv[54] = 12'hc07;
      expv[55] = 12'h405;
      expv[56] = 12'h3ea;
      expv[57] = 12'h407;
      expv[58] = 12'h005;
      expv[59] = 12'hc05;
      expv[60] = 12'h08b;
      expv[61] = 12'h369;
      expv[62] = 12'h407;
      expv[63] = 12'h21b;
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
