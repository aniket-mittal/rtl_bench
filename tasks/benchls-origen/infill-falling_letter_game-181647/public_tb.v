// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_181647 dut (
    .clock(clk),
    .user_input(in_vec[8:1]),
    .reset_signal(in_vec[0:0]),
    .ypos(out_vec[14:10]),
    .game_over(out_vec[9:9]),
    .correct(out_vec[8:8]),
    .letter(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h12b;
    stim[1] = 9'h13b;
    stim[2] = 9'h0b8;
    stim[3] = 9'h014;
    stim[4] = 9'h16e;
    stim[5] = 9'h066;
    stim[6] = 9'h112;
    stim[7] = 9'h132;
    stim[8] = 9'h1d8;
    stim[9] = 9'h0f2;
    stim[10] = 9'h1fa;
    stim[11] = 9'h0cc;
    stim[12] = 9'h148;
    stim[13] = 9'h1fa;
    stim[14] = 9'h1dc;
    stim[15] = 9'h1fc;
    stim[16] = 9'h1e4;
    stim[17] = 9'h0ba;
    stim[18] = 9'h090;
    stim[19] = 9'h1a0;
    stim[20] = 9'h05e;
    stim[21] = 9'h0e6;
    stim[22] = 9'h1ec;
    stim[23] = 9'h166;
    stim[24] = 9'h0ba;
    stim[25] = 9'h146;
    stim[26] = 9'h188;
    stim[27] = 9'h024;
    stim[28] = 9'h1a0;
    stim[29] = 9'h122;
    stim[30] = 9'h06e;
    stim[31] = 9'h17c;
    stim[32] = 9'h0d0;
    stim[33] = 9'h03e;
    stim[34] = 9'h1ba;
    stim[35] = 9'h168;
    stim[36] = 9'h0ca;
    stim[37] = 9'h0f6;
    stim[38] = 9'h0b8;
    stim[39] = 9'h08e;
    stim[40] = 9'h1b2;
    stim[41] = 9'h1e2;
    stim[42] = 9'h166;
    stim[43] = 9'h028;
    stim[44] = 9'h100;
    stim[45] = 9'h01c;
    stim[46] = 9'h04e;
    stim[47] = 9'h0b8;
    stim[48] = 9'h1aa;
    stim[49] = 9'h0ba;
    stim[50] = 9'h0a4;
    stim[51] = 9'h1a0;
    stim[52] = 9'h058;
    stim[53] = 9'h183;
    stim[54] = 9'h1ba;
    stim[55] = 9'h0d4;
    stim[56] = 9'h0a2;
    stim[57] = 9'h110;
    stim[58] = 9'h108;
    stim[59] = 9'h1d2;
    stim[60] = 9'h080;
    stim[61] = 9'h1e2;
    stim[62] = 9'h140;
    stim[63] = 9'h01a;
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
      expv[0] = 15'h0xxx;
      expv[1] = 15'h5c1b;
      expv[2] = 15'h5c1d;
      expv[3] = 15'h5c1d;
      expv[4] = 15'h5c1d;
      expv[5] = 15'h5c1d;
      expv[6] = 15'h5c1d;
      expv[7] = 15'h5c1d;
      expv[8] = 15'h5c1d;
      expv[9] = 15'h5c1d;
      expv[10] = 15'h5c1d;
      expv[11] = 15'h5c1d;
      expv[12] = 15'h5c1d;
      expv[13] = 15'h5c1d;
      expv[14] = 15'h5c1d;
      expv[15] = 15'h5c1d;
      expv[16] = 15'h5c1d;
      expv[17] = 15'h5c1d;
      expv[18] = 15'h5c1d;
      expv[19] = 15'h5c1d;
      expv[20] = 15'h5c1d;
      expv[21] = 15'h5c1d;
      expv[22] = 15'h5c1d;
      expv[23] = 15'h5c1d;
      expv[24] = 15'h5c1d;
      expv[25] = 15'h5c1d;
      expv[26] = 15'h5c1d;
      expv[27] = 15'h5c1d;
      expv[28] = 15'h5c1d;
      expv[29] = 15'h5c1d;
      expv[30] = 15'h5c1d;
      expv[31] = 15'h5c1d;
      expv[32] = 15'h5c1d;
      expv[33] = 15'h5c1d;
      expv[34] = 15'h5c1d;
      expv[35] = 15'h5c1d;
      expv[36] = 15'h5c1d;
      expv[37] = 15'h5c1d;
      expv[38] = 15'h5c1d;
      expv[39] = 15'h5c1d;
      expv[40] = 15'h5c1d;
      expv[41] = 15'h5c1d;
      expv[42] = 15'h5c1d;
      expv[43] = 15'h5c1d;
      expv[44] = 15'h5c1d;
      expv[45] = 15'h5c1d;
      expv[46] = 15'h5c1d;
      expv[47] = 15'h5c1d;
      expv[48] = 15'h5c1d;
      expv[49] = 15'h5c1d;
      expv[50] = 15'h5c1d;
      expv[51] = 15'h5c1d;
      expv[52] = 15'h5c1d;
      expv[53] = 15'h5c1d;
      expv[54] = 15'h5c51;
      expv[55] = 15'h5c51;
      expv[56] = 15'h5c51;
      expv[57] = 15'h5d51;
      expv[58] = 15'h5c51;
      expv[59] = 15'h5c51;
      expv[60] = 15'h5c51;
      expv[61] = 15'h5c51;
      expv[62] = 15'h5c51;
      expv[63] = 15'h5c51;
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
