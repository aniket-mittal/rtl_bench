// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05065 dut (
    .clk(clk),
    .sigIn(in_vec[12:12]),
    .waitCnt(in_vec[11:1]),
    .sharedBit(in_vec[0:0]),
    .sigOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h096f;
    stim[1] = 13'h04b6;
    stim[2] = 13'h0b7f;
    stim[3] = 13'h04df;
    stim[4] = 13'h05e0;
    stim[5] = 13'h142a;
    stim[6] = 13'h16a5;
    stim[7] = 13'h160b;
    stim[8] = 13'h1594;
    stim[9] = 13'h191f;
    stim[10] = 13'h00c6;
    stim[11] = 13'h10c9;
    stim[12] = 13'h074e;
    stim[13] = 13'h0189;
    stim[14] = 13'h165d;
    stim[15] = 13'h1fbb;
    stim[16] = 13'h1da1;
    stim[17] = 13'h1c6b;
    stim[18] = 13'h1d49;
    stim[19] = 13'h1622;
    stim[20] = 13'h109a;
    stim[21] = 13'h10f6;
    stim[22] = 13'h0e7c;
    stim[23] = 13'h11c8;
    stim[24] = 13'h1beb;
    stim[25] = 13'h0269;
    stim[26] = 13'h1129;
    stim[27] = 13'h16be;
    stim[28] = 13'h1ad6;
    stim[29] = 13'h09de;
    stim[30] = 13'h1a0b;
    stim[31] = 13'h0339;
    stim[32] = 13'h1521;
    stim[33] = 13'h0a1f;
    stim[34] = 13'h0e61;
    stim[35] = 13'h15ff;
    stim[36] = 13'h0786;
    stim[37] = 13'h19aa;
    stim[38] = 13'h127e;
    stim[39] = 13'h0a49;
    stim[40] = 13'h06d5;
    stim[41] = 13'h108d;
    stim[42] = 13'h1e60;
    stim[43] = 13'h0e58;
    stim[44] = 13'h1020;
    stim[45] = 13'h070c;
    stim[46] = 13'h0b5e;
    stim[47] = 13'h0782;
    stim[48] = 13'h01b7;
    stim[49] = 13'h05a5;
    stim[50] = 13'h1dff;
    stim[51] = 13'h1adb;
    stim[52] = 13'h1a22;
    stim[53] = 13'h1c5c;
    stim[54] = 13'h0844;
    stim[55] = 13'h06c5;
    stim[56] = 13'h187d;
    stim[57] = 13'h1c0f;
    stim[58] = 13'h0cd0;
    stim[59] = 13'h0060;
    stim[60] = 13'h0173;
    stim[61] = 13'h0ea6;
    stim[62] = 13'h12c9;
    stim[63] = 13'h051b;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
