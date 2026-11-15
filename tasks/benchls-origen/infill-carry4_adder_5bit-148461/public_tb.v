// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148461 dut (
    .i0(in_vec[10:6]),
    .i1(in_vec[5:1]),
    .cin(in_vec[0:0]),
    .s(out_vec[5:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h70e;
    stim[1] = 11'h059;
    stim[2] = 11'h03c;
    stim[3] = 11'h7e6;
    stim[4] = 11'h62e;
    stim[5] = 11'h6f9;
    stim[6] = 11'h500;
    stim[7] = 11'h6f6;
    stim[8] = 11'h75f;
    stim[9] = 11'h29b;
    stim[10] = 11'h397;
    stim[11] = 11'h141;
    stim[12] = 11'h40a;
    stim[13] = 11'h336;
    stim[14] = 11'h036;
    stim[15] = 11'h52d;
    stim[16] = 11'h657;
    stim[17] = 11'h3be;
    stim[18] = 11'h25c;
    stim[19] = 11'h7f9;
    stim[20] = 11'h612;
    stim[21] = 11'h674;
    stim[22] = 11'h30f;
    stim[23] = 11'h2b8;
    stim[24] = 11'h51e;
    stim[25] = 11'h05b;
    stim[26] = 11'h0a1;
    stim[27] = 11'h00f;
    stim[28] = 11'h4dc;
    stim[29] = 11'h3a7;
    stim[30] = 11'h7eb;
    stim[31] = 11'h0a6;
    stim[32] = 11'h641;
    stim[33] = 11'h52b;
    stim[34] = 11'h08a;
    stim[35] = 11'h663;
    stim[36] = 11'h7b2;
    stim[37] = 11'h684;
    stim[38] = 11'h0bb;
    stim[39] = 11'h599;
    stim[40] = 11'h04d;
    stim[41] = 11'h7a0;
    stim[42] = 11'h720;
    stim[43] = 11'h47b;
    stim[44] = 11'h786;
    stim[45] = 11'h701;
    stim[46] = 11'h672;
    stim[47] = 11'h0be;
    stim[48] = 11'h1b2;
    stim[49] = 11'h7a0;
    stim[50] = 11'h509;
    stim[51] = 11'h38b;
    stim[52] = 11'h349;
    stim[53] = 11'h3ba;
    stim[54] = 11'h021;
    stim[55] = 11'h45a;
    stim[56] = 11'h2dc;
    stim[57] = 11'h613;
    stim[58] = 11'h354;
    stim[59] = 11'h7e6;
    stim[60] = 11'h20c;
    stim[61] = 11'h0bd;
    stim[62] = 11'h35e;
    stim[63] = 11'h1f7;
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
      expv[0] = 6'h26;
      expv[1] = 6'h1c;
      expv[2] = 6'h1c;
      expv[3] = 6'h24;
      expv[4] = 6'h1e;
      expv[5] = 6'h30;
      expv[6] = 6'h08;
      expv[7] = 6'h2c;
      expv[8] = 6'h3a;
      expv[9] = 6'h30;
      expv[10] = 6'h34;
      expv[11] = 6'h0c;
      expv[12] = 6'h0a;
      expv[13] = 6'h2e;
      expv[14] = 6'h16;
      expv[15] = 6'h16;
      expv[16] = 6'h2a;
      expv[17] = 6'h3a;
      expv[18] = 6'h2e;
      expv[19] = 6'h38;
      expv[20] = 6'h22;
      expv[21] = 6'h26;
      expv[22] = 6'h28;
      expv[23] = 6'h2c;
      expv[24] = 6'h26;
      expv[25] = 6'h1e;
      expv[26] = 6'h06;
      expv[27] = 6'h10;
      expv[28] = 6'h22;
      expv[29] = 6'h24;
      expv[30] = 6'h2a;
      expv[31] = 6'h0a;
      expv[32] = 6'h14;
      expv[33] = 6'h14;
      expv[34] = 6'h0e;
      expv[35] = 6'h16;
      expv[36] = 6'h2e;
      expv[37] = 6'h18;
      expv[38] = 6'h20;
      expv[39] = 6'h26;
      expv[40] = 6'h10;
      expv[41] = 6'h1c;
      expv[42] = 6'h18;
      expv[43] = 6'h1e;
      expv[44] = 6'h22;
      expv[45] = 6'h1a;
      expv[46] = 6'h24;
      expv[47] = 6'h22;
      expv[48] = 6'h1e;
      expv[49] = 6'h1c;
      expv[50] = 6'h12;
      expv[51] = 6'h28;
      expv[52] = 6'h24;
      expv[53] = 6'h36;
      expv[54] = 6'h02;
      expv[55] = 6'h1c;
      expv[56] = 6'h32;
      expv[57] = 6'h24;
      expv[58] = 6'h2e;
      expv[59] = 6'h24;
      expv[60] = 6'h1c;
      expv[61] = 6'h22;
      expv[62] = 6'h38;
      expv[63] = 6'h26;
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
