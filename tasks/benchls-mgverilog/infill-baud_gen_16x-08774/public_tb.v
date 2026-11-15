// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08774 dut (
    .clock(clk),
    .reset(in_vec[28:28]),
    .baud_freq(in_vec[27:16]),
    .baud_limit(in_vec[15:0]),
    .ce_16(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h15c764af;
    stim[1] = 29'h12d8b0a2;
    stim[2] = 29'h00a1ae9d;
    stim[3] = 29'h07aa8d4a;
    stim[4] = 29'h00c95c63;
    stim[5] = 29'h062ca3f5;
    stim[6] = 29'h03c5b005;
    stim[7] = 29'h0b97a8ff;
    stim[8] = 29'h0aaaba60;
    stim[9] = 29'h05cb1146;
    stim[10] = 29'h09bdd1e9;
    stim[11] = 29'h0e069df9;
    stim[12] = 29'h020543c5;
    stim[13] = 29'h00e2a249;
    stim[14] = 29'h04bb9013;
    stim[15] = 29'h02ca2520;
    stim[16] = 29'h040efd0e;
    stim[17] = 29'h0dcf195c;
    stim[18] = 29'h0df565e4;
    stim[19] = 29'h09d3d89c;
    stim[20] = 29'h039135c1;
    stim[21] = 29'h0df0129e;
    stim[22] = 29'h0b2a89a8;
    stim[23] = 29'h06fcd750;
    stim[24] = 29'h0024af4b;
    stim[25] = 29'h0f46a8d5;
    stim[26] = 29'h0f61d488;
    stim[27] = 29'h0d743d8e;
    stim[28] = 29'h0b9e135c;
    stim[29] = 29'h0504bade;
    stim[30] = 29'h0706983d;
    stim[31] = 29'h03e1df6d;
    stim[32] = 29'h056300da;
    stim[33] = 29'h0469dad1;
    stim[34] = 29'h085d2eb1;
    stim[35] = 29'h07e08c8d;
    stim[36] = 29'h033cd0a5;
    stim[37] = 29'h05660001;
    stim[38] = 29'h03a97759;
    stim[39] = 29'h080d8682;
    stim[40] = 29'h09d1ba27;
    stim[41] = 29'h0a66c77d;
    stim[42] = 29'h0fc93198;
    stim[43] = 29'h0902f402;
    stim[44] = 29'h038d6503;
    stim[45] = 29'h01099d7e;
    stim[46] = 29'h03628d43;
    stim[47] = 29'h0e811822;
    stim[48] = 29'h010e8684;
    stim[49] = 29'h1c6e45ca;
    stim[50] = 29'h0c8ceca0;
    stim[51] = 29'h0bc5a9bb;
    stim[52] = 29'h04a06fa7;
    stim[53] = 29'h067d196c;
    stim[54] = 29'h0fbd715f;
    stim[55] = 29'h078b2b00;
    stim[56] = 29'h09192177;
    stim[57] = 29'h079592f9;
    stim[58] = 29'h06568863;
    stim[59] = 29'h01f0146a;
    stim[60] = 29'h0638946f;
    stim[61] = 29'h01752b2d;
    stim[62] = 29'h0497bdd0;
    stim[63] = 29'h01a9ccc6;
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
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
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
