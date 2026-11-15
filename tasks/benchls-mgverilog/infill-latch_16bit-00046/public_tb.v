// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00046 dut (
    .in(in_vec[16:1]),
    .write(in_vec[0:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h113d4;
    stim[1] = 17'h1c91e;
    stim[2] = 17'h1e950;
    stim[3] = 17'h19bdf;
    stim[4] = 17'h1b05e;
    stim[5] = 17'h09833;
    stim[6] = 17'h07742;
    stim[7] = 17'h0a98c;
    stim[8] = 17'h1a1c2;
    stim[9] = 17'h0bfad;
    stim[10] = 17'h13400;
    stim[11] = 17'h075c6;
    stim[12] = 17'h17924;
    stim[13] = 17'h1bd67;
    stim[14] = 17'h020f1;
    stim[15] = 17'h0395c;
    stim[16] = 17'h1ca2c;
    stim[17] = 17'h03330;
    stim[18] = 17'h009f7;
    stim[19] = 17'h09f0d;
    stim[20] = 17'h0a2ae;
    stim[21] = 17'h07a9b;
    stim[22] = 17'h072fc;
    stim[23] = 17'h1235f;
    stim[24] = 17'h183d6;
    stim[25] = 17'h1df20;
    stim[26] = 17'h04afe;
    stim[27] = 17'h028a7;
    stim[28] = 17'h0f11d;
    stim[29] = 17'h0be2b;
    stim[30] = 17'h16d63;
    stim[31] = 17'h0834e;
    stim[32] = 17'h01534;
    stim[33] = 17'h1ee7c;
    stim[34] = 17'h1e9cd;
    stim[35] = 17'h093cd;
    stim[36] = 17'h00880;
    stim[37] = 17'h16e57;
    stim[38] = 17'h0b078;
    stim[39] = 17'h00c6c;
    stim[40] = 17'h1c789;
    stim[41] = 17'h038a2;
    stim[42] = 17'h1c3eb;
    stim[43] = 17'h082ca;
    stim[44] = 17'h0bc33;
    stim[45] = 17'h1da7a;
    stim[46] = 17'h1534a;
    stim[47] = 17'h0e7b2;
    stim[48] = 17'h1a114;
    stim[49] = 17'h17074;
    stim[50] = 17'h12aba;
    stim[51] = 17'h1197d;
    stim[52] = 17'h1dab4;
    stim[53] = 17'h09fde;
    stim[54] = 17'h0921f;
    stim[55] = 17'h19eeb;
    stim[56] = 17'h0676f;
    stim[57] = 17'h17d8d;
    stim[58] = 17'h0eae7;
    stim[59] = 17'h0831e;
    stim[60] = 17'h1d159;
    stim[61] = 17'h1e51c;
    stim[62] = 17'h03667;
    stim[63] = 17'h0d057;
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
      expv[0] = 16'h89ea;
      expv[1] = 16'he48f;
      expv[2] = 16'hf4a8;
      expv[3] = 16'hf4a8;
      expv[4] = 16'hd82f;
      expv[5] = 16'hd82f;
      expv[6] = 16'h3ba1;
      expv[7] = 16'h54c6;
      expv[8] = 16'hd0e1;
      expv[9] = 16'hd0e1;
      expv[10] = 16'h9a00;
      expv[11] = 16'h3ae3;
      expv[12] = 16'hbc92;
      expv[13] = 16'hbc92;
      expv[14] = 16'hbc92;
      expv[15] = 16'h1cae;
      expv[16] = 16'he516;
      expv[17] = 16'h1998;
      expv[18] = 16'h1998;
      expv[19] = 16'h1998;
      expv[20] = 16'h5157;
      expv[21] = 16'h5157;
      expv[22] = 16'h397e;
      expv[23] = 16'h397e;
      expv[24] = 16'hc1eb;
      expv[25] = 16'hef90;
      expv[26] = 16'h257f;
      expv[27] = 16'h257f;
      expv[28] = 16'h257f;
      expv[29] = 16'h257f;
      expv[30] = 16'h257f;
      expv[31] = 16'h41a7;
      expv[32] = 16'h0a9a;
      expv[33] = 16'hf73e;
      expv[34] = 16'hf73e;
      expv[35] = 16'hf73e;
      expv[36] = 16'h0440;
      expv[37] = 16'h0440;
      expv[38] = 16'h583c;
      expv[39] = 16'h0636;
      expv[40] = 16'h0636;
      expv[41] = 16'h1c51;
      expv[42] = 16'h1c51;
      expv[43] = 16'h4165;
      expv[44] = 16'h4165;
      expv[45] = 16'hed3d;
      expv[46] = 16'ha9a5;
      expv[47] = 16'h73d9;
      expv[48] = 16'hd08a;
      expv[49] = 16'hb83a;
      expv[50] = 16'h955d;
      expv[51] = 16'h955d;
      expv[52] = 16'hed5a;
      expv[53] = 16'h4fef;
      expv[54] = 16'h4fef;
      expv[55] = 16'h4fef;
      expv[56] = 16'h4fef;
      expv[57] = 16'h4fef;
      expv[58] = 16'h4fef;
      expv[59] = 16'h418f;
      expv[60] = 16'h418f;
      expv[61] = 16'hf28e;
      expv[62] = 16'hf28e;
      expv[63] = 16'hf28e;
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
