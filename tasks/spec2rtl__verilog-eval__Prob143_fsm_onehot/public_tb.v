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

  TopModule dut (
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
    stim[0] = 11'h2c3;
    stim[1] = 11'h11d;
    stim[2] = 11'h3f1;
    stim[3] = 11'h094;
    stim[4] = 11'h423;
    stim[5] = 11'h561;
    stim[6] = 11'h2db;
    stim[7] = 11'h59f;
    stim[8] = 11'h176;
    stim[9] = 11'h7c9;
    stim[10] = 11'h71f;
    stim[11] = 11'h70e;
    stim[12] = 11'h3f6;
    stim[13] = 11'h628;
    stim[14] = 11'h1fa;
    stim[15] = 11'h651;
    stim[16] = 11'h261;
    stim[17] = 11'h116;
    stim[18] = 11'h6c0;
    stim[19] = 11'h266;
    stim[20] = 11'h336;
    stim[21] = 11'h279;
    stim[22] = 11'h040;
    stim[23] = 11'h7c5;
    stim[24] = 11'h3b1;
    stim[25] = 11'h0f2;
    stim[26] = 11'h75c;
    stim[27] = 11'h030;
    stim[28] = 11'h1c4;
    stim[29] = 11'h5bd;
    stim[30] = 11'h0bd;
    stim[31] = 11'h255;
    stim[32] = 11'h0bd;
    stim[33] = 11'h6ca;
    stim[34] = 11'h6e7;
    stim[35] = 11'h287;
    stim[36] = 11'h70b;
    stim[37] = 11'h249;
    stim[38] = 11'h19a;
    stim[39] = 11'h19a;
    stim[40] = 11'h573;
    stim[41] = 11'h0ea;
    stim[42] = 11'h470;
    stim[43] = 11'h430;
    stim[44] = 11'h23e;
    stim[45] = 11'h556;
    stim[46] = 11'h5cb;
    stim[47] = 11'h514;
    stim[48] = 11'h55a;
    stim[49] = 11'h58c;
    stim[50] = 11'h5d6;
    stim[51] = 11'h176;
    stim[52] = 11'h2d0;
    stim[53] = 11'h5eb;
    stim[54] = 11'h736;
    stim[55] = 11'h4f2;
    stim[56] = 11'h09b;
    stim[57] = 11'h3d7;
    stim[58] = 11'h113;
    stim[59] = 11'h069;
    stim[60] = 11'h3e8;
    stim[61] = 11'h309;
    stim[62] = 11'h168;
    stim[63] = 11'h4ef;
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
      expv[0] = 12'h807;
      expv[1] = 12'h006;
      expv[2] = 12'hc07;
      expv[3] = 12'h005;
      expv[4] = 12'h118;
      expv[5] = 12'h30a;
      expv[6] = 12'h807;
      expv[7] = 12'h2fb;
      expv[8] = 12'hc06;
      expv[9] = 12'h24b;
      expv[10] = 12'h0fb;
      expv[11] = 12'h07b;
      expv[12] = 12'hc07;
      expv[13] = 12'h14b;
      expv[14] = 12'hc07;
      expv[15] = 12'h28b;
      expv[16] = 12'hc07;
      expv[17] = 12'h006;
      expv[18] = 12'h20b;
      expv[19] = 12'hc07;
      expv[20] = 12'h407;
      expv[21] = 12'hc07;
      expv[22] = 12'h800;
      expv[23] = 12'h22b;
      expv[24] = 12'h407;
      expv[25] = 12'hc05;
      expv[26] = 12'h2eb;
      expv[27] = 12'h404;
      expv[28] = 12'h807;
      expv[29] = 12'h3eb;
      expv[30] = 12'h405;
      expv[31] = 12'h807;
      expv[32] = 12'h405;
      expv[33] = 12'h25b;
      expv[34] = 12'h33b;
      expv[35] = 12'h007;
      expv[36] = 12'h05b;
      expv[37] = 12'h807;
      expv[38] = 12'h007;
      expv[39] = 12'h007;
      expv[40] = 12'h39a;
      expv[41] = 12'hc05;
      expv[42] = 12'h380;
      expv[43] = 12'h180;
      expv[44] = 12'h407;
      expv[45] = 12'h2ba;
      expv[46] = 12'h25b;
      expv[47] = 12'h0aa;
      expv[48] = 12'h2da;
      expv[49] = 12'h26b;
      expv[50] = 12'h2bb;
      expv[51] = 12'hc06;
      expv[52] = 12'h807;
      expv[53] = 12'h35b;
      expv[54] = 12'h1bb;
      expv[55] = 12'h391;
      expv[56] = 12'h005;
      expv[57] = 12'h807;
      expv[58] = 12'h006;
      expv[59] = 12'hc04;
      expv[60] = 12'hc07;
      expv[61] = 12'h007;
      expv[62] = 12'hc06;
      expv[63] = 12'h379;
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
